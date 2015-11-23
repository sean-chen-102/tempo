# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# SET UP USERS
user_1 = User.create({ name: "Sally", username: "sillysally23", email: "sally@mail.com", password: "password", password_confirmation: "password", activated: true, activated_at: Time.zone.now })
user_2 = User.create({ name: "Ben", username: "trap_queen", email: "ben@mail.com", password: "password", password_confirmation: "password", activated: true, activated_at: Time.zone.now })
user_list = [user_1, user_2]


# SET UP INTERESTS
news_interest = Interest.create({ name: "News" })
fitness_interest = Interest.create({ name: "Fitness" })
science_interest = Interest.create({ name: "Science" })
technology_interest = Interest.create({ name: "Technology" })
food_interest = Interest.create({ name: "Food" })
eli5_interest = Interest.create({ name: "Explain It Like I'm 5" })
history_interest = Interest.create({ name: "History" })
health_interest = Interest.create({ name: "Health" })
fun_facts_interest = Interest.create({ name: "Fun Facts" })


user1_interests = [news_interest, fitness_interest]
user2_interests = [science_interest, technology_interest, news_interest, fitness_interest]
interests = user1_interests + user2_interests


# SET UP ACTIVITIES
# template: { title: "", content_type: "", completion_time: 0, link: "", content: "" }

# FITNESS ACTIVITIES
fitness_1 = { title: "Why Weights Are Better Than Cardio for Fat Loss", content_type: "text", completion_time: 5, link: "http://www.bornfitness.com/weights-are-better-than-cardio-for-fat-loss/", content: "Have you heard that one joke where some fitness professionals insist that running makes you fat? In a world where diets sell you on the idea of eating cookies to lose weight, it’s hard to believe that exercise professionals could consider any activity or form of exercise \"bad.”
 The majority of calories you burn in a day are not through activity, but instead through your resting metabolic rate (RMR). And yet, the anti-running crusade is not joke. There are those that genuinely believe lower intensity cardio is directly causing weight gain problems. This is what happens when weight loss frustration sets in and people are looking for a reason to explain why the scale goes the wrong direction 
 despite plenty of effort. After all, it becomes easier to understand if you slog away day after day doing cardio and don’t see changes. Naturally, something must be wrong. But that usually that has more to do with why your cardio approach isn’t working, than anything \"wrong” with cardio. Running is not the reason you gain weight. But if you’re looking for the fastest way to see your body change, it’s not necessarily 
 the most efficient approach. There’s a big difference between \"doesn’t work” and \"doesn’t work as well.” Such is the case in the age-old debate between cardio and weight training. Cardio has many benefits, including many related to weight loss, but also supports your ATP production (think energy for your workouts), aids in recovery, and even can help you relax and sleep better (by shifting your sympathetic drive in
 your autonomic nervous system; translation: longer, slower cardio can help you chill out.) But if you’re trying to create the fastest path to dropping a few extra pounds, here’s why prioritizing weight training is important. Just for the sake of learning, remember, cardio is not bad. It just doesn’t burn fat as quickly. (Ok, let’s pass that around until we kill that myth.) In an ideal world, you’d combine metabolic
 and high intensity workouts (think moderate-to-heavy weights combined with short rest periods) with longer, slower, less intense bouts of cardiovascular activity. The short bouts of training would send your heart rate soaring, increase metabolic activity, and crush fat cells. The slower cardio would aid with recovery and make sure you don’t walk around exhausted, but would also improve your heart efficiency. Think
 about it, when you train you become exhausted. Most of the time you only think about how tired your muscles feel, and that’s part of the equation. The other part is your heart just not being able to push harder. When you perform slower, longer cardio, you actually are able to force more blood into your heart and expand the walls. This renovation means your heart can pump more blood and oxygen with each beat, making
 you much more efficient. Rather than becoming gassed as you push harder, you can do a better job of fighting off fatigue and maintaining a higher intensity. While it is easy to see why it’s ideal to perform both a mix of lower intensity cardio and weight training, the reality is most people are pressed for time and impatient. You want results as fast as possible with the least amount of work needed. Not to mention,
 you might not have time for the a little extra cardio. You can call it an excuse, but it’s also a reality for many people. So why build a training plan you might not be able to maintain? That’s why if you had to choose between weights and cardio, weights would be the more direct approach. The majority of calories you burn in a day are not through activity, but instead through your resting metabolic rate (RMR). For
 example, a 200-pound man might have an RMR of 1600 to 1900 calories, which is about 2-3 times the amount of calories burned in a typical workout. The point? Weight training is better at preserving your RMR by preserving lean body mass (LBM), which is a significant contributor to RMR, or the calories you burn in a 24-hour period independently of physical activity. Research has shown exactly why strength training does
 such a good job of being the top priority on fat loss plans. West Virginia University researchers used obese female subjects to assess LBM and RMR and compared 12 weeks of resistance versus aerobic training on LBM and RMR. Despite an 800 calorie liquid diet (mmm…delicious), the resistance-trained group had no significant LBM losses while the other group lost 4 kg of lean mass. Think about that for a moment. Eating 800
 calories per day is low enough that people would fear the dreaded \"starvation effect.” And yet, that’s not what was found. [Note: this is not an endorsement to eat 800 liquid calories per day.] You, the resistance-trained group also lost significantly more body fat (around 2 kg) and the RMR increased by 4 percent. In comparison, the aerobic group experienced a 13.4 percent drop in RMR. The resistance group also had
 greater endurance capacity in the time-to-fatigue test. This study supports the idea that untrained obese subjects dieting severely will get across-the-board better benefits from strength training instead of aerobic training. But the benefits aren’t just limited to those that are overweight or obese. When considered your most direct path to fat loss, it’s understanding why these benefits were so pronounced. Strength
 training allows you to maintain a better muscle-to-fat ratio, which not only helps with the way you process food, but also ensures that the amount of calories you burn outside the gym are enough to support all the hard work you dedicate inside the gym."}

