<template>
    <div>
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
        <b-button
                    id="Confirm"
                    type="submit"
                    variant="success"
                    @click="check()"
                    style="float:right; margin:20px"
                >
                    OK
                </b-button>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        selectroomid: null,
        op_roomid: [
          { value: 1000, text: '1000' },
          { value: 1001, text: '1001' },
          { value: 1002, text: '1002' },
          { value: 1003, text: '1003' },
          { value: 1004, text: '1004' },
          
        ],
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
      check(){ 
          if(this.form1.tel===null | this.form1.title===null | this.form1.fname===null| this.form1.lname===null | this.form1.country===null){
          this.makeToast('danger','1 guest for minimum')      
          }
          
          else{
              this.form1.roomid = this.selectroomid
              this.guest.push(this.form1)
              
              if(this.form2.tel!=null | this.form2.title!=null | this.form2.fname!=null| this.form2.lname!=null | this.form2.country!=null){
                  this.form2.roomid = this.selectroomid
                  this.guest.push(this.form2)
                if(this.form3.tel!=null | this.form3.title!=null | this.form3.fname!=null| this.form3.lname!=null | this.form3.country!=null){
                  this.form3.roomid = this.selectroomid
                  this.guest.push(this.form3)
                    if(this.form4.tel!=null | this.form4.title!=null | this.form4.fname!=null| this.form4.lname!=null | this.form4.country!=null){
                    this.form4.roomid = this.selectroomid
                    this.guest.push(this.form4)
                    }
                }
              }
              
              alert(JSON.stringify(this.guest))
         
          }
      },
      makeToast(variant = null, text) {
         this.$bvToast.toast(text, {
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center",
        });
      },
    },
      
  }
  
</script>


