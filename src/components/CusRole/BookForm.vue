<template>
  <div>
    <!--                          Bar                              -->
      <!-- before login -->
      <div v-if="$store.getters.getUser == null"><NavLogIn /></div>
      <!-- after  login -->
      <div v-else-if="$store.getters.getUser != null"><NavLogOut /></div>
    <br /><br /><br /><br />
    <CheckAv />
    <br />
    <div id="CARD">
      <b-card
        title="Available room"
        sub-title="Date: checkin_date to checkout_date Number of guests: num_guest"
      >
        <table class="table table-bordered">
          <thead>
            <tr class="table-secondary">
              <th scope="col" width="35%">Room type</th>
              <th scope="col" width="18%">Limit guest</th>
              <th scope="col" width="15%">Price for .. nights</th>
              <th scope="col" width="11%">No. rooms</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody v-for="(room,index) in RoomType" :key="index">
            <!-- ตัวอย่างข้อมูล -->
            <tr>
              <th scope="row">
                <div style="width:90%; margin:auto">
                  <p>{{room.RoomType_Name}}</p>
                  <p style="font-size:small;">
                    Description:
                    {{room.Service}}
                  </p>
                </div>
              </th>
              <td>{{room.Limit_Guest}}</td>
              <td>{{room.Price}}</td>
              <td>
                <div id="noRoom1">
                  <b-form-select
                    v-model="selected[index]"
                    :options="options"
                    size="sm"
                    class="mb-3"
                  ></b-form-select>
                </div>
              </td>
              <td rowspan="8">
                <!-- rowspan = for ตามจน.รูมไทป์ -->
                <b-button
                  id="reserve"
                  type="submit"
                  variant="primary"
                  @click="check(index)"
                  >Reserve</b-button
                >
              </td>
            </tr>
            <!-- ตัวอย่างข้อมูล -->
            
          </tbody>
        </table>

        <!-- <p>
          roomtype1: {{ selected[0] }} rooms<br />
          roomtype2: {{ selected[1] }} rooms<br />
          roomtype3: {{ selected[2] }} rooms
        </p> -->
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
    CheckAv,
  },
  data() {
    return {
      // from DB .RoomType_Name, .Price, .Limit_Guest, .Description, .Service, .SpecialService
      RoomType:[],
      // check num room
      isZero: true,
      // num room each roomtype
      selected: [],
      // option selete
      options: [
        { value: 0, text: "0" },
        { value: 1, text: "1" },
        { value: 2, text: "2" },
        { value: 3, text: "3" },
        { value: 4, text: "4" },
      ],
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
          this.isZero = false;
        }
      }
      return this.isZero;
    },
    // fetch data from DB
    fetchRoomType() {
      this.axios
        .get("http://hakuna-hotel.kmutt.me/phpapi/RoomType.php?action=read")
        .then(response => {
          this.RoomType = response.data.data;
          console.log(this.RoomType);
          console.log(response.data);
        });
    },
    // check input
    check(index) {
      if (this.checkNull()) {
        this.makeToast('danger','Please select number of each room type.');

      } else {
        // push global
        this.$store.dispatch("AcType", this.RoomType[index].RoomType_Name);
        this.$store.dispatch("AcNRoom", this.selected[index]);
        this.$store.dispatch("AcBook", true);
        // alert(this.$store.getters.getUser);

        // didn't login  make toast plz
        if(this.$store.getters.getUser == null){
          this.$router.push("/login");
        }
        // already login  make toast plz
        else{
          this.$router.push("/payment");
        }
        // 
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
}
#reserve:hover {
  background-color: darkblue;
  color: white;
}
</style>