fitness_2 = {title: "The Best Protein Sources", content_type: "text", completion_time: 5, link: "http://www.bornfitness.com/the-best-protein-sources/", content: "Let’s state the obvious: protein is good for you. You need protein, whether it’s for building muscle, losing fat, staying full, or just maintaining your health. What’s not as settled is where you should get your protein and what are the best protein sources.
 And when you consider all the options, it’s easy to see why. From meat to vegetarian sources, powders to dairy, there’s a wide variety of options and plenty of difficulty understanding what you need, what is good, and if \"too much” is really a danger. Protein supplementation should not be catered around absorption speeds, marketing promises, or the latest and greatest protein powder modification. While your own needs
 will be personal based on your body and goals, here’s how you can make the protein column on your shopping list a little easier to understand. The top sources of food protein are those that are high in protein while simultaneously lowest in fatty acids (kind of obvious). Meat rarely, if ever, has carbohydrate or alcohol content. These \"lean meats” are fairly equivalent on a macronutrient basis to many protein powders,
 with roughly 100 calories per 20 to 25 grams of protein. Your typical lean meats include warm-water fish, white poultry meat, and red meat sources considered extra lean. (For reference, red meat and pork tend to have higher fat content.) Egg whites also qualify, and most protein powders fall into this category. Food sources of protein that also contain fatty acids are cold water fish (salmon as an example), most of the
 red meats, the dark meat of the poultry, and any of the lean category if you decided to cook it in oil. Whole eggs are similarly in this category as the yolk contains fatty acids. If a meat has breading on it, it is now covered in carbs. That is not inherently bad, but you should understand that no meat can be breaded and still be considered lean. Dairy products tend to never be as lean as the leanest meat products,
 although they are in a wide spectrum of fat content; checking the label or investigating nutritional information online would be prudent. As mentioned earlier, it seems that the best sources of protein on a caloric basis come from animals. In general, the food groups and their overall protein contents are in the order (greatest to least content on a caloric basis): meat and dairy products (lean), most vegetables,
 meat and dairy products (fatty), meat substitutes, fruits and harvest vegetables, most grains. Vegetables are in a weird position, as they tend to have roughly 3 to 4 grams of protein per 40 calories (which is 30-40% by caloric weight). It is unlikely that they will form a substantial amount of your dietary intake due to their filling nature, but they are indeed decent protein sources from a caloric perspective.
 Most root and harvest vegetables (pumpkin, squash, potatoes, etc.) are listed further down as they have a greatly increased amount of carbohydrates. Additionally, although some grains can indeed have a high protein content (such as quinoa), the majority of grains eaten in a standard diet tend to have a large degree of carbohydrates relative to protein; the focus on enhancing grains appears to be related to micronutrition
 and fiber, with minimal focus in increasing protein content. Supplement-wise, a rice/pea blend as well as both soy and hemp appear to be viable vegan protein sources. Soy food products are viable options, as are vegetables themselves if you can eat sufficient amounts of them. Some microalgae protein sources also exist, mostly chlorella and spirulina. Overall, the importance of a protein supplement is only important if
 you don’t consume enough protein your diet. Protein supplementation should be catered mostly around allergies, price range, flavor, and perhaps functional properties of the protein if pudding is desired. Protein supplementation should not be catered around absorption speeds, marketing promises, or the latest and greatest protein powder modification. Adding more amino acids tends to have the biggest impact when total
 protein intake is lower. Let’s say you only consume 50g of protein a day. It is a good idea to increase that to 75g by adding whey because of its cysteine content. However, if you’re a 180 pound male and you eat 100 grams per day, you don’t need to worry about consuming any specific protein, as even poor sources of one or another amino acid will add up. Because of these reasons, BCAA and EAA supplements also seem to
 have less of a role as supplements when protein intake from food and supplements is comparatively high; they have a much larger role when your diet is low in protein overall, especially low in complete proteins."}

fitness_3 = {title: "Scared to Eat Carbs? Here’s How to Enjoy Them (Healthfully)", content_type: "text", completion_time: 8, link: "https://blog.myfitnesspal.com/scared-to-eat-carbs-heres-how-to-enjoy-them-healthfully/", content: "When I first decided to stop dieting the single hardest thing for me to do was let myself eat carbs again. Bread, rice and potatoes had been banned from my list of skinny-friendly foods for
 over 5 years. And even though I only weighed about 5 lbs less than when I ate them regularly, I couldn’t help but think of carbs as impossibly fattening. Given my body image issues at the time, I think I would have preferred to eat something laced with anthrax. What is it about carbs that makes people act insane? Getting over my fear of carbs required several critical steps. The first big one was digging into the science
 and learning that the healthiest, longest lived humans on the planet eat intact grains, tubers and legumes regularly. I grudgingly had to accept that they were not subsisting on protein bars and Diet Coke like I was. The next big test was trying for myself. I slowly phased out processed \"diet” foods and started teaching myself to cook vegetables and other Real Foods. I started eating fruit again. But the scariest part was
 letting myself eat things like oats, rice and breakfast cereal (still not the best choice, but it didn’t matter). To my surprise and delight I didn’t gain weight. This was a huge win, since it was the first time in my adult life I remember not being constantly hungry. Then, slowly, I started to lose weight. As I experienced success and felt my health flourish, I gained confidence that I was on the right track and became
 even more adventurous with my food experiments. I even allowed myself to eat things like bread and cake on occasion. Today, nearly 10 years later, I hardly ever think of the word \"carbs” unless I see it in the news. I eat and love Real Foods. Sometimes they’re starchy. Sometimes they’re sweet. But they’re always delicious. I even eat foods that have been processed if it sounds tasty and appropriate for the setting. When
 I’m in Italy I eat pasta, in Paris I eat baguettes, in Napa I’ll eat pretty much anything because the food is so amazing. Believe it or not I haven’t gained weight, I don’t have diabetes, and the apocalypse didn’t come. In other words, I’ve learned to eat the formerly forbidden \"carbs” like a sane person. Carbs don’t have to be your enemy. Anyone with a healthy metabolism can learn to live with them in peace with the right
 attitude. Here are some of the lessons I’ve learned along the way: 1. Don’t moralize your choices. Foods, even those that contain carbohydrates, are not all \"good” or \"bad.” Some may support health more than others, and some may remind you of your childhood summers at grandma’s house. There’s value in both and no need for feeling guilty or virtuous in either case. Drop the moralization and you can start to see your actions
 more objectively, which is half the battle. 2. Prioritize unrefined starches. I’ve come to accept that I don’t function well without some starchier foods in my life. Going completely carb-free gets me very hungry, making it harder to eat mindfully and more likely I’ll binge (meat binges are not pretty). It also makes my workouts suffer and makes it nearly impossible to eat in public without being that obnoxious person who
 has a problem with every single thing on the menu. At the same time I still prefer to eat unprocessed foods, which help me have more energy and look my best. I’ve found that when I eat small amounts of grains (e.g. oats, rice, farro, etc.) and legumes (e.g. beans, lentils) regularly, my cravings for bread and sweets completely disappear and I’m satisfied with less food. It also helps vary my meals so they’re less boring and
 generally makes life more delicious. Win-win-win. You may do better with more or less starchy foods in your personal healthstyle, but regardless of the quantity focusing on unrefined, intact starches should be your default. 3. Own your indulgences. When outside your normal habits—maybe it’s your birthday or you’re on vacation—you’ll occasionally have an opportunity to eat something that is made almost entirely of flour and/or
 sugar. Only you can decide what is or isn’t worth it for you. Now that I am totally in love with the Real Foods I eat every day, it’s easy for me to be really picky in this regard, which I’m thankful for. But even if Ben & Jerry’s ice cream cake still makes you swoon, that’s fine. What’s important is that if you decide to go for it, go for it. That doesn’t mean shoveling as much into your mouth hole as you can fit in a
 20-minute sitting. It means being honest with yourself about what a satisfying piece is for you—not too skimpy, not so big it’ll make you sick. It means putting it on a plate, finding a place to sit, putting a smile on your face, and enjoying the hell out of it. Because life should be awesome. 4. Don’t pretend processed carbs don’t matter. No one eats processed carbs because they’re healthy. You eat them because they’re
 delicious. Because there’s more to life than eating like a robot. Because you don’t know what the future will bring. Because one croissant won’t kill you. That doesn’t mean you can throw caution to the wind and eat like that every meal of every day. Your food choices have consequences, and the frequency and quantity of processed starches and sugars you eat is strongly predictive of your future health and body weight.
 Finding the balance between health and enjoyment gets much, much easier when you stop moralizing your food choices, pay attention to your body, and prioritize your own well-being. But it is still work you need to do for yourself, since everyone is different. Learning to enjoy delicious food without sacrificing your health requires mastering your own psychology and being realistic about what you really want, and what you
 can really do. 5. Don’t believe the hype. In recent years it feels like starchy foods have become even more controversial than meat. Every week new sensationalist headlines rekindle the battle between the low-carb and low-fat camps, providing next to zero actionable advice for average people. Just ignore it. The science is interesting to us geeks, but it tells you almost nothing about yourself as an individual. So don’t
 worry about it. Focus on eating real, unprocessed food most of the time and choose your indulgences based on what you love and what works to keep you feeling and looking your best. That’s all you really care about anyway, and it will help keep you sane."}

fitness_4 = {title: "Easy Ways to Make Exercise Happen", content_type: "text", completion_time: 3, link: "https://blog.myfitnesspal.com/easy-ways-to-make-exercise-happen/", content: "If you’ve been lacing up your sneakers and breaking a sweat a few times per week for a while now, you’ve got a great fitness routine going—good on you! But what happens when things go haywire? Say, your calendar fills up with work deadlines, the babysitter cancels, or a tire goes flat on the way to the gym.
 Cut yourself some slack, and try one of these tricks to keep some activity in your day. 1. Schedule your workouts the same way you plan your week around your favorite TV shows. Yes, you can TiVo those episodes to watch on your time, and—guess what!?—you can do that with a run or power walk, too. Find a time that works for you and make fitness happen! 2. Stop thinking of exercise as something you have to do. Fitness should
 be fun! Find an activity that you love—adult kickball, soccer, roller skating, anything!—and make that part of your routine. You’re more likely to stick to an exercise plan that makes you smile than one you dread. Plus, there’s no rule that says you have to spend an hour a day slogging it out on an elliptical machine, while staring at a wall.  3. Skip up a hill—don’t laugh, it’s a calorie-torching workout! (Or do laugh—it’s
 great for your abs!) Invite your friends for a power walk around the neighborhood and some girl time. Or turn your 2:15pm touch-base with a coworker into a walking meeting, and do a couple laps around the building. (Don’t forget to log that walk in your MyFitnessPal exercise diary.) 4. Instead of getting bogged down with doing the perfect workout or signing up for the trendiest class, simply add more movement (any and all
 movement is great!) into your day. 5. You’ve heard these little suggestions before: Take the stairs, park in the furthest spot possible, get off the bus one stop early—all that extra movement really does add up. Being more active in general will increase your calorie burn and enhance your weight loss efforts."}

fitness_5 = {title: "The One Trick That Will Help You Stick to Your Workouts", content_type: "text", completion_time: 3, link: "http://dailyburn.com/life/fitness/one-trick-workout-motivation-news-101215/", content: "Did you know more than 43 percent of Americans get insufficient levels of exercise every day? That’s why literally millions of dollars are being spent each year to encourage people to move more with initiatives
 like Let’s Move. But now, a new study from the University of Pennsylvania has pinpointed the one thing that might actually improve your workout habits. It turns out the secret to keeping up lies in having a posse of \"health buddies.” (It may sound corny, but hear us out.) When researchers asked 217 students to enroll in free exercise classes at their gym, they gave half of the subjects a virtual support system comprised of
 six of their peers. The other half either received motivational messages via e-mail to pump them up for workouts, or just the free membership. Throughout the 13-week study, each member regular received e-mail updates on their peers’ actions, though everyone’s identity was kept anonymous. When one person signed up for a yoga or strength-training class, the other folks were notified. And they got updates only on the good stuff
 — not when one of them skipped a class to eat pizza, instead. (Because hey, that definitely happens.) Results showed that students paired with \"health buddies” were the only ones who showed a steady increase in workout attendance (rah-rah messaging and freebie classes alone didn’t do much). \"You just have to put people into the right kind of social environment where they can interact with each other. Even anonymous social
 interaction will create behavior change,” says study author Damon Centola, of Penn’s Annenberg School for Communication and its School of Engineering and Applied Sciences. The crazy thing, though, is that the subjects involved in the study didn’t even know each other. So imagine what could happen if you formed a workout group of your actual friends? After all, you don’t want to be the only one who stays at home when all
 your pals are getting in a quality sweat session together."}

fitness_list = [fitness_1, fitness_2, fitness_3, fitness_4, fitness_5]


# NEWS ACTIVITIES
news_1 = { title: "Why Fannie Mae and Freddie Mac Survived", content_type: "text", completion_time: 6, link: "https://www.washingtonpost.com/opinions/why-fannie-mae-and-freddie-mac-survived/2015/11/15/86cba904-8a20-11e5-9a07-453018f9a0ec_story.html?hpid=hp_no-name_opinion-card-c%3Ahomepage%2Fstory", content: "One of the most interesting and uncovered stories these days is the survival of Fannie Mae and Freddie Mac — the giant
 housing entities created by the government and known collectively as the GSEs (government-sponsored enterprises). On Sept. 6, 2008, nine days before the Lehman Brothers bankruptcy, Treasury Secretary Henry Paulson put the GSEs into \"conservatorship.” This meant that the government would cover their costs because they were bankrupt. The government’s aid ultimately totaled $187 billion. Even in Washington, that’s serious money,
 and it fostered an informal consensus: Fannie and Freddie had to go; taxpayers’ exposure was too great. \"This is an opportunity to get rid of institutions that shouldn’t exist,” former Federal Reserve chairman Paul Volcker said. The GSEs had been — it was widely assumed — \"consigned to the dustbin of history,” as financial writer Bethany McLean says in her new book, \"Shaky Ground: The Strange Saga of the U.S. Mortgage Giants.”
 Well, not yet — and possibly never. Remarkably, their importance today is unparalleled. In 2013, President Obama said that \"our housing system should operate where there’s a limited government role and private lending should be the backbone.” Just the opposite applies now: Government dominates housing finance. Here are the numbers. Fannie and Freddie provide government mortgage guarantees (i.e., if homeowners default, the
 GSEs repay mortgage investors in full). In 2015, GSE guarantees cover about half of new mortgages for home purchases; including other agencies — the Federal Housing Administration, which caters to lower-income borrowers, and Veterans Affairs — the government guarantees three-quarters of new mortgages. By contrast, the government’s share in 2006 was slightly more than 30 percent, with the GSEs representing most of that. We
 have effectively nationalized housing finance. Private money retreated, and the GSEs have returned to profitability — with all the profits going to the U.S. treasury. So far, these amount to $241 billion. To be sure, some profits reflected one-time increases, says housing expert Jim Parrott of the Urban Institute. During the financial crisis, the GSEs overestimated their losses, resulting in huge write-offs. As the economy
 revived, it became clear that the GSEs had been too pessimistic. When some write-offs were reversed, profits temporarily surged. In 2013, they totaled $133 billion. But these profit bonanzas won’t likely be repeated, says Parrott. Still, the GSEs’ underlying profitability has improved, though more modestly. Losses on loans made in the early 2000s have faded, while tighter lending standards have made new loans less risky. And
 guarantee fees — what borrowers pay to cover losses — have increased. Nevertheless, taxpayers could face billions of losses in another crisis. Doesn’t this suggest that the GSEs should be eased out of backstopping the $9 trillion mortgage market? Apparently not. Two obstacles arose. One is pragmatic: fear for the housing recovery. All the real estate agents, builders, carpenters, mortgage bankers and others who depend on home
 buying worry that dismantling the GSEs would push interest rates up and housing activity down. \"Without GSE backing, banks have shown very little interest in lending to American homeowners, even ones with very high credit scores,” writes McLean. Even with the GSEs, housing’s recovery has been sluggish. Annualized sales are about 8 percent below a normal level of 6.5 million, notes Mark Zandi of Moody’s Analytics. Housing starts
 are weaker at about 1.1 million annually, well below a more normal level of 1.7 million, he says. The second obstacle is philosophical: protecting the 30-year fixed-rate mortgage, which Americans prefer. It’s said that, without government guarantees, institutional investors won’t hold loans with such long maturities. The danger of huge losses is too great. If government guarantees end, mortgage maturities will shorten and adjustable
 interest rates will become more common, the argument goes. What’s wrong with that?, asks Peter Wallison of the American Enterprise Institute. Subsidized long-term mortgages encourage overinvestment in big homes. Shorter maturities would favor smaller homes. Borrowers would also earn equity in their homes faster than with 30-year fixed loans, where early payments go mostly to interest. These are important choices. The GSEs
 are part of a larger agenda that McLean rightly calls \"the cult of homeownership”: that it’s an essential marker of social success. We should be discussing whether this approach still serves our interests. But that’s a debate we’ve evaded. There’s a wild card in all this: suits by private investors, who still own about 20 percent of the GSEs. They allege that the government has mistreated them. A legal victory could compel
 change. Meanwhile, the safest course for the White House and Congress has been to save the GSEs and enlist them in the housing recovery. So that’s what they did — and that’s how Fannie and Freddie survived."}


news_2 = {title: "SeaWorld’s whales still deserve better", content_type: "text", completion_time: 3, link: "https://www.washingtonpost.com/opinions/do-better-by-the-whales/2015/11/15/f58474ac-8967-11e5-be39-0034bb576eee_story.html?hpid=hp_no-name_opinion-card-b%3Ahomepage%2Fstory", content: "SEAWORLD ENTERTAINMENT has announced it will phase out its controversial killer whale show at its San Diego park, replacing it with one
 that doesn’t rely on human-designed stunts but focuses on behaviors in the wild. Any improvement in the treatment of these magnificent marine animals must be welcomed. But it will take far more than a repackaging of the show to address the physical and psychological problems that orcas in captivity experience. Last week’s announcement that next year will be last for SeaWorld’s signature \"Shamu” show of flips and tricks was
 seen as an effort to counter the backlash that has hurt its brand and depressed attendance. The explosive 2013 documentary \"Blackfish,” tracing the history of killer whales in captivity leading up to the 2010 killing of a SeaWorld trainer by a whale associated with the death of two other people, criticized the Orlando-based company’s treatment of these highly intelligent and far-ranging creatures. SeaWorld has called \"Blackfish”
 inaccurate and mounted a public relations campaign emphasizing the company’s conservation efforts. Pressure has been particularly intense in California, with state and federal officials pushing SeaWorld to end the captive breeding of orcas. The California Coastal Commission has made ending the captive breeding of orcas a condition — which SeaWorld says it will challenge — for proceeding with a tank expansion project. Maybe
 that’s why the move to drop the circuslike aspects of the show is limited to San Diego and wasn’t extended to the parks in Orlando or San Antonio. Just as the Ringling Bros. and Barnum & Bailey Circus had to come to grips with the reality that dressing up elephants and forcing them to stand on their heads was a callous holdover of another age, SeaWorld should recognize the need for new thinking and bold action. The whales now
 in captivity are unlikely to survive in the wild, but sanctuaries could be created that would better emulate conditions of their natural habitat. The existing tanks would be put to far better use accommodating the injured animals that are a part of SeaWorld’s admirable rescue efforts. Since breeding orcas only consigns future generations to captivity and its inherent cruelty, SeaWorld should voluntarily end the practice."}

news_3 = {title: "Apple's Tim Cook says a converged MacBook and iPad won't happen" , content_type: "text", completion_time: 3, link: "http://www.engadget.com/2015/11/16/apple-tim-cook-converged-macbook-and-ipad/", content: "Apple CEO Tim Cook isn't sold on the Surface, and the company doesn't plan on bringing together its MacBook or iPad into a single product like Microsoft's computing device, either. In an interview with the
 Irish Independent, Cook said: \"We feel strongly that customers are not really looking for a converged Mac and iPad.\" This follows comments the CEO made in an interview with the Daily Telegraph, where he questioned why anyone would buy a PC -- those comments were apparently aimed at Windows PCs, not his company's own computer range. \"We don't regard Macs and PCs to be the same.\" \"It's true that the difference between the
 X86 [PC architecture] and A-series [iPad architecture] is much less than it's ever been. That said, what we've tired to do is to recognize that people use both iOS and Mac devices ... so with things like Handoff we just made it really simple to work on one of our products and pick it up and work on the next product.\" But if Apple tried to fuse the two together, the CEO believes it might not be in the best interests of users:
 \"...So we want to make the best tablet in the world and the best Mac in the world. And putting those two together would not achieve either. You'd begin to compromise in different ways.\" - Tim Cook, Apple That said, Apple's said plenty of things before reassessing its options years later." }

news_4 = { title: "What happens when a self-driving Google vehicle gets pulled over?", content_type: "text", completion_time: 3, link: "http://rapidnewsnetwork.com/what-happens-when-a-self-driving-google-vehicle-gets-pulled-over/286224/", content: "In their own blog post on the the incident, the Mountain View Police Department said an officer \"noticed traffic backing up behind a slow-moving car\". It’s worth noting that under
 California’s Neighborhood Electric Vehicle Definition in its Vehicle Code, Google’s self-driving cars can travel no faster than 35 miles per hour. In September, Google said it was working to make its cars drive \"more humanistically\" following complaints that they were too polite. In the end, the officer determined the vehicle had broken no law. Google responded to the hubbub yesterday on its Self-Driving vehicle Project page
 on Google+. There was a passenger in the auto, though. A police officer pulled over a vehicle in California recently with the intention of giving the driver a ticket, but there was one problem: there was no driver. After realizing that it was an autonomous auto of Google’s, the policeman contacted the operators and \"educated them about impeding traffic\". The search engine giant has said that alike the officer, the operators
 of these vehicles have been flagged down by many people, who are interested in the vehicles, but it hasn’t violated any laws so far. Reports also surfaced that the driverless vessel had not been careening about town but instead had been going 25 miles per hour in a 35 miles per hour lane, causing traffic to build up. In a blog post on Policemag.com, Lt. Dan Fink of the San Rafael, Calif., Police Department wrote, \"an additional
 unintended outcome of smart cars may be significantly fewer law enforcement personnel assigned to traffic enforcement\". It turns out the Google vehicle operates only on roadways with speed limits at or under 35mph, and the road it was transversing, El Camino Real, is rated at 35mph. Other self-driving cars that Google has been testing on California roads and highways were involved in 17 minor collisions since May 2010, according
 to the company."}

news_5 = { title: "The strange Trump and Carson phenomenon explained", content_type: "text", completion_time: 7, link: "http://www.bbc.com/news/world-us-canada-34824987", content: "Pundits have long been wondering why two political outsiders, Donald Trump and Ben Carson, hold such a commanding lead in the Republican race for the White House. For their supporters, the answer is simple. A day after Trump sharply criticised fellow
 candidate Carson, they shared a stage at the Sunshine Summit in Orlando, Florida. There were no pyrotechnics, however - just evidence that both frontrunners have a dedicated base of support in Florida, a key electoral battleground, that shows no signs of fading any time soon. Mr Trump returned to his usual form as he addressed a packed ballroom in a luxury resort near major tourist attractions like Disney World and Universal
 Studios - \"right down the road\" from his palatial home in Palm Beach, the candidate noted. For 20 minutes he regaled the crowd with a typical mix of boasting about his poll numbers and book sales, denunciations of current US immigration and foreign policy, and promises to build a wall on the Mexican border. \"It's going to be a beautiful wall because some day they're probably going to name it after me,\" he said as the audience
 cheered. \"The Trump wall.\" The closest he came to swiping at fellow candidates this time was when he noted the war of words between two senators earlier in the day over immigration reform. \"I watched Ted Cruz and Marco Rubio fighting over who's tougher,\" he said. \"Let me tell you something - I was tougher when it wasn't politically popular to be tough.\" If Donald Trump's campaign was damaged by his dishevelled, often
 rambling 95-minute diatribe at an Iowa rally on Thursday - in which he mocked Mr Carson's personal history and said he had an incurable, \"pathological\" temper - there was no evidence of it Friday evening. Supporter after supporter in attendance praised Mr Trump for his business acumen and dismissed the earlier remarks as simply evidence of the candidate's tell-it-like-it is personality. \"I like that he's over the top,\" says
 Victoria Wilen of Orlando. \"My president needs to have bravado. I need to have somebody that's big and strong and loud and powerful.\" Yolanda Esquivel from Wauchula, Florida, says the recent criticisms of Mr Trump are just the latest attempts to bring him down. \"I'm looking at what candidates can do, not the picky little things they say that people want to make a big deal of and make into drama,\" she says. \"Come on, let's
 act like grown-ups.\" Before Trump's speech, loyalists lined the hallways of the conference centre to greet their man like a conquering hero. When he plunged into the crowd, flanked by his newly acquired Secret Service escort, the multitude pressed against him, seeking autographs and selfies. \"People say he doesn't have experience, but he has a lot more experience than Marco Rubio or Ted Cruz because he has executive experience,\"
 says Nicholas Poucher, a 16-year-old supporter from Lakeland, Florida. \"He has experience running a billion dollar company, and that's the business that counts - not just sitting in a Senate seat.\" One supporter placed a hand on Mr Trump's face as he passed - a strange, loving gesture that the New Yorker, who is reluctant to even shake hands, surely found off-putting. It's all part of life on the presidential campaign circuit,
 however. And if Mr Trump seemed exhausted by the gruelling day-after-day, cross-country schedule he's been keeping during his rally in Iowa, he was nonplussed on Friday. Linda Callahan of Pinellas County, Florida, said Mr Trump has started a revolution. \"He's brought energy back into the people, and I haven't seen that in a long time,\" she says. \"People are tired of politicians. They want somebody that's not connected with the
 government. They don't trust government anymore.\" Mr Carson, the other outsider candidate who has benefitted the most from this mistrust of government, took the stage shortly after Mr Trump departed - and the contrast between the two men couldn't have been more stark. Where Mr Trump was bombastic, Mr Carson was demure. Where the billionaire mogul was boastful, the retired neurosurgeon was humble. \"The good thing about God,\"
 he told the crowd, \"is you don't have to have a PhD to talk to him. You just have to have faith.\" In his quiet manner, however, he was equally scornful of the current Democratic government. He offered a litany of ways progressives are bringing the nation down - driving up debt, allowing illegal immigration, pushing people onto food stamps, promising free education, reducing funding for national defence, ignoring crumbling public
 infrastructure and neglecting veterans affairs. \"That's what I would do if I were trying to destroy the country,\" he said. After his speech Mr Carson was asked if he was angered by Mr Trump's recent attacks. \"When I was a youngster, I used to get irritated by that kind of thing - 'he said this about you, he said this about your momma',\" he said. \"I've moved so far beyond that, I don't pay attention to that kind of stuff.\"
 He added, however, that his quiet manner shouldn't be taken as a sign of weakness. \"Strength is not determined by the number of decibels in your voice,\" he said. Although Mr Carson doesn't display Mr Trump's fire on the campaign trail, his supporters are equally dedicated. \"He has a lot of good virtuous qualities that I'm looking for in a candidate,\" says Amy Handshoe of Winchester, Kentucky. \"I feel like he has a fresh vision
 and a fresh approach to the problems.\" Angela Nuzzi, a student at the nearby University of Central Florida, says she admires Mr Carson's willingness to persevere in the face of Mr Trump's criticism. \"His whole demeanour is so different than Trump's,\" she says. \"I think the soft-spokenness brings you in, and you just see he has all these ideas that are just genius.\" Earlier in the day Mr Carson's business manager said that his
 candidate admired Mr Trump and was praying for him - a sentiment that several Carson backers echoed later in the day. \"We like Donald Trump, but you can't pull back from that [criticism of Carson],\" says Annie Otto, a Wildwood, Florida, resident who has organised the group Grannies for Carson. \"I'm disappointed, but I do believe in the American people's common sense.\""}

news_6 = { title: "Bear Killed After Escape From Russia Shopping Mall", content_type: "video", completion_time: 2, link: "https://www.youtube.com/v/PM7h5Ptun28", like_count: 0 }


news_list = [news_1, news_2, news_3, news_4, news_5, news_6]


# TECH ACTIVITIES
tech_1 = { title: "5 Mind Blowing Facts About Your Smartphone!", completion_time: 10, link: "https://www.youtube.com/v/3MYhhO_nSAk", content_type: "video", like_count: 0 }

tech_2 = { title: "Nexus 6P Review!", completion_time: 14, link: "https://www.youtube.com/v/Xc5fFvp8le4", content_type: "video"}

tech_3 = { title: "Apple's first Singapore store will be powered entirely by renewable energy", completion_time: 3, link: "http://www.cnet.com/news/apples-first-singapore-store-will-be-powered-entirely-by-renewable-energy/", content_type: "text", content: "Apple wants to end its dependence on fossil fuel for all of its global facilities and the upcoming store in the city-state of Singapore will be one of the first in the world to be powered entirely by solar energy. The Cupertino consumer
 electronics giant has partnered with Singapore's largest clean energy provider, Sunseap Group, who will provide power to Apple's 2,5000-person corporate campus and retail store. Energy will be obtained from solar panels laid on the rooftops of 800 buildings. \"We're thrilled to be working with Sunseap and the government of Singapore to pioneer new ways to bring solar energy to the country and bring Apple even closer to our goal
 of powering our facilities around the world with 100 percent renewable energy,\" said Lisa Jackson, Apple's vice president of environment, policy and social initiatives in a statement provided to CNET. The deal follows a recent announcement of two clean energy projects in China. The first involved building 200 megawatts of solar projects to offset the energy used in Apple's supply chain, while a second project consisted of working
 with its manufacturing partners to install more than 2 gigawatts of clean energy production over two years. In Singapore, Apple expects that this deal will generate 50 megawatts of energy, enough for 9,000 homes, though Apple will use 33 megawatts of the energy for its campus and upcoming store. The announcement also confirmed rumors that the company would finally open a retail store in Singapore. The island-state has long been in
 list of day one product launches alongside bigger markets such as the US, Hong Kong and Japan, but has never had an Apple Store. Instead, Apple relies on local distributors, Apple Premium Resellers, for retail and servicing to its customer base in Singapore. The upcoming retail store will likely see Apple placing a larger focus on the Singapore market, which currently also serves as a shopping hub for more devoted fanbase in the
 region, who often travel down to the island-state during product launches to get their hands on Apple devices such as the iPhone 6 Plus. The expected location of its upcoming store will be at the heart of Singapore's shopping district on Orchard Road, where it will be taking over 15,000 square feet of space. The company has also posted job listings for Apple Geniuses and other retail positions."}

tech_4 = { title: "Should you buy the iPhone 6s or iPad Pro?", completion_time: 8, link: "https://www.youtube.com/v/g6ZfghiG70M", content_type: "video"}

tech_5 = { title: "How Much Technology Is Too Much Technology?", completion_time: 15, link: "http://techcrunch.com/2015/11/15/how-much-technology-is-too-much-technology/", content_type: "text", content: "There are many visions of what our hyper-connected future might look like. We’re packaged countless variants on the shiny-techie-future vision theme every day as marketing departments lay it on thick to try to put gloss on their latest
 product and restless grease on the wheels of consumption. Thing is, these tales of shiny futures are not really that interesting. Given they are artless fictions. What’s far more interesting is how technology is being applied in the here and now — and how it’s already interacting with and impacting social structures. And if you look at those tell-tale signs then sure it’s possible to extrapolate some possible futures — some of which
 really aren’t very pretty at all. Technology replacing humans is one recurrent theme. We can argue about how many jobs are being destroyed by technology. But that’s sort of missing the point. Given that technology is a tool that people can apply in various ways, the number and type of human jobs that get replaced will, at the end of the day, be determined by us, not by the technology. Or, more likely, by the companies that apply technology
 at scale. Look, for example, at supermarkets and big box retailers replacing multiple (human) check out operators with ranks of self-service machines — with perhaps one solitary human overseer standing silently off to the side. Or Uber recruiting an entire university robotics department to try to accelerate the development of driverless cars. Because robots can’t protest a dwindling revenue share. Because robots don’t get a revenue share.
 But who wants to live in a future where every physical shop (if indeed there are any in such a technology-maximized scenario) is a self-service warehouse where the atoms in the drear air stir only to synthesized thank-yous spat from money-harvesting machines, suffixed by the rustle of a departing plastic bag — attached to another silent human. Sure, if all you think about are profit margins you won’t find any value in the seasonal
 tapestry of face-to-face human communication. Or the variable elbow grease of human labour. You’ll seek to edit it out as an unpredictable inefficiency. But what happens to society when we trade a person for a button press? Or a human being for a delivery drone? What happens when we start to view every interaction as merely a quantifiable string of dollar signs — allowing ‘less human’ to mean the same as ‘lower cost’? We as individuals
 — and as a society — are also reduced. Reduced in character, colour, culture, communication, cohesion. There’s no shortage of collateral damage if you extrapolate a tech-fueled future that thinks only of maximizing profit margins. So why can we so easily glimpse that possible future? Indeed, why do we keep sketching such dystopic scenarios? Why do we seem convinced technology has to capture and control and do everything — as if we humans
 are powerless to choose how to use our own tools? As better minds than mine have pointed out, humans are, at base, social creatures, yet we are prone to falling for trivial tricks that would sell us a substitute for the social connection we generally crave. Emollient services that proffer a tech-sanitized workaround for our raw, emotionally fretted edges. So sure it’s not always companies hammering the shiny technology wedge between
 genuine human interactions. Undoubtedly, we do this to ourselves too. Albeit companies know our weaknesses, and seek to exploit them. They always have. Technology just makes that kind of exploitation insanely scaleable. Perhaps mass surveillance — a tech-powered dystopia we are living through right here, right now — is not just a massive trampling of our human rights, but also a giant red flag reminding humanity of the importance of
 moderating our consumptive impulses. Because as well as being social creatures, we are all-too-easy addicts. We can’t get enough of a good thing. We don’t always know when to stop. Sometimes we need to make ourselves really, really sick before we can be compelled to change our ways. If we learn there’s a button we can push to get a treat, we’ll push it and push it and push it. And keep pushing it. Our present tense world-view can be
 made to shrink to fit a button press. Or a social network. Point is, a little technology is amazing. But all technology, all the time is dystopia. And strutting and fretting our entire lives digitally is a reduction of the rich possibilities of life beyond the algorithm. Even as the increasingly comprehensive digital footprints we generate are also, clearly, a way too tempting repository for governments and companies to ignore — and
 so they do the opposite: lift, store and manipulate the substance of our digital lives at will. Maybe the appropriate response to being systematically dehumanized by vast technology-powered data-harvesting infrastructures is to act a little more human, be a little less tech obsessed. You know — buy a book from a second-hand bookshop. Pay with cash. Walk down an unfamiliar street. Order a drink in a place you didn’t find beforehand
 on Foursquare. Talk to a stranger you didn’t match with on Tinder. Leave your phone in your pocket — or better still, at home. Unfold a piece of paper and breathe. Virtual reality? It can never be a fraction as fascinating as real, lived, actual reality where chaotic possibility is threaded through every undesigned moment — if only you take the time to lift your eyes off the screen and look around you. And sure, the Googles Alphabets
 and Amazons will promise to ‘engineer serendipity’. Or say they can transmute our collective behaviors into a predictive extrapolation they’ll claim resembles telepathy — in a bid to deliver you the thing you’re after before you even thought to want it. Of course they will. Because they really want to be able to do this. It’s the holy grail of commerce. If they can digitally steer or synthesize a proto human intention before it’s
 become a fully formed thought chain-linked to a guaranteed transaction they get to win the money-makers’ neverending jackpot and laugh all the way to the bank — until the very last neon light winks out in the Nevada desert. More realistically the giant data miners of our lives will make algorithms that segment collective human behavior into generalized buckets and apply these stencils over individuals, blurring our detail in the process.
 Because you can’t abstract infinite variety. You can’t contain multitudes. You can’t synthesize all the shifting shades that will ever be perceived. And so the strategy of control attempts to use ubiquitous technology to disrupt our attention so we forget to think for ourselves. Undesigned existence is the real magic. And ‘engineered serendipity’ is both an oxymoron and a dictatorship of the dreary; a notion created by a confederation of
 bottom line bores who have somehow attained far more social control than their pedestrian focus on profit margins should ever have afforded them. If all you’re allowed to be or do or know is what’s predetermined by aggregated behavioral patterns parsed by algorithms you might as well be living in a medieval monastery — just without the vaulted ceiling of mystery that exalted such a prior pre-defined existence. Remember: the algorithm is
 not God. It’s never been omniscient, and it never will be. The algorithm is just a tool for optimization. And most of the time it’s the slave of commerce. Sure, you can think of technology as a lidless eye — given how it tends to watch and record what we do. But ceaseless surveillance is not a synonym for supernatural. It’s technology applied to constrain and reduce; to turn the creative chaos of possibility into a predictable pipeline
 that can be controlled or monetized. If you think that sounds like magic you probably need to recalibrate your inner lens. So really, as we use and shape technology tools and services, we the people making the tech and buying the tech and living with the tech need to sharpen our focus on what’s really important. And what’s really true. A ‘shiny, hyper-connected future’ is meaningless if we don’t actually want to live in it. If we as
 individuals threaded within the fabric of society end up feeling less connected to each other, more dehumanized by the tools we use then why are we buying into the marketing fiction? What’s in it for us? What’s in it for society as a cohesive whole? The fiction of the shiny sci-fi future is repackaged and sold to us again and again to try to herd us towards some near term commercial goal. But what’s the actual, lived reality of these
 marketing fictions? Fewer human jobs and more ephemeral employment that rebrands social precariousness as ‘choice’ and ‘flexibility’? Fewer actual human interactions and more synthesized, packaged substitutes that feed off the sense of isolation and dissatisfaction their (over)use cultivates? Does that sound like a fair trade? In exchange for granting a free pass to an army of digital middlemen to mediate more and more aspects of our
 lives via their shiny layers we get what — mild diversion and marginal convenience? Cat GIFs on Facebook and pizza dropping from the sky at the push of a drone-summoning button? Are we really so easily infantalized? Can our inner lives be so cheaply bought? Thing is, it doesn’t have to be technology or people. It’s possible to imagine a future where technology works FOR people. Where unchecked software is not eating the world but is
 applied selectively, by societies, as a tool to help tighten and reinforce the jointed scaffolding of real-world communities. To help build actual connections, not devalue real-world social structures to try to replace them with mediated digital alternatives. But that means recognizing when it’s necessary to moderate the trajectory of a platform, say, or shape algorithmic applications with people-focused regulation to ensure valuable
 social structures aren’t ripped out or ripped apart by the indifferent interests of corporate accountancy. And — as individual users of technology — recognizing when it’s time to leave your phone alone for a bit and talk to the people around you. If we can find the right balance between technology and society, it’s possible to imagine many good things being created by humans using ever more sophisticated tools. But achieving that balance
 requires continuous sweating toil to define society’s red lines — and the discipline not to be distracted or swayed by the superficial sheen of shiny things. Hard work for sure, but the kind of socially engaged activity that yields genuinely satisfying rewards — and benefits the many, not the few."}

tech_6 = { title: "The Best Tech Under $50 - November 2015", completion_time: 1, link: "https://www.youtube.com/v/Gb8VJwT3OdU", content_type: "video"}

tech_list = [tech_1, tech_2, tech_3, tech_4, tech_5, tech_6]


# SCIENCE ACTIVITIES
science_1 = { title: "10 Cool Science Experiments Compilation #9", completion_time: 5, link: "https://www.youtube.com/v/TDMXs2hJv28", content_type: "video" }


science_2 = { title: "10 Amazing Science Tricks Using Liquid!", completion_time: 7, link: "https://www.youtube.com/v/HQx5Be9g16U", content_type: "video", like_count: 0 }


science_3 = { title: "No, Mount St. Helens Doesn’t Have New Magma Chambers", completion_time: 8, link: "http://www.wired.com/2015/11/no-mount-st-helens-doesnt-have-new-magma-chambers/", content_type: "text", content: "You may have noticed a lot of rumbling in the science media over the past week over a study presented at last week’s Geological Society of America meeting concerning the state of things underneath Mount St. Helens. Many of
 those articles declared that “new magma chambers were discovered under St. Helens!” and “magma is on the move!” and “the volcano may erupt again!“—all of it said breathlessly and based on a brief talk (we’re talking less than 15 minutes) at the meeting. Well, as with most of these types of things, there is a lot less to it than it seems and no, it doesn’t change the chances of a new Mount St. Helens eruption. All of this static comes
 from the iMUSH study at the Washington volcano. Geologists are examining the structure of the crust under St. Helens to try to image—using seismic waves from distant earthquakes, man-made vibrations, and magnetic surveys—the elusive magma body underneath the volcano. The presentation at GSA included some of their preliminary findings (in full disclosure, I did not see it, but rather read the abstract and tried to make sense of the news)—namely
 that, yes, under St. Helens and the region around it in the Cascades, there are parts of the crust that contain more “melt” (magma) than others and the melt appears to follow pathways to the volcanic centers like St. Helens or Mount Adams. Now, why would the magma under an active volcano be elusive? That’s because magma is not stored under a volcano like St. Helens as a vast, roiling cauldron of 100 percent liquid magma. Recent studies looking
 at other Cascade volcanoes like Lassen Peak (full disclosure: my study) and compilations of data from arc volcanoes around the world (the same group St. Helens belongs to) have found that during most of the life of a volcano, the magma is stored not as a liquid but rather a mix of some molten material and lots of crystals—what we like to call a “crystal mush.” This might be upwards of 60 to 70 percent crystals, a space where the magma
 doesn’t behave like a liquid anymore because of the network created by all those crystals. The magma is not able to erupt in that state (under most circumstances). Instead it needs a jolt in the form of new magma entering the “mush” to heat it back up, melt the crystals and get it to the point that it starts to behave like a liquid again. You might imagine this is somewhat like a jar of honey that has started to crystallize. You won’t be
 able to get it to come out of the container until you heat it back up, dissolve those honey crystals and let the honey get warm and gooey again. So, even at volcanoes like St. Helens that have erupted recently, there are rarely the clear, tell-tale signs of reservoirs of magma. The iMUSH project is carefully surveying the area to try to see those zones of crystal mush and partially molten crust that lie underneath. Then why all the media
 noise? On the surface, it may seem shocking that deep magma bodies in the crust might feed St. Helens and its close neighbors, but that is exactly what we would expect based on our current petrologic models of the crust in continental arcs like the Cascades. Our models put magma being stored in the shallow crust only a few kilometers below St. Helens, then in the middle crust somewhere, maybe 10 to 15 kilometers down and then at the base
 of the crust up to 40 kilometers down. These zones are connected by conduits that bring magma upwards. This model is built from geochemical evidence from the lava erupted at arc volcanoes and the cruder seismic data we have about the location of earthquakes, mainly generated by magma rising from the bottom of the crust to the surface. The magma under St. Helens is generated as the mantle over 100 kilometers beneath the volcano melts. This
 magma is hot and buoyant, so it rises until it hits the bottom of the North American continental crust, where the lower density of the crust causes the magma to no longer be buoyant. Instead, it sits in a MASH zone (defined in the seminal paper by Hildreth and Moorbath). MASH stands for “Melting Assimilation Storage and Homogenization”, where magma that is stalled melts the continental crust, assimilates it (mixes with the melted crust)
 and then is stored and homogenized. This creates a less dense magma that then continues its trip towards the surface. It might stop along the way to form ephemeral magma bodies or crystal mush—and we seen the evidence for this in plutons (magma that solidified underground) that have been exposed at the surface, like in the Sierra Nevada. So, what we might expect to see when we can examine the crust in detail is multiple places where the
 crust as more magma—the MASH zone, the stalling points, the crystal mush under the volcano with smaller conduits that feed the next level … and this is almost exactly what we see from the iMUSH study at St. Helens. We haven’t added new bodies of magma, we haven’t increased the likelihood of another eruption, we just understand the architecture of the crust better now. There isn’t even full agreement on what the data might mean—some of what
 is being interpreted as “partially melted” crust may actually be metamorphosed sediment. Seismic data is highly interpretative, so trying to deduce exactly what it is might be akin to trying to groping into a bag and trying to figure out everything in it without seeing anything. The most fascinating thing about the iMUSH study is the identification of the potential magma stalling point in the middle of the crust (~10-14 kilometers down) that
 feeds both St. Helens and Mount Adams. Right now, it seems that examining the similarities and differences in the lava erupted from both volcanoes, especially during periods when they were both erupting, could give us a lot of information about what happens to magma as they make their last push to the surface. Mount St. Helens will erupt again, that there is no doubt. The iMUSH study helps us better understand the depths where magma is stored,
 so when we start seeing earthquakes increase under the volcano, we can be more confident that it is being caused by magma on the move. We know more, but that doesn’t mean that we’re any closer to disaster." }

science_4 = { title: "Undersea Internet Cables Are Surprisingly Vulnerable", completion_time: 7, link: "http://www.wired.com/2015/10/undersea-cable-maps/#slide-2", content_type: "text", content: "So, the Russians are at it again, snooping around the undersea communications cables that connect the continents. These fiber optic cables carry 99 percent of all transoceanic digital communication—phone calls, emails, web pages, you name it.
 They’re the reason you can Skype your colleague in Sydney or text with your friend in Mumbai. They’re essential infrastructure for the global economy. It’s no wonder, as The New York Times reported this week, that US military officials are not at all comfortable with Russian subs and spy ships \"aggressively operating” in their vicinity. Despite the importance of this undersea network, most people never give it a thought until something
 goes wrong, or seems likely to. Nicole Starosielski wants to change that. Starosielski, a media scholar at New York University, spent six years traveling the globe to study the history of the cable network and the cultural, political, and environmental forces that have shaped it. Her work also highlights the vulnerability of this system. \"We usually think of the internet as distributed,” Starosielski says. Because of the built-in
 redundancies, an attack at a given point in the terrestrial network is unlikely to bring the whole thing down. Not so under the sea. \"I think people would be surprised to know that there are a little over 200 systems that carry all of the internet traffic across the ocean, and these are by and large concentrated in very few areas. The cables end up getting funneled through these narrow pressure points all around the globe.” Starosielski’s
 book The Undersea Network, published earlier this year, examines some of the reasons for this. They range from politics to undersea topography to seismic risks. A companion website lets you explore the Pacific cable network with interactive maps, histories of the various cables, and photos of the sometimes spooky, sometimes mundane places where they come ashore. The first transoceanic cable, a copper telegraph wire, was laid across the
 Atlantic in 1866. The cables put down in the following decades followed colonial era shipping routes, and many modern cables follow these same old routes. In the 1950s, coaxial cable, capable of carrying telephone conversations became the standard. Then, in the 1990s, these analog cables were edged into obsolescence by fiber optic cables able to carry huge amounts of digital data in the form of light. (If you’re even remotely curious
 about how these cables work and how they get laid on the ocean floor, check out Neal Stephenson’s epic 1996 WIRED article about one global networks.) The undersea cables have been the subject of international intrigue before. Back in 1959 the Times reported that the US Navy boarded and searched a Russian fishing trawler off Newfoundland on suspicions that it had tampered with cables. (The boarding party found no incriminating evidence).
 Not that the Russians were the only ones interested in the cables. In the 1970s, the US Navy deployed divers from submarines to tap secret Soviet military communications cables, an effort known as Operation Ivy Bells. But it doesn’t take a navy to mess with the cables, which these days are roughly the diameter of a garden hose. \"They have to wind these things up and throw them in the back of boats, so they have to be as light as possible,\"
 Starosielski explains. A 2006 earthquake severed cables and disrupted internet access in Taiwan. In 2007, scrap metal salvagers pulled up parts of two fiber optic cables off Vietnam, disrupting internet service there for several months. Sharks, apparently, are also a threat. By far the most common problems, however—accounting for about 60 percent of cut cable incidents—are dropped anchors and fishing nets, Starosielski says. For that reason,
 the cables are clearly marked by pink squiggly lines on navigational charts, and, on the water, signs warning boaters not to drop anchor. The flip side of all these warnings is a potential tip off to would-be saboteurs. Cable sabotage was common during both World Wars, but Starosielski says she knows of no recent incidents. That doesn’t mean it couldn’t happen, though. It would be relatively easy to cut a cable near shore, but such damage
 would also be easy to find and repair. The Times article raises a greater concern: the possibility of cuts made to deep-lying cables in remote parts of the ocean. In her book, Starosielski notes that the strategy for safeguarding undersea cables has been described as \"security through obscurity.\" Nobody gave much thought to the cables, and that was enough to protect them. In the future, it might not be." }


science_5 = { title: "The Brightest Part of a Shadow is in the Middle", completion_time: 8, link: "https://www.youtube.com/v/y9c8oZ49pFc", content_type: "video"}

science_list = [science_1, science_2, science_3, science_4, science_5]


# combine activity lists
activity_list_science = Activity.create(science_list)
activity_list_tech = Activity.create(tech_list)
activity_list_news = Activity.create(news_list)
activity_list_fitness = Activity.create(fitness_list)


# SET UP CUSTOMACTIVITIES
# template: template: { title: "", completion_time: 0, content: "" }

# USER_1 CUSTOMACTIVITIES
user1_activity_1 = { title: "MCAT Flashcards", completion_time: 15, content: "Insert MCAT flashcards here!" }
user1_activity_2 = { title: "Pushups", completion_time: 5, content: "Do some pushups until failure" }
user1_activity_3 = { title: "Read About The Higgs Boson", completion_time: 30, content: "Do research for thesis." }
user1_activity_4 = { title: "Practice on DuoLingo", completion_time: 20, content: "Brush up on some basic Spanish" }
user1_activity_5 = { title: "Type up class notes", completion_time: 15, content: "CS169, EE122 Notes to do" }
user1_custom_activities = CustomActivity.create([user1_activity_1, user1_activity_2, user1_activity_3, user1_activity_4, user1_activity_5])

# USER_2 CUSTOMACTIVITIES
user2_activity_1 = { title: "Bio Readings", completion_time: 35, content: "Chapters 2.3 and 2.7" }
user2_activity_2 = { title: "Bake some cookies", completion_time: 60, content: "Master the recipe" }
user2_activity_3 = { title: "Call Grandma", completion_time: 10, content: "Just do it!!!" }
user2_activity_4 = { title: "Study for CS interviews", completion_time: 37, content: "Read cracking the code" }
user2_activity_5 = { title: "Run a mile", completion_time: 10, content: "You better do it faster than 10 minutes" }
user2_custom_activities = CustomActivity.create([user2_activity_1, user2_activity_2, user2_activity_3, user2_activity_4, user2_activity_5])

# combine the custom_activity lists
custom_activities = user1_custom_activities + user2_custom_activities


# SET UP ASSOCIATIONS
# Give Interests to user_1
user1_interests.each do |interest|
  user_1.interests << interest
end

# Give Interests to user_2
user2_interests.each do |interest|
  user_2.interests << interest
end

# Give CustomActivities to user_1
user1_custom_activities.each do |custom_activity|
  user_1.custom_activities << custom_activity
end

# Give CustomActivities to user_2
user2_custom_activities.each do |custom_activity|
  user_2.custom_activities << custom_activity
end

# Give fitness Interests to fitness Activities
activity_list_fitness.each do |fitness_activity|
  fitness_activity.interests << fitness_interest
end

# Give technology Interests to technology Activities
activity_list_tech.each do |technology_activity|
  technology_activity.interests << technology_interest
end

# Give news Interests to news Activities
activity_list_news.each do |news_activity|
  news_activity.interests << news_interest
end

# Give science Interests to science Activities
activity_list_science.each do |science_activity|
  science_activity.interests << science_interest
end

# Give an Activity multiple interests
activity_list_tech[0].interests << news_interest
activity_list_tech[0].interests << science_interest

# Populate the databse via external APIs
Activity.populate_database_with_news() # add news articles to the database
Activity.populate_database_with_videos()

# Populate the database with food-based activities
food_1 = Activity.create({ title: "Recipe: Butternut Squash and Cranberry Muffins", content_type: "text", completion_time: 40, link: "http://allrecipes.com/recipe/239607/butternut-squash-and-cranberry-muffins/", content: "\"I got some butternut squash and cranberries (both I am not fond of) in my 'Bountiful Basket' last week. Not having a clue what to do with them, I came up with this surprisingly yummy muffin. I made up this recipe with what I had on hand. It is really very light, tasty, and not too sweet. I serve mine with honey or sweetened cream cheese. If possible, always choose organic.\"" })
food_2 = Activity.create({ title: "Recipe: Fluffy French Toast", content_type: "text", completion_time: 30, link: "http://allrecipes.com/recipe/16895/fluffy-french-toast/", content: "\"This French toast recipe is different because it uses flour. I have given it to some friends and they've all liked it better than the French toast they usually make!\"" })
food_3 = Activity.create({ title: "Recipe: Salsa Chicken", content_type: "text", completion_time: 45, link: "http://allrecipes.com/recipe/16700/salsa-chicken/", content: "\"Someone gave me this recipe a few years back and it's become a household favorite. You can use mild, medium or hot salsa depending on your taste. I usually serve it with Spanish rice and Mexican-style canned corn. Very easy and quick!\"" })
food_4 = Activity.create({ title: "Recipe: Easy Quiche", content_type: "text", completion_time: 60, link: "http://allrecipes.com/recipe/23389/easy-quiche/", content: "\"This is an easy mix-it-up-in-one-bowl-and-cook recipe. I make it for every brunch I attend. You may substitute chopped spinach for the broccoli if you wish.\"" })
food_5 = Activity.create({ title: "Recipe: Lime Chicken Soft Tacos", content_type: "text", completion_time: 50, link: "http://allrecipes.com/recipe/25371/lime-chicken-soft-tacos/", content: "\"I was given this recipe by my mom when I went away to college, and it has become all of my friends' favorite!\"" })
food_6 = Activity.create({ title: "Recipe: Marinated Grilled Shrimp", content_type: "text", completion_time: 55, link: "http://allrecipes.com/recipe/21694/marinated-grilled-shrimp/", content: "\"A very simple and easy marinade that makes your shrimp so yummy you don't even need cocktail sauce! Don't let the cayenne pepper scare you, you don't even taste it. My 2 and 4 year-olds love it and eat more shrimp than their parents! It is also a big hit with company, and easy to prepare. I make this with frozen or fresh shrimp and use my indoor electric grill if the weather is not good for outside grilling. Try it with a salad, baked potato, and garlic bread. You will not be disappointed!!!\"" })
food_7 = Activity.create({ title: "Recipe: Easy Tuna Casserole", content_type: "text", completion_time: 45, link: "http://allrecipes.com/recipe/18871/easy-tuna-casserole/", content: "\"Tuna, macaroni, creamy soup, cheese and fried onions are all you need to make this super easy tuna casserole that I learned from my roommate. It's great as leftovers, too.\"" })
food_8 = Activity.create({ title: "Recipe: Simple Hamburger Stroganoff", content_type: "text", completion_time: 30, link: "http://allrecipes.com/recipe/23260/simple-hamburger-stroganoff/", content: "\"I've always loved the taste of a good Stroganoff, but I hated the expense and preparation of beef tips or steak or roast beef to make it. So I created my own creamy Stroganoff.\"" })
food_9 = Activity.create({ title: "Recipe: Taco Pie", content_type: "text", completion_time: 30, link: "http://allrecipes.com/recipe/17303/taco-pie/", content: "\"It's a quick, easy meal that is very filling. Some people will also top it with regular taco toppings, i.e. lettuce, tomatoes, black olives, etc. It also is great as leftovers for lunches! Serve with taco sauce.\"" })
food_10 = Activity.create({ title: "Recipe: Suki's Spinach and Feta Pasta", content_type: "text", completion_time: 40, link: "http://allrecipes.com/recipe/19591/sukis-spinach-and-feta-pasta/", content: "\"Spinach, tomatoes, and mushrooms mingle with tangy feta cheese in this quick and easy dish for a summer night or anytime.\"" })
food_11 = Activity.create({ title: "Recipe: Sausage Balls", content_type: "text", completion_time: 35, link: "http://allrecipes.com/recipe/21649/sausage-balls/", content: "\"These are so yummy! My family makes every Christmas morning. Enjoy!\"" })

food_1.interests << food_interest
food_2.interests << food_interest
food_3.interests << food_interest
food_4.interests << food_interest
food_5.interests << food_interest
food_6.interests << food_interest
food_7.interests << food_interest
food_8.interests << food_interest
food_9.interests << food_interest
food_10.interests << food_interest
food_11.interests << food_interest

# Populate the database with history-based activities
history_1 = Activity.create({ title: "US History Overview 1: Jamestown to the Civil War", content_type: "video", completion_time: 19, link: "https://www.youtube.com/v/ghgPq2wjQUQ", content: "" })
history_2 = Activity.create({ title: "Appomattox Court House and Lincoln's Assassination", content_type: "video", completion_time: 6, link: "https://www.youtube.com/v/Frpq_A7Ky_Q", content: "" })
history_3 = Activity.create({ title: "US History Overview 2 - Reconstruction to the Great Depression", content_type: "video", completion_time: 15, link: "https://www.youtube.com/v/zmBV87XA52Q", content: "" })
history_4 = Activity.create({ title: "US History Overview 3 - WWII to Vietnam", content_type: "video", completion_time: 15, link: "https://www.youtube.com/v/j2eKaxU-8kA", content: "" })
history_5 = Activity.create({ title: "Communism", content_type: "video", completion_time: 16, link: "https://www.youtube.com/v/MmRgMAZyYN0", content: "" })
history_6 = Activity.create({ title: "Korean War Overview", content_type: "video", completion_time: 17, link: "https://www.youtube.com/v/MEGyRgYJKEY", content: "" })
history_7 = Activity.create({ title: "Bay of Pigs Invasion", content_type: "video", completion_time: 14, link: "https://www.youtube.com/v/XmkbAduMD_E", content: "" })
history_8 = Activity.create({ title: "Cuban Missile Crisis", content_type: "video", completion_time: 19, link: "https://www.youtube.com/v/VO40SpSBjbc", content: "" })
history_9 = Activity.create({ title: "Vietnam War", content_type: "video", completion_time: 18, link: "https://www.youtube.com/v/9e9GWdT2pEQ", content: "" })
history_10 = Activity.create({ title: "Pattern of US Cold War Interventions", content_type: "video", completion_time: 10, link: "https://www.youtube.com/v/aNkrawaaiZQ", content: "" })

history_1.interests << history_interest
history_2.interests << history_interest
history_3.interests << history_interest
history_4.interests << history_interest
history_5.interests << history_interest
history_6.interests << history_interest
history_7.interests << history_interest
history_8.interests << history_interest
history_9.interests << history_interest
history_10.interests << history_interest

# Populate the database with fun facts
fun_fact_1 = Activity.create({title: "Fun Fact #1", content_type: "text", completion_time: 1, link: "N/A", content: "It's impossible to sneeze with your eyes open!"})
fun_fact_2 = Activity.create({title: "Fun Fact #2", content_type: "text", completion_time: 1, link: "N/A", content: "On average, vending machines kill more people annually than sharks (13 vs 5)."})
fun_fact_3 = Activity.create({title: "Fun Fact #3", content_type: "text", completion_time: 1, link: "N/A", content: "Antarctica is technically classified as a desert because it receives less than 2 inches of rainfall per year."})
fun_fact_4 = Activity.create({title: "Fun Fact #4", content_type: "text", completion_time: 1, link: "N/A", content: "The first movie released by Disney was Snow White and the Seven Dwarfs in 1947."})
fun_fact_5 = Activity.create({title: "Fun Fact #5", content_type: "text", completion_time: 1, link: "N/A", content: "The first woman to be elected to Congress was Jeannette Rankin of Montana in 1916."})
fun_fact_6 = Activity.create({title: "Fun Fact #6", content_type: "text", completion_time: 1, link: "N/A", content: "The S in Ulysses S Grant doesn't stand for anything and was in fact a mistake by the congressman who appointed Grant."})
fun_fact_7 = Activity.create({title: "Fun Fact #7", content_type: "text", completion_time: 1, link: "N/A", content: "It is possible to see Russia from Alaska; the closest islands are 2.5 miles apart."})
fun_fact_8 = Activity.create({title: "Fun Fact #8", content_type: "text", completion_time: 1, link: "N/A", content: "Contrary to popular belief, the correct word for the plural of octopus is octopuses, not octopi."})
fun_fact_9 = Activity.create({title: "Fun Fact #9", content_type: "text", completion_time: 1, link: "N/A", content: "Woodrow Wilson is the only U.S. President in history to hold a Ph.D.; he also served as President of Princeton from 1902 to 1910."})
fun_fact_10 = Activity.create({title: "Fun Fact #10", content_type: "text", completion_time: 1, link: "N/A", content: "The only vegetable or fruit never sold frozen, canned, processed, cooked, or in any form but fresh is lettuce."})

fun_fact_1.interests <<  fun_facts_interest
fun_fact_2.interests <<  fun_facts_interest
fun_fact_3.interests <<  fun_facts_interest
fun_fact_4.interests <<  fun_facts_interest
fun_fact_5.interests <<  fun_facts_interest
fun_fact_6.interests <<  fun_facts_interest
fun_fact_7.interests <<  fun_facts_interest
fun_fact_8.interests <<  fun_facts_interest
fun_fact_9.interests <<  fun_facts_interest
fun_fact_10.interests << fun_facts_interest

# Populate the database with health-based activities
health_1 = Activity.create({ title: "Flow through the Heart", content_type: "video", completion_time: 8, link: "https://www.youtube.com/v/7XaftdE_h60", content: "" })
health_2 = Activity.create({ title: "Lub Dub", content_type: "video", completion_time: 10, link: "https://www.youtube.com/v/-4kGMI-qQ3I", content: "" })
health_3 = Activity.create({ title: "Meet the heart!", content_type: "video", completion_time: 11, link: "https://www.youtube.com/v/Vi1JK6IYVt8", content: "" })
health_4 = Activity.create({ title: "Electrical System of the Heart", content_type: "video", completion_time: 10, link: "https://www.youtube.com/v/7K2icszdxQc", content: "" })
health_5 = Activity.create({ title: "Meet the Lungs", content_type: "video", completion_time: 10, link: "https://www.youtube.com/v/qGiPZf7njqY", content: "" })
health_6 = Activity.create({ title: "Basics of Metabolism", content_type: "video", completion_time: 12, link: "https://www.youtube.com/v/wQ1QGZ6gJ8w", content: "" })
health_7 = Activity.create({ title: "What's Inside of Blood?", content_type: "video", completion_time: 12, link: "https://www.youtube.com/v/5MOn8X-tyFw", content: "" })
health_8 = Activity.create({ title: "How do our kidneys work? (Renal Anatomy)", content_type: "video", completion_time: 8, link: "https://www.youtube.com/v/ctGkLYuUCvU", content: "" })
health_9 = Activity.create({ title: "Arteries vs. Veins - What's the Difference?", content_type: "video", completion_time: 12, link: "https://www.youtube.com/v/7b6LRebCgb4", content: "" })
health_10 = Activity.create({ title: "Digesting Food", content_type: "video", completion_time: 17, link: "https://www.youtube.com/v/v2V4zMx33Mc", content: "" })

health_1.interests << health_interest
health_2.interests << health_interest
health_3.interests << health_interest
health_4.interests << health_interest
health_5.interests << health_interest
health_6.interests << health_interest
health_7.interests << health_interest
health_8.interests << health_interest
health_9.interests << health_interest
health_10.interests << health_interest

# Populate the database with eli5-based activities
eli5_1 = Activity.create({ title: "ELI5: Why does it take 5 seconds for credit card companies to take money out of my account but 5 days to refund it?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3hu553/eli5_why_does_it_take_5_seconds_for_credit/", content: "" })
eli5_2 = Activity.create({ title: "ELI5: How is Orange Juice economically viable when it takes 10 oranges to have enough for a single glass of Orange Juice?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3iarsy/eli5_how_is_orange_juice_economically_viable_when/", content: "" })
eli5_3 = Activity.create({ title: "ELI5: What about Coca-Cola is so hard to replicate?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3hb0mo/eli5_what_about_cocacola_is_so_hard_to_replicate/", content: "" })
eli5_4 = Activity.create({ title: "ELI5: What does the TPP (Trans-Pacific Partnership) mean for me and what does it do?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3az0fa/eli5_what_does_the_tpp_transpacific_partnership/", content: "" })
eli5_5 = Activity.create({ title: "ELI5: What's the difference between an Ave, Rd, St, Ln, Dr, Way, Pl, Blvd etc?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/2me7l2/eli5_whats_the_difference_between_an_ave_rd_st_ln/", content: "" })
eli5_6 = Activity.create({ title: "ELI5: what exactly happens to your brain when you feel mentally exhausted?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3g1moj/eli5_what_exactly_happens_to_your_brain_when_you/", content: "" })
eli5_7 = Activity.create({ title: "ELI5: How can Roman bridges be still standing after 2000 years, but my 10 year old concrete driveway is cracking?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/362pru/eli5_how_can_roman_bridges_be_still_standing/", content: "" })
eli5_8 = Activity.create({ title: "ELI5: Why are humans so bad at growing teeth?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3g4z79/eli5_why_are_humans_so_bad_at_growing_teeth/", content: "" })
eli5_9 = Activity.create({ title: "ELI5: Why is Australia full of poisonous creatures, but New Zealand has surprisingly few of them?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3gg3cx/eli5_why_is_australia_chokefull_of_poisonous/", content: "" })
eli5_10 = Activity.create({ title: "ELI5: How could Germany lose 2 wars and become one of the wealthiest countries in 80 years?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/2mp3qh/eli5_how_could_germany_in_a_span_of_80_years/", content: "" })

eli5_1.interests << eli5_interest
eli5_2.interests << eli5_interest
eli5_3.interests << eli5_interest
eli5_4.interests << eli5_interest
eli5_5.interests << eli5_interest
eli5_6.interests << eli5_interest
eli5_7.interests << eli5_interest
eli5_8.interests << eli5_interest
eli5_9.interests << eli5_interest
eli5_10.interests << eli5_interest

