<template>
  <div id="body" class="container">
    <div class="row">
      <div class="col-lg-8 mx-auto">
        <h2>Services we offer</h2>
        <p class="lead">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut optio
          velit inventore.
        </p>
        <div id="card">
          <div class="containerr" id="swimmingpool">
            <img src="@/assets/SVswimmingpool.jpg" alt="Avatar" class="image" />
            <div class="overlay">
              <h3><b>Swimming pool</b></h3>
              <p>Swimming pool suay2 clean2 d ngarm Rama8</p>
            </div>
          </div>

          <div class="containerr" id="wifi">
            <img src="@/assets/SVwifi.jpg" alt="Avatar" class="image" />
            <div class="overlay">
              <h3><b>Free Wi-Fi</b></h3>
              <p>Free Wi-Fi for all guests 24/7</p>
            </div>
          </div>

          <div class="containerr" id="breakfast">
            <img src="@/assets/SVbreakfast.jpg" alt="Avatar" class="image" />
            <div class="overlay">
              <h3><b>Breakfast</b></h3>
              <p>Breakfast delicious t sud</p>
            </div>
          </div>

          <div class="containerr" id="gym">
            <img src="@/assets/SVgym.jpg" alt="Avatar" class="image" />
            <div class="overlay">
              <h3>GYM</h3>
              <p>GYM d d ja eiei</p>
            </div>
          </div>


        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
* {
  box-sizing: border-box;
}

/* Container needed to position the overlay. Adjust the width as needed */
.containerr {
  position: relative;
  width: 50%;
  max-width: 300px;
}

/* Make the image to responsive */
.image {
  display: block;
  width: 380px;
  height: 250px;
  border: 1px solid #f1f1f1;
  perspective: 1000px;
}

/* The overlay effect - lays on top of the container and over the image */
.overlay {
  position: absolute;
  bottom: 0;
  background: rgb(0, 0, 0);
  background: rgba(0, 0, 0, 0.5); /* Black see-through */
  color: #f1f1f1;
  width: 380px;
  height: 250px;
  transition: 0.5s ease;
  opacity: 0;
  color: white;
  font-size: 20px;
  padding-top: 50px;
  text-align: center;
}

/* When you mouse over the container, fade in the overlay title */
.containerr:hover .overlay {
  opacity: 0.7;
}

#card{
  display: block;
}
</style>
