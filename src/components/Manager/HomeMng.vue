<!-- ViewStaff+StatusHotel -->
<template>
    <div id="all">
        <MNnav/>
        <div>
        <b-card id="card" title="Your profile">

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
    max-width: 90rem; 
    margin:100px 100px 100px 300px;    
    padding:30px;
    
  }
</style>