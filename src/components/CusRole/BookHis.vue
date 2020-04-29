<template>
    <div>
        <Cusnav/>
        <b-card id='card' title="Your History" >
            <div>
                <b-card no-body>
                    <b-tabs card>
                    <b-tab title="Ongoing" active>
                        <b-card-text>Tab contents 1</b-card-text>
                        <a> <button>cancle</button> </a>
                    </b-tab>
                    <b-tab title="Done">
                        <b-card-text>Tab contents 2</b-card-text>
                        <a href='#'> <button>Review</button> </a>
                    </b-tab>
                    <b-tab title="Cancled">
                        <b-card-text>Tab contents 3</b-card-text>
                    </b-tab>
                    </b-tabs>
                </b-card>
            </div>
        </b-card>

        
    </div>
</template>

+review ด้วย
อย่าลืมตุ่มยกเลิกการจองก่อนถึงวัน check-in

<script>
import Cusnav from './SideTopNav_cus.vue'
export default {
    components:{
        Cusnav,
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