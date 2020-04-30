<template>
  <div id="all" >
    <Cusnav/>
      <div>
        <b-card id="card" title="Your profile">
          <b-card-body style="margin:40px">
              <span style="float:left;">First name</span><br><br> 
              <span style="float:left;">Last name</span><br><br>
              <span style="float:left;">Name title</span><br><br>
              <span style="float:left;">Birthday</span><br><br>
              <span style="float:left;">Email address</span><br><br>
              <span style="float:left;">Phone number</span><br><br>
              <span style="float:left;">Country</span><br><br>
            </b-card-body>  


        </b-card>
        
      </div>

  </div>

</template>

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

<script>
import Cusnav from './SideTopNav_cus.vue'
export default {
  components:{
        Cusnav,
    },
    data(){
      
    }
    
  
}
</script>



