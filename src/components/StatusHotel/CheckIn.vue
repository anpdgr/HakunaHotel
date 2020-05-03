<template>
    <div>
        <STnav/>
        <Side/>
        <div id="all">
            <b-card id="card">
                <h1>Check-in</h1>
                <div id='detail-head'>
                    <h6 style="float:left">Booking no</h6><br>
                    
                    <div id='PayDetail'>
                        <h6>Payment detail</h6>
                        <p style="margin-right:350px">Method :</p>
                        <p>Total :</p>
                        
                    </div>
                    
                    <div id='CusDetail'>
                        <h6>Customer detail</h6>
                        <p>ID :</p>
                        <span style="float:left">Name :</span>
                        <span>Phone :</span>
                    </div>
                    <br><hr style="width:900px">
                </div>
               
                <div id="bookdetail">
                    <h6>Booking Detail</h6><br>
                    <div  v-for='item in items' :key='item'>
                        <b-card  id="roomtype_card">
                            <h6>{{item.roomtype}}</h6> 
                            <p>{{item.Qroom}} rooms</p>
                            <div id="roomdetail">
                                <b-button v-b-modal.modal-center>Add information</b-button>
                                <div>
                                    <b-modal id="modal-center" centered title="Add information"  hide-footer>
                                         <guest/>                            
                                    </b-modal>
                                </div>
                            </div>
                        </b-card>
                    </div>
                </div>



                <b-button
                    v-b-tooltip.hover
                    title="Please make sure that your information is correct"
                    id="Confirm"
                    type="submit"
                    variant="success"
                    @click="check()"
                    style="float:right; margin:20px"
                >
                    Confirm
                </b-button>
                
                

            </b-card>
        </div>
    </div>
    
    

</template>





- กดจาก StatusHotel
<script>
import STnav from '../Nav_st.vue'
import Side from './Side_statusH.vue'
import guest from './Guestform'
export default {
  components:{
        STnav,
        Side,
        guest
    },
  data() {
    return {
      items: [
        { roomtype: "Dulux Executive Twin Bed", Qroom: 1 ,limitG:2},
        //{ roomtype: "Premier Lux Twin Bed", Qroom: 1,limitG:2},
        { roomtype: "Urban Junior Suite", Qroom: 2 ,limitG:4},
      ],
    };
  }
  
}
</script>

<style>
    #all{
    margin: 100px 100px auto 300px;
    
    }
    #card{
        padding: 20px 50px;
    }
    #detail-head{
       
        margin:50px auto 20px auto;
    }
    #CusDetail{
        margin: 10px auto;
        
    }
    #PayDetail{
        margin: 10px auto;
        float: left;
        
    }
    #roomtype_card{
        margin: 10px;
    
        
    }
</style>
