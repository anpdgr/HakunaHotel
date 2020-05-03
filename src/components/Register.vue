<template>
  <body id="regis">
    <div id="box">
      <b-card border-varient="Primary" class="container" style="padding:5px">
        <div id="left" class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">Sign up</h3>
          </div>
          <b-form >
            <br />

            <b-form-group id="ipg-email">
              <b-form-input
                id="ip-email"
                v-model="form.email"
                type="email"
                required
                placeholder="Email"
              ></b-form-input>
            </b-form-group>

            <b-form-group id="ipg-uname">
              <b-form-input
                id="ip-uname"
                v-model="form.username"
                required
                placeholder="Username"
              ></b-form-input>
            </b-form-group>

            <b-form-group id="ipg-pass">
              <b-form-input
                type="password"
                id="ip-pass"
                v-model="form.password"
                required
                placeholder="Password"
              ></b-form-input>
            </b-form-group>

            <b-form-group id="ipg-cpass">
              <b-form-input
                type="password"
                id="ip-cpass"
                v-model="form.cpassword"
                required
                placeholder="Confirm your password"
              ></b-form-input>
            </b-form-group>
            <div style="margin-top:30px; margin-bottom:30px"><hr /></div>
            <h5>Personal information</h5>
            <div style="margin-bottom:20px"></div>
            <b-form-group id="ipg-title">
              <b-form-select
                id="ip-title"
                v-model="form.title"
                :options="title"
                required
              ></b-form-select>
            </b-form-group>

            <b-form-group id="ipg-fname">
              <b-form-input
                id="ip-fname"
                v-model="form.fname"
                required
                placeholder="First name"
              ></b-form-input>
            </b-form-group>

            <b-form-group id="ipg-lname">
              <b-form-input
                id="ip-lname"
                v-model="form.lname"
                required
                placeholder="Last name"
              ></b-form-input>
            </b-form-group>

            <b-form-group id="ipg-birthday">
              <b-form-datepicker
                id="ip-birthday"
                v-model="form.birthday"
                required
                placeholder="Date of birth"
              ></b-form-datepicker>
            </b-form-group>

            <b-form-group id="ipg-tel">
              <b-form-input
                id="ip-tel"
                v-model="form.tel"
                type="tel"
                required
                placeholder="Phone number"
              ></b-form-input>
            </b-form-group>

            <b-form-group id="ipg-country">
              <b-form-input
                id="ip-country"
                v-model="form.country"
                required
                placeholder="Country"
              ></b-form-input>
            </b-form-group>

            <div style="float: left;">
              <b-button formtarget="_blank"  variant="primary" @click="check()"
                >Sign up</b-button
              >
            </div>
          </b-form>
        </div>
        <br /><br />
        <div id="back">
          <a href="/">Back to home</a>
        </div>
      </b-card>
    </div>
  </body>
</template>

<script>
export default {
  data() {
    return {
      form: {
        email: "",
        username: "",
        password: "",
        cpassword: "",
        title: null,
        fname: "",
        lname: "",
        birthday: "",
        tel: "",
        country: null,
      },
      title: [{ text: "Name title", value: null }, "Mr.", "Ms.", "Miss"],
      show: true,
    };
  },
  methods: {
    check() {
      //alert(JSON.stringify(this.form))
      if(this.form.email===null|this.form.username===null|this.form.password===null|this.form.cpassword===null|
        this.form.title===null|this.form.fname===null|this.form.lname===null|this.form.birthday===null|this.form.tell===null|this.form.country===null){
          this.makeToast(
          "danger",
          "Please fill out all field"
        );
      }
      
      else{
        if (this.form.password != this.form.cpassword) {
        this.makeToast(
          "danger",
          "Your password and confirmation password do not match."
        );
      }
      if (this.form.password.length < 7) {
          this.makeToast("danger", "invalid password");
      }
      else{
        this.$router.push("login");

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

<style scoped>
#editcus {
  margin: 50px;
}
#back {
  text-align: right;
}
#box {
  max-width: 550px;
  margin: auto;
  padding-top: 35px;
}
#left {
  max-width: 30rem;
  padding: 30px 20px;
  float: middle;
  text-align: left;
}
body {
  background-image: url("../assets/hotel.home.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  height: 100vh;
}
</style>
