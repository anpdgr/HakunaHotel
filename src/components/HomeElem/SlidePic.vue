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
        <b-carousel-slide
          caption="Welcome to Hakuna Hotel"
          text="Nulla vitae elit libero, a pharetra augue mollis interdum."
          img-src="@/assets/hotel.home.jpg"
        >
        </b-carousel-slide>

        <!-- Slides with custom text -->
        <b-carousel-slide
          caption="Welcome to Hakuna Hotel"
          text="Nulla vitae elit libero, a pharetra augue mollis interdum."
          img-src="@/assets/room.home.jpg"
        >
        </b-carousel-slide>

        <!-- Slides with image only -->
        <b-carousel-slide
          caption="Welcome to Hakuna Hotel"
          text="Nulla vitae elit libero, a pharetra augue mollis interdum."
          img-src="@/assets/food.home.jpg"
        >
        </b-carousel-slide>
      </b-carousel>
    </div>
</template>