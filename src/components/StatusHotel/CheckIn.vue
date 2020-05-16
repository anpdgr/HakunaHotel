<template>
    <div>
        <STnav/>
        <Side/>
        <div id="all">
            <b-card id="card">
                <!-- ส่วนรายละเอียด -->
                <h1>Check-in</h1>
                <div id='detail-head' style="text-align:left;">
                    <!-- show Bookingid ที่กำลัง check in -->
                    <b style="font-size:120%;">Booking no.</b><br><br>
                <b-row>
                    <!-- show cusdetail  -->
                    <b-col id='CusDetail'>
                        <b style="font-size:120%;">Customer detail</b><br><br>
                        <p>ID :</p>
                        <p>Name :</p>
                        <p>Phone :</p>
                    </b-col>
                    <!-- show payment detail  -->
                    <b-col id='PayDetail'>
                        <b style="font-size:120%;">Payment detail</b><br><br>
                        <p >Method :</p>
                        <p>Total :</p>
                        
                    </b-col>      
                </b-row>    
                    <hr style="width:100%">
                </div>
               <!-- ส่วน checkin -->
                <div id="bookdetail">
                    <b style="font-size:120%;">Booking Detail</b><br>
                    <!-- show roomtype ที่จอง -->
                    <div v-for='(item,index) in items' :key='index'>
                        <b-card  id="roomtype_card" >  
                            <div style="text-align:left;">                    
                            <p><b style="font-size:105%;">{{item.roomtype}}    :</b>  {{item.Qroom}} rooms </p>
                            <p style="font-size:80%; text-align:left">* Click button to add information</p>
                            </div>
                            <b v-if=" roomsucces==1"  style="float:right; color:MediumSeaGreen">checked</b>
                            <div v-for='i in item.Qroom' :key="i" style="float:left">   
                                <b-button v-b-modal.modal-center  @click="index1 = index" style="margin:0px 20px 0px 0px">room {{i}}</b-button>
                                    <div id="roomdetail" v-if="index === index1">
                                        <b-modal id="modal-center" centered title="Add information"  hide-footer>
                                            <div id="guest form">
                                                <!-- เลือกเลขห้อง -->
                                                <b-form-select-group>
                                                    <h6>Select room ID</h6>
                                                    <b-form-select style="width:8rem; margin:10px" 
                                                        v-model="selectroomid" 
                                                        :options="op_roomid">
                                                    </b-form-select>
                                                </b-form-select-group>
                                                <br><br>
                                                <div id="guest">
                                                    <h6>Guest information</h6>                        
                                                </div>
                                                <!-- guest info  -->
                                                <b-tabs card>
                                                    <b-tab title="* Guest 1" active>
                                                        <b-form id="G1">
                                                                <b-form-group label="Name title:" >
                                                                    <b-form-select
                                                                        id="ip-title"
                                                                        v-model="form1.title"
                                                                        :options="title"
                                                                        placeholder="-- select one --"
                                                                        required
                                                                    ></b-form-select>
                                                                </b-form-group>
                                                                <b-form-group label="First Name:">
                                                                    <b-form-input
                                                                        id="ip-fname"
                                                                        v-model="form1.fname"
                                                                        required
                                                                        placeholder="enter first name"
                                                                    ></b-form-input>
                                                                </b-form-group>
                                                                <b-form-group label="Last Name:">
                                                                    <b-form-input
                                                                        id="ip-lname"
                                                                        v-model="form1.lname"
                                                                        required
                                                                        placeholder="enter last name"
                                                                    ></b-form-input>
                                                                </b-form-group>
                                                                <b-form-group label="Phone number:">
                                                                    <b-form-input
                                                                        id="ip-tel"
                                                                        v-model="form1.tel"
                                                                        type="tel"
                                                                        required
                                                                        placeholder="enter phone number"
                                                                    ></b-form-input>
                                                                </b-form-group>
                                                                                                    
                                                                <b-form-group label="Country:" >
                                                                    <b-form-input
                                                                        id="ip-country"
                                                                        v-model="form1.country"
                                                                        required
                                                                    ></b-form-input>
                                                                </b-form-group>                                   
                                                        </b-form>  
                                                    </b-tab>
                                                    
                                                    <b-tab title="Guest 2">
                                                        <b-form id="G2">
                                                                <b-form-group label="Name title:" >
                                                                    <b-form-select
                                                                        id="ip-title"
                                                                        v-model="form2.title"
                                                                        :options="title"
                                                                        placeholder="-- select one --"
                                                                        required
                                                                    ></b-form-select>
                                                                </b-form-group>
                                                                <b-form-group label="First Name:">
                                                                    <b-form-input
                                                                        id="ip-fname"
                                                                        v-model="form2.fname"
                                                                        required
                                                                        placeholder="enter first name"
                                                                    ></b-form-input>
                                                                </b-form-group>
                                                                <b-form-group label="Last Name:">
                                                                    <b-form-input
                                                                        id="ip-lname"
                                                                        v-model="form2.lname"
                                                                        required
                                                                        placeholder="enter last name"
                                                                    ></b-form-input>
                                                                </b-form-group>
                                                                <b-form-group label="Phone number:">
                                                                    <b-form-input
                                                                        id="ip-tel"
                                                                        v-model="form2.tel"
                                                                        type="tel"
                                                                        required
                                                                        placeholder="enter phone number"
                                                                    ></b-form-input>
                                                                </b-form-group>
                                                                                                    
                                                                <b-form-group label="Country:" >
                                                                    <b-form-input
                                                                        id="ip-country"
                                                                        v-model="form2.country"
                                                                        required
                                                                    ></b-form-input>
                                                                </b-form-group>                                   
                                                        </b-form> 
                                                    </b-tab>   
                                                
                                                    <b-tab title="Guest 3">
                                                        <b-form id="G3">
                                                                <b-form-group label="Name title:" >
                                                                    <b-form-select
                                                                        id="ip-title"
                                                                        v-model="form3.title"
                                                                        :options="title"
                                                                        placeholder="-- select one --"
                                                                        required
                                                                    ></b-form-select>
                                                                </b-form-group>
                                                                <b-form-group label="First Name:">
                                                                    <b-form-input
                                                                        id="ip-fname"
                                                                        v-model="form3.fname"
                                                                        required
                                                                        placeholder="enter first name"
                                                                    ></b-form-input>
                                                                </b-form-group>
                                                                <b-form-group label="Last Name:">
                                                                    <b-form-input
                                                                        id="ip-lname"
                                                                        v-model="form3.lname"
                                                                        required
                                                                        placeholder="enter last name"
                                                                    ></b-form-input>
                                                                </b-form-group>
                                                                <b-form-group label="Phone number:">
                                                                    <b-form-input
                                                                        id="ip-tel"
                                                                        v-model="form3.tel"
                                                                        type="tel"
                                                                        required
                                                                        placeholder="enter phone number"
                                                                    ></b-form-input>
                                                                </b-form-group>
                                                                                                    
                                                                <b-form-group label="Country:" >
                                                                    <b-form-input
                                                                        id="ip-country"
                                                                        v-model="form3.country"
                                                                        required
                                                                    ></b-form-input>
                                                                </b-form-group>                                   
                                                        </b-form>  
                                                    </b-tab>   
                                                    
                                                    <b-tab title="Guest 4">
                                                        <b-form id="G4">
                                                                <b-form-group label="Name title:" >
                                                                    <b-form-select
                                                                        id="ip-title"
                                                                        v-model="form4.title"
                                                                        :options="title"
                                                                        placeholder="-- select one --"
                                                                        required
                                                                    ></b-form-select>
                                                                </b-form-group>
                                                                <b-form-group label="First Name:">
                                                                    <b-form-input
                                                                        id="ip-fname"
                                                                        v-model="form4.fname"
                                                                        required
                                                                        placeholder="enter first name"
                                                                    ></b-form-input>
                                                                </b-form-group>
                                                                <b-form-group label="Last Name:">
                                                                    <b-form-input
                                                                        id="ip-lname"
                                                                        v-model="form4.lname"
                                                                        required
                                                                        placeholder="enter last name"
                                                                    ></b-form-input>
                                                                </b-form-group>
                                                                <b-form-group label="Phone number:">
                                                                    <b-form-input
                                                                        id="ip-tel"
                                                                        v-model="form4.tel"
                                                                        type="tel"
                                                                        required
                                                                        placeholder="enter phone number"
                                                                    ></b-form-input>
                                                                </b-form-group>
                                                                                                    
                                                                <b-form-group label="Country:" >
                                                                    <b-form-input
                                                                        id="ip-country"
                                                                        v-model="form4.country"
                                                                        required
                                                                    ></b-form-input>
                                                                </b-form-group>                                   
                                                        </b-form> 
                                                    </b-tab>
                                                </b-tabs>
                                                <!-- submit checkin  -->
                                                <b-button
                                                            id="Confirm"
                                                            type="submit"
                                                            variant="outline-primary"
                                                            
                                                            @click="check"
                                                            style="float:right; margin:20px"
                                                        >
                                                            submit
                                                </b-button>

                                            </div>                         
                                        </b-modal>
                                    </div>
                                    
                            </div>
                        </b-card>
                    </div>
                    
                </div>


                <!-- confirm checkin  -->
                <b-button
                    v-b-tooltip.hover
                    title="Please make sure that your information is correct"
                    id="Confirm"
                    type="submit"
                    variant="success"
                    @click="confirm()"
                    style="float:right; margin:20px"
                >
                    Confirm
                </b-button>
                
                

            </b-card>
        </div>
    </div>
    
    

