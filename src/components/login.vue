<template>
<body id="login">
  <div id="box">
    <!-- Box login -->
    <b-card style="max-width:30rem; padding:30px; float: middle; margin-top:100px">
      <div class="panel panel-primary">
        <div class="panel-heading">
          <h3 class="panel-title">Sign in</h3>
          <br />
        </div>

        <!-- Form sign in -->
        <b-form @submit="onSubmit">
          <!-- input user -->
          <b-form-group id="ipg-uname">
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
            <!-- sign in button -->
            <b-button type="submit" style="background-color:#6096a8; margin-right:10px">Sign in</b-button>

            <!-- testuser button -->
            <b-button @click="TestUser" @click.alt="StaffUser" type="button">devuser</b-button>
          </div>
        </b-form>
      </div>
      <br />
      <br />
      <div id="back" style="text-align: right;">
        <!-- link to register page -->
        <button id="btn" @click="regis" style="color:#809aa1">I didn't have an account</button>
        <br />

        <!-- link to home -->
        <button id="btn" @click="home" style="color:#809aa1">Back to home</button>
      </div>
    </b-card>
  </div>
</body>
</template>

<script>
export default {
  data() {
    return {
      // check status user 0:didn't login  1:customer   2:staff
      c: 0,

      // input form
      form: {
        username: "",
        password: ""
      },

      // fetch data form DB
      users: [],

      // didn't use
      show: true,

      // didn't use
      check: 0
    };
  },
  mounted() {
    this.fetchUsers();
    // console.log(Date());
    // console.log(Date("Tomorrow"));
  },
  methods: {
    //  method for เปลี่ยนหน้า
    regis() {
      this.$router.push("register");
    },
    home() {
      this.$router.push("/");
    },
    // When click button sign in
    onSubmit(evt) {
      evt.preventDefault();
      // alert(JSON.stringify(this.form))
      this.CheckUser();

      // sign in failed
      if (this.c === 0)
        this.makeToast("danger", "username or password incorrect");
      // alert("username or password incorrect");
      // sign in user
      else if (this.c === 1) {
        this.makeToast("success", "User login");
        // alert("User login");

        // go to payment
        if (this.$store.getters.getBook) {
          setTimeout(() => {
            this.$router.push("/payment");
          }, 1500);
        }

        // go to home
        else {
          setTimeout(() => {
            this.$router.push("/");
          }, 1500);
        }
        // sign in staff
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
          // console.log(this.users);
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

    // foe loop user from DB
    CheckUser() {
      for (var i = 0; i < this.users.length; i++) {
        if (this.users[i]["User_ID"] === this.form.username) {
          if (this.users[i]["Password"] == this.form.password) {
            this.c = 1;
            this.$store.dispatch("AcUser", this.users[i]["User_ID"]);
            this.$store.dispatch("AcBKID", this.users[i]["No"]);
          }
        } 
        else if (this.users[i]["Staff_ID"] === this.form.username) {
          if (this.users[i]["Password"] == this.form.password) {
            this.c = 2;
            this.$store.dispatch("AcIsS", true);
            this.$store.dispatch("AcUser", this.users[i]["Staff_ID"]);
          }
        }
      }

    },
// GetDB(URL, Data, code) {
//       var formData = this.toFormData(Data);
//       this.axios.post(URL, formData).then(response => {
//       });
//       },
// toFormData(obj) {
//       var fd = new FormData();
//       for (var i in obj) {
//         fd.append(i, obj[i]);
//       }
//       return fd;
//     },

    // สร้างกล่องข้อความ
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
  background-image: url("../assets/1023.jpg");
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  height: 100vh;
}
</style>
