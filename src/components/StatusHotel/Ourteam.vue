<template>
    <div>
        <STnav/>
        <Side/>
        <b-card id='card' title="Our team" >
                <div>
                    
                </div>
            </b-card>
    </div>
</template>

เป็นการ์ดๆๆๆๆ
Edit Staff เป็น pop-up ขึ้นมา

<script>
import STnav from '../Nav_st.vue'
import Side from './Side_statusH.vue'
export default {
    components:{
        STnav,
        Side
    },
    
}
</script>


<style scoped>
#card{
    max-width: 90rem; 
    margin:100px 100px 100px 300px;    
    padding:30px;
    
  }
</style>