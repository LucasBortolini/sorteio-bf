---
layout: prizes
title: Finalizar cadastro
permalink: /sign-up
description:
---

<section class="w-full">
  <div class="slidecontainer w-1/3 mx-auto mb-4">
    <input type="range" value="1" min="1" max="3" step="1" disabled class="slider" list="tickmarks">
    <div id="tickmarks">
      <p></p>
      <p></p>
      <p class="selected">3</p>
    </div>
  </div>
  <h1 class="flex justify-center text-xl text-yellow-300 mb-6">
    Complete com seus dados:
  </h1>
  <div>
    <div class="mb-3 flex justify-center">
      <input required placeholder="CPF" name="profilesname" type="text" id="name" class="shadow appearance-none border rounded-xl py-2 px-3 border-yellow-300 leading-tight focus:outline-none focus:shadow-outline bg-white text-black focus:outline-none focus:ring-2 focus:ring-gray-400 focus:border-transparent"/>
    </div>
    <div class="mb-4 flex justify-center">
      <input required placeholder="Data de Nascimento" name="profilesemail" type="email" id="email" class="shadow appearance-none border rounded-xl py-2 px-3 border-yellow-300 leading-tight focus:outline-none focus:shadow-outline bg-white text-black focus:outline-none focus:ring-2 focus:ring-gray-400 focus:border-transparent"/>
    </div>
    <div class="hidden">
      <input type="required" name="profilessource" value="cybermonday" />
    </div>
    <div class="flex justify-center">
      <button type="submit" class="bg-yellow-300 border border-transparent hover:bg-dark-red hover:text-white text-black rounded-xl py-2 mt-4 w-60">Finalizar cadastro</button>
    </div>
  </div>
</section>
