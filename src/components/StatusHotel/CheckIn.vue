<template>
    <div>
        <STnav/>
        <Side/>
        <div id="all">
        <b-card id="card">
            <h1>Check-in</h1>
            <div id='detail-head'>
                <h6>Booking no</h6><br>
                
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
                <div >
                    <b-card  id="roomtype_card" v-for='item in items' :key='item'>
                        <h6>{{item.roomtype}}</h6> 
                        <p>{{item.Qroom}} rooms</p>
                        <div id="roomdetail">
                            <b-button v-b-modal.modal-center>Add information</b-button>
                            <div>
                                <b-modal id="modal-center" centered title="Add information">
                                    <b-form-select-group>
                                        <p>select room ID</p>
                                        <b-form-select style="width:8rem; margin:10px" 
                                            v-model="roomid" :options="op_roomid">
                                        </b-form-select>
                                    </b-form-select-group>
                                    <br><br>
                                    <div id="guest">
                                        <h6>Guest information</h6>
                                        <b-form>
                                            <b-form-group label="Name title:" >
                                                <b-form-select
                                                    id="ip-title"
                                                    v-model="g.title"
                                                    :options="title"
                                                    placeholder="-- select one --"
                                                    required
                                                ></b-form-select>
                                            </b-form-group>

                                            <b-form-group label="First Name:">
                                                <b-form-input
                                                    id="ip-fname"
                                                    v-model="g.fname"
                                                    required
                                                    placeholder="enter first name"
                                                ></b-form-input>
                                            </b-form-group>

                                            <b-form-group label="Last Name:">
                                                <b-form-input
                                                    id="ip-lname"
                                                    v-model="g.lname"
                                                    required
                                                    placeholder="enter last name"
                                                ></b-form-input>
                                            </b-form-group>

                                            <b-form-group label="Phone number:">
                                                    <b-form-input
                                                        id="ip-tel"
                                                        v-model="g.tel"
                                                        type="tel"
                                                        required
                                                        placeholder="enter phone number"
                                                    ></b-form-input>
                                            </b-form-group>
                                                
                                            <b-form-group label="Country:" >
                                                    <b-form-input
                                                        id="ip-country"
                                                        v-model="g.country"
                                                        required
                                                    ></b-form-input>
                                            </b-form-group>

                                                
                                            
                                        </b-form>
                                        <b-icon icon="plus-circle" style="width:39rem"></b-icon>
                                    </div>
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
export default {
  components:{
        STnav,
        Side
    },
  methods:{
      check(){

      }

  },
  data() {
    return {
      items: [
        { roomtype: "Dulux Executive Twin Bed", Qroom: 1 ,limitG:2},
        //{ roomtype: "Premier Lux Twin Bed", Qroom: 1,limitG:2},
        { roomtype: "Urban Junior Suite", Qroom: 2 ,limitG:4},
      ],

      roomid: null,
        op_roomid: [
          { value: 1, text: '1000' },
          { value: 2, text: '1001' },
          { value: 3, text: '1002' },
          { value: 4, text: '1003' },
          { value: 5, text: '1004' },
          
        ],
        g: {
          tel:'',
          title: null,
          fname: '',
          lname: '',
          country: null,
          
        },
        title: [{ text: 'Select One', value: null }, 'Mr.', 'Ms.', 'Miss'],
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
    float:left;
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
