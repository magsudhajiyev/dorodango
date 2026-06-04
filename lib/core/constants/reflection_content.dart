import 'dart:math';
import '../../data/models/build_stage.dart';

enum ReflectionTheme {
  dorodangoOrigins('Dorodango Origins'),
  wabiSabi('Wabi-Sabi'),
  ma('Ma (間)'),
  kintsugi('Kintsugi'),
  shokunin('Shokunin'),
  soil('Soil'),
  patience('Patience');

  const ReflectionTheme(this.displayName);
  final String displayName;
}

class Reflection {
  final String id;
  final ReflectionTheme theme;
  final String title;
  final String body;
  final String source;
  final List<BuildStage> relevantStages;
  final int estimatedReadTime;

  const Reflection({
    required this.id,
    required this.theme,
    required this.title,
    required this.body,
    required this.source,
    required this.relevantStages,
    required this.estimatedReadTime,
  });
}

abstract final class ReflectionContent {
  static List<Reflection> get all => _reflections;

  static List<Reflection> forStage(BuildStage stage) {
    return _reflections
        .where((r) => r.relevantStages.contains(stage))
        .toList();
  }

  static Reflection? pickForStage(BuildStage stage, Set<String> shownIds) {
    final candidates = forStage(stage)
        .where((r) => !shownIds.contains(r.id))
        .toList();
    if (candidates.isEmpty) return null;
    candidates.shuffle(Random());
    return candidates.first;
  }

  static Reflection? pickForCompletion(Set<String> shownIds) {
    return pickForStage(BuildStage.finished, shownIds);
  }

