<template>
    <body id='regis'>
        <div id = 'box'>
             <b-card border-varient='Primary' class="container">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Register</h3>
                    </div>
                    <div class="panel-body">
                        <form>
                            <div class="form-group" style="padding-top:20px">
                                <input v-model='email' type="email" class="form-control" id="email" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input v-model='username' type="username" class="form-control" id="username" placeholder="Username">
                            </div>
                            <div class="form-group">
                                <input v-model='password' type="password" class="form-control" id="password" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <input v-model='ConfirmedPassword' type="password" class="form-control" id="ConPassword" placeholder="Confirm your password">
                            </div>
                            <button class="btn btn-primary pull-right">Sign Up</button>
                        </form>
                    </div>
                </div>
            </b-card>   
        </div>
    </body>
</template>

<script>
export default {
    name:'regis',
    data: () => ({
        email: '',
        username: '',
        password: '',
        ConfirmedPassword: ''
    })
}
</script>

<style scoped>
#box{
    max-width: 500px; 
    margin: auto;
    padding-top: 80px;
}
.container{
    max-width:30rem;
    padding:30px 20px;
    float: middle;
    text-align: center;
}
body {
    background-image: url('../assets/hotel.home.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    height: 100vh;
}
</style>