<!-- ViewStaff+StatusHotel -->
<!-- home manager -->
<template>
    <div id="all">
        <MNnav/>
        <div>
        <b-card id="card" title="Your profile">
          <b-card-body>   
              <b-tabs content-class="mt-3" fill>
                <!-- tab bar about u -->
                    <b-tab title="About you" active>
                        <div style="margin:70px 30px">
                          <!-- show profile -->
                          <span style="float:left;"><b>First name</b></span><br><br> 
                          <span style="float:left;"><b>Last name</b></span><br><br>
                          <span style="float:left;"><b>Name title</b></span><br><br>
                          <span style="float:left;"><b>Birthday</b></span><br><br>
                          <span style="float:left;"><b>Email address</b></span><br><br>
                          <span style="float:left;"><b>Phone number</b></span><br><br>
                          <span style="float:left;"><b>Country</b></span><br><br>
                        </div>
                    </b-tab>
                    <!-- tab bar about job  -->
                    <b-tab title="About job">
                        <div style="margin:70px 30px">
                          <!-- show detail about job  -->
                          <span style="float:left;"><b>Position</b></span>เมเนเจ้องัย จะคัยหล่ะ<br><br>
                          <span style="float:left;"><b>Salary</b></span><br><br>
                          <span style="float:left;"><b>Start date</b></span><br><br>
                        </div>
                    </b-tab>               
              </b-tabs>              
          </b-card-body>  

        </b-card>
      </div>

    </div>

</template>

<script>
// import manager bar 
import MNnav from './SideTopNav_mn.vue'
export default {
  components:{
        MNnav,
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