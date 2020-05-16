<template>
  <div>
    <NavLO />
    <br />
    <br />
    <br />
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
            <div class="row">
              <div class="column">
                <p>Booking ID: {{ this.BookID }}</p>
                <p>Booking date: {{ this.$store.getters.getBookCkin }}</p>
                <p>Check-in date: {{ this.$store.getters.getBookCkin }}</p>
              </div>
              <div class="column">
                <p>Billing name: {{ UserName.Customer_FirstName }} {{ UserName.Customer_LastName }}</p>
                <p>Number of guests: {{ this.$store.getters.getBookNumG }}</p>
                <p>Check-out date: {{ this.$store.getters.getBookCkout }}</p>
              </div>
            </div>
          </div>

          <!-- Room -->
          <div>
            <h5>Rooms</h5>
            <div v-for="(room, index) in rooms" :key="index">
              <h6>
                {{ room.type }}
                <div style="float:right;">
                  ฿ {{ room.price * room.num_room * DiffDay }}
                </div>
              </h6>
              <p>{{ room.num_room }} rooms</p>
            </div>
          </div>

          <!-- Discount -->
          <div>
            <h5>Discount</h5>
            <!-- ตัวอย่างข้อมูล -->
            <h6>
              Season discount : {{ season }}
              <div style="float:right;">฿ {{ Sdis }}</div>
            </h6>
            <h6>
              Code promotion: {{ code }}
              <div div style="float:right;">฿ {{ Cdis }}</div>
            </h6>

            <div style="text-align:left">
              <input
                v-model="inputcode"
                type="text"
                placeholder="Code promotion"
              />
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
          <br />
          <div>
            <!-- ตัวอย่างข้อมูล -->
            <h5>
              Subtotal
              <div style="float:right;">฿ {{ Tdis }}</div>
            </h5>
            <h5>
              Tax 7%
              <div style="float:right;">฿ {{ sum * 0.07 }}</div>
            </h5>
          </div>
          <hr />

          <!-- input codepromo -->
          <div style="text-align:left;">
            <!-- ตัวอย่างข้อมูล -->
            <h4>
              <b>
                Total
                <div style="float:right;">฿{{ Tprice }}</div>
              </b>
            </h4>
          </div>
          <!-- <div>{{value}} {{this.$store.getters.getBKID}}</div> -->
        </div>
      </b-card>
      <!-- <div>{{Allcode}}</div> -->
      <div>
        <h5>Payment method:</h5>

        <b-form-radio-group
          size="lg"
          v-model="value"
          :options="options"
          :state="state"
          name="radio-validation"
        >
          <b-form-invalid-feedback :state="state"
            >Please select one payment method</b-form-invalid-feedback
          >
          <b-form-valid-feedback :state="state"
            >Further information about payment will be sent to your
            email.</b-form-valid-feedback
          >
        </b-form-radio-group>
      </div>
    </div>
    <div style="margin-top: 30px; margin-bottom:30px">
      <b-button id="Cancel" variant="secondary" @click="cancelButton()"
        >Cancel</b-button
      >
      <b-button
        v-b-tooltip.hover
        title="Please make sure that your information is correct"
        id="Confirm"
        type="submit"
        variant="success"
        @click="check()"
        >Confirm</b-button
      >
    </div>
  </div>
</template>

