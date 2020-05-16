<template>
  <!-- first step booking -->
  <b-card id="card" bg-variant="default">
    <!-- box -->
    <b-form inline id="dateform">
      <!-- Checkin Date block -->
      <b-form-group id="ipg-cin" label="Check-in Date:" style="margin-right:20px; width: 17rem;">
        <!--                               input box checkin date                               -->

        <!--<b-form-datepicker
          id="ip-cin"
          v-model="form.checkin_date"
          :date-disabled-fn="dateDisabled"
          locale="en"
          required
        ></b-form-datepicker>-->

        <!-- fix bug console -->
        <b-form-datepicker id="ip-cin" v-model="form.checkin_date" locale="en" required></b-form-datepicker>
      </b-form-group>

      <!-- Checkout Date block -->
      <b-form-group id="ipg-cout" label="Check-out Date:" style="margin-right:20px; width: 17rem;">
        <!--                                    input checkout date                                -->

        <!--<b-form-datepicker
          id="ip-cout"
          v-model="form.checkout_date"
          :date-disabled-fn="dateDisabled"
          locale="en"
          required
        ></b-form-datepicker>-->

        <!-- fix bug console -->
        <b-form-datepicker id="ip-cout" v-model="form.checkout_date" locale="en" required></b-form-datepicker>
      </b-form-group>

      <!--                                      Num guest block                                       -->

      <!-- input num guest -->
      <b-form-group label="Number of guests: " style="margin-right:30px; width: 10rem;">
        <b-form-spinbutton v-model="form.num_guest" min="1" max="100" placeholder="--" required></b-form-spinbutton>
      </b-form-group>

      <!-- submit button -->
      <b-button id="button" variant="dark" @click="checkNull()">Check available</b-button>
      <!-- variant="success" -->

      <!-- <h1>{{this.$store.getters.getBookCkin}}   {{this.$store.getters.getBookCkout}}  {{this.$store.getters.getBookNumG}}</h1> -->
    </b-form>
  </b-card>
</template>

<style scoped>
#card {
  padding: 25px 10px;
  margin: auto 85px;
  align-items: center;
  border-color: #2a2818;
}
#button {
  float: right;
  margin-top: 30px;
  margin-left: 20px;
  background-color: #9c472f;
  border-color: transparent;
}
#dateform {
  margin: auto;
}
</style>

<script>
export default {
  data() {
    return {
      // ?? didn't use
      isNUll: true,
      // ?? didn't use
      x: 0,
      // form input
      form: {
        checkin_date: null,
        checkout_date: null,
        num_guest: 0
      },
      // ?? didn't use
      show: true
    };
  },
  mounted() {
    this.form.checkin_date = this.$store.getters.getBookCkin;
    this.form.checkout_date = this.$store.getters.getBookCkout;
    this.form.num_guest = this.$store.getters.getBookNumG;
  },
  methods: {
    checkNull() {
      if (
        (this.form.checkin_date == null) &&
        (this.form.checkout_date == null) &&
        (this.form.num_guest == 0)
      ) {
        this.makeToast("danger", "Please input data.");
      } else if (
        (this.form.checkin_date == null) ||
        (this.form.checkout_date == null)
      ) {
        this.makeToast("danger", "Please select date.");
      } else if (this.form.num_guest == 0) {
        this.makeToast("danger", "Please select number of guests.");
      } else {
        // check date
        if (this.form.checkin_date > this.form.checkout_date) {
          // use method makeToast
          this.makeToast("danger", "Invalid date");
        } else {
          // push t global
          this.$store.dispatch("AcCkIn", this.form.checkin_date);
          this.$store.dispatch("AcCkOut", this.form.checkout_date);
          this.$store.dispatch("AcNumG", this.form.num_guest);
          // console.log(this.form.checkin_date+"  "+this.form.checkout_date+"  "+this.form.num_guest);

          // go booking page
          // this port is so good
          this.$router.push("booking");
        }
      }
    },
    // create toast
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
