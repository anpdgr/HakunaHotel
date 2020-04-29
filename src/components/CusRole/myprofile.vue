<template>
  <div id="all" >
    <STnav/>
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
    max-width: 50rem; 
    margin:100px 100px 100px 400px;    
    padding:30px;
    
  }
</style>

<script>
import STnav from './SideTopNav_cus.vue'
export default {
  components:{
        STnav,
    }
  
}
</script>