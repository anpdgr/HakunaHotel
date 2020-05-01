<template>
  <div >
    <STnav/>
    <Side/>
    <div id="all">
      <h1 >Booking</h1>
      <a href="/checkin">checkin</a>
      <a href="/checkin">checkout</a>
    </div>
  
  </div>
</template>





<script>
import STnav from '../Nav_st.vue'
import Side from './Side_statusH.vue'
export default {
  components:{
        STnav,
        Side
    }
  
}
</script>


<style>
#all{
  margin: 100px 100px auto 300px;
  
}

</style>



- เป็นตารางห้องๆ บอกสเตตัสบลาๆ  มีfilter
- ถ้าถึงวัน checkin ก็มีปุ่ม checkin
- ถ้า checkin แล้วมีปุ่ม checkout
- ถ้าเกินวัน checkin ก็ตัดการจองเอง