</template>
<!--กดจาก StatusHotel-->
<script>
import STnav from '../Nav_st.vue'
import Side from './Side_statusH.vue'
//import guest from './Guestform'
export default {
  components:{
        STnav,
        Side,
        //guest
    },
  data() {
    return {
      index1:0,
      roomsucces:0,
    //   booked roomtype 
      items: [
        { roomtype: "Dulux Executive Twin Bed", Qroom: 1 },
        { roomtype: "Premier Lux Twin Bed", Qroom: 3},
        { roomtype: "Urban Junior Suite", Qroom: 2},
      ],
    //   roomid ที่ตรงกับ roomtype 
      selectroomid: null,
        op_roomid: [
          { value: 1000, text: '1000' },
          { value: 1001, text: '1001' },
          { value: 1002, text: '1002' },
          { value: 1003, text: '1003' },
          { value: 1004, text: '1004' },
          
        ],
        // form เก็บ guest ในแต่ละ roomid
        form1: 
          {id:null,
          tel:null,
          title: null,
          fname:null,
          lname:null,
          country:null,
          roomid: null,
          },
          form2: 
          {id:null,
          tel:null,
          title: null,
          fname:null,
          lname:null,
          country:null,
          roomid:null,
          },
          form3: 
          {id:null,
          tel:null,
          title: null,
          fname:null,
          lname:null,
          country:null,
          roomid:null,
          },
          form4: 
          {id:null,
          tel:null,
          title: null,
          fname:null,
          lname:null,
          country:null,
          roomid:null,
          },
        guest:[],      
        title: [{ text: 'Select One', value: null }, 'Mr.', 'Ms.', 'Miss'],
      }
    },
    methods: {  
      confirm(){
          this.makeToast('success','Check-in success !') 

      }, 
    //   check ว่ามีการกรอกฟอร์มม้าย
      check(){ 
          if(this.form1===null){
              this.makeToast('danger','1 guest for minimum')  
              this.roomsucces=0   
          }
          else{
            if(this.selectroomid===null){
                this.makeToast('danger','please select room id') 
                this.roomsucces=0    
            }

            else if(this.form1.tel===null || this.form1.title===null || this.form1.fname===null || this.form1.lname===null || this.form1.country===null){
            this.makeToast('danger','please fill out all fields')  
            this.roomsucces=0    
            }
            
            
            else{
                this.hideModal()

                this.form1.roomid = this.selectroomid
                this.guest.push(this.form1)
                
                if(this.form2.tel!=null || this.form2.title!=null || this.form2.fname!=null|| this.form2.lname!=null || this.form2.country!=null){
                    this.form2.roomid = this.selectroomid
                    this.guest.push(this.form2)
                    if(this.form3.tel!=null || this.form3.title!=null || this.form3.fname!=null||this.form3.lname!=null || this.form3.country!=null){
                    this.form3.roomid = this.selectroomid
                    this.guest.push(this.form3)
                        if(this.form4.tel!=null || this.form4.title!=null || this.form4.fname!=null|| this.form4.lname!=null || this.form4.country!=null){
                        this.form4.roomid = this.selectroomid
                        this.guest.push(this.form4)
                        }
                    }
                }
                this.roomsucces=1
                //alert(JSON.stringify(this.guest))
                
                alert(this.roomsucces)
                this.makeToast('success','Add information this room success !') 
                
            
            }
          }
      },
      hideModal() {
        //this.$refs['modal-center'].hide()
        this.$bvModal.hide('modal-center')
      },
      makeToast(variant = null, text) {
         this.$bvToast.toast(text, {
        variant: variant,
        solid: true,
        toaster: "b-toaster-top-center",
        });
      },
    },

  
}
</script>

<style>
    #all{
    margin: 100px 100px auto 300px;
    
    }
    #card{
        padding: 20px 50px;
    }
    
    
    #roomtype_card{
        margin: 10px;
        padding: 10px 20px;
        
    }
</style>
