<template>
    <div>
      <b-carousel
        id="carousel-1"
        v-model="slide"
        :interval="4000"
        controls
        indicators
        background="#ababab"
        img-width="1024"
        img-height="480"
        style="text-shadow: 1px 1px 2px #333;"
      >
        <!-- Text slides with image -->
        <!-- caption="Welcome to Hakuna Hotel"
          text="Hakuna is one of the best luxury hotels in our state. We offer high-quality accommodation with a wide variety of rooms, additional services, and amenities available to all our guests." -->
        <b-carousel-slide
          img-src="@/assets/hotel.home.jpg"
        >
          <div id="divwel">
            <p id="welcome" > Welcome to Hakuna </p><br><br>
            <span style="font-size:20px">Hakuna is one of the best luxury hotels in our state. We offer high-quality accommodation with a wide variety of rooms, additional services, and amenities available to all our guests.</span>
          </div>      
        </b-carousel-slide>

        <!-- Slides with custom text -->
        <b-carousel-slide
          img-src="@/assets/livroom.home.jpg"
        >
          <div id="divwel">
            <p id="welcome" > Welcome to Hakuna </p><br><br>
            <span style="font-size:20px">Hakuna is one of the best luxury hotels in our state. We offer high-quality accommodation with a wide variety of rooms, additional services, and amenities available to all our guests.</span>
          </div> 
        </b-carousel-slide>

        <!-- Slides with image only -->
        <b-carousel-slide
          img-src="@/assets/food.home.jpg"
        >
          <div id="divwel">
            <p id="welcome" > Welcome to Hakuna </p><br><br>
            <span style="font-size:20px">Hakuna is one of the best luxury hotels in our state. We offer high-quality accommodation with a wide variety of rooms, additional services, and amenities available to all our guests.</span>
          </div> 
        </b-carousel-slide>
      </b-carousel>
      <b-card id="checkavi">
      </b-card>
    </div>
</template>

<style scoped>
  #welcome{
    font-size:70px; 
    font-family: 'Frank Ruhl Libre', serif; 
    font-weight: bold;

  }
  #divwel{

    padding: 350px 200px
  }
  #ckeckavi{
    padding: 350px 200px
  }
</style>