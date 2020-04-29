<template>
    <div>
        <STnav/>
        <b-card id='card' title="Your History" >
            
            <a href='#'> <button>Review</button> </a>
            <a href='#'> <button>Cancel</button> </a>
        </b-card>
    </div>
</template>

+review ด้วย
อย่าลืมตุ่มยกเลิกการจองก่อนถึงวัน check-in

<script>
import STnav from './SideTopNav_cus.vue'
export default {
    components:{
        STnav,
    },
    
}
</script>

<style scoped>
#card{
    max-width: 50rem; 
    margin:100px 100px 100px 400px;    
    padding:30px;
    
  }
</style>