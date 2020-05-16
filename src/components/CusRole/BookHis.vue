<template>
  <div>
    <NavLO/>
    <Cusnav />
    <b-card id="card" title="Your History">
      <div>
        <b-card no-body>
          <b-tabs card>
            <b-tab title="Ongoing" active>
              <div style="text-align:left;" v-for="(BookID, index) in BOnGoing" :key="index">
                <!-- Using modifiers -->
                <div style="padding-left:60px">
                  <b-button variant="info" v-b-toggle.collapse-2 class="m-1"
                    >Booking ID: {{BookID.Booking_ID}}
                  </b-button>
                </div>
                <!-- Element to collapse -->
                <b-collapse id="collapse-2">
                  <b-card border-variant="info">
                    Check-in date: {{BookID.Checkin}}
                    <br />
                    Check-out date: {{BookID.Checkout}}<br />
                    Number of guests: {{BookID.Number_Of_Guest}}
                    <hr />
                    Room type : 
                    <div v-for="(room, i) in BookID.rooms" :key="i">
                        <br />{{i}}. {{room.RoomType_Name}} <br />
                        Room : {{room.Number_of_Room}}
                    </div> 
                    <hr />
                    Payment ID: {{BookID.No}}
                    <br />
                    Total price: {{BookID.Total}}
                    <div id="onbook">
                      <div>
                        <b-button
                          variant="outline-secondary"
                          id="toggle-btn" 
                          v-b-modal.modal-cancle
                          >Cancel Booking
                        </b-button>

                        <b-modal
                          id="modal-cancle"
                          ref="modal-cancle"
                          hide-footer
                          title="Confirm to Cancel"
                        >
                          <div class="d-block text-center">
                            <h3>
                              Are you sure you want to cancel this booking?
                            </h3>
                          </div>
                          <!-- delete this book from db in hideModal function -->
                          <b-button
                            class="mt-3"
                            pill variant="outline-danger"
                            block
                            @click="hideModal"
                            >Yes</b-button
                          >
                          <b-button
                            class="mt-2"
                            pill variant="outline-warning"
                            block
                            @click="toggleModal"
                            >No</b-button
                          >
                        </b-modal>
                      </div>
                    </div>
                  </b-card>
                </b-collapse>
              </div>
            </b-tab>

            <b-tab title="Done">
              <div style="text-align:left;" v-for="(BookID, index) in BDone" :key="index" >
                <!-- Using modifiers -->
                <div style="padding-left:60px">
                  <b-button variant="dark" v-b-toggle.collapse-2 class="m-1"
                    >Booking ID: {{BookID.Booking_ID}}
                  </b-button>
                </div>
                <!-- Element to collapse -->
                <b-collapse id="collapse-2">
                  <b-card border-variant="dark">
                    <div id="info">
                      Check-in date: {{BookID.Checkin}}
                      <br />
                      Check-out date: {{BookID.Checkout}} <br />
                      Number of guests: {{BookID.Number_Of_Guest}}
                      <hr />
                      Room type :
                      <div v-for="(room, i) in BookID.rooms" :key="i">
                        <br />{{i+1}}. {{room.RoomType_Name}} <br />
                        Room : {{room.Number_of_Room}}
                      </div> 
                      <div id="right">
                        <div>
                          <b-button id="show-btn" href="#"  v-b-modal.my-modalRv style="background-color: transparent; border-color:transparent; cursor: pointer;">
                            <font color='#FDA50F'>Click to review</font>
                          </b-button>
                          <b-modal
                            ref="my-modalRv"
                            id="my-modalRv"
                            hide-footer
                            title="Review room type 1"
                          >
                            <div class="d-block text-center">
                              <div id="reviewSection">
                                <div>
                                  <div>
                                    <label for="rating-inline">Rate:</label>
                                    <b-form-rating
                                      id="rating-inline"
                                      v-model="rateStar"
                                      inline
                                      value="4"
                                      no-border
                                      size="lg"
                                      color="#ff8800"
                                    ></b-form-rating>
                                    {{ rateStar }}

                                    <b-form-textarea
                                      id="textarea"
                                      v-model="comment"
                                      placeholder="Enter something..."
                                      rows="3"
                                      max-rows="6"
                                      style="margin-top:10px;"
                                    ></b-form-textarea>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div style="margin-top:20px;">
                              <b-button
                                @click="toggleModalRv"
                                class="mt-2"
                                pill variant="outline-warning"
                                block

                              >
                                Review
                              </b-button>
                            </div>
                          </b-modal>
                        </div>
                      </div>
                      <hr />
                      Payment ID: {{BookID.No}}
                      <br />
                      Total price: {{BookID.Total}}
                    </div>
                  </b-card>
                </b-collapse>
              </div>
            </b-tab>

            <b-tab title="Canceled">
              <div style="text-align:left;" v-for="(BookID, index) in BCanceled" :key="index" >
                <!-- Using modifiers -->
                <div style="padding-left:60px">
                  <b-button v-b-toggle.collapse-2 class="m-1"
                    >Booking ID: {{BookID.Booking_ID}}
                  </b-button>
                </div>
                <!-- Element to collapse -->
                <b-collapse id="collapse-2">
                  <b-card border-variant="secondary">
                    Check-in date: {{BookID.Checkin}}
                    <br />
                    Check-out date: {{BookID.Checkout}} <br />
                    Number of guests: {{BookID.Number_Of_Guest}}
                    <hr />
                    Room type :
                    <div v-for="(room, i) in BookID.rooms" :key="i">
                        <br />{{i}}. {{room.RoomType_Name}} <br />
                        Room : {{room.Number_of_Room}}
                    </div> 
                    <hr />
                    Payment ID: {{BookID.No}}
                    <br />
                    Total price: {{BookID.Total}}
                  </b-card>
                </b-collapse>
              </div>
            </b-tab>
          </b-tabs>
        </b-card>
      </div>
    </b-card>
  </div>