  static final List<Reflection> _reflections = [
    // --- dorodangoOrigins (4) ---
    const Reflection(
      id: 'origins-1',
      theme: ReflectionTheme.dorodangoOrigins,
      title: 'Children of the Schoolyard',
      body:
          'Hikaru dorodango emerged from Japanese schoolyards, where children '
          'discovered that ordinary mud could be transformed into something '
          'extraordinary through patience alone. Professor Fumio Kayo of Kyoto '
          'University of Education documented this tradition in the late 1990s, '
          'finding that nearly every region of Japan had children independently '
          'developing the technique. No one taught them — they learned from '
          'each other, passing the knowledge sideways rather than down. There '
          'is something profound in this: the desire to transform raw earth '
          'into a mirror is not learned but discovered.',
      source: 'Fumio Kayo, Kyoto University of Education',
      relevantStages: [BuildStage.coreForming, BuildStage.drying, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'origins-2',
      theme: ReflectionTheme.dorodangoOrigins,
      title: 'The Word Itself',
      body:
          'Hikaru means "to shine" or "shining." Dorodango breaks into doro '
          '(mud) and dango (dumpling). A shining mud dumpling — the name is '
          'disarmingly humble for something that can achieve a mirror finish. '
          'This humility is intentional in Japanese naming. The most '
          'extraordinary things are often given the simplest names, because '
          'the object speaks for itself. When you hold a finished dorodango, '
          'no one needs to explain what it is. The sphere of polished earth '
          'communicates directly, beyond language, a testament to what patience '
          'and attention can draw from the most ordinary material.',
      source: 'Japanese etymology',
      relevantStages: [BuildStage.coreForming, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'origins-3',
      theme: ReflectionTheme.dorodangoOrigins,
      title: 'Bruce Gardner and the West',
      body:
          'American artist Bruce Gardner encountered dorodango while researching '
          'Japanese craft traditions and became one of the first Western '
          'practitioners to document the process in detail. His work helped '
          'bridge cultures, showing that the appeal of transforming earth is '
          'universal. Gardner noted that Western students often struggle most '
          'with the drying stage — not because of technique, but because of '
          'impatience. The sphere asks you to wait, and in that waiting, '
          'something shifts. You stop trying to force the material and start '
          'listening to it. This lesson, Gardner observed, is the real gift '
          'of the practice.',
      source: 'Bruce Gardner, dorodango.com',
      relevantStages: [BuildStage.drying, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'origins-4',
      theme: ReflectionTheme.dorodangoOrigins,
      title: 'Earth as Mirror',
      body:
          'The final stage of a dorodango achieves something almost paradoxical: '
          'earth becomes a mirror. The dullest material in our world — dirt — '
          'reflects light when given enough patient attention. Ancient Japanese '
          'philosophy finds no contradiction here. The potential for brilliance '
          'was always present in the soil; the maker simply revealed what was '
          'already there. This is a recurring idea in Japanese aesthetics: the '
          'craftsperson does not impose beauty upon material but coaxes it out. '
          'Your hands have been in conversation with this earth, and the shine '
          'is the earth answering back.',
      source: 'Japanese aesthetic philosophy',
      relevantStages: [BuildStage.polishing, BuildStage.finished],
      estimatedReadTime: 1,
    ),

    // --- wabiSabi (4) ---
    const Reflection(
      id: 'wabi-1',
      theme: ReflectionTheme.wabiSabi,
      title: 'The Beauty of Imperfection',
      body:
          'Wabi-sabi is the Japanese aesthetic rooted in the acceptance of '
          'imperfection and transience. A cracked tea bowl, a weathered wooden '
          'beam, moss growing between stones — these are not flaws but '
          'signatures of time and use. Your dorodango will not be a perfect '
          'sphere. It will carry the unique imprint of your hands, the '
          'particular composition of your soil, the humidity of the day you '
          'made it. These variations are not errors to be corrected but the '
          'very things that make your sphere yours alone. No two dorodango '
          'are alike, and this is precisely the point.',
      source: 'Leonard Koren, Wabi-Sabi: for Artists, Designers, Poets & Philosophers',
      relevantStages: [BuildStage.drying, BuildStage.polishing, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'wabi-2',
      theme: ReflectionTheme.wabiSabi,
      title: 'Nothing Lasts',
      body:
          'One of the three pillars of wabi-sabi is impermanence — nothing '
          'lasts, nothing is finished, nothing is perfect. Your dorodango, '
          'even when complete, is still changing. It will continue to harden '
          'for weeks. Over months and years, its surface may develop subtle '
          'shifts in tone. If dropped, it will break, and the cross-section '
          'will reveal the layers of your work like geological strata. This '
          'impermanence does not diminish the object; it deepens it. You are '
          'not building something eternal. You are building something that '
          'exists beautifully in time, just as you do.',
      source: 'Richard Powell, Wabi Sabi Simple',
      relevantStages: [BuildStage.drying, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'wabi-3',
      theme: ReflectionTheme.wabiSabi,
      title: 'Poverty of Means, Richness of Result',
      body:
          'Wabi originally described the loneliness of living in nature, far '
          'from society. Over centuries it evolved to appreciate the beauty of '
          'simplicity and poverty of means. Dorodango is perhaps the purest '
          'expression of this: your material is dirt and water. No expensive '
          'tools, no specialized equipment, no rare ingredients. The richness '
          'of the result comes entirely from your attention. In a world that '
          'often equates expense with quality, there is something quietly '
          'radical about making a beautiful object from earth beneath your '
          'feet. The material cost is zero. The investment is presence.',
      source: 'Kakuzo Okakura, The Book of Tea',
      relevantStages: [BuildStage.polishing, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'wabi-4',
      theme: ReflectionTheme.wabiSabi,
      title: 'Seeing What Is Already There',
      body:
          'The wabi-sabi master does not create beauty so much as reveal it. '
          'A garden designer sees the existing landscape before placing a '
          'single stone. A tea master chooses the bowl that suits the season, '
          'not the most ornate one. When you polish your dorodango, you are '
          'not painting beauty onto mud — you are drawing out the latent shine '
          'that the soil particles already possessed. The alignment of tiny '
          'mineral grains, compressed and smoothed, naturally reflects light. '
          'You did not add the shine. You removed everything that was hiding '
          'it. This is the wabi-sabi way: not addition but subtraction, not '
          'decoration but revelation.',
      source: 'Soetsu Yanagi, The Beauty of Everyday Things',
      relevantStages: [BuildStage.polishing, BuildStage.finished],
      estimatedReadTime: 2,
    ),

    // --- ma (2) ---
    const Reflection(
      id: 'ma-1',
      theme: ReflectionTheme.ma,
      title: 'The Space Between',
      body:
          'Ma (間) is the Japanese concept of negative space — the pause '
          'between notes that gives music its shape, the emptiness of a room '
          'that makes it usable, the silence in conversation that allows '
          'meaning to land. In dorodango, the drying stage is pure ma. '
          'Nothing visible is happening, yet everything is changing beneath '
          'the surface. Moisture migrates outward through capillary action, '
          'particles settle and bond. The sphere is working even when your '
          'hands are not. Learning to trust this invisible process — to value '
          'the waiting as much as the doing — is one of the deepest lessons '
          'the practice offers.',
      source: 'Arata Isozaki, MA: Space-Time in Japan',
      relevantStages: [BuildStage.drying, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'ma-2',
      theme: ReflectionTheme.ma,
      title: 'Emptiness Is Not Nothing',
      body:
          'In Western thinking, empty space is often seen as absence — '
          'something to be filled. In Japanese aesthetics, emptiness is '
          'presence. The tokonoma alcove in a traditional room holds only one '
          'scroll and one flower because the space around them is what gives '
          'them power. Right now your dorodango is resting, and this rest is '
          'not wasted time. The pause between your actions lets the material '
          'respond. It is a dialogue: you shape, then you listen. You compress, '
          'then you wait. The sphere teaches that productivity and stillness '
          'are not opposites but partners, each making the other meaningful.',
      source: 'Lao Tzu, Tao Te Ching (Chapter 11), via Japanese interpretation',
      relevantStages: [BuildStage.drying, BuildStage.finished],
      estimatedReadTime: 1,
    ),

    // --- kintsugi (2) ---
    const Reflection(
      id: 'kintsugi-1',
      theme: ReflectionTheme.kintsugi,
      title: 'Gold in the Cracks',
      body:
          'Kintsugi is the art of repairing broken pottery with lacquer mixed '
          'with gold. Rather than hiding the damage, the repair becomes the '
          'most beautiful part of the object. Its history dates to the '
          'fifteenth century, when a Japanese shogun sent a cracked tea bowl '
          'to China for repair and was disappointed by the ugly metal staples '
          'he received back. Japanese craftsmen developed a more beautiful '
          'solution. If your dorodango develops a crack during drying, you '
          'face a kintsugi moment: you can abandon it, or you can work with '
          'the crack, incorporating it into the sphere\'s story. Some of the '
          'most striking dorodango carry visible history in their surfaces.',
      source: 'Christy Bartlett, Flickwerk: The Aesthetics of Mended Japanese Ceramics',
      relevantStages: [BuildStage.drying, BuildStage.dustingCapping],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'kintsugi-2',
      theme: ReflectionTheme.kintsugi,
      title: 'Stronger at the Broken Places',
      body:
          'The philosophy of kintsugi extends far beyond ceramics. It suggests '
          'that breakage and repair are part of an object\'s history, not '
          'something to disguise. Applied to dorodango, this means that the '
          'imperfections you encounter — a small dent from handling, an uneven '
          'patch of dusting, a subtle color variation from different soil '
          'layers — are not failures. They are chapters. Each mark records a '
          'moment of the making process. Master dorodango practitioners often '
          'say they can read a sphere\'s entire story from its surface, the '
          'way a geologist reads the history of the earth in exposed rock.',
      source: 'Japanese craft philosophy',
      relevantStages: [BuildStage.dustingCapping, BuildStage.polishing],
      estimatedReadTime: 1,
    ),

    // --- shokunin (4) ---
    const Reflection(
      id: 'shokunin-1',
      theme: ReflectionTheme.shokunin,
      title: 'The Craftsman\'s Spirit',
      body:
          'Shokunin means artisan or craftsman in Japanese, but it carries a '
          'deeper meaning than its English translation suggests. Shokunin '
          'katagi — the craftsman\'s spirit — describes a devotion to one\'s '
          'craft that goes beyond skill into moral territory. The shokunin '
          'feels a social obligation to work their best for the benefit of '
          'others. Even when making something for yourself, you work as '
          'though someone else\'s life depends on the quality. This intensity '
          'of focus, applied to a simple mud sphere, transforms what could be '
          'a trivial activity into a meditation on what it means to care '
          'deeply about the quality of your work.',
      source: 'Tashio Odate, Japanese Woodworking Tools',
      relevantStages: [BuildStage.coreForming, BuildStage.dustingCapping, BuildStage.polishing],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'shokunin-2',
      theme: ReflectionTheme.shokunin,
      title: 'Ten Thousand Hours of Earth',
      body:
          'In traditional Japanese crafts, mastery is measured not in years but '
          'in repetitions. A sushi chef spends years just learning to prepare '
          'rice. A sword polisher completes a ten-year apprenticeship before '
          'working independently. Dorodango follows a compressed version of '
          'this arc: within hours, you cycle through frustration, boredom, '
          'flow, and satisfaction. Each sphere you make teaches something the '
          'previous one could not. The second sphere\'s core will be denser. '
          'The third sphere\'s dusting will be more even. By the fifth, your '
          'hands will know things your mind cannot articulate. This is the '
          'shokunin path — knowledge that lives in the body.',
      source: 'Japanese apprenticeship tradition',
      relevantStages: [BuildStage.coreForming, BuildStage.polishing],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'shokunin-3',
      theme: ReflectionTheme.shokunin,
      title: 'The Dust Speaks',
      body:
          'A skilled dusting practitioner can feel the difference between soil '
          'particles of different sizes through their fingertips. The finest '
          'particles — those that pass through a 200-mesh sieve — create the '
          'smoothest surface and the deepest shine. But the shokunin approach '
          'is not just about using the finest dust; it is about understanding '
          'why. Smaller particles pack more tightly, leaving fewer gaps for '
          'light to scatter. Each dusting layer adds perhaps twenty microns '
          'of material. Five to ten layers build a shell thinner than a '
          'playing card, yet strong enough to burnish to a mirror. Attention '
          'at this scale is the essence of craftsmanship.',
      source: 'Material science of dorodango',
      relevantStages: [BuildStage.dustingCapping],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'shokunin-4',
      theme: ReflectionTheme.shokunin,
      title: 'The Polisher\'s Touch',
      body:
          'Japanese sword polishers, or togishi, spend decades perfecting the '
          'art of revealing a blade\'s true character. They work through a '
          'series of increasingly fine stones, each one removing less material '
          'and revealing more detail. The final stage uses a fingertip-sized '
          'stone that glides across the steel with almost no pressure. '
          'Polishing dorodango follows the same principle: as the surface '
          'becomes finer, your touch must become lighter. Heavy pressure on a '
          'smooth surface will gouge, not polish. The last stage of finishing '
          'barely grazes the surface at all. Mastery here is measured in what '
          'you learn to withhold, not what you apply.',
      source: 'Japanese sword polishing tradition (togishi)',
      relevantStages: [BuildStage.polishing],
      estimatedReadTime: 1,
    ),

    // --- soil (2) ---
    const Reflection(
      id: 'soil-1',
      theme: ReflectionTheme.soil,
      title: 'A World Beneath Your Feet',
      body:
          'A single teaspoon of healthy soil contains more microorganisms than '
          'there are people on Earth. Bacteria, fungi, protozoa, and nematodes '
          'form a living web that has been building for thousands of years. '
          'The soil you gathered for your dorodango carries this history. The '
          'mineral composition reflects the bedrock below, weathered over '
          'geological time. The color tells a story: reds and oranges indicate '
          'iron oxides, dark browns suggest rich organic matter, grays point '
          'to clay deposits. Every dorodango is a portrait of the specific '
          'place it came from — a small sphere holding the deep story of its '
          'landscape.',
      source: 'David Montgomery, Dirt: The Erosion of Civilizations',
      relevantStages: [BuildStage.coreForming, BuildStage.drying],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'soil-2',
      theme: ReflectionTheme.soil,
      title: 'Clay Remembers',
      body:
          'Clay is remarkable among soil components because of its memory. '
          'Clay particles are flat and plate-like, and when compressed, they '
          'align in parallel layers — much like shuffling a deck of cards and '
          'pressing it flat. This alignment is what gives your dorodango its '
          'strength and its potential for shine. The particles, once aligned, '
          'resist returning to disorder. They remember the pressure of your '
          'hands. This is not metaphor; it is physics. Every compression '
          'during core forming permanently rearranges millions of particles '
          'into a stronger configuration. The sphere literally takes the shape '
          'of your care.',
      source: 'Soil science, clay mineralogy',
      relevantStages: [BuildStage.coreForming, BuildStage.drying],
      estimatedReadTime: 1,
    ),

    // --- patience (2) ---
    const Reflection(
      id: 'patience-1',
      theme: ReflectionTheme.patience,
      title: 'The Slow Reveal',
      body:
          'Modern life optimizes for speed. Instant delivery, real-time '
          'updates, immediate results. Dorodango resists all of this. The '
          'drying stage alone takes hours, and there is no way to rush it '
          'without damaging the sphere. This enforced patience is not a bug '
          'but a feature. Researchers studying flow states have found that '
          'slow, repetitive manual tasks — knitting, woodcarving, pottery — '
          'activate the default mode network in the brain, the same network '
          'associated with creativity and self-reflection. Your dorodango is '
          'not just drying right now; your mind may be doing some of its most '
          'interesting work in this unhurried space.',
      source: 'Mihaly Csikszentmihalyi, Flow',
      relevantStages: [BuildStage.drying],
      estimatedReadTime: 1,
    ),
    const Reflection(
      id: 'patience-2',
      theme: ReflectionTheme.patience,
      title: 'What the Hands Know',
      body:
          'There is a Japanese proverb: "The hands learn before the mind '
          'understands." Watch a child making dorodango for the first time, '
          'and you will see this in action. Before they can explain what they '
          'are doing, their hands are adjusting pressure, rotating speed, and '
          'moisture instinctively. This tactile intelligence — developed over '
          'millions of years of human evolution — is one of our most '
          'undervalued capacities. In an age of screens and abstraction, '
          'dorodango is a return to the fundamental human activity of shaping '
          'the physical world with your hands. It is not a step backward but '
          'a reconnection with something essential.',
      source: 'Frank Wilson, The Hand',
      relevantStages: [BuildStage.coreForming, BuildStage.drying, BuildStage.dustingCapping],
      estimatedReadTime: 1,
    ),
  ];
}
