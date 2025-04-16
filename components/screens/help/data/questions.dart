class HelpQuestins {
  const HelpQuestins(this.text, this.answers);
  final String text;
  final String answers;
}

const List<HelpQuestins> questions = [
  HelpQuestins(
    'What Exactly is InkSeninal?',
    'It is an application has been developed to help users and facilities to verify  signatures.',
  ),
  HelpQuestins(
    'How can accsess the features?',
    'After you enter the app you will find the home page and you will find the signature verification button after clicking on it it will transfer you directly to the page of uploading the pictures that you want to make sure of their authenticity.',
  ),
  HelpQuestins(
    'How can use the App?',
    'First you upload the picture that you want to make sure of its authenticity and then you upload an original picture for signature so that the program makes a comparison between the two pictures and reveals the fake picture.',
  ),
  HelpQuestins(
    'Storge...?',
    'After you done youre operathion it will save and you can access it in history page .',
  ),
  HelpQuestins(
    'What is our goals?',
    'Our goal is to reduce fraud and help users,banks and companies secure currency data and protect them from forgery.',
  ),
];
