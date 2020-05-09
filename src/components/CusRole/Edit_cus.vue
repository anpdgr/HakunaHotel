<template>
  <div id="editcus">
    <NavLO />
    <Cusnav />

    <!--                                   Edit form                                     -->
    <b-card id="card" align="left" title="Edit your profile">
      <b-form @submit="onSubmit" @reset="onReset" v-if="show">
        <br />

        <!-- First Name -->
        <b-form-group id="ipg-fname" label="First Name:" label-for="ip-fname">
          <b-form-input id="ip-fname" v-model="form.fname" required placeholder="enter first name"></b-form-input>
        </b-form-group>

        <!-- Last Name -->
        <b-form-group id="ipg-lname" label="Last Name:" label-for="ip-lname">
          <b-form-input id="ip-lname" v-model="form.lname" required placeholder="enter last name"></b-form-input>
        </b-form-group>

        <!-- Name Title -->
        <b-form-group id="ipg-title" label="Name title:" label-for="ip-title">
          <b-form-select id="ip-title" v-model="form.title" :options="title" required></b-form-select>
        </b-form-group>

        <!-- DOB -->
        <b-form-group id="ipg-birthday" label="Birthday:" label-for="ip-birthday">
          <b-form-datepicker
            id="ip-birthday"
            v-model="form.birthday"
            required
            placeholder="-- select date --"
          ></b-form-datepicker>
        </b-form-group>

        <!-- Email -->
        <b-form-group
          id="ipg-email"
          label="Email address:"
          label-for="ip-email"
          description="We'll never share your email with anyone else."
        >
          <b-form-input
            id="ip-email"
            v-model="form.email"
            type="email"
            required
            placeholder="enter email"
          ></b-form-input>
        </b-form-group>

        <!-- Tel -->
        <b-form-group id="ipg-tel" label="Phone number:" label-for="ip-tel">
          <b-form-input
            id="ip-tel"
            v-model="form.tel"
            type="tel"
            required
            placeholder="enter phone number"
          ></b-form-input>
        </b-form-group>

        <!-- Country -->
        <b-form-group id="ipg-country" label="Country:" label-for="ip-country">
          <b-form-input id="ip-country" v-model="form.country" required></b-form-input>
        </b-form-group>

        <br />
        <br />

        <!-- Button Submit & Reset -->
        <div style="float: right;">
          <b-button type="reset" variant="danger" style="margin-right:20px;">Reset</b-button>
          <b-button type="submit" variant="primary">Submit</b-button>
        </div>
      </b-form>
    </b-card>
    <!-- <b-card class="mt-3" header="Form Data Result">
      <pre class="m-0">{{ form }}</pre>
    </b-card>-->
  </div>
</template>

<script>
import NavLO from "../NavLO.vue";
import Cusnav from "./SideTopNav_cus.vue";
export default {
  components: {
    Cusnav,
    NavLO
  },
  data() {
    return {
      // for form edit
      form: {
        email: "",
        tel: "",
        title: null,
        fname: "",
        lname: "",
        birthday: "",
        country: ""
      },
      // Update data
      CurrentUser: {
        userid: "",
        title: "",
        cusfname: "",
        cuslname: "",
        tel: "",
        email: "",
        country: "",
        DOB: ""
      },
      title: [{ text: "Select One", value: null }, "Mr.", "Ms.", "Miss"],
      show: true
    };
  },

  methods: {
    onSubmit(evt) {
      evt.preventDefault();
      this.setCurrentUser();
      this.UpdateUser();
      this.makeToast("success", "Update complete");
        // alert("Staff login");
        setTimeout(() => {
          this.$router.push("myprofile");
        }, 1500);
      //alert("update success")
    },
    onReset(evt) {
      evt.preventDefault();
      // Reset our form values
      this.form.email = "";
      this.form.tel = "";
      this.form.title = "";
      this.form.fname = "";
      this.form.lname = "";
      this.form.birthday = null;
      this.form.country = null;
      // Trick to reset/clear native browser form validation state
      this.show = false;
      this.$nextTick(() => {
        this.show = true;
      });
    },
    setCurrentUser() {
      this.CurrentUser = {
        userid: this.$store.getters.getUser,
        title: this.form.title,
        cusfname: this.form.fname,
        cuslname: this.form.lname,
        tel: this.form.tel,
        email: this.form.email,
        country: this.form.country,
        DOB: this.form.birthday
      };
    },
    UpdateUser() {
      var formData = this.toFormData(this.CurrentUser);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/customer.php?action=update",
          formData
        )
        .then(response => {
          //set var to default
          console.log(response);
          this.form = {
            email: "",
            tel: "",
            title: null,
            fname: "",
            lname: "",
            birthday: "",
            country: ""
          };
          this.CurrentUser = {
            userid: "",
            title: "",
            cusfname: "",
            cuslname: "",
            tel: "",
            email: "",
            country: "",
            DOB: ""
          };
          if (response.data.error) {
            console.log(response.data.error);
          } else {
            console.log(response.data.message);
          }
        });
    },
    // make obj type FormData
    toFormData(obj) {
      var fd = new FormData();
      for (var i in obj) {
        fd.append(i, obj[i]);
      }
      return fd;
    },
    makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        title: "Notice!",
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center",
      });
    },
  }
};
</script>


<style scoped>
#editcus {
  margin: auto;
}
#card {
  max-width: 50rem;
  margin: 100px auto 100px 440px;
  padding: 30px;
}
</style>