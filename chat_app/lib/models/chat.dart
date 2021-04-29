class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Patrick Lasmar",
    lastMessage: "Domingo é meu aniversário...",
    image: "assets/images/profiles/profile_1.png",
    time: "3m atrás",
    isActive: false,
  ),
  Chat(
    name: "Lidiane Lopes",
    lastMessage: "Vdd ...",
    image: "assets/images/profiles/profile_2.png",
    time: "8m atrás",
    isActive: true,
  ),
  Chat(
    name: "Dad <3",
    lastMessage: "Bom Dia Filho! Deus aben...",
    image: "assets/images/profiles/profile_3.png",
    time: "1d atrás",
    isActive: false,
  ),
  Chat(
    name: "Amanda Ortega",
    lastMessage: "Boom dia :D",
    image: "assets/images/profiles/profile_4.png",
    time: "5d atrás",
    isActive: true,
  ),
  Chat(
    name: "Daniel Peixoto",
    lastMessage: "Me ajuda no projeto de mobile...",
    image: "assets/images/profiles/profile_5.png",
    time: "6d atrás",
    isActive: false,
  ),
  Chat(
    name: "Lucas Rafael",
    lastMessage: "O que você fez no traba...",
    image: "assets/images/profiles/profile_6.png",
    time: "3m atrás",
    isActive: false,
  ),

  // deuplicados
  //
  Chat(
    name: "Patrick Lasmar",
    lastMessage: "Domingo é meu aniversário...",
    image: "assets/images/profiles/profile_7.png",
    time: "3m atrás",
    isActive: false,
  ),
  Chat(
    name: "Lidiane Lopes",
    lastMessage: "Vdd!",
    image: "assets/images/profiles/profile_1.png",
    time: "8m atrás",
    isActive: true,
  ),
  Chat(
    name: "Amanda Ortega",
    lastMessage: "Boom dia :D",
    image: "assets/images/profiles/profile_4.png",
    time: "5d atrás",
    isActive: true,
  ),
  Chat(
    name: "Daniel Peixoto",
    lastMessage: "Me ajuda no projeto de mobile...",
    image: "assets/images/profiles/profile_5.png",
    time: "6d atrás",
    isActive: false,
  ),
  Chat(
    name: "Lucas Rafael",
    lastMessage: "O que você fez no traba...",
    image: "assets/images/profiles/profile_6.png",
    time: "3m atrás",
    isActive: false,
  ),
];
