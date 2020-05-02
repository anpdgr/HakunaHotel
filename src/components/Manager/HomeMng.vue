<!-- ViewStaff+StatusHotel -->
<template>
    <div id="all">
        <MNnav/>
        <div>
        <b-card id="card" title="Your profile">
          <b-card-body>   
              <b-tabs content-class="mt-3" fill>
                    <b-tab title="About you" active>
                        <div style="margin:70px 30px">
                          <span style="float:left;">First name</span><br><br> 
                          <span style="float:left;">Last name</span><br><br>
                          <span style="float:left;">Name title</span><br><br>
                          <span style="float:left;">Birthday</span><br><br>
                          <span style="float:left;">Email address</span><br><br>
                          <span style="float:left;">Phone number</span><br><br>
                          <span style="float:left;">Country</span><br><br>
                        </div>
                    </b-tab>
                    <b-tab title="About job">
                        <div style="margin:70px 30px">
                          <span style="float:left;">Position</span>เมเนเจ้องัย จะคัยหล่ะ<br><br>
                          <span style="float:left;">Salary</span><br><br>
                          <span style="float:left;">Start date</span><br><br>
                        </div>
                    </b-tab>               
              </b-tabs>              
          </b-card-body>  

        </b-card>
      </div>

    </div>

</template>

<script>
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