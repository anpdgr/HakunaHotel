<template>
<body id="regis">
  <!-- sign up box -->
  <div id="box">
    <b-card border-varient="Primary" class="container" style="padding:5px; margin:50px">
      <div id="left" class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title">Sign up</h3>
        </div>
        <!-- Form regis -->
        <!-- User regis -->
        <b-form @submit="onSubmit">
          <br />
          <!-- input email -->
          <b-form-group id="ipg-email">
            <b-form-input
              id="ip-email"
              v-model="form.email"
              type="email"
              required
              placeholder="Email"
            ></b-form-input>
          </b-form-group>

          <!-- input User name -->
          <b-form-group id="ipg-uname">
            <b-form-input id="ip-uname" v-model="form.username" required placeholder="Username"></b-form-input>
          </b-form-group>

          <!-- input password -->
          <b-form-group id="ipg-pass">
            <b-form-input
              type="password"
              id="ip-pass"
              v-model="form.password"
              required
              placeholder="Password"
            ></b-form-input>
          </b-form-group>

          <!-- input confirm password -->
          <b-form-group id="ipg-cpass">
            <b-form-input
              type="password"
              id="ip-cpass"
              v-model="form.cpassword"
              required
              placeholder="Confirm your password"
            ></b-form-input>
            <!-- Details regis -->
          </b-form-group>
          <div style="margin-top:30px; margin-bottom:30px">
            <hr />
          </div>
          <h5>Personal information</h5>
          <div style="margin-bottom:20px"></div>
          <b-form-group id="ipg-title">
            <!-- radio selete name title -->
            <b-form-select id="ip-title" v-model="form.title" :options="title" required></b-form-select>
          </b-form-group>

          <!-- input first name -->
          <b-form-group id="ipg-fname">
            <b-form-input id="ip-fname" v-model="form.fname" required placeholder="First name"></b-form-input>
          </b-form-group>

          <!-- input last name -->
          <b-form-group id="ipg-lname">
            <b-form-input id="ip-lname" v-model="form.lname" required placeholder="Last name"></b-form-input>
          </b-form-group>

          <!-- input birthday -->
          <b-form-group id="ipg-birthday">
            <b-form-datepicker
              id="ip-birthday"
              v-model="form.birthday"
              required
              placeholder="Date of birth"
            ></b-form-datepicker>
          </b-form-group>

          <!-- input telephone numeber -->
          <b-form-group id="ipg-tel">
            <b-form-input
              id="ip-tel"
              v-model="form.tel"
              type="tel"
              required
              placeholder="Phone number"
            ></b-form-input>
          </b-form-group>

          <!-- input country -->
          <b-form-group id="ipg-country">
            <b-form-input id="ip-country" v-model="form.country" required placeholder="Country"></b-form-input>
          </b-form-group>

          <!-- Button -->
          <div style="float: left;">
            <!-- sign up button -->
            <b-button
              formtarget="_blank"
              @click.alt="UseDev"
              type="submit"
              style="background-color:#6096a8"
            >Sign up</b-button>

            <!-- alert button -->
            <!-- <b-button formtarget="_blank" @click="UseDev">dummy</b-button> -->
          </div>
        </b-form>
      </div>
      <br />
      <br />
      <!-- return to home page -->
      <div id="back">
        <button id="btn" style="color:#809aa1" @click="login">I already have an account</button>
        <br />
        <button id="btn" style="color:#809aa1" @click="home">Back to home</button>
      </div>
    </b-card>
  </div>
</body>
</template>

<script>
export default {
  data() {
    return {
      fetchuser: {
        userid: ""
      },
      fetchlenght: 0,
      // for form register
      form: {
        email: "",
        username: "",
        password: "",
        cpassword: "",
        tel: "",
        title: null,
        name: "",
        fname: "",
        lname: "",
        birthday: "",
        // data: null,//???????
        country: ""
      },
      title: [{ text: "Name title", value: null }, "Mr.", "Ms.", "Miss"],
      show: true,
      // for DB
      newUser: {
        userid: "",
        pass: "",
        title: "",
        cusfname: "",
        cuslname: "",
        tel: "",
        email: "",
        country: "",
        DOB: ""
      }
    };
  },
  methods: {
    //  method for เปลี่ยนหน้า
    login() {
      this.$router.push("login");
    },
    home() {
      this.$router.push("/");
    },
    // default user easy click
    UseDev() {
      this.form = {
        email: "test@mail.com",
        username: "testuser",
        password: "password",
        cpassword: "password",
        tel: "123456",
        title: "Mr.",
        fname: "Unknow",
        lname: "Unknow",
        birthday: "2020-05-05",
        country: "Astera"
      };
    },
    onSubmit(evt) {
      evt.preventDefault();
      //alert(JSON.stringify(this.form))
      if (this.form.password.length < 7) {
        this.makeToast("danger", "Minimum length for password is 7");
      } else if (this.form.password !== this.form.cpassword) {
        this.makeToast(
          "danger",
          "Your password and confirmation password do not match."
        );
      } else {
        this.setNewUser();
        this.fetchUsers();
      }
    },
    makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        title: "Notice!",
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center"
      });
    },
    // set user from form
    setNewUser() {
      this.newUser = {
        userid: this.form.username,
        pass: this.form.password,
        title: this.form.title,
        cusfname: this.form.fname,
        cuslname: this.form.lname,
        tel: this.form.tel,
        email: this.form.email,
        country: this.form.country,
        DOB: this.form.birthday
      };
      this.fetchuser = {
        userid: this.form.username
      };
    },
    fetchUsers() {
      var formData = this.toFormData(this.fetchuser);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/regis.php?action=read",
          formData
        )
        .then(response => {
          console.log(response);
          this.fetchuser = response.data.data;
          // this.user = this.user[0];
          this.fetchlenght = this.fetchuser.length;
          if (this.fetchlenght !== 0) {
            this.makeToast("danger", "This User_ID has already used");
          } 
          else {
            this.addUser();
            this.makeToast("success", "Register complete");
            setTimeout(() => {
              this.$router.push("login");
            }, 1500);
          }
          // console.log(this.fetchlenght);
          // console.log(response.data);
        });
    },
    // axios post data
    addUser() {
      var formData = this.toFormData(this.newUser);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/regis.php?action=add",
          formData
        )
        .then(response => {
          //set var to default
          // console.log(response);
          this.form = {
            email: "",
            username: "",
            password: "",
            cpassword: "",
            tel: "",
            title: null,
            fname: "",
            lname: "",
            birthday: "",
            country: ""
          };
          this.newUser = {
            userid: "",
            pass: "",
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
    }
  }
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
}
#left {
  max-width: 30rem;
  padding: 30px 20px;
  float: middle;
  text-align: left;
}
body {
  background-image: url("../assets/1023.jpg");
  background-size: cover;
  background-position: center center;
  min-width: 100%;
  min-height: 100%;
  position: absolute;
}
#btn {
  border: none;
  background-color: transparent;
  padding: 0px;
  font-size: 16px;
  cursor: pointer;
  display: inline-block;
  color: #2688d9;
}
</style>
