<template>
<body id="login">
  <div id="box">
    <!-- Box login -->
    <b-card style="max-width:30rem; padding:30px; float: middle;">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title">Sign in</h3>
          <br />
        </div>
        <!-- Form sign in -->
        <b-form @submit="onSubmit">
          <b-form-group id="ipg-uname">
            <!-- input user -->
            <b-form-input id="ip-uname" v-model="form.username" required placeholder="Username"></b-form-input>
          </b-form-group>

          <!-- input pass -->
          <b-form-group id="ipg-pass">
            <b-form-input
              type="password"
              id="ip-pass"
              v-model="form.password"
              required
              placeholder="Password"
            ></b-form-input>
          </b-form-group>

          <div style="float: left;">
            <b-button v-on:click="check = 1" type="submit" variant="primary">Sign in</b-button>

            <b-button @click="TestUser" @click.alt="StaffUser" type="button">devuser</b-button>
          </div>
        </b-form>
      </div>
      <br />
      <br />
      <div id="back" style="text-align: right;">
        <!-- link to register page -->
        <button id="btn" @click="regis">I didn't have an account</button>
        <br />
        <!-- link to home -->
        <button id="btn" @click="home">Back to home</button>
      </div>
    </b-card>
  </div>
</body>
</template>

<script>
export default {
  data() {
    return {
      c: 0,
      form: {
        username: "",
        password: ""
      },
      users: [],
      show: true,
      check: 0
    };
  },
  mounted() {
    this.fetchUsers();
  },
  methods: {
    //  method for เปลี่ยนหน้า
    regis() {
      this.$router.push("register");
    },
    home() {
      this.$router.push("/");
    },
    onSubmit(evt) {
      evt.preventDefault();
      // alert(JSON.stringify(this.form))
      this.CheckUser();
      if (this.c === 0)
        this.makeToast("danger", "username or password incorrect");
      // alert("username or password incorrect");
      else if (this.c === 1) {
        this.makeToast("success", "User login");
        // alert("User login");
        setTimeout(() => {
          this.$router.push("/");
        }, 1500);
      } else if (this.c === 2) {
        this.makeToast("success", "Staff login");
        // alert("Staff login");
        setTimeout(() => {
          this.$router.push("/shome");
        }, 1500);
      }
    },
    // ดึงข้อมูลจาก db เพื่อเช็ค username  ที่ login
    fetchUsers() {
      this.axios
        .get("http://hakuna-hotel.kmutt.me/phpapi/login.php?action=read")
        .then(response => {
          this.users = response.data.data;
          console.log(this.users);
          console.log(response.data);
        });
    },
    // ตัว test
    TestUser() {
      this.form = {
        username: "noey_1",
        password: "12345"
      };
    },
    StaffUser() {
      this.form = {
        username: "ST_0002",
        password: "Sun0001"
      };
    },
    CheckUser() {
      this.users.forEach(this.checkUP);
    },
    checkUP(value) {
      if (value["User_ID"] === this.form.username) {
        if (value["Password"] == this.form.password) {
          this.c = 1;
          this.$store.dispatch("AcUser", value["User_ID"]);
        }
      } else if (value["Staff_ID"] === this.form.username) {
        if (value["Password"] == this.form.password) {
          this.c = 2;
          this.$store.dispatch("AcUser", value["Staff_ID"]);
        }
      }
      // console.log(JSON.stringify(value["User_ID"]));
    },
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

<style scoped>
#btn {
  border: none;
  background-color: transparent;
  padding: 0px;
  font-size: 16px;
  cursor: pointer;
  display: inline-block;
  color: #2688d9;
}

#back {
  text-align: right;
}
#box {
  max-width: 500px;
  margin: auto;
  padding-top: 100px;
}
body {
  background-image: url("../assets/hotel.home.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  height: 100vh;
}
</style>
