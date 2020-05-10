<template>
  <div>
    <NavLO />
    <br /><br /><br />
    <div id="CARD">
      <b-card
        border-variant="success"
        bg-variant="light"
        style="margin: 30px;"
        title="Billing"
      >
        <div id="content">
          <div>
            <h5>Booking details</h5>
            <!-- Bill   use global           -->
            <p>
              Booking ID: BKXXXXXX
              <span class="tab"
                >Booking date: {{ this.$store.getters.getBookCkin }}</span
              >
              <br />
              Check-in date: 11/08/43
              <span class="tab"
                >Check-out date: {{ this.$store.getters.getBookCkout }}</span
              >
              <br />
              Number of guests: {{ this.$store.getters.getBookNumG }}
              <span class="tab"
                >Billing name: {{ this.$store.getters.getUser }}</span
              >
              <br />
            </p>
          </div>

          <!-- Room -->
          <div>
            <h5>Rooms</h5>
            <div v-for="(room, index) in rooms" :key="index">
              <h6>
                {{ room.type }}
                <div style="float:right;">
                  ฿ {{ room.price * room.num_room }}
                </div>
              </h6>
              <p>{{ room.num_room }} rooms</p>
            </div>
          </div>

          <!-- Discount -->
          <div>
            <h5>Discount</h5>
            <!-- ตัวอย่างข้อมูล -->
            <h6>Code promotion: {{ code }}</h6>
            <h6>
              Season discount : {{ season }}
              <div style="float:right;">฿ {{ Sdis }}</div>
            </h6>
          </div>
          <br />
          <div>
            <!-- ตัวอย่างข้อมูล -->
            <h5>
              Subtotal
              <div style="float:right;">฿...</div>
            </h5>
            <h5>
              Tax
              <div style="float:right;">฿...</div>
            </h5>
          </div>
          <hr />

          <!-- input codepromo -->
          <div style="text-align:left;">
            <!-- ตัวอย่างข้อมูล -->
            <h4>
              <b
                >Total
                <div style="float:right;">฿{{ sum }}</div>
              </b>
            </h4>
            <input v-model="code" type="text" placeholder="Code promotion" />
            <b-button
              variant="light"
              type="button"
              size="sm"
              style="margin-left:10px"
              @click="checkCode"
              >Check code</b-button
            >
          </div>
        </div>
      </b-card>
      <div>
        <h5>Payment method:</h5>

        <b-form-radio-group
          size="lg"
          v-model="value"
          :options="options"
          :state="state"
          name="radio-validation"
        >
          <b-form-invalid-feedback :state="state">
            Please select one payment method
          </b-form-invalid-feedback>
          <b-form-valid-feedback :state="state">
            Further information about payment will be sent to your email.
          </b-form-valid-feedback>
        </b-form-radio-group>
      </div>
    </div>
    <div style="margin-top: 30px; margin-bottom:30px">
      <b-button id="Cancel" variant="secondary" @click="cancelButton()">
        Cancel
      </b-button>
      <b-button
        v-b-tooltip.hover
        title="Please make sure that your information is correct"
        id="Confirm"
        type="submit"
        variant="success"
        @click="check()"
      >
        Confirm
      </b-button>
    </div>
  </div>
</template>

<script>
import NavLO from "../NavLO.vue";
export default {
  components: {
    NavLO,
  },
  data() {
    return {
      sum: 0,
      Sdis: 0,
      Cdis: 0,
      code: "",
      value: null,
      options: [
        { text: "Cash (hotel counter)", value: "counter" },
        { text: "Online banking", value: "online" },
        { text: "Credit card", value: "card" },
      ],
      rooms: [],
      season: null,
      Bill: {
        S_Name: "",
      },
    };
  },
  mounted() {
    this.rooms = this.$store.getters.getBookType;
    this.fetchSeason();
  },
  computed: {
    state() {
      return Boolean(this.value);
    },
  },
  methods: {
    Sum(room, type) {
      this.sum = 0;
      this.Sdis = 0;
      var j = 0;
      for (var i = 0; i < room.length; i++) {
        j = 0;
        while (j < type.length) {
          if (room[i].type == type[j].RoomType_Name) {
            this.Sdis +=
              (room[i].price * room[i].num_room * type[j].Discount) / 100;
            break;
          }
          j++;
        }
        this.sum += room[i].price * room[i].num_room;
      }
    },

    fetchSeason() {
      this.axios
        .get("http://hakuna-hotel.kmutt.me/phpapi/PaymentPage.php?action=read")
        .then((response) => {
          // this.season = response.data.Name;
          console.log(response.data.Data);
          this.CheckDateSeason(response.data.Data);
          this.GetDB(
            "http://hakuna-hotel.kmutt.me/phpapi/PaymentPage.php?action=seasondis",
            this.Bill
          );
        });
    },

    CheckDateSeason(season) {
      for (var i = 0; i < season.length; i++) {
        if (
          this.$store.getters.getBookCkin > season[i].Start_Date &&
          this.$store.getters.getBookCkin < season[i].End_Date
        ) {
          this.season = season[i].Season_Name;
          this.Bill.S_Name = this.season;
        }
      }
    },

    GetDB(URL, Data) {
      var formData = this.toFormData(Data);
      this.axios.post(URL, formData).then((response) => {
        console.log(response.data.Data);
        this.Sum(this.rooms, response.data.Data);
      });
    },
    toFormData(obj) {
      var fd = new FormData();
      for (var i in obj) {
        fd.append(i, obj[i]);
      }
      return fd;
    },

    checkCode() {
      alert("try");
    },
    cancelButton() {
      this.$router.push("booking");
    },
    check() {
      if (this.value === null) {
        this.makeToast("danger", "Please select one payment method.");
      } else {
        this.makeToast("success", "Success");
        setTimeout(() => this.$router.push({ path: "/" }), 1500);
      }
    },
    makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        title: "Notice!",
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center",
      });
    },
  },
};
</script>

<style scoped>
#CARD {
  max-width: 800px;
  margin: auto;
}
#content {
  margin: 40px;
}
h5 {
  text-align: left;
  font-weight: bold;
}
h6 {
  text-align: left;
  margin-left: 1rem;
}
p {
  text-align: left;
  margin-left: 2rem;
}
.tab {
  padding-left: 130px;
}
#Confirm {
  border-radius: 4px;
  font-size: 20px;
  padding: 12px 28px;
  transition-duration: 0.4s;
}
#Cancel {
  border-radius: 4px;
  font-size: 16px;
  padding: 10px 20px;
  margin-right: 20px;
}
#Confirm:hover {
  background-color: limegreen;
  color: white;
}
</style>
