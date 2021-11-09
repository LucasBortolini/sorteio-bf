---
layout: prizes
title: Escolha seu prêmio
permalink: /premios
description:
---

<section class="w-full">
  <div class="slidecontainer lg:w-1/3 mx-auto mb-4">
    <input type="range" value="1" min="1" max="3" step="1" disabled class="slider" list="tickmarks">
    <div id="tickmarks">
      <p></p>
      <p class="selected">2</p>
      <p></p>
    </div>
  </div>
  <h1 class="flex justify-center text-xl text-yellow-300 mb-6">
    Escolha seu Prêmio:
  </h1>
  <div class="flex flex-wrap justify-center gap-4 px-18">
    {% for prize in site.prizes %}
      <div class="w-56 h-76 border-yellow-300 bg-contain bg-no-repeat bg-black border rounded-md pt-32 px-4 flex flex-col justify-between" style="background-image: url('{{prize.image}}');"> 
        <ul class="list-disc list-inside mt-14">
          {% for item in prize.list %}
            <li class="tiny-text text-white">
              {{ item }}
            </li>
          {% endfor %}
        </ul>
        <a href="/sign-up">
          <button class="bg-yellow-300 border border-transparent hover:bg-dark-red hover:text-white w-full text-black rounded-lg my-2 py-1">Selecionar
          </button>
        </a>
      </div>
    {% endfor %}
  </div>
</section>
