


import 'dart:math';

class Card{
  String title;
  String info;

  ///Constructor
  Card(String t, String i){
    title = t;
    info = i;
  }
}

class ListCard{
  List<Card> _cards = [
    Card("Dale Mecha", "Empieza jugando el que trajo el contenido del cigarro."),
    Card("Corta Mambo", "Mala suerte, es tu última seca. ¡Que la disfrutes! Aprovechá y traete unos chizitos. Por si no lo entendiste: perdiste... ¡un turno! Epa, qué susto, ¿no?"),
    Card("50/50", "Tirá una moneda. Si sale ceca, fumás.\n\nNo leer: Si alguien pregunta cuál es ceca, también fuma."),
    Card("ABC FUMO", "Comiencen a decir las letras del abecedario por turnos -una cada uno-, lo más rápido que puedan, hasta que uno se trabe o se pierda. Cuando eso pase, fuma el de su izquierda."),
    Card("Nombres Locos", "Señalá a un participante y decí en voz alta el nombre de otro. La persona a la que nombraste debe hacer lo mismo, y así sucesivamente. El primero en confundirse o tardar dos días en responder, fuma."),
    Card("Pita Parker", "Fumá como Spiderman. El resto del grupo deberá decidir si lo hiciste bien o no. Si la mayoría vota que sí, fumás de vuelta porque grandes poderes conllevan grandes fumabilidades."),
    Card("Bichero", "Fumá una pitada por cada animal que haya en la casa. Si no hay animales, tenés que ladrar como caniche toy. Si el grupo aprueba, fumás."),
    Card("A Ver Esas Palmas", "No leas esta carta en voz alta. Empezá a aplaudir. Si alguien se suma, fumás. Si no, fuman todos menos vos."),
    Card("Giorgio Armani", "Fuma el que haya armado el cigarro que tenés en la mano. Mientras lo hace tiene que gritar '¡Má qué buona tuca!'"),
    Card("Mi Primera Vez", "Para fumar contá la historia de la primera vez que fumaste y dio comienzo a este hermoso romance que perdura hasta el día de hoy."),
    Card("Mentiroso Mentiroso", "Para fumar tenés que decir algo que sea totalmente falso sobre el jugador que está sentado a tu izquierda."),
    Card("Ponele a La Película", "Para fumar, nombrá 3 películas o series poniendo en el título una de las palabras de abajo. Por ejemplo 'COGOLLOLIPSIS NOW'.\n\n'CHORIZO'\n'COGOLLO'\n'ROLITO'\n'HUESITO DULCE'\n'MENEM'\n'WASKAZO'\n'AHRE'\n'CHARUTO'\n'ALCIDES'"),
    Card("Chino Mexicano", "Fumá y conteniendo el humo decí 'Ya wey qué chingón no mames pendejo'."),
    Card("Colgate", "El resto de los jugadores elige un objeto de la habitación y vos tenés que mirarlo fijamente durante toda la ronda. Si lo lográs, el próximo turno fumás antes de sacar la carta."),
    Card("Morgan Fuman", "Te convertiste en Dios y debés preguntarle a la mesa cómo fue el ruido del Big Bang. Quien lo haga mejor según tu divino criterio, fuma."),
    Card("Mutación", "El mar te alcanzó y te transformaste en un salmón verde. Por eso ahora fumá una pitada abriendo y cerrando la boca rápidamente. Vas a ser un pez durante una ronda."),
    Card("Fumodín", "Si querés fumás. Si no querés, no fumás. También podes elegir quién fuma. Básicamente podés hacer lo que se te cante."),
    Card("Gestito De Idea", "Para fumar tenés que dejar tus dedos como si todavía sostuvieses el cigarro durante el resto de la partida. Si te distraés y los separás, no pasa nada, nadie se va a dar cuenta, pero al menos intentalo."),
    Card("Activador", "Te pegó para arriba. Para fumar, hacete 20 flexiones de brazos.\n\nBueno, con 15 estamos. Ok, ¿no te da? Hagamos 5.\n\nBueno, cerremos en una, Arnold."),
    Card("Don Billetín", "Para fumar tenés que sacar un billete y dibujarle un faso en la boca al prócer o al animal que tiene. Si también le hacés ojos locos, fumás dos veces."),
    Card("Fumshot", "Dale el cigarro al de la derecha. Vos no fumás, él sí y debe tirarte todo el humo en la cara mientras dice 'FUMAAAAAAANYIIIIIIIII'"),
    Card("Piedra Libre", "Inventate una consigna, sobre lo que sea. El participante que la cumpla, fuma. Si está muy buena, mandala que te la robamos para el próximo juego. Si no se te ocurre, no fumás."),
    Card("Piedra Buena", "Jueguen al piedra, papel o tijera entre todos. No digas nada, pero el que tira piedra, fuma."),
    Card("Ponele La Tuca Al Burro", "Tapate los ojos. Otro jugador al azar va a fumar una pitada y retener el humo. Al abrir los ojos, tenés que adivinar quién fue. Si lo hacés bien, fumás vos también."),
    Card("National Geographic", "El participante de tu izquierda elige un animal. ¡Tenés 18 segundos para encontrar una foto de ese animal fumando, mientras los demás cuentan en voz alta! Si lo lográs, fumás."),
    Card("Perdidos En El Tiempo", "Preguntá en voz alta en qué año fue el lanzamiento de alguna de las siguientes opciones. El que más se le acerque a la respuesta correcta, fuma con vos.\n\n'Gasolina', de Daddy Yankee. Respuesta: 2004\n\n'A jugar con Hugo'. Respuesta: 1996"),
    Card("Te Lo Refumo Así Nomás", "Elegí una película de la siguiente lista y contala en 10 segundos. El primero que adivine cuál es, fuma con vos. Si nadie adivina, no fuman."),
    Card("Tucán", "Se te apareció este ave exótica y te dio el poder de fumar cuatro secas seguidas. Usala sabiamente y dale bananita o chocotorta para que bajonee."),
    Card("La Curiosa", "No leas esta carta en voz alta y hacete el misterioso. Mirala, reíte, tapate la boca como que no lo podés creer. Si alguien te pregunta '¿qué dice?', fumás. Si no lo lográs en 17 segundos, soltala, ya fue."),
    Card("", ""),
    Card("", ""),
    Card("", ""),
    Card("", ""),
    Card("", ""),
    Card("", ""),
    Card("", ""),
    Card("", ""),
    Card("", ""),
    Card("", ""),
    Card("", ""),
  ];

  ///Carta numero ...
  int cardNumber = 0;

  ///Cambiar a la siguiente carta al azar
  void nextCard() {
    var rng = Random();
    var len = _cards.length;
    cardNumber = rng.nextInt(len);
  }

  ///Siguiente carta "Title"
  String  getNextCard(){
    return _cards[cardNumber].title;
  }

  ///Siguiente cart "Info"
  String getNextCardInfo(){
    return _cards[cardNumber].info;
  }

  ///Eliminar carta
  void removeCard(){
    _cards.removeAt(cardNumber);
  }
}