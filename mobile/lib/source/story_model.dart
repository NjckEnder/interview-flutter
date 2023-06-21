class StoryModel {
  final String story;
  // vote = true is like
  // vote = false is dislike
  // vote = null isn't vote
  final bool? vote;
  final int id;

  StoryModel({
    required this.story,
    this.vote,
    required this.id,
  });

  static final List<StoryModel> lstData = [
    StoryModel(
      id: 0,
        story:
            'A child asked his father, "How were people born?" \nSo his father said, "Adam and Eve made babies, then their babies became adults and made babies, and so on." \nThe child then went to his mother, asked her the same question and she told him, "We were monkeys then we evolved to become like we are now." \nThe child ran back to his father and said, "You lied to me!" \nHis father replied, "No, your mom was talking about her side of the family."'),
    StoryModel(
      id: 1,
        story:
            'Teacher: "Kids,what does the chicken give you?"\nStudent: "Meat!"\nTeacher: "Very good! Now what does the pig give you?"\nStudent: "Bacon!"\nTeacher: "Great! And what does the fat cow give you?"\nStudent: "Homework!"'),
    StoryModel(
      id: 2,
        story:
            'The teacher asked Jimmy, "Why is your cat at school today Jimmy?"\nJimmy replied crying, "Because I heard my daddy tell my mommy, \'I am going to eat that pussy once Jimmy leaves for school today!\'"'),
    StoryModel(
      id: 3,
        story:
            'A housewife, an accountant and a lawyer were asked "How much is 2+2?" \nThe housewife replies: "Four!". \nThe accountant says: "I think it\'s either 3 or 4.  Let me run those figures through my spreadsheet one more time." \nThe lawyer pulls the drapes, dims the lights and asks in a hushed voice, "How much do you want it to be?"'),
  ];

  StoryModel.fromJson(Map<String, dynamic> json)
      : story = json['story'],
        vote = json['vote'],
        id = json['id'];

  Map<String, dynamic> toJson() => {
        'story': story,
        'vote': vote,
        'id': id,
      };
  // StoryModel.
  copyWith({String? story, bool? vote}) {
    return StoryModel(story: story ?? this.story, vote: vote ?? this.vote, id: id);
  }
}
