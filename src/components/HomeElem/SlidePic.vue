<template>
    <div id="body">
      <!--<b-carousel
        id="carousel-1"
        v-model="slide"
        :interval="4000"
        controls
        indicators
        background="#ababab"
        img-width="1024"
        img-height="480"
        style="text-shadow: 1px 1px 2px #333;"
      >-->
      <!-- Test fix console -->
      <b-carousel
        id="carousel-1"
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
          style="width=1024px; height=480px"
        >
        </b-carousel-slide>

        <!-- Slides with custom text -->
        <b-carousel-slide
          img-src="@/assets/livroom.home.jpg"
          style="width=1024px; height=480px margin-top:10px"
        >
        </b-carousel-slide>

        <!-- Slides with image only -->
        <b-carousel-slide
          img-src="@/assets/food.home.jpg"
          style="width=1024px; height=480px"
        >
        </b-carousel-slide>
      </b-carousel>
    </div>
</template>

<style scoped>
 
</style>

