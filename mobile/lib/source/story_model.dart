class StoryModel {
  final String title, description;

  StoryModel({
    required this.title,
    required this.description,
  });

  static final List<StoryModel> lstData = [
    StoryModel(
      title: 'Boy and barber',
      description:
          'A young boy enters a barber shop and the barber whispers to his customer. "This is the dumbest kid in the world. Watch while I prove it you." The barber puts a dollar bill in one hand and two quarters in the other, then calls the boy over and asks, "Which do you want, son?" The boy takes the quarters and leaves. "What did I tell you?" said the barber. "That kid never learns!" Later, when the customer leaves, he sees the same young boy coming out of the ice cream store. "Hey, son! May I ask you a question? Why did you take the quarters instead of the dollar bill?" The boy licked his cone and replied, "Because the day I take the dollar, the game is over!"',
    ),
    StoryModel(
      title: 'Two friends go camping',
      description:
          'Two campers are walking through the woods when a huge brown bear suddenly appears in the clearing about 50 feet in front of them. The bear sees the campers and begins to head toward them. The first guy drops his backpack, digs out a pair of sneakers, and frantically begins to put them on. The second guy says, "What are you doing? Sneakers won’t help you outrun that bear." "I don’t need to outrun the bear," the first guy says. "I just need to outrun you."',
    ),
    StoryModel(
      title: 'Snail slowness',
      description:
          'A guy is sitting at home when he hears a knock at the door. He opens the door and sees a snail on the porch. He picks up the snail and throws it as far as he can. Three years later there’s a knock on the door. He opens it and sees the same snail. The snail says, "What the hell was that all about?".',
    ),
    StoryModel(
      title: 'The man "only one million people"',
      description:
          'China has a population of a billion people. One billion. That means even if you’re a one in a million kind of guy, there are still a thousand others exactly like you.',
    ),
    StoryModel(
      title: 'Wishes of three friends:',
      description:
          'Three guys stranded on a desert island find a magic lantern containing a genie, who grants them each one wish. The first guy wishes he was off the island and back home. The second guy wishes the same. The third guy says: "I’m lonely. I wish my friends were back here."',
    ),
  ];
}
