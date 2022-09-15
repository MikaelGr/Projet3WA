// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

document.addEventListener("DOMContentLoaded", function(event) {
  // Si la page contient le boutton "Commencer le combat"
  if (document.body.contains(document.getElementById("button"))) {
    // Initialisation des variables
    let button = document.getElementById("button");
    let result = document.getElementById("result");
    let heads = document.getElementById("heads");
    let tails = document.getElementById("tails");
    let random = Math.floor(Math.random() * 2);
    let youStart = false
    let turns = 0
    let win = document.getElementById("win");
    let lose = document.getElementById("lose");
    let yourHp = document.getElementById("yourHp").innerHTML;
    let yourAtk = document.getElementById("yourAtk").innerHTML;
    let yourDef = document.getElementById("yourDef").innerHTML;
    let ennemyHp = document.getElementById("ennemyHp").innerHTML;
    let ennemyAtk = document.getElementById("ennemyAtk").innerHTML;
    let ennemyDef = document.getElementById("ennemyDef").innerHTML;

    button.addEventListener("click", whoStart);

    // Fonction pour déterminer qui commence
    async function whoStart() {
      if (!heads.checked && !tails.checked) {
        alert('Veuillez choisir pile ou face')
      }
      else {
        if((heads.checked && heads.value == random) || (tails.checked && tails.value == random)) {
          turns += 1
          result.innerHTML += ('Tour n° ' + turns + '<br/>')
          result.innerHTML += ('Vous commencez ' + '<br/>')
          button.disabled = true
          youStart = true
          await delay(1000);
          startFight()
        }
        else {
          turns += 1
          result.innerHTML += ('Tour n° ' + turns + '<br/>')
          result.innerHTML += ("L'adversaire commence " + '<br/>')
          button.disabled = true
          youStart = false
          await delay(1000);
          startFight()
        }
      }
    }  

    // Fonction pour le combat
    async function startFight() {
      // Tant qu'une des carte a des points de vie
      while (yourHp > 0 && ennemyHp > 0) {
        inflictedDamage = yourAtk - ennemyDef
        receivedDamage = ennemyAtk - yourDef
        if (youStart == true) {
          result.innerHTML += ('Vous attaquez ' + '<br/>')
          await delay(1000);
          if (inflictedDamage > 0) {
            ennemyHp -= inflictedDamage
            result.innerHTML += ('Vous infligez ' + inflictedDamage + ' dégâts' + '<br/>')
            ennemyDef -= 1
            await delay(1000);
            youStart = false
            if (ennemyHp <= 0) {
              result.innerHTML += ('Vous avez gagné !' + '<br/>')
              win_gif()
            }
            else {
              result.innerHTML += ('Il reste ' + ennemyHp + " hp à l'adversaire" + '<br/>')
              await delay(1000);
              turns += 1
              result.innerHTML += ('Tour n° ' + turns + '<br/>')
            }
          }
          else{
            inflictedDamage = 0
            result.innerHTML += ('Votre adversaire esquive votre attaque ' + '<br/>')
            ennemyDef -= 1
            await delay(1000);
            youStart = false
            turns += 1
            result.innerHTML += ('Tour n° ' + turns + '<br/>')
          }
        }
        if (yourHp > 0 && ennemyHp > 0) {
          result.innerHTML += ("L'adversaire attaque !" + '<br/>')
          await delay(1000);
          if (receivedDamage > 0) {
            yourHp -= receivedDamage
            result.innerHTML += ('Vous recevez ' + receivedDamage + ' dégâts' + '<br/>')
            yourDef -= 1
            await delay(1000);
            youStart = true
            if (yourHp <= 0) {
              result.innerHTML += ('Vous avez perdu !' + '<br/>')
              lose_gif()
            }
            else {
              result.innerHTML += ('Il vous reste ' + yourHp + ' hp' + '<br/>')
              await delay(1000);
              turns += 1
              result.innerHTML += ('Tour n° ' + turns + '<br/>')
            }
          }
          else{
            receivedDamage = 0
            result.innerHTML += ("Vous esquivez l'attaque " + '<br/>')
            yourDef -= 1
            await delay(1000);
            youStart = true
            turns += 1
            result.innerHTML += ('Tour n° ' + turns + '<br/>')
          }
        }  
      }
    }

    function delay(milliseconds){
      return new Promise(resolve => {
          setTimeout(resolve, milliseconds);
      });
    }

    // Enlève l'attribut hidden de la div pour afficher le gif de victoire
    function win_gif() {
      win.hidden = false
    }

    // Enlève l'attribut hidden de la div pour afficher le gif de défaite
    function lose_gif() {
      lose.hidden = false
    }
  }
});