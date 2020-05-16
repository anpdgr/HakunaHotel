<template>
  <div>
    <!--                          Bar                              -->
    <!-- before login -->
    <div v-if="$store.getters.getUser == null">
      <NavLogIn />
    </div>
    <!-- after  login -->
    <div v-else-if="$store.getters.getUser != null">
      <NavLogOut />
    </div>
    <br />
    <br />
    <br />
    <br />
    <CheckAv />
    <br />
    <div id="CARD">
      <b-card title="Available room">
        <span>
          <b>Date:</b>
          {{this.$store.getters.getBookCkin}}
          <b>to</b>
          {{this.$store.getters.getBookCkout}}
          <b>Number of guests:</b>
          {{this.$store.getters.getBookNumG}}
        </span>

        <table class="table table-hover table-bordered">
          <thead>
            <tr>
              <th scope="col" width="35%">Room type</th>
              <th scope="col" width="18%">Limit guest</th>
              <th scope="col" width="15%">Price for .. nights</th>
              <th scope="col" width="11%">No. rooms</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody>
            <!-- ตัวอย่างข้อมูล -->
            <tr v-for="(room, index) in RoomType" :key="index">
              <th scope="row" id="1">
                <div style="width:90%; margin:auto">
                  <p>{{ room.RoomType_Name }}</p>
                  <p style="font-size:small;">
                    Description:
                    {{ room.Service }}
                  </p>
                </div>
              </th>
              <td id="2">{{ room.Limit_Guest }}</td>
              <td id="3">{{ room.Price }}</td>
              <td id="4">
                <div id="noRoom1">
                  <b-form-select
                    v-model="selected[index]"
                    :options="options"
                    size="sm"
                    class="mb-3"
                  ></b-form-select>
                </div>
              </td>
              <td>
                <div v-if="index === 0">
                  <b-button id="reserve" type="submit" @click="check()">Reserve all</b-button>
                </div>
              </td>
            </tr>
            <tr rowspan="8">
              <!-- rowspan = for ตามจน.รูมไทป์ -->
            </tr>
            <!-- ตัวอย่างข้อมูล -->
          </tbody>
        </table>

        <!-- <p>
          roomtype1: {{ selected[0] }} rooms<br />
          roomtype2: {{ selected[1] }} rooms<br />
          roomtype3: {{ selected[2] }} rooms
        </p>-->
        <p>{{ selected }}</p>
      </b-card>
    </div>
  </div>
</template>

<script>
import NavLogOut from "../NavLO.vue";
import NavLogIn from "../Nav.vue";
import CheckAv from "../HomeElem/CheckAvi";

export default {
  components: {
    NavLogOut,
    NavLogIn,
    CheckAv
  },
  data() {
    return {
      // from DB .RoomType_Name, .Price, .Limit_Guest, .Description, .Service, .SpecialService
      RoomType: [],
      // check num room
      isZero: true,
      // num room each roomtype
      selected: [0,0,0,0,0,0,0,0],
      isFail: true,
      // option selete
      options: [
        { value: 0, text: "0" },
        { value: 1, text: "1" },
        { value: 2, text: "2" },
        { value: 3, text: "3" },
        { value: 4, text: "4" }
      ],
      bookdata: []
      //ตามจน.รูมไทป์ ฟอร์ไป (รอดาต้า)
    };
  },
  mounted() {
    this.fetchRoomType();
  },
  methods: {
    // check num room
    checkNull() {
      for (let i = 0; i < this.selected.length; i++) {
        if (this.selected[i] != 0) {
          return false;
        }
      }
      return true
    },
    //check num guest and num room
    checkRoom() {
      //if(!this.checkNull()){
      var count = 0;
      for (let i = 0; i < this.selected.length; i++) {
          count += this.selected[i];
      }
      this.$store.dispatch("AcNRoom", count);
      console.log((this.$store.getters.getBookNumG % 4) + Math.floor((this.$store.getters.getBookNumG / 4)))
      if ( count < (this.$store.getters.getBookNumG % 4) + Math.floor((this.$store.getters.getBookNumG / 4)) ) {
        return true;
      }
      else if ( count > this.$store.getters.getBookNumG ) {
        return true;
      //}
      }
      else
        return false;
    },
    // fetch data from DB
    fetchRoomType() {
      this.axios
        .get("http://hakuna-hotel.kmutt.me/phpapi/RoomType.php?action=read")
        .then(response => {
          this.RoomType = response.data.data;
          // console.log(this.RoomType);
          // console.log(response.data);
        });
    },
    // check input
    check() {
      // console.log(this.isZero);
      if (this.checkNull()) {
        this.makeToast("danger", "Please select number of each room type.");
      }
      else if (this.checkRoom()) {
        this.makeToast(
          "danger",
          "The Number of rooms are not match with number of guest."
        );
      } 
      else {
          this.setData(this.RoomType, this.selected);
          // push global
          // this.$store.dispatch("AcType", this.RoomType[index].RoomType_Name);
          // this.$store.dispatch("AcNRoom", this.selected[index]);
          this.$store.dispatch("AcSetRoom", this.bookdata);
          this.$store.dispatch("AcBook", true);
          // alert(this.$store.getters.getUser);

          // didn't login  make toast plz
          if (this.$store.getters.getUser == null) {
            this.makeToast(
              "danger",
              "You didn't log in. Please login before payment"
            );
            setTimeout(() => {
              this.$router.push("/login");
            }, 2500);
          }
          // already login  make toast plz
          else {
            setTimeout(() => {
            this.$router.push("/payment");
          }, );
        }
        //
      }
    },
    setData(Room, sel) {
      for (var i = 0; i < sel.length; i++) {
        if (sel[i] != null) {
          this.bookdata.push({
            type: Room[i].RoomType_Name,
            num_room: sel[i],
            price: Room[i].Price
          });
        }
      }
      // console.log(this.bookdata);
    },
    makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        title: "Notice!",
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center"
      });
    }
  }
};
</script>

<style>
#CARD {
  max-width: 75%;
  margin: auto;
}
table {
  table-layout: fixed;
  width: 100%;
}

table td {
  word-wrap: break-word;
}
#reserve {
  font-size: 16px;
  padding: 10px 24px;
  transition-duration: 0.4s;
  background-color: #b98672;
}
#reserve:hover {
  background-color: #513f2a;
  color: white;
}
thead {
  background-color: #513f2a;
  color: aliceblue;
}
</style>