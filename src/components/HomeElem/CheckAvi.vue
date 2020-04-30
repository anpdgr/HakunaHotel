<template>
  <b-card id="card" bg-variant="default">
    <b-form inline id="dateform">
      <b-form-group
        id="ipg-cin"
        label="Check-in Date:"
        style="margin-right:20px; width: 17rem;"
      >
        <b-form-datepicker
          id="ip-cin"
          v-model="form.checkin_date"
          :date-disabled-fn="dateDisabled"
          locale="en"
          required
        ></b-form-datepicker>
      </b-form-group>

      <b-form-group
        id="ipg-cout"
        label="Check-out Date:"
        style="margin-right:20px; width: 17rem;"
      >
        <b-form-datepicker
          id="ip-cout"
          v-model="form.checkout_date"
          :date-disabled-fn="dateDisabled"
          locale="en"
          required
        ></b-form-datepicker>
      </b-form-group>

      <b-form-group
        label="Number of guests: "
        style="margin-right:30px; width: 10rem;"
      >
        <b-form-spinbutton
          v-model="form.num_guest"
          min="1"
          max="100"
          placeholder="--"
          required
        ></b-form-spinbutton>
      </b-form-group>

      <b-button
        id="button"
        variant="success"
        @click="checkNull()"
        >Check avilable</b-button
      >
    </b-form>
  </b-card>
</template>

<style scoped>
#card {
  padding: 25px 10px;
  margin: auto 85px;
  align-items: center;
}
#button {
  float: right;
  margin-top: 30px;
  margin-left: 20px;
}
#dateform {
  margin: auto;
}
</style>

<script>
export default {
  data() {
    return {
      isNUll: true,
      x: 0,
      form: {
        checkin_date: null,
        checkout_date: null,
        num_guest: null,
      },
      show: true,
    };
  },
  methods: {
    checkNull() {
      if (
        (this.form.checkin_date == null) |
        (this.form.checkout_date == null) |
        (this.form.num_guest == null)
      ) {
            if (
            (this.form.checkin_date == null) |
            (this.form.checkout_date == null)
            ) {
            this.makeToast("danger", "Please select date.");
            } else {
            this.makeToast("danger", "Please select number of guests.");
            }
      } else {
            if (this.form.checkin_date > this.form.checkout_date) {
            this.makeToast("danger", "Invalid date");
            } else {
            this.$router.push("booking");
            }
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
