<!-- EditStaff+Checkin+AddCode+StatusHotel -->
<template>
    <div id="all">
        <STnav/>
        <div>
        <b-card id="card" title="Your profile">
          
            <b-card-body>   
              <b-tabs content-class="mt-3" fill>
                    <b-tab title="About you" active>
                        <div style="margin:70px 30px">
                          <span style="float:left;">First name : {{staff.Staff_FirstName}}</span><br><br> 
                          <span style="float:left;">Last Name : {{staff.Staff_LastName}}</span><br><br>
                          <span style="float:left;">Name title : {{staff.Name_Title}}</span><br><br>
                          <span style="float:left;">Birthday : {{staff.Date_Of_Birth}}</span><br><br>
                          <span style="float:left;">Address : {{staff.Address}}</span><br><br>
                          <span style="float:left;">Phone number : {{staff.Tel_No}}</span><br><br>
                          <!-- <span style="float:left;">Country</span><br><br> -->
                        </div>
                    </b-tab>
                    <b-tab title="About job">
                        <div style="margin:70px 30px">
                          <span style="float:left;">Position : {{staff.Position}}</span><br><br>
                          <span style="float:left;">Salary : {{staff.Salary}}</span><br><br>
                          <span style="float:left;">Start date : {{staff.Start_Date}}</span><br><br>
                        </div>
                    </b-tab>               
              </b-tabs>              
            </b-card-body>  
        </b-card>
      </div>

    </div>

</template>

<script>
import STnav from './SideTopNav_st.vue'
export default {
  components:{
        STnav,
    },
    data(){
      return{
        // for show
        staff:"",
        thisstaff:{
          staffid:""
        }
      };
    },
     mounted() {
    this.thisstaff.staffid = this.$store.getters.getUser;
    this.fetchUsers();
  },
    methods: {
      // fetch data from database
    fetchUsers() {
      var formData = this.toFormData(this.thisstaff);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/staffprofile.php?action=read",formData)
        .then(response => {
          this.staff = response.data.data;
          this.staff = this.staff[0];
          console.log(this.staff);
          console.log(response.data);
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
  
}
</script>

<style scoped>
#all{
  margin: 100px 50px;
  
}
#card{
    max-width: 50rem; 
    margin:100px 100px 100px 400px;    
    padding:30px;
    
  }
</style>