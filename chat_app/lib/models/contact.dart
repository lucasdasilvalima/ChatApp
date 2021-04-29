class Contact implements Comparable<Contact> {
  final String name, about, avatarUrl, phoneNumber;
  final bool isActive;

  Contact({
    this.name = '',
    this.about = '',
    this.avatarUrl = '',
    this.phoneNumber = '',
    this.isActive = false,
  });

  @override
  int compareTo(other) {
    if (this == null || other == null) {
      return null;
    }

    return this.name.compareTo(other.name);
  }
}

List<Contact> contactsData = <Contact>[
  Contact(
    name: "Lucas Lima",
    about: "Vaidade! Tudo e vaidade",
    avatarUrl: "assets/images/profiles/profile_1.png",
    isActive: true,
    phoneNumber: "+5545991541021",
  ),
  Contact(
    name: "Patrick Lima",
    about: "Vaidade! Tudo e vaidade",
    avatarUrl: "assets/images/profiles/profile_1.png",
    isActive: true,
    phoneNumber: "+5545991541021",
  ),
  Contact(
    name: "Lidiane Lima",
    about: "Vaidade! Tudo e vaidade",
    avatarUrl: "assets/images/profiles/profile_1.png",
    isActive: true,
    phoneNumber: "+5545991541021",
  ),
];
