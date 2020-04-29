<template>
    <b-card id="card" bg-variant="default" >
         <b-form inline id="dateform">
                    <b-form-group label="Check-in Date:" style="margin-right:20px; margin-left:20px; width: 17rem;">
                        <b-form-datepicker v-model="checkin_date" :date-disabled-fn="dateDisabled" locale="en"></b-form-datepicker>
                    </b-form-group>
                    <b-form-group label="Check-out Date:" style="margin-right:20px; width: 17rem;">
                        <b-form-datepicker v-model="checkout_date" :date-disabled-fn="dateDisabled" locale="en"></b-form-datepicker>
                    </b-form-group>
                    <b-form-group label="Number of guestes: " style="margin-right:30px; width: 10rem;">
                        <b-form-spinbutton id="demo-sb" v-model="num_guest" min="1" max="100" placeholder="--"></b-form-spinbutton>
                    </b-form-group>
                    <b-button id="button" variant="secondary">Check avilable</b-button>
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