<script>
import NavLO from "../NavLO.vue";
import moment from "moment";
export default {
  components: {
    NavLO,
  },
  data() {
    return {
      // about money
      sum: 0,
      Sdis: 0,
      Cdis: 0,
      Tdis: 0,
      Tprice: 0,

      // about code
      Allcode: null,
      code: "-",
      limit: 0,
      inputcode: "",

      // confirm
      value: null,

      // radio
      options: [
        { text: "Cash (hotel counter)", value: "counter" },
        { text: "Online banking", value: "online" },
        { text: "Credit card", value: "card" },
      ],

      // DB
      rooms: [],
      season: null,
      Bill: {
        S_Name: "",
      },
      UserName: {
        userid: "",
      },
      UptoDB: {
        bookid: null,
        userid: null,
        checkIn: null,
        checkOut: null,
        numguest: null,
        method: null,
        code: null,
        limit: null,
      },

      // about time
      t1: null,
      t2: null,
      DiffDay: null,

      BookID: null,
      HisNo: null,
    };
  },
  mounted() {
    this.getRoom();
    // this.rooms = this.$store.getters.getBookType;
    // console.log(this.rooms);
    this.UserName.userid = this.$store.getters.getUser;
    this.GetDB(
      "http://hakuna-hotel.kmutt.me/phpapi/PaymentPage.php?action=user",
      this.UserName,
      "User"
    );
    this.GetDB(
      "http://hakuna-hotel.kmutt.me/phpapi/PaymentPage.php?action=codepromo",
      this.UserName,
      "Code"
    );
    this.fetchSeason();
    this.t1 = new Date(this.$store.getters.getBookCkin).getTime();
    this.t2 = new Date(this.$store.getters.getBookCkout).getTime();
    this.DiffDay = this.CalDiffTime();
    // this.GenCode();
    this.BookID += this.GetDB(
      "http://hakuna-hotel.kmutt.me/phpapi/PaymentPage.php?action=hisNo",
      this.UserName,
      "HisNo"
    );

    // console.log(moment(Date()).format('YYYY-MM-DD hh:mm:ss') < "2020-05-12 12:00:00");
    // this.$store.getters.getBookCkin
  },
  computed: {
    state() {
      return Boolean(this.value);
    },
  },
  methods: {
    // Different time
    CalDiffTime() {
      var milsec = this.t2 - this.t1;
      var DiffDay = Math.floor(milsec / 1000 / 60 / 60 / 24);
      return DiffDay;
      // console.log(DiffDay);
    },

    getRoom(){
      var Rooms = this.$store.getters.getBookType;
      for(var i=0 ; i<Rooms.length ; i++){
        if(Rooms[i].num_room != 0){
          this.rooms.push(Rooms[i]);
        }
      }
    },
    // Sum Total price before codepromo
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
      this.sum *= this.DiffDay;
      this.Tprice = this.sum;
      this.Sdis *= this.DiffDay;
      this.Tdis = this.Sdis;
      this.Tprice -= this.Sdis + this.sum * 0.07;
      // this.PriceBfCode = this.Tprice;
    },

    // Fetch season DB
    fetchSeason() {
      this.axios
        .get("http://hakuna-hotel.kmutt.me/phpapi/PaymentPage.php?action=read")
        .then((response) => {
          // this.season = response.data.Name;
          // console.log(response.data.Data);
          this.CheckDateSeason(response.data.Data);
          this.GetDB(
            "http://hakuna-hotel.kmutt.me/phpapi/PaymentPage.php?action=seasondis",
            this.Bill,
            "Sum"
          );
        });
    },

    // Check discout from season
    CheckDateSeason(season) {
      for (var i = 0; i < season.length; i++) {
        if (
          moment(Date()).format("YYYY-MM-DD") > season[i].Start_Date &&
          moment(Date()).format("YYYY-MM-DD") < season[i].End_Date
        ) {
          this.season = season[i].Season_Name;
          this.Bill.S_Name = this.season;
        }
      }
    },

    // All link to DB
    GetDB(URL, Data, code) {
      var formData = this.toFormData(Data);
      this.axios.post(URL, formData).then((response) => {
        // console.log(response.data.Data);
        if (code == "Sum") {
          this.Sum(this.rooms, response.data.Data);
        } else if (code == "Code") {
          this.Allcode = response.data.Data;
        } else if (code == "User") {
          this.UserName = response.data.Data[0];
        } else if (code == "HisNo") {
          this.HisNo = response.data.Data[0].Count;
          this.BookID = "BK";
          this.BookID =
            this.BookID +
            moment(Date()).format("MM") +
            "0" +
            this.$store.getters.getBKID +
            this.rooms.length;
          this.BookID +=
            this.$store.getters.getBookNumRoom < 10
              ? "0" + this.$store.getters.getBookNumRoom
              : this.$store.getters.getBookNumRoom;
          this.BookID += this.DiffDay < 10 ? "0" + this.DiffDay : this.DiffDay;
          this.BookID += this.HisNo < 10 ? "0" + this.HisNo : this.HisNo;
          // console.log(this.BookID);
        }
        // else if(code == "Booking"){
        //   console.log(response.data);
        // }
        else if (code == "Booking") {
          console.log(response.data);
          if (this.code != "-") {
            this.GetDB(
              "http://hakuna-hotel.kmutt.me/phpapi/PaymentPage.php?action=usecode",
              this.UptoDB,
              "Usecode"
            );

            // console.log(this.code);
          }
          this.UpdateBookDetail();
        } else if (code == "Usecode") {
          console.log(response.data);
          this.UptoDB = {
            userid: null,
            checkIn: null,
            checkOut: null,
            numguest: null,
            method: null,
            code: null,
            limit: null,
          };
        } else if (code == "Bookdetail") {
          console.log(response.data);
        }
      });
    },
    toFormData(obj) {
      var fd = new FormData();
      for (var i in obj) {
        fd.append(i, obj[i]);
      }
      return fd;
    },

    // check codepromo from input
    checkCode() {
      for (var i = 0; i < this.Allcode.length; i++) {
        if (
          this.inputcode == this.Allcode[i].Code_ID &&
          this.Allcode[i].Limit > 0
        ) {
          // console.log(this.Allcode[i].StartDate);
          if (
            moment(Date()).format("YYYY-MM-DD hh:mm:ss") >
              this.Allcode[i].StartDate &&
            moment(Date()).format("YYYY-MM-DD hh:mm:ss") <
              this.Allcode[i].ExpireDate
          ) {
            this.Cdis = (this.sum * this.Allcode[i].Discount) / 100;
            this.code = this.inputcode;
            this.limit = this.Allcode[i].Limit;
            console.log(this.limit);
            this.BookID = "BK";
            this.BookID =
              this.BookID +
              moment(Date()).format("MM") +
              "1" +
              this.$store.getters.getBKID +
              this.rooms.length;
            this.BookID +=
              this.$store.getters.getBookNumRoom < 10
                ? "0" + this.$store.getters.getBookNumRoom
                : this.$store.getters.getBookNumRoom;
            this.BookID +=
              this.DiffDay < 10 ? "0" + this.DiffDay : this.DiffDay;
            this.BookID += this.HisNo < 10 ? "0" + this.HisNo : this.HisNo;
          }
        }
      }
      this.Tdis = this.Cdis + this.Sdis;
      // this.Tprice = this.PriceBfCode;
      this.Tprice = this.sum - this.Cdis - this.Sdis - this.sum * 0.07;
    },

    // cancel payment
    cancelButton() {
      this.$store.dispatch("AcCkIn", null);
      this.$store.dispatch("AcCkOut", null);
      this.$store.dispatch("AcNumG", 0);
      this.$store.dispatch("AcBook", false);
      this.$router.push("/");
    },

    // confirm payment
    check() {
      if (this.value === null) {
        this.makeToast("danger", "Please select one payment method.");
      } else {
        this.setToUpdate();
        this.GetDB(
          "http://hakuna-hotel.kmutt.me/phpapi/PaymentPage.php?action=booking",
          this.UptoDB,
          "Booking"
        );
        this.$store.dispatch("AcBook", false);
        this.makeToast("success", "Success");
        this.$store.dispatch("AcCkIn", null);
        this.$store.dispatch("AcCkOut", null);
        this.$store.dispatch("AcNumG", 0);
        this.$store.dispatch("AcBook", false);
        setTimeout(() => this.$router.push({ path: "/" }), 1500);
      }
    },

    setToUpdate() {
      this.UptoDB = {
        bookid: this.BookID,
        userid: this.$store.getters.getUser,
        checkIn: this.$store.getters.getBookCkin,
        checkOut: this.$store.getters.getBookCkout,
        numguest: this.$store.getters.getBookNumG,
        method: this.value,
        code: this.code,
        total: this.Tprice,
        limit: this.limit,
      };
    },

    UpdateBookDetail() {
      var detail = {
        bookid: this.BookID,
        typename: null,
        numroom: null,
      };
      for (var i = 0; i < this.rooms.length; i++) {
        detail = {
          bookid: this.BookID,
          typename: this.rooms[i].type,
          numroom: this.rooms[i].num_room,
        };
        console.log(detail);
        this.GetDB(
          "http://hakuna-hotel.kmutt.me/phpapi/PaymentPage.php?action=bookdetail",
          detail,
          "Bookdetail"
        );
      }
    },
    // SumRoom(){
    //   var sum = 0;
    //   for(var i=0 ; i < this.rooms.length ; i++){
    //     sum += this.rooms[i].num_room;
    //   }
    //   if(sum<10){
    //     return "0"+sum;
    //   }
    //   else
    //     return sum
    // },

    // GenCode(){
    //   this.BookID = "BK";
    //   this.BookID = this.BookID + moment( Date()).format('MM') + "0" + this.$store.getters.getBKID
    //                 + this.rooms.length + this.SumRoom() + this.DiffDay + "00";
    //   //this.BookID += this.GetDB("http://hakuna-hotel.kmutt.me/phpapi/PaymentPage.php?action=hisNo",this.UserName,"HisNo");
    //   console.log(this.BookID[4]);
    // },

    // make toast
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
* {
  box-sizing: border-box;
}
.column {
  float: left;
  width: 50%;
  padding: 10px;
}
.row:after {
  content: "";
  display: table;
  clear: both;
}
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
