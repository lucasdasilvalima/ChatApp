class User {
  final String firstName;
  final String lastName;
  final String avatarUrl;
  final String phoneNumber;
  final String email;
  final String aboutDesc;

  User({
    this.firstName = '',
    this.lastName = '',
    this.avatarUrl = 'assets/images/profiles/default.png',
    this.phoneNumber = '',
    this.email = '',
    this.aboutDesc = '',
  });
}

User userProfile = User(
  firstName: "Manu <3",
  lastName: "Sales",
  avatarUrl: "assets/images/profiles/profile_1.png",
  phoneNumber: "+5592991541021",
  email: "manu@purpurina.com",
  aboutDesc: "A menina mais linda do mundo!",
);
