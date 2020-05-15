<template>
  <div>
    <NavLO/>
    <Cusnav />
    <b-card id="card" title="Your History">
      <div>
        <b-card no-body>
          <b-tabs card>
            <b-tab title="Ongoing" active>
              <div style="text-align:left;">
                <!-- Using modifiers -->
                <div style="padding-left:60px">
                  <b-button variant="info" v-b-toggle.collapse-2 class="m-1"
                    >Booking ID: {{bookDetail.bookid[0]}}
                  </b-button>
                </div>
                <!-- Element to collapse -->
                <b-collapse id="collapse-2">
                  <b-card border-variant="info">
                    Check-in date: {{bookDetail.checkIn[0]}}
                    <br />
                    Check-out date: {{bookDetail.checkOut[0]}}<br />
                    Number of guests: {{bookDetail.numguest[0]}}
                    <hr />
                    Room type {{rooms.type[0]}}: {{rooms.num_room[0]}}
                    <hr />
                    Payment ID: {{payment.no[0]}}
                    <br />
                    Total price: {{payment.total[0]}}
                    <div id="onbook">
                      <div>
                        <b-button
                          variant="outline-secondary"
                          id="toggle-btn"
                          @click="toggleModal"
                          >Cancel Booking
                        </b-button>

                        <b-modal
                          ref="my-modal"
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
              <div style="text-align:left;">
                <!-- Using modifiers -->
                <div style="padding-left:60px">
                  <b-button variant="dark" v-b-toggle.collapse-2 class="m-1"
                    >Booking ID: BKxxxxxxx
                  </b-button>
                </div>
                <!-- Element to collapse -->
                <b-collapse id="collapse-2">
                  <b-card border-variant="dark">
                    <div id="info">
                      Check-in date:
                      <br />
                      Check-out date: <br />
                      Number of guests:
                      <hr />
                      Room type 1: 2 rooms
                      <div id="right">
                        <div>
                          <a id="show-btn" href="#" @click="showModalRv">
                            <font color='#FDA50F'>Click to review</font>
                          </a>

                          <b-modal
                            ref="my-modalRv"
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
                                class="mt-2"
                                pill variant="outline-warning"
                                block
                                @click="toggleModalRv"
                              >
                                Review
                              </b-button>
                            </div>
                          </b-modal>
                        </div>
                      </div>
                      <hr />
                      Payment ID:
                      <br />
                      Total price:
                    </div>
                  </b-card>
                </b-collapse>
              </div>
            </b-tab>

            <b-tab title="Canceled">
              <div style="text-align:left;">
                <!-- Using modifiers -->
                <div style="padding-left:60px">
                  <b-button v-b-toggle.collapse-2 class="m-1"
                    >Booking ID: BKxxxxxxx
                  </b-button>
                </div>
                <!-- Element to collapse -->
                <b-collapse id="collapse-2">
                  <b-card border-variant="secondary">
                    Check-in date:
                    <br />
                    Check-out date: <br />
                    Number of guests:
                    <hr />
                    Room type 1: 2 rooms
                    <hr />
                    Payment ID:
                    <br />
                    Total price:
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
      bookDetail:{
        bookid:'',
        userid:'',
        checkIn:'',
        checkOut:'',
        date:'',
        numguest:'',
        status:''
      },
      room:[],
      payment:{
        no:'',
        method:'',
        bookid:'',
        codeid:'',
        total:'',
        date:''
      }
    };
  },
  components: {
    Cusnav,
    NavLO,
  },
  mounted() {
    this.room = this.$store.getters.getBookType;
    this.bookDetail.userid = this.$store.getters.getUser;
    this.payment.bookid = this.bookDetail.bookid;
    this.fetchBookDetail();
    this.fetchPayment();
  },
  methods: {
    showModal() {
      this.$refs["my-modal"].show();
    },
    hideModal() {
      this.makeToast('success','Your booking has been canceled')
      this.$refs["my-modal"].hide();
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
    makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        title: "Notice!",
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center",
      });
    },
    fetchBookDetail(){
      var formData = this.toFormData(this.bookDetail);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/Booking.php?action=read",formData)
        .then(response => {
          this.bookDetail = response.data.data;
          // console.log(this.user);
          // console.log(response.data);
        });
    },
    fetchPayment(){
      var formData = this.toFormData(this.payment);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/Payment.php?action=read",formData)
        .then(response => {
          this.payment = response.data.data;
          // console.log(this.user);
          // console.log(response.data);
        }
        );
    },
    // convert to formdata
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
