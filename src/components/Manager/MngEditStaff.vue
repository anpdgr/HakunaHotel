<template>
  <div id="editST">
    <b-form @submit="onSubmit" @reset="onReset" v-if="show">
      <br />

      <b-form-group label="Position:" label-for="ip-position">
        <b-form-input
          id="ip-position"
          v-model="position"
          placeholder="Enter new position"
        ></b-form-input>
      </b-form-group>

      <b-form-group label="Salary:" label-for="ip-salary">
        <b-form-input
          id="ip-salary"
          v-model="salary"
          placeholder="Enter new salary"
          required=""
        ></b-form-input>
      </b-form-group>

      <b-form-group label="Start date:" label-for="ip-sDate">
        <b-form-datepicker
          id="ip-sDate"
          v-model="sDate"
          placeholder="-- select date --"
        ></b-form-datepicker>
      </b-form-group>

      <b-form-group label="End date:" label-for="ip-eDate">
        <b-form-datepicker
          id="ip-eDate"
          v-model="eDate"
          placeholder="-- select date --"
        ></b-form-datepicker>
      </b-form-group>

      <br /><br />

      <div style="float: right;">
        <b-button type="reset" variant="danger" style="margin-right:20px;"
          >Reset</b-button
        >
        <b-button type="submit" variant="primary">Submit</b-button>
      </div>
    </b-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      position: "",
      salary: "",
      sDate: "",
      eDate: "",
      show: true,
    };
  },

  methods: {
    onSubmit(evt) {
      evt.preventDefault();
      this.makeToast("success", "Information has been updated.");
      //alert("update success")
    },
    onReset(evt) {
      evt.preventDefault();
      // Reset our form values
      this.position = "";
      this.salary = "";
      this.sDate = "";
      this.eDate = "";
      this.show = false;
      this.$nextTick(() => {
        this.show = true;
      });
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
#editcus {
  margin: auto;
}
#card {
  max-width: 35rem;
  margin: 100px 100px 100px 400px;
  padding: 30px;
}
</style>
