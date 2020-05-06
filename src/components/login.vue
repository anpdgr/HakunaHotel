<template>
  <body id="login">
    <div id="box">
      <!-- Box login -->
      <b-card style="max-width:30rem; padding:30px; float: middle;">
        <div class="panel panel-primary">
          <div class="panel-heading">
            <h3 class="panel-title">Sign in</h3>
            <br>
          </div>
          <!-- Form sign in -->
          <b-form @submit="onSubmit">
            <b-form-group id="ipg-uname">

              <!-- input user -->
              <b-form-input
                id="ip-uname"
                v-model="form.username"
                required
                placeholder="Username"
              ></b-form-input>
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
              <b-button v-on:click="check = 1" type="submit" variant="primary" 
                >Sign in</b-button>

              <b-button @click="TestUser" type="button" 
                >devuser</b-button>
            
            </div>
          </b-form>
        </div>
        <br /><br />
        <div id="back" style="text-align: right;">
          <a href="register">I didn't have an account</a>
          <br />
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
      c:0,
      form: {
        username: "",
        password: "",
      },
      users:[],
      show: true,
      check: 0,
    };
  },
  mounted() {
    this.fetchUsers();
  },
  methods: {
    onSubmit(evt) {
      evt.preventDefault();
      // alert(JSON.stringify(this.form))
      this.CheckUser();
      if(this.c === 0)
        alert("username or password incorrect");
      else if(this.c === 1){
        alert("User login");
        this.$router.push("/");
      }
      else if(this.c === 2){
        alert("Staff login");
        this.$router.push("/shome");
      }
    },
    fetchUsers() {
      this.axios
        .get("http://hakuna-hotel.kmutt.me/phpapi/login.php?action=read")
        .then(response => {
          this.users = response.data.data;
          console.log(this.users);
           console.log(response.data);
        });
    },
    TestUser(){
      this.form = {
        username: "testuser",
        password: "password"
      }


    },
    CheckUser(){
       this.users.forEach(this.checkUP);      
    },
    checkUP(value){
      if(value["User_ID"] === this.form.username)
      {
        if(value["Password"] == this.form.password){
          this.c = 1;
          // this.$store.dispatch("AcSetUser",value["User_ID"]);
        }
          
      }
      else if(value["Staff_ID"] === this.form.username){
        if(value["Password"] == this.form.password){
          this.c = 2;
          // this.$store.dispatch("AcSetUser",value["Staff_ID"]);
        }
          
      }
      // console.log(JSON.stringify(value["User_ID"]));
    }
    
  },
};
</script>

<style scoped>
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
