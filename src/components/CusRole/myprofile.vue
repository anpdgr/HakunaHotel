<template>
  <div id="all">
    
    <!--                            bar                                     -->
    <NavLo />

    <!--                         left  bar                                  -->
    <Cusnav />
    <div>

      <!--                     Customer info                                -->
      <b-card id="card" title="Your profile">
        <b-card-body style="margin:40px">
          
          <!-- First Name -->
          <span style="float:left;"><b>First name :</b> {{user.Customer_FirstName}}</span>
          <br />
          <br />

          <!-- Last Name -->
          <span style="float:left;"><b>Last name :</b> {{user.Customer_LastName}}</span>
          <br />
          <br />

          <!-- Title -->
          <span style="float:left;"><b>Name title :</b> {{user.Name_Title}}</span>
          <br />
          <br />

          <!-- DoB -->
          <span style="float:left;"><b>Birthday :</b> {{user.DoB}}</span>
          <br />
          <br />

          <!-- Email -->
          <span style="float:left;"><b>Email address :</b> {{user.Email}}</span>
          <br />
          <br />

          <!-- Tel -->
          <span style="float:left;"><b>Phone number :</b> {{user.Tel_No}}</span>
          <br />
          <br />

          <!-- Country -->
          <span style="float:left;"><b>Country :</b> {{user.Customer_Country}}</span>
          <br />
          <br />
        </b-card-body>
      </b-card>
    </div>
  </div>
</template>

<style scoped>
#all {
  margin: 100px 50px;
}
#card {
  max-width: 50rem;
  margin: 100px 100px 100px 400px;
  padding: 30px;
  text-align: center;
}
</style>

<script>
import Cusnav from "./SideTopNav_cus.vue";
import NavLo from "../NavLO.vue";
export default {
  components: {
    Cusnav,
    NavLo
  },
  data() {
    return {
      // for show
      user:"",

      // for select in DB
      thisuser:{
        userid:""
      }
    };
  },
  mounted() {
    this.thisuser.userid = this.$store.getters.getUser;
    this.fetchUsers();
  },
  methods: {
    // fetch data from database
    fetchUsers() {
      var formData = this.toFormData(this.thisuser);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/myprofileuser.php?action=read",formData)
        .then(response => {
          this.user = response.data.data[0];
          //this.user = this.user[0];
          // console.log(this.user);
          // console.log(response.data);
        });
    },
    // convert to formdata
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



