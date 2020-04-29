<template>
  <div id="all" >
    <Cusnav/>
      <div>
        <b-card id="card" title="Your profile">

        </b-card>
      </div>

  </div>

</template>

<style scoped>
#all{
  margin: 100px 50px;
  
}
#card{
    max-width: 90rem; 
    margin:100px 100px 100px 300px;    
    padding:30px;
    
  }
</style>

<script>
import Cusnav from './SideTopNav_cus.vue'
export default {
  components:{
        Cusnav,
    }
  
}
</script>