</template>

+review ด้วย อย่าลืมตุ่มยกเลิกการจองก่อนถึงวัน check-in

<script>
import NavLO from '../NavLO.vue'
import Cusnav from "./SideTopNav_cus.vue";
export default {
  data() {
    return {
      rateStar: null,
      comment:'',
      // for fetch data and manage
      bookDetail:{
        userid:'',
      },
      // for show
      BOnGoing:[],
      BDone:[],
      BCanceled:[],
    };
  },
  components: {
    Cusnav,
    NavLO,
  },
  mounted() {
    this.bookDetail.userid = this.$store.getters.getUser;
    this.fetchBooking();

    setTimeout(() => {
      this.setBookdetail();
    }, 800);

    setTimeout(() => {
      this.splitStatus();
    }, 1000);
  },
  methods: {
    showModal() {
      this.$refs["my-modal"].show();
    },
    hideModal() {
      this.makeToast('success','Your booking has been canceled')
      this.$refs["modal-cancle"].hide();
    },
    toggleModal() {
      this.$refs["my-modal"].toggle("#toggle-btn");
    },
    showModalRv() {
      this.$refs["my-modalRv"].show();
    },
    toggleModalRv() {
        if(this.rateStar===null){
            this.makeToast('danger','You have not done your review.')
        }
        else{
        this.makeToast('success','Thank you for your review.')
        setTimeout(() => this.$refs["my-modalRv"].toggle("#show-btn"), 1000);
       
        }
    },
    
    // split AllBooking to each status
    splitStatus(){
      for(var i=0 ; i < this.bookDetail.length ; i++){
        console.log(this.bookDetail[i]);
        if(this.bookDetail[i].Status == "CheckOut"){
          this.BDone.push(this.bookDetail[i]);
        }
        else if(this.bookDetail[i].Status == "Cancel"){
          this.BCanceled.push(this.bookDetail[i]);
        }
        else{
          this.BOnGoing.push(this.bookDetail[i]);
        }
      }
      // console.log(this.BOnGoing);
    },

    // Add room to bookDetail
    setBookdetail(){
      for(var i=0 ; i < this.bookDetail.length ; i++){
        this.fetchBookDetail(this.bookDetail[i],i);
      }
    },
    fetchBookDetail(data,i){
      var formData = this.toFormData(data);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/CusBooking.php?action=fbookdetail",formData)
        .then(response => {
          this.bookDetail[i].rooms = response.data.data;
          // console.log(this.bookDetail[i]);
          
        });
    },

    // fetch Booking & Payment from DB
    fetchBooking(){
      var formData = this.toFormData(this.bookDetail);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/CusBooking.php?action=fbookid",formData)
        .then(response => {
          this.bookDetail = response.data.data;
          // console.log(response.data.data);
          
        });
    },
    // convert to formdata
    toFormData(obj) {
      var fd = new FormData();
      for (var i in obj) {
        fd.append(i, obj[i]);
      }
      return fd;
    },
    // make Toast
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
#card {
  max-width: 90rem;
  margin: 100px 100px 100px 300px;
  padding: 30px;
}
#collapse-2 {
  max-width: 80%;
  margin: auto;
}
#onbook {
  margin-top: 20px;
}
#right {
  float: right;
  margin-right: 30px;
}
</style>
