<template>
  <div>
    <NavLO />
    <Cusnav />
    <b-card id="card" title="Your History">
      <div>
        <b-card no-body>
          <b-tabs card>
            <b-tab title="Ongoing" active>
              <div
                style="text-align:left;"
                v-for="(BookID, index) in BOnGoing"
                :key="index"
              >
                  <!-- Using modifiers -->
                  <div style="padding-left:60px">
                    <b-button
                      variant="info"
                      v-b-toggle.collapse-2
                      class="m-1"
                      @click="index1 = index"
                      >Booking ID: {{ BookID.Booking_ID }}
                    </b-button>
                  </div>
                  <!-- Element to collapse -->
                  <b-collapse id="collapse-2" v-if="index == index1">
                    <b-card border-variant="info">
                      <h5>Booking details</h5>
                      <div class="row">
                        <div class="column">
                          <p>Booking date: {{ BookID.Checkin }}</p>
                          <p>Check-in date: {{ BookID.Checkin }}</p>
                        </div>
                        <div class="column">
                          <p>Number of guests: {{ BookID.Number_Of_Guest }}</p>
                          <p>Check-out date: {{ BookID.Checkout }}</p>
                        </div>
                      </div>

                      <hr />
                      <h5>Room type</h5>
                      <div v-for="(room, i) in BookID.rooms" :key="i">
                        {{ i + 1 }}. {{ room.RoomType_Name }} <br />
                        Room : {{ room.Number_of_Room }}
                      </div>
                      <hr />
                      <h5>Billing details</h5>
                      Payment ID: {{ BookID.No }}
                      <br />
                      <b>Total price: {{ BookID.Total }}฿</b>
                      <div id="onbook">
                        <div>
                          <b-button
                            variant="outline-secondary"
                            id="toggle-btn"
                            v-b-modal.modal-cancel
                            @click="index1 = index"
                            >Cancel Booking
                          </b-button>

                          <b-modal
                            id="modal-cancel"
                            ref="modal-cancel"
                            v-if="index === index1"
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
                              pill
                              variant="outline-danger"
                              block
                              @click="hideModal(BookID)"
                              >Yes</b-button
                            >
                            <b-button
                              class="mt-2"
                              pill
                              variant="outline-warning"
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
              <div
                style="text-align:left;"
                v-for="(BookID, index) in BDone"
                :key="index"
              >
                <!-- Using modifiers -->
                <div style="padding-left:60px">
                  <b-button
                    variant="dark"
                    v-b-toggle="'Done-' + index"
                    class="m-1"
                    >Booking ID: {{ BookID.Booking_ID }}
                  </b-button>
                </div>
                <!-- Element to collapse -->
                <b-collapse
                  :id="'Done-' + index"
                  style="max-width: 80%; margin: auto;"
                >
                  <b-card border-variant="dark">
                    <div id="info">
                      <h5>Booking details</h5>

                      <div class="row">
                        <div class="column">
                          <p>Booking date: {{ BookID.Checkin }}</p>
                          <p>Check-in date: {{ BookID.Checkin }}</p>
                        </div>
                        <div class="column">
                          <p>Number of guests: {{ BookID.Number_Of_Guest }}</p>
                          <p>Check-out date: {{ BookID.Checkout }}</p>
                        </div>
                      </div>
                      <hr />

                      <h5>Room type</h5>
                      <div v-for="(room, i) in BookID.rooms" :key="i">
                        <!-- {{ i + 1 }}. {{ room.RoomType_Name }} <br />
                        Room : {{ room.Number_of_Room }} <br />
                        <b-button
                          id="show-btn"
                          href="#"
                          v-b-modal.my-modalRv
                          v-if="RVavi[index].r[i] != true"
                          style="background-color: transparent; border-color:transparent; cursor: pointer;"
                          @click="check(BookID, room ,index, i)"
                        >
                          <font color="#FDA50F">Click to review</font>
                        </b-button> -->

                        <b-row>
                          <b-col>
                            {{ i + 1 }}. {{ room.RoomType_Name }} <br />
                            Room : {{ room.Number_of_Room }} <br />
                          </b-col>
                          <b-col>
                            <b-button
                              id="show-btn"
                              href="#"
                              v-b-modal.my-modalRv
                              style="background-color: transparent; border-color:transparent; cursor: pointer; float:right;"
                              @click="check(BookID, room, index, i)"
                            >
                              <font color="#FDA50F">Click to review</font>
                            </b-button>
                          </b-col>
                        </b-row>
                      </div>
                      <div id="right">
                        <div>
                          <!-- <b-button id="show-btn" href="#"  v-b-modal.my-modalRv style="background-color: transparent; border-color:transparent; cursor: pointer;">
                            <font color='#FDA50F'>Click to review</font>
                          </b-button> -->
                          <b-modal
                            ref="my-modalRv"
                            id="my-modalRv"
                            v-if="index === index1"
                            hide-footer
                            title="Review this room type"
                          >
                            <div class="d-block text-center">
                              <div id="reviewSection">
                                <div>
                                  <label for="rating-inline">Rate:</label>
                                  <b-form-rating
                                    id="rating-inline"
                                    v-model="review.rate"
                                    inline
                                    value="4"
                                    no-border
                                    size="lg"
                                    color="#ff8800"
                                  ></b-form-rating>
                                  {{ review.rate }}

                                  <b-form-textarea
                                    id="textarea"
                                    v-model="review.comment"
                                    placeholder="Enter something..."
                                    rows="3"
                                    max-rows="6"
                                    style="margin-top:10px;"
                                  ></b-form-textarea>
                                </div>
                              </div>
                            </div>

                            <div style="margin-top:20px;">
                              <b-button
                                @click="toggleModalRv(index)"
                                class="mt-2"
                                pill
                                variant="outline-warning"
                                block
                              >
                                Review
                              </b-button>
                            </div>
                          </b-modal>
                        </div>
                      </div>
                      <hr />
                      <h5>Billing details</h5>
                      Payment ID: {{ BookID.No }}
                      <br />
                      <b>Total price: {{ BookID.Total }}฿</b>
                    </div>
                  </b-card>
                </b-collapse>
              </div>
            </b-tab>

            <b-tab title="Canceled">
              <div
                style="text-align:left;"
                v-for="(BookID, index) in BCanceled"
                :key="index"
              >
                <!-- Using modifiers -->
                <div style="padding-left:60px">
                  <b-button v-b-toggle="'Cancel-' + index" class="m-1"
                    >Booking ID: {{ BookID.Booking_ID }}
                  </b-button>
                </div>
                <!-- Element to collapse -->
                <b-collapse
                  :id="'Cancel-' + index"
                  style="max-width: 80%; margin: auto;"
                >
                  <b-card border-variant="secondary">
                    <h5>Booking details</h5>
                    <div class="row">
                      <div class="column">
                        <p>Booking date: {{ BookID.Checkin }}</p>
                        <p>Check-in date: {{ BookID.Checkin }}</p>
                      </div>
                      <div class="column">
                        <p>Number of guests: {{ BookID.Number_Of_Guest }}</p>
                        <p>Check-out date: {{ BookID.Checkout }}</p>
                      </div>
                    </div>

                    <hr />
                    <h5>Room type</h5>
                    <div v-for="(room, i) in BookID.rooms" :key="i">
                      {{ i + 1 }}. {{ room.RoomType_Name }} <br />
                      Room : {{ room.Number_of_Room }}
                    </div>
                    <hr />
                    <h5>Billing details</h5>
                    Payment ID: {{ BookID.No }}
                    <br />
                    <b>Total price: {{ BookID.Total }}฿</b>
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
import NavLO from "../NavLO.vue";
import Cusnav from "./SideTopNav_cus.vue";
export default {
  data() {
    return {
      disReview: false,
      index1: 0,
      ibuff: 0,
      review: {
        bookid: null,
        rtype: null,
        userid: null,
        rate: null,
        comment: null,
      },
      reviewAlready: [],
      // for fetch data and manage
      bookDetail: {
        userid: "",
      },
      // for show
      BOnGoing: [],
      BDone: [],
      BCanceled: [],
      isNotRV: 0,

      RVavi: [],
    };
  },
  components: {
    Cusnav,
    NavLO,
  },
  mounted() {
    this.bookDetail.userid = this.review.userid = this.$store.getters.getUser;
    this.fetchBooking();
    setTimeout(() => {
      this.setBookdetail();
    }, 800);
    setTimeout(() => {
      this.splitStatus();
    }, 1000);
    setTimeout(() => {
      this.prepareRV();
    }, 1200);
    setTimeout(() => {
      this.loopCkRv();
    }, 1250);
  },
  methods: {
    // checkModal(index) {
    //   this.index1 = index;
    // },
    prepareRV() {
      for (var i = 0; i < this.BDone.length; i++) {
        this.RVavi.push({ id: null });
        this.reviewAlready.push({ id: null });
        this.RVavi[i].id = this.BDone[i].Booking_ID;
        this.reviewAlready[i].id = this.BDone[i].Booking_ID;
        for (var j = 0; j < this.BDone[i].rooms.length; j++) {
          var ravi = [];
          ravi.push(false);
        }
        this.RVavi[i].r = ravi;
        this.reviewAlready[i].r = ravi;
      }
      // console.log(this.RVavi);
    },

    loopCkRv() {
      for (var i = 0; i < this.BDone.length; i++) {
        for (var j = 0; j < this.BDone[i].rooms.length; j++) {
          var data = {
            bookid: this.BDone[i].Booking_ID,
            rtype: this.BDone[i].rooms[j].RoomType_Name,
          };
          // console.log(data);
          this.checkRV(data, i, j);
        }
      }
    },

    showModal() {
      this.$refs["modal-cancel"].show();
    },
    hideModal(BookID) {
      // console.log(BookID);
      var formData = this.toFormData(BookID);
      this.axios.post(
        "http://hakuna-hotel.kmutt.me/phpapi/bookhis.php?action=cancel",
        formData
      );

      this.makeToast("success", "Your booking has been canceled");
      //this.$refs["modal-cancel"].hide();
      this.$bvModal.hide("modal-cancel");
      // setTimeout(() => {
      //   this.$router.push("mybook");
      // }, 1500);
    },
    toggleModal() {
      //this.$refs["modal-cancel"].toggle("#toggle-btn");
      this.$bvModal.hide("modal-cancel");
    },
    showModalRv() {
      this.$refs["my-modalRv"].show();
    },
    toggleModalRv(index) {
      // console.log(index + " " + this.ibuff);
      if (this.review.rate === null || this.review.comment === null) {
        this.makeToast("danger", "You have not done your review.");
      } else {
        if (!this.reviewAlready[index].r[this.ibuff]) this.AddReview();
        this.RVavi[index].id = this.review.bookid;
        this.RVavi[index].r[this.ibuff] = true;

        this.review.rate = null;
        this.review.comment = null;

        this.makeToast("success", "Thank you for your review.");
        this.$bvModal.hide("my-modalRv"); // hide modal
        //setTimeout(() => this.$refs["my-modalRv"].toggle("#show-btn"),1000);
      }
    },
    //Check ว่ารีวิวแล้วยัง
    checkRV(data, index, i) {
      var formData = this.toFormData(data);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/Review.php?action=check",
          formData
        )
        .then((response) => {
          // console.log(response.data.data.length);
          // console.log("index " + index + " i " + i);
          if (response.data.data.length != 0) {
            this.reviewAlready[index].id = data.bookid;
            this.reviewAlready[index].r[i] = true;
          } else {
            this.reviewAlready[index].id = data.bookid;
            this.reviewAlready[index].r[i] = false;
          }
          // console.log(this.RVavi)
        });
      // if (this.isNotRV == 0) {
      //   return false;
      // } else {
      //   return true;
      // }
    },
    //ฝากปรอย fixxxx
    check(BookID, room, index, i) {
      this.ibuff = i;
      this.review.bookid = BookID.Booking_ID;
      this.review.rtype = room.RoomType_Name;
      // console.log(this.reviewAlready[index].r[i]);
      if (this.reviewAlready[index].r[i] == true) {
        this.makeToast("danger", "You have already reviewed this room.");
        this.RVavi[index].id = this.review.bookid;
        this.RVavi[index].r[this.ibuff] = true;
      }
      // console.log(BookID);

      // console.log(this.review.rtype);
      //console.log(this.isNotrv);
      // if (this.checkRV()) {
      //   this.makeToast("danger", "You have already reviewed !!");
      // }
      // else{
      //   this.showModalRv();
      // }
    },
    // split AllBooking to each status
    splitStatus() {
      for (var i = 0; i < this.bookDetail.length; i++) {
        // console.log(this.bookDetail[i]);
        if (this.bookDetail[i].Status == "CheckOut") {
          this.BDone.push(this.bookDetail[i]);
        } else if (this.bookDetail[i].Status == "Cancel") {
          this.BCanceled.push(this.bookDetail[i]);
        } else {
          this.BOnGoing.push(this.bookDetail[i]);
        }
      }
      // console.log(this.BDone);
    },

    // Add room to bookDetail
    setBookdetail() {
      for (var i = 0; i < this.bookDetail.length; i++) {
        this.fetchBookDetail(this.bookDetail[i], i);
      }
    },
    fetchBookDetail(data, i) {
      var formData = this.toFormData(data);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/CusBooking.php?action=fbookdetail",
          formData
        )
        .then((response) => {
          this.bookDetail[i].rooms = response.data.data;
          // console.log(this.bookDetail[i]);
        });
    },
    // fetch Booking & Payment from DB
    fetchBooking() {
      var formData = this.toFormData(this.bookDetail);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/CusBooking.php?action=fbookid",
          formData
        )
        .then((response) => {
          this.bookDetail = response.data.data;
          // console.log(response.data.data);
        });
    },
    AddReview() {
      var formData = this.toFormData(this.review);
      this.axios.post(
        "http://hakuna-hotel.kmutt.me/phpapi/Review.php?action=add",
        formData
      );
      // .then((response) => {
      //   //set var to default
      //   console.log(response);
      //   this.review = {
      //     bookid: null,
      //     rtype: null,
      //     userid: null,
      //     rate: null,
      //     comment: null,
      //   };
      //   if (response.data.error) {
      //     console.log(response.data.error);
      //   } else {
      //     console.log(response.data.message);
      //   }
      // })
      this.review = {
        bookid: null,
        rtype: null,
        userid: null,
        rate: null,
        comment: null,
      };
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
</style>
