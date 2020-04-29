<template>
    <b-card id="card" bg-variant="default" >
         <b-form  @submit="onSubmit" inline id="dateform">

             <b-form-group id="ipg-cin" label="Check-in Date:" style="margin-right:20px; margin-left:20px; width: 17rem;">
                        <b-form-datepicker
                            id="ip-cin"
                            v-model="form.checkin_date"
                            required
                            placeholder="No date delected"
                        ></b-form-datepicker>
            </b-form-group>

             <b-form-group id="ipg-cout" label="Check-out Date:" style="margin-right:20px; width: 17rem;">
                        <b-form-datepicker
                            id="ip-cout"
                            v-model="form.checkout_date"
                            required
                            placeholder="No date delected"
                        ></b-form-datepicker>
            </b-form-group>
            
            <b-form-group label="Number of guestes: " style="margin-right:30px; width: 10rem;">
                <b-form-spinbutton  v-model="form.num_guest" min="1" max="100" placeholder="--" required></b-form-spinbutton>
            </b-form-group>

            <b-button id="button" type="submit" variant="secondary" @click="check()">Check avilable</b-button>
        </b-form>          
    </b-card>

    
</template>

<style scoped>
    #card{
        padding:25px 25px;
        width: 68rem;
        margin:auto auto auto 50px;     
    }
    #button{
        float:right;
        margin-top:30px;
        margin-left: 20px;
    }
    #dateform{
        margin:auto;
    }
</style>

<script>
  export default {
    data() {
      return {
        isNUll:true,
        form: {
          checkin_date: null,
          checkout_date: null,
          num_guest: null,
        },
        show: true
      }
    },
    methods: {  
        checkNull(){
            for (let i = 0; i < this.form.length; i++) {
                if(this.form[i] !=null){
                    this.isNULL=false;
                }
            }
            return this.isNUll;
        },
        check() {
        if(this.checkNull())
        {
            alert('Please select date')
        }
        else{
            this.$router.push("booking");
        }
        },
  },
  }
</script>

