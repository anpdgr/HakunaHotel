<template>
  <div>
    <STnav />
    <Side />
    <div id="all">
      <b-card id="card">
        <!-- ส่วนรายละเอียด -->
        <h1>Check-in</h1>
        <div id="detail-head" style="text-align:left;">
          <!-- show Bookingid ที่กำลัง check in -->
          <b-row>
            <b-col cols="2"><b style="font-size:120%;">Booking no. </b></b-col>
            <b-col
              ><p>{{ $store.getters.getBKID }}</p></b-col
            ><br />
          </b-row>
          <b-row>
            <!-- show cusdetail  -->
            <b-col id="CusDetail">
              <b style="font-size:120%;">Customer detail</b>
              <br />
              <br />
              <p>ID : {{bookDetail.User_ID}}</p>
              <p>Name : {{bookDetail.Name_Title}} {{bookDetail.Customer_FirstName}} {{bookDetail.Customer_Lastname}}</p>
              <p>Phone : {{bookDetail.Tel_No}}</p>
            </b-col>
            <!-- show payment detail  -->
            <b-col id="PayDetail">
              <b style="font-size:120%;">Payment detail</b>
              <br />
              <br />
              <p>Method : {{ bookDetail.Method }}</p>
              <p>Total : {{ bookDetail.Total }}</p>
            </b-col>
          </b-row>
          <hr style="width:100%" />
        </div>
        <!-- ส่วน checkin -->
        <div id="bookdetail">
          <b style="font-size:120%;">Booking Detail</b>
          <br />
          <!-- show roomtype ที่จอง -->
          <div v-for="(item, index) in items" :key="index">
            <b-card id="roomtype_card">
              <div style="text-align:left;">
                <p>
                  <b style="font-size:105%;"
                    >{{ item.roomtype }} {{ index }} :</b
                  >
                  {{ item.Qroom }} rooms
                </p>
                <p style="font-size:80%; text-align:left">
                  * Click button to add information
                </p>
              </div>
              <b
                v-if="roomsucces == 1"
                style="float:right; color:MediumSeaGreen"
                >checked</b
              >
              <div v-for="i in item.Qroom" :key="i" style="float:left">
                <!-- <b-button
                  v-b-modal.modal-center
                  @click="(location.index = index), (location.i = i)"
                  id="RoomCheck"
                  >room {{ i }}</b-button
                > -->

                <div v-if="checkError === '1'">
                  <b-button
                    v-b-modal.modal-center
                    @click="(location.index = index), (location.i = i)"
                    id="RoomCheck"
                    style="background-color:green"
                    >room {{ i }}</b-button
                  >
                </div>
                <div v-else-if="checkError === '0'">
                  <b-button
                    v-b-modal.modal-center
                    @click="(location.index = index), (location.i = i)"
                    id="RoomCheck"
                    style="background-color:red"
                    >room {{ i }}</b-button
                  >
                </div>
                <div v-else-if="checkError === null">
                  <b-button
                    v-b-modal.modal-center
                    @click="(location.index = index), (location.i = i)"
                    id="RoomCheck"
                    >room {{ i }}</b-button
                  >
                </div>


                <!-- เปิดฟอร์มสำหรับกรอก ? -->
                <div
                  id="roomdetail"
                  v-if="index === location.index && i === location.i"
                >
                  <b-modal
                    id="modal-center"
                    centered
                    title="Add information"
                    hide-footer
                  >
                    <div id="guest form">
                      <!-- เลือกเลขห้อง -->
                      <div>
                        <h6>Select room ID {{ index }} : {{ i }}</h6>
                        <b-form-select
                          style="width:8rem; margin:10px"
                          v-model="selectroomid"
                          :options="op_roomid[index]"
                        ></b-form-select>
                      </div>
                      <br />
                      <br />
                      <div id="guest">
                        <h6>Guest information</h6>
                      </div>
                      <!-- guest info  -->
                      <b-tabs card>
                        <b-tab title="* Guest 1" active>
                          <b-form id="G1">
                            <b-form-group label="Name title:">
                              <b-form-select
                                id="ip-title 1"
                                v-model="form1.title"
                                :options="title"
                                placeholder="-- select one --"
                                required
                              ></b-form-select>
                            </b-form-group>
                            <b-form-group label="First Name:">
                              <b-form-input
                                id="ip-fname 1"
                                v-model="form1.fname"
                                required
                                placeholder="enter first name"
                              ></b-form-input>
                            </b-form-group>
                            <b-form-group label="Last Name:">
                              <b-form-input
                                id="ip-lname 1"
                                v-model="form1.lname"
                                required
                                placeholder="enter last name"
                              ></b-form-input>
                            </b-form-group>
                            <b-form-group label="Phone number:">
                              <b-form-input
                                id="ip-tel 1"
                                v-model="form1.tel"
                                type="tel"
                                required
                                placeholder="enter phone number"
                              ></b-form-input>
                            </b-form-group>

                            <b-form-group label="Country:">
                              <b-form-input
                                id="ip-country 1"
                                v-model="form1.country"
                                required
                              ></b-form-input>
                            </b-form-group>
                          </b-form>
                        </b-tab>

                        <b-tab title="Guest 2">
                          <b-form id="G2">
                            <b-form-group label="Name title:">
                              <b-form-select
                                id="ip-title 2"
                                v-model="form2.title"
                                :options="title"
                                placeholder="-- select one --"
                                required
                              ></b-form-select>
                            </b-form-group>
                            <b-form-group label="First Name:">
                              <b-form-input
                                id="ip-fname 2"
                                v-model="form2.fname"
                                required
                                placeholder="enter first name"
                              ></b-form-input>
                            </b-form-group>
                            <b-form-group label="Last Name:">
                              <b-form-input
                                id="ip-lname 2"
                                v-model="form2.lname"
                                required
                                placeholder="enter last name"
                              ></b-form-input>
                            </b-form-group>
                            <b-form-group label="Phone number:">
                              <b-form-input
                                id="ip-tel 2"
                                v-model="form2.tel"
                                type="tel"
                                required
                                placeholder="enter phone number"
                              ></b-form-input>
                            </b-form-group>

                            <b-form-group label="Country:">
                              <b-form-input
                                id="ip-country 2"
                                v-model="form2.country"
                                required
                              ></b-form-input>
                            </b-form-group>
                          </b-form>
                        </b-tab>

                        <b-tab title="Guest 3">
                          <b-form id="G3">
                            <b-form-group label="Name title:">
                              <b-form-select
                                id="ip-title 3"
                                v-model="form3.title"
                                :options="title"
                                placeholder="-- select one --"
                                required
                              ></b-form-select>
                            </b-form-group>
                            <b-form-group label="First Name:">
                              <b-form-input
                                id="ip-fname 3"
                                v-model="form3.fname"
                                required
                                placeholder="enter first name"
                              ></b-form-input>
                            </b-form-group>
                            <b-form-group label="Last Name:">
                              <b-form-input
                                id="ip-lname 3"
                                v-model="form3.lname"
                                required
                                placeholder="enter last name"
                              ></b-form-input>
                            </b-form-group>
                            <b-form-group label="Phone number:">
                              <b-form-input
                                id="ip-tel 3"
                                v-model="form3.tel"
                                type="tel"
                                required
                                placeholder="enter phone number"
                              ></b-form-input>
                            </b-form-group>

                            <b-form-group label="Country:">
                              <b-form-input
                                id="ip-country 3"
                                v-model="form3.country"
                                required
                              ></b-form-input>
                            </b-form-group>
                          </b-form>
                        </b-tab>

                        <b-tab title="Guest 4">
                          <b-form id="G4">
                            <b-form-group label="Name title:">
                              <b-form-select
                                id="ip-title 4"
                                v-model="form4.title"
                                :options="title"
                                placeholder="-- select one --"
                                required
                              ></b-form-select>
                            </b-form-group>
                            <b-form-group label="First Name:">
                              <b-form-input
                                id="ip-fname 4"
                                v-model="form4.fname"
                                required
                                placeholder="enter first name"
                              ></b-form-input>
                            </b-form-group>
                            <b-form-group label="Last Name:">
                              <b-form-input
                                id="ip-lname 4"
                                v-model="form4.lname"
                                required
                                placeholder="enter last name"
                              ></b-form-input>
                            </b-form-group>
                            <b-form-group label="Phone number:">
                              <b-form-input
                                id="ip-tel 4"
                                v-model="form4.tel"
                                type="tel"
                                required
                                placeholder="enter phone number"
                              ></b-form-input>
                            </b-form-group>

                            <b-form-group label="Country:">
                              <b-form-input
                                id="ip-country 4"
                                v-model="form4.country"
                                required
                              ></b-form-input>
                            </b-form-group>
                          </b-form>
                        </b-tab>
                      </b-tabs>
                      <!-- submit checkin  -->
                      <b-button
                        id="Confirm"
                        type="submit"
                        variant="outline-primary"
                        @click="check(index,i)"
                        style="float:right; margin:20px"
                        >submit</b-button
                      >
                    </div>
                  </b-modal>
                </div>
              </div>
            </b-card>
          </div>
        </div>

        <!-- confirm checkin  -->
        <b-button
          v-b-tooltip.hover
          title="Please make sure that your information is correct"
          id="Confirm"
          type="submit"
          variant="success"
          @click="confirm()"
          style="float:right; margin:10px"
        >Confirm</b-button>

        <b-button
          v-b-tooltip.hover
          title="Please make sure that your information is correct"
          id="Confirm"
          type="submit"
          variant="danger"
          @click="reset()"
          style="float:right; margin:10px"
        >reset</b-button>
      </b-card>
    </div>
  </div>
</template>
<!--กดจาก StatusHotel-->
<script>
import STnav from "../Nav_st.vue";
import Side from "./Side_statusH.vue";
//import guest from './Guestform'
export default {
  components: {
    STnav,
    Side,
    //guest
  },
  data() {
    return {
      checkError: null,
      index1: 0,
      roomsucces: 0,
      //   booked roomtype
      items: [
        // { roomtype: "Dulux Executive Twin Bed", Qroom: 1 },
        // { roomtype: "Premier Lux Twin Bed", Qroom: 3 },
        // { roomtype: "Urban Junior Suite", Qroom: 2 }
      ],
      //   roomid ที่ตรงกับ roomtype
      selectroomid: null,
      op_roomid: [
        // { value: 1000, text: "1000" },
        // { value: 1001, text: "1001" },
        // { value: 1002, text: "1002" },
        // { value: 1003, text: "1003" },
        // { value: 1004, text: "1004" }
      ],
      // form เก็บ guest ในแต่ละ roomid
      form1: {
        id: null,
        tel: null,
        title: null,
        fname: null,
        lname: null,
        country: null,
        roomid: null,
      },
      form2: {
        id: null,
        tel: null,
        title: null,
        fname: null,
        lname: null,
        country: null,
        roomid: null,
      },
      form3: {
        id: null,
        tel: null,
        title: null,
        fname: null,
        lname: null,
        country: null,
        roomid: null,
      },
      form4: {
        id: null,
        tel: null,
        title: null,
        fname: null,
        lname: null,
        country: null,
        roomid: null,
      },
      guest: [],
      title: [{ text: "Select One", value: null }, "Mr.", "Mrs.", "Ms.", "Miss"],
      bookDetail: {
        bookid: null,
      },
      location: {
        index: 0,
        i: 0,
      },
      R: {
        rtype: null
      },
      inputGuest:[],
      prepareRoom:[],
      bookhis:[],
      duplicated:false,
    };
  },
  mounted() {
    this.bookDetail.bookid = this.$store.getters.getBKID;
    this.fetchBooking();
    setTimeout(() => {
      this.fetchRoom();
      this.prepareBookhis();
    }, 1000);
  },
  methods: {

    prepareBookhis(){
      this.bookhis=[];
      for(var i=0 ; i<this.bookDetail.rooms.length ; i++){
        this.bookhis.push({});
        var obj=[];
        for(var j=0 ; j<this.bookDetail.rooms[i].Number_of_Room ; j++){
          obj.push(null);
          
        }
        this.bookhis[i]= obj;
      }
      // console.log(this.bookhis);
    },

    reset(){
      this.inputGuest = [];
      this.prepareBookhis();
      // console.log(this.inputGuest);
    },

    fetchBooking() {
      var formData = this.toFormData(this.bookDetail);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/CheckIn.php?action=read",
          formData
        )
        .then((response) => {
          this.bookDetail = response.data.data[0];
          // console.log(this.bookDetail);
          this.fetchBookDetail();
        });
    },

    fetchBookDetail() {
      var formData = this.toFormData(this.bookDetail);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/CheckIn.php?action=fbookdetail",
          formData
        )
        .then((response) => {
          var rooms = response.data.data;
          this.bookDetail.rooms = rooms;
          // console.log(this.bookDetail);
          for (var i = 0; i < rooms.length; i++) {
            this.items.push({
              roomtype: rooms[i].RoomType_Name,
              Qroom: Number(rooms[i].Number_of_Room),
            });
            // let data = {
            //     rtype:rooms[i].RoomType_Name
            // };
            // this.fetchRoom(data);
          }
        });
    },

    fetchRoom() {
      for (var i = 0; i < this.bookDetail.rooms.length; i++) {
        var R = {
          rtype: this.bookDetail.rooms[i].RoomType_Name,
        };
        // console.log(R);
        var formData = this.toFormData(R);
        this.axios
          .post(
            "http://hakuna-hotel.kmutt.me/phpapi/CheckIn.php?action=room",
            formData
          )
          .then((response) => {
            var rooms = response.data.data;
            var type = [];
            for (var i = 0; i < rooms.length; i++) {
              type.push({ value: rooms[i].Room_ID, text: rooms[i].Room_ID });
            }
            this.op_roomid.push(type);
            // console.log( this.op_roomid);
          });
      }
    },

    CheckAndAddGuest(data){
      var form={
          gtitle:data.title,
          gfname:data.fname,
          glname:data.lname,
          gtel:data.tel,
          gcountry:data.country
      }
      var formData = this.toFormData(form);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/CheckIn.php?action=ckguest",
          formData
        )
        .then(response => {
            this.duplicated = false;
            for(var i=0 ; i<this.inputGuest.length ; i++){
              if(response.data.data[0].Guest_ID == this.inputGuest[i].id){
                this.duplicated = true;
                // console.log(this.duplicated);
              }
            }
            if(!this.duplicated) {
              this.inputGuest.push({id:response.data.data[0].Guest_ID , Name : data.title + " " + data.fname + " " + data.lname});
              this.prepareRoom.push(response.data.data[0].Guest_ID);
            }
            else{
              this.makeToast("danger", "Guest " + i + " is already input");
            }
            // console.log(response.data);
        });
    },

    confirm(){
      if(this.inputGuest.length != this.bookDetail.Number_Of_Guest){
        this.makeToast("danger", "Number of guest in booking don't match inputguest");
      }
      else{
        var empty = false;
        var error = false;
        for(var i=0 ; i<this.bookhis.length ; i++){
          for(var j=0 ; j<this.bookhis[i].length ; j++){
            if(this.bookhis[i][j].error){
              error = true;
            }
            else if(this.bookhis[i][j].guest.length == 0){
              empty = true;
            }
          }
        }
        if(error){
          this.makeToast("danger", "please set input again");
        }
        else if(empty){
          this.makeToast("danger", "have room don't have guest");
        }
        else{
          this.ManageData();
          setTimeout(() => {
            this.makeToast("success", "Check-in success !");
            this.$router.push('bookstatus');
          }, 1500);
          
        }
      }
    },

    ManageData(){
      var data = {};
      for(var i=0 ; i<this.bookhis.length ; i++){
        for(var j=0 ; j<this.bookhis[i].length ; j++){
          for(var k=0 ; k<this.bookhis[i][j].guest.length ; k++){
            data = {
                guestid: this.bookhis[i][j].guest[k],
                roomid: this.bookhis[i][j].room,
                bookid: this.bookDetail.Booking_ID
            };
            this.SentBookHis(data);
            // console.log("room : " + this.bookhis[i][j].room + " guest : " + this.bookhis[i][j].guest[k]);
          }
        }
      }
    },

    SentBookHis(data){
      var formData = this.toFormData(data);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/CheckIn.php?action=bookhis",
          formData
        )
        // .then(response => {
        //     console.log(response.data);
        // });       
    },
    // confirm() {

    //   this.makeToast("success", "Check-in success !");
    // },
    //   check ว่ามีการกรอกฟอร์มม้าย
    check(index,i) {
      this.prepareRoom = [];
      if (this.form1 === null) {
        this.makeToast("danger", "1 guest for minimum");
        this.roomsucces = 0;
      } 
      else {
        if (this.selectroomid === null) {
          this.makeToast("danger", "please select room id");
          this.roomsucces = 0;
        } 
        else if (
          this.form1.tel === null ||
          this.form1.title === null ||
          this.form1.fname === null ||
          this.form1.lname === null ||
          this.form1.country === null
        ) {
          this.makeToast("danger", "please fill out all fields");
          this.roomsucces = 0;
        } 
        else {
          this.hideModal();
          console.log(index +" "+ i);
          this.CheckAndAddGuest(this.form1,1);
        //   this.form1.roomid = this.selectroomid;
        //   this.guest.push(this.form1);
          if (
            this.form2.tel != null ||
            this.form2.title != null ||
            this.form2.fname != null ||
            this.form2.lname != null ||
            this.form2.country != null
          ) {
              this.CheckAndAddGuest(this.form2,2);
            // this.form2.roomid = this.selectroomid;
            // this.guest.push(this.form2);
            if (
              this.form3.tel != null ||
              this.form3.title != null ||
              this.form3.fname != null ||
              this.form3.lname != null ||
              this.form3.country != null
            ) {
                this.CheckAndAddGuest(this.form3,3);
            //   this.form3.roomid = this.selectroomid;
            //   this.guest.push(this.form3);
              if (
                this.form4.tel != null ||
                this.form4.title != null ||
                this.form4.fname != null ||
                this.form4.lname != null ||
                this.form4.country != null
              ) {
                  this.CheckAndAddGuest(this.form4,4);
                // this.form4.roomid = this.selectroomid;
                // this.guest.push(this.form4);
                // this.guest.push({RoomID:this.selectroomid,Guest:this.inputGuest});
                
              }
            }
          }
          // this.roomsucces = 1;
          //alert(JSON.stringify(this.guest))
          setTimeout(() => {
            if(this.duplicated){
              this.bookhis[index][i-1] = {room: this.selectroomid ,
                                          guest: this.prepareRoom ,
                                          error: true};
            }
            else{
              this.bookhis[index][i-1] = {room: this.selectroomid ,
                                          guest: this.prepareRoom ,
                                          error: false};
            }
            if(!this.duplicated){
              this.makeToast("success", "Add information this room success !");
              // document.getElementById("roombutton").className = "btn btn-success";
            }
            else{
              // document.getElementById("roombutton").className = "btn btn-danger";
            }
          }, 1000);
          
          
          this.form1 = {id: null, tel: null, title: null, fname: null, lname: null, country: null, roomid: null};
          this.form2 = {id: null, tel: null, title: null, fname: null, lname: null, country: null, roomid: null};
          this.form3 = {id: null, tel: null, title: null, fname: null, lname: null, country: null, roomid: null};
          this.form4 = {id: null, tel: null, title: null, fname: null, lname: null, country: null, roomid: null};
          // console.log(this.bookhis);
          // alert(this.roomsucces);
          
        }
      }
    },
    hideModal() {
      //this.$refs['modal-center'].hide()
      this.$bvModal.hide("modal-center");
    },
    makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        variant: variant,
        solid: true,
        toaster: "b-toaster-top-center",
      });
    },
    toFormData(obj) {
      var fd = new FormData();
      for (var i in obj) {
        fd.append(i, obj[i]);
      }
      return fd;
    },
  },
};
</script>

<style>
#all {
  margin: 100px 100px auto 300px;
}
#card {
  padding: 20px 50px;
}

#roomtype_card {
  margin: 10px;
  padding: 10px 20px;
}
#RoomCheck{
  margin:5px;
}
</style>
