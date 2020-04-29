<!-- EditStaff+Checkin+AddCode+StatusHotel -->
<template>
    <div id="all">
        <STnav/>
        <div>
        <b-card id="card" title="Your profile">

        </b-card>
      </div>

    </div>

</template>

<script>
import STnav from './SideTopNav_st.vue'
export default {
  components:{
        STnav,
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