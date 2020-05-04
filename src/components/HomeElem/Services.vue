<template>
  <div style="margin:auto; padding-bottom:50px">
    <div class="row" style="padding-top:50px">
      <div class="col-lg-8 mx-auto">
        <h1><mark>Services & Facilities</mark></h1>
        <p class="lead">
          This is a great place to talk about your webpage. This template is
          purposefully unstyled so you can use it as a boilerplate or starting
          point for you own landing page designs! This template features:
        </p>
      </div>
    </div>

    <div>
      <b-row>
        <b-col
          v-for="item in items"
          :key="item"
          style="flex: 30%; margin:10px 10px; padding:-10px;"
          xl="*"
        >
          <!-- <div   v-for='image in images' :key = 'image' > -->
          <div class="container">
            <div>
              <img :src="item.img" class="image" />
              <div class="overlay">
                <div class="text">
                  <h3>
                    <b>{{ item.head }}</b>
                  </h3>
                  <p>{{ item.description }}</p><br>
                  <p><i>{{item.time}}</i></p>
                </div>
              </div>
            </div>
          </div>
          <!-- </div> -->
        </b-col>
      </b-row>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        {
          head: "Tour Packages",
          description: "More than 40 half-day or full day tours available for our staying guests.",
          time: 'Tour desk: daily opened 8.00-16.00',
          img: require("@/assets/SVtour.jpg"),
        },
        {
          head: "Shuttle Bus Services",
          description: "For a small extra charge, we will get you to your destination in comfort.",
          img: require("@/assets/SVbus2.jpg"),
        },
        {
          head: "Laundry Services",
          description: "We provide laundry, dry cleaning, and press services",
          time: 'daily opened 10.00-21.00',
          img: require("@/assets/SVlaundry.jpg"),
        },
        {
          head: "Butler Services",
          description: "During your stay at Hakuna Hotel, your private Butler is on hand to take care of every little detail.",
          img: require("@/assets/SVbutler.jpg"),
        },

        {
          head: "Free Wi-Fi",
          description: "All day, every day, use our free high-speed Wi-Fi to stay connected throughout your stay in our luxury hotel.",
          img: require("@/assets/SVwifi.jpg"),
        },
        {
          head: "Breakfast",
          description: "In the morning treat yourself to a delight from one of the best selection of breakfasts from us.",
          time: 'daily opened 6.30-10.30',
          img: require("@/assets/SVbreakfast4.jpg"),
        },
        {
          head: "Swimming Pool",
          description: "A fantastic outdoor pool which you can chill out and relax.",
          time: 'daily opened 7.00-21.00',
          img: require("@/assets/SVswimmingpool2.jpg"),
        },
        {
          head: "Sauna",
          description: "Healthy sweating in the sauna, deep warmth in the infrared cabin, circulation-stimulating.",
          time: 'Daily opened 8.00-22.00',
          img: require("@/assets/SVsauna.jpg"),
        },
        {
          head: "Spa",
          description: "Find your retreat at our Spa, the soulful and enchanting escape into a world of relaxation.",
          time: 'daily opened 8.00-21.00',
          img: require("@/assets/SVspa.jpg"),
        },
        {
          head: "Fitness Center",
          time: 'daily opened 5.00-22.00',
          description: "You can still be healthy while away from home with our Fitness Center, complete with staff and all the necessities.",
          img: require("@/assets/SVgym.jpg"),
        },
        {
          head: "Business Lounge",
          description: "A quiet environment with office space, newspapers as well as computers and printers that can be freely used.",
          time: 'daily opened for 24 hours',
          img: require("@/assets/SVbucenter.jpg"),
        },
        {
          head: "Baby Cots",
          description: "Children under 2 stay free of charge using a baby cot.",
          img: require("@/assets/SVbabycot.jpg"),
        },
      ],
    };
  },
};
</script>

<style scoped>
.image {
  width: 400px;
  height: 270px;
  border-radius: 25%;
}

.container {
  position: relative;
  width: 530px;
  height: 270px;
  float: center;
}

.container:hover .overlay {
  opacity: 0.7;
}

.overlay {
  position: absolute;
  margin: auto;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  width: 410px;
  height: 280px;
  opacity: 0;
  transition: 0.5s ease;
  background-color:#faeccf;
  padding: 10px;
  border-radius: 25%;
}

/* 9c472f  77503b b98672 2a2818 513f2a cd986b  */

.text {
  color: black;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 320px;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  text-align: center;
}
</style>
