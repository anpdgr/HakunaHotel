<template>
  <div id="editst" >
    <div style="margin-right:300px">
      <STnav/>
    </div>
    <!-- ปล ถ้า  placeholder เป็นข้อมูลปัจจุบันก็ดีนะ ทุก edit-->
    <b-card title="Edit profile"  align="left" id="card" style="text-align:center" >
      <b-form @submit="onSubmit" @reset="onReset" v-if="show">
        <br>
        <!-- ipg = input group -->
        <!-- edit first name  -->
        <b-form-group id="ipg-fname" label="First Name:" label-for="ip-fname">
          <b-form-input
            id="ip-fname"
            v-model="form.fname"
            required
            placeholder= "Enter First name"
          >
          </b-form-input>
        </b-form-group>
         <!-- edit last name  -->
        <b-form-group id="ipg-lname" label="Last Name:" label-for="ip-lname">
          <b-form-input
            id="ip-lname"
            v-model="form.lname"
            required
            placeholder= "Enter Last name"
          ></b-form-input>
        </b-form-group>
        <!-- edit title  -->
        <b-form-group id="ipg-title" label="Name title:" label-for="ip-title">
          <b-form-select
            id="ip-title"
            v-model="form.title"
            :options="title"
            placeholder= "Select one"
          ></b-form-select>
        </b-form-group>
        <!-- edit DOB  -->
        <b-form-group id="ipg-birthday" label="Birthday:" label-for="ip-birthday">
          <b-form-datepicker 
            id="ip-birthday"
            v-model="form.dob"
            required
            placeholder= "-- Select date --"
          ></b-form-datepicker>
        </b-form-group>
        <!-- edit email  -->
        <b-form-group
          id="ipg-email"
          label="Email address:"
          label-for="ip-email"
          description="We'll never share your email with anyone else."
        >
          <b-form-input
            id="ip-email"
            v-model="form.email"
            type="email"
            required
            placeholder= "Enter email"
          ></b-form-input>
        </b-form-group>
        <!-- edit tel no. -->
        <b-form-group
          id="ipg-tel"
          label="Phone number:"
          label-for="ip-tel"
        >
          <b-form-input
            id="ip-tel"
            v-model="form.tel"
            type="tel"
            required
            placeholder= "Enter phone number"
          ></b-form-input>
        </b-form-group>
        <!-- 
        <b-form-group id="ipg-country" label="Country:" label-for="ip-country">
          <b-form-input
            id="ip-country"
            v-model="form.country"
            required
          ></b-form-input>
        </b-form-group> -->
        <!-- edit address  -->
        <b-form-group id="ipg-@" label="Address:" label-for="ip-@">
          <b-form-textarea
            id="ip-@"
            v-model="form.address"
            placeholder= "Enter your address"
            rows="3"
            max-rows="6"
          ></b-form-textarea>
        </b-form-group>

        <br><br>
        
        <div style="float: right;">
          <b-button type="reset" variant="outline-primary" style="margin-right:20px;">Reset</b-button>
          <b-button type="submit" variant="primary" >Submit</b-button>
        </div>
      </b-form>
    </b-card>
    <!-- <b-card class="mt-3" header="Form Data Result">
      <pre class="m-0">{{ form }}</pre>
    </b-card> -->
  </div>
</template>

<script>
  import STnav from './SideTopNav_st.vue'
  export default {
    components:{
        STnav
    },
    data() {
      return {
        form: {
          email: '',
          tel:'',
          title: null,
          fname: '',
          lname: '',
          dob: null,
          address: null,
        },
        //update data
        nowstaff:{
           staffid : '' ,
           title : '',
           STFname : '',
           STLname : '',
           tel : '',
           email : '',
           address : '',
           DOB : ''
        },
        title: [{ text: 'Select One', value: null }, 'Mr.', 'Ms.', 'Miss'],
        show: true
      }
    },
    methods: {
      onSubmit(evt) {
        evt.preventDefault()
        //alert(JSON.stringify(this.form))
        this.setnowstaff();
        this.Updateprofile();
        this.makeToast("success", "Update complete");
        // alert("Staff login");
        setTimeout(() => {
          this.$router.push("myprofile");
        }, 1500);
      //alert("update success")
        this.$router.push('shome')
      },
      onReset(evt) {
        evt.preventDefault()
        // Reset our form values
        this.form.email = ''
        this.form.tel = ''
        this.form.title = ''
        this.form.fname = ''
        this.form.lname = ''
        this.form.dob = null
        // this.form.country = null
        this.form.address = null
        // Trick to reset/clear native browser form validation state
        this.show = false
        this.$nextTick(() => {
          this.show = true
        })
      },
      setnowstaff(){
          this.nowstaff = {
           staffid : this.$store.getters.getUser ,
           title : this.form.title,
           STFname : this.form.fname,
           STLname : this.form.lname,
           tel : this.form.tel,
           email : this.form.email,
           address : this.form.address,
           DOB : this.form.dob
          };
      },
      Updateprofile() {
        var formData = this.toFormData(this.nowstaff);
        this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/staffprofile.php?action=update",
          formData
        )
        .then(response => {
          //set var to default
          console.log(response);
          this.form = {
          email: '',
          tel:'',
          title: null,
          fname: '',
          lname: '',
          dob: null,
          address: null,
          };
          this.nowstaff = {
           staffid : '' ,
           title : '',
           STFname : '',
           STLname : '',
           tel : '',
           email : '',
           address : '',
           DOB : ''
          };
          if (response.data.error) {
            console.log(response.data.error);
          } else {
            console.log(response.data.message);
          }
        });
      },
      // convert to formdata
      toFormData(obj) {
      var fd = new FormData();
      for (var i in obj) {
        fd.append(i, obj[i]);
      }
      return fd;
      },
      makeToast(variant = null, text) {
        this.$bvToast.toast(text, {
        title: "Notice!",
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center",
        });
      }
    }
  };
</script>

<style scoped>
  #editst {
    margin: auto;
    
  }
  #card{
    max-width: 50rem; 
    margin: 100px auto 100px 440px;    
    padding:30px;
    
  }


</style>