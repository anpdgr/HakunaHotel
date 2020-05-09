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
            v-model="staff.Staff_FirstName"
            required
            placeholder= "Enter First name"
          >
          </b-form-input>
        </b-form-group>
         <!-- edit last name  -->
        <b-form-group id="ipg-lname" label="Last Name:" label-for="ip-lname">
          <b-form-input
            id="ip-lname"
            v-model="staff.Staff_LastName"
            required
            placeholder= "Enter Last name"
          ></b-form-input>
        </b-form-group>
        <!-- edit title  -->
        <b-form-group id="ipg-title" label="Name title:" label-for="ip-title">
          <b-form-select
            id="ip-title"
            v-model="staff.Name_Title"
            :options="title"
            placeholder= "Select one"
          ></b-form-select>
        </b-form-group>
        <!-- edit DOB  -->
        <b-form-group id="ipg-birthday" label="Birthday:" label-for="ip-birthday">
          <b-form-datepicker 
            id="ip-birthday"
            v-model="staff.Date_Of_Birth"
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
            v-model="staff.Email"
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
            v-model="staff.Tel_No"
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
            v-model="staff.Address"
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
          data: null,
          // country: null,
          address: null,
        },
         staff:"",
        thisstaff:{
          staffid:""
        },
        title: [{ text: 'Select One', value: null }, 'Mr.', 'Ms.', 'Miss'],
        show: true
      }
    },mounted() {
    this.thisstaff.staffid = this.$store.getters.getUser;
    this.fetchUsers();
    this.updateUsers();
    },
    methods: {
      onSubmit(evt) {
        evt.preventDefault()
        //alert(JSON.stringify(this.form))
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
        this.form.birthday = null
        // this.form.country = null
        this.form.address = null
        // Trick to reset/clear native browser form validation state
        this.show = false
        this.$nextTick(() => {
          this.show = true
        })
      },
     // fetch data from database
    fetchUsers() {
      var formData = this.toFormData(this.thisstaff);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/staffprofile.php?action=read",formData)
        .then(response => {
          this.staff = response.data.data;
          this.staff = this.staff[0];
          console.log(this.staff);
          console.log(response.data);
        });
    },
    // update data from database
    updateUsers(){
      var formData = this.toFormData(this.thisstaff);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/staffprofile.php?action=update",formData)
        .then(response => {
          this.staff = response.data.data;
          this.staff = this.staff[0];
          console.log(this.staff);
          console.log(response.data);
        });
    },
    // convert to formdata
    toFormData(obj) {
      var fd = new FormData();
      for (var i in obj) {
        fd.append(i, obj[i]);
      }
      return fd;
    }
    }
  }
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