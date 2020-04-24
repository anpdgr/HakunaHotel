<template>
    <body>
            <div style="max-width: 500px; margin: auto; padding-top:200px">
                <div class="container" >
                    <b-card style="max-width:30rem; padding:30px 20px; float: middle;" >
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Login</h3>
                            </div>
                            <div class="panel-body">
                                <form>
                                    <div class="form-group" style="padding-top:20px">
                                        <label for="username" class="control-label sr-only">Add your username.</label>
                                        <input type="username" class="form-control" id="username" placeholder="username">
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="control-label sr-only">Add your password.</label>
                                        <input type="password" class="form-control" id="password" placeholder="password">
                                    </div>
                                    <button class="btn btn-primary pull-right">Sign In</button>
                                </form>
                            </div>
                        </div>
                    </b-card>           
                </div>
            </div>
    </body>
</template>

<style>
body{
    background-image: url('../assets/hotel.home.jpg');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    height: 100vh;
}
</style>