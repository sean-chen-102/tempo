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
fitness_1 = { title: "Why Weights Are Better Than Cardio for Fat Loss", content_type: "text", completion_time: 10, link: "http://www.bornfitness.com/weights-are-better-than-cardio-for-fat-loss/", content: "Have you heard that one joke where some fitness professionals insist that running makes you fat? In a world where diets sell you on the idea of eating cookies to lose weight, it’s hard to believe that exercise professionals could consider any activity or form of exercise “bad.”
 The majority of calories you burn in a day are not through activity, but instead through your resting metabolic rate (RMR). And yet, the anti-running crusade is not joke. There are those that genuinely believe lower intensity cardio is directly causing weight gain problems. This is what happens when weight loss frustration sets in and people are looking for a reason to explain why the scale goes the wrong direction 
 despite plenty of effort. After all, it becomes easier to understand if you slog away day after day doing cardio and don’t see changes. Naturally, something must be wrong. But that usually that has more to do with why your cardio approach isn’t working, than anything “wrong” with cardio. Running is not the reason you gain weight. But if you’re looking for the fastest way to see your body change, it’s not necessarily 
 the most efficient approach. There’s a big difference between “doesn’t work” and “doesn’t work as well.” Such is the case in the age-old debate between cardio and weight training. Cardio has many benefits, including many related to weight loss, but also supports your ATP production (think energy for your workouts), aids in recovery, and even can help you relax and sleep better (by shifting your sympathetic drive in
 your autonomic nervous system; translation: longer, slower cardio can help you chill out.) But if you’re trying to create the fastest path to dropping a few extra pounds, here’s why prioritizing weight training is important. Just for the sake of learning, remember, cardio is not bad. It just doesn’t burn fat as quickly. (Ok, let’s pass that around until we kill that myth.) In an ideal world, you’d combine metabolic
 and high intensity workouts (think moderate-to-heavy weights combined with short rest periods) with longer, slower, less intense bouts of cardiovascular activity. The short bouts of training would send your heart rate soaring, increase metabolic activity, and crush fat cells. The slower cardio would aid with recovery and make sure you don’t walk around exhausted, but would also improve your heart efficiency. Think
 about it, when you train you become exhausted. Most of the time you only think about how tired your muscles feel, and that’s part of the equation. The other part is your heart just not being able to push harder. When you perform slower, longer cardio, you actually are able to force more blood into your heart and expand the walls. This renovation means your heart can pump more blood and oxygen with each beat, making
 you much more efficient. Rather than becoming gassed as you push harder, you can do a better job of fighting off fatigue and maintaining a higher intensity. While it is easy to see why it’s ideal to perform both a mix of lower intensity cardio and weight training, the reality is most people are pressed for time and impatient. You want results as fast as possible with the least amount of work needed. Not to mention,
 you might not have time for the a little extra cardio. You can call it an excuse, but it’s also a reality for many people. So why build a training plan you might not be able to maintain? That’s why if you had to choose between weights and cardio, weights would be the more direct approach. The majority of calories you burn in a day are not through activity, but instead through your resting metabolic rate (RMR). For
 example, a 200-pound man might have an RMR of 1600 to 1900 calories, which is about 2-3 times the amount of calories burned in a typical workout. The point? Weight training is better at preserving your RMR by preserving lean body mass (LBM), which is a significant contributor to RMR, or the calories you burn in a 24-hour period independently of physical activity. Research has shown exactly why strength training does
 such a good job of being the top priority on fat loss plans. West Virginia University researchers used obese female subjects to assess LBM and RMR and compared 12 weeks of resistance versus aerobic training on LBM and RMR. Despite an 800 calorie liquid diet (mmm…delicious), the resistance-trained group had no significant LBM losses while the other group lost 4 kg of lean mass. Think about that for a moment. Eating 800
 calories per day is low enough that people would fear the dreaded “starvation effect.” And yet, that’s not what was found. [Note: this is not an endorsement to eat 800 liquid calories per day.] You, the resistance-trained group also lost significantly more body fat (around 2 kg) and the RMR increased by 4 percent. In comparison, the aerobic group experienced a 13.4 percent drop in RMR. The resistance group also had
 greater endurance capacity in the time-to-fatigue test. This study supports the idea that untrained obese subjects dieting severely will get across-the-board better benefits from strength training instead of aerobic training. But the benefits aren’t just limited to those that are overweight or obese. When considered your most direct path to fat loss, it’s understanding why these benefits were so pronounced. Strength
 training allows you to maintain a better muscle-to-fat ratio, which not only helps with the way you process food, but also ensures that the amount of calories you burn outside the gym are enough to support all the hard work you dedicate inside the gym."}

fitness_2 = {title: "The Best Protein Sources", content_type: "text", completion_time: 5, link: "http://www.bornfitness.com/the-best-protein-sources/", content: "Let’s state the obvious: protein is good for you. You need protein, whether it’s for building muscle, losing fat, staying full, or just maintaining your health. What’s not as settled is where you should get your protein and what are the best protein sources.
 And when you consider all the options, it’s easy to see why. From meat to vegetarian sources, powders to dairy, there’s a wide variety of options and plenty of difficulty understanding what you need, what is good, and if “too much” is really a danger. Protein supplementation should not be catered around absorption speeds, marketing promises, or the latest and greatest protein powder modification. While your own needs
 will be personal based on your body and goals, here’s how you can make the protein column on your shopping list a little easier to understand. The top sources of food protein are those that are high in protein while simultaneously lowest in fatty acids (kind of obvious). Meat rarely, if ever, has carbohydrate or alcohol content. These “lean meats” are fairly equivalent on a macronutrient basis to many protein powders,
 with roughly 100 calories per 20 to 25 grams of protein. Your typical lean meats include warm-water fish, white poultry meat, and red meat sources considered extra lean. (For reference, red meat and pork tend to have higher fat content.) Egg whites also qualify, and most protein powders fall into this category. Food sources of protein that also contain fatty acids are cold water fish (salmon as an example), most of the
 red meats, the dark meat of the poultry, and any of the lean category if you decided to cook it in oil. Whole eggs are similarly in this category as the yolk contains fatty acids. If a meat has breading on it, it is now covered in carbs. That is not inherently bad, but you should understand that no meat can be breaded and still be considered lean. Dairy products tend to never be as lean as the leanest meat products,
 although they are in a wide spectrum of fat content; checking the label or investigating nutritional information online would be prudent. As mentioned earlier, it seems that the best sources of protein on a caloric basis come from animals. In general, the food groups and their overall protein contents are in the order (greatest to least content on a caloric basis): meat and dairy products (lean), most vegetables,
 meat and dairy products (fatty), meat substitutes, fruits and harvest vegetables, most grains. Vegetables are in a weird position, as they tend to have roughly 3 to 4 grams of protein per 40 calories (which is 30-40% by caloric weight). It is unlikely that they will form a substantial amount of your dietary intake due to their filling nature, but they are indeed decent protein sources from a caloric perspective.
 Most root and harvest vegetables (pumpkin, squash, potatoes, etc.) are listed further down as they have a greatly increased amount of carbohydrates. Additionally, although some grains can indeed have a high protein content (such as quinoa), the majority of grains eaten in a standard diet tend to have a large degree of carbohydrates relative to protein; the focus on enhancing grains appears to be related to micronutrition
 and fiber, with minimal focus in increasing protein content. Supplement-wise, a rice/pea blend as well as both soy and hemp appear to be viable vegan protein sources. Soy food products are viable options, as are vegetables themselves if you can eat sufficient amounts of them. Some microalgae protein sources also exist, mostly chlorella and spirulina. Overall, the importance of a protein supplement is only important if
 you don’t consume enough protein your diet. Protein supplementation should be catered mostly around allergies, price range, flavor, and perhaps functional properties of the protein if pudding is desired. Protein supplementation should not be catered around absorption speeds, marketing promises, or the latest and greatest protein powder modification. Adding more amino acids tends to have the biggest impact when total
 protein intake is lower. Let’s say you only consume 50g of protein a day. It is a good idea to increase that to 75g by adding whey because of its cysteine content. However, if you’re a 180 pound male and you eat 100 grams per day, you don’t need to worry about consuming any specific protein, as even poor sources of one or another amino acid will add up. Because of these reasons, BCAA and EAA supplements also seem to
 have less of a role as supplements when protein intake from food and supplements is comparatively high; they have a much larger role when your diet is low in protein overall, especially low in complete proteins."}

fitness_3 = {title: "Scared to Eat Carbs? Here’s How to Enjoy Them (Healthfully)", content_type: "text", completion_time: 10, link: "https://blog.myfitnesspal.com/scared-to-eat-carbs-heres-how-to-enjoy-them-healthfully/", content: "When I first decided to stop dieting the single hardest thing for me to do was let myself eat carbs again. Bread, rice and potatoes had been banned from my list of skinny-friendly foods for
 over 5 years. And even though I only weighed about 5 lbs less than when I ate them regularly, I couldn’t help but think of carbs as impossibly fattening. Given my body image issues at the time, I think I would have preferred to eat something laced with anthrax. What is it about carbs that makes people act insane? Getting over my fear of carbs required several critical steps. The first big one was digging into the science
 and learning that the healthiest, longest lived humans on the planet eat intact grains, tubers and legumes regularly. I grudgingly had to accept that they were not subsisting on protein bars and Diet Coke like I was. The next big test was trying for myself. I slowly phased out processed “diet” foods and started teaching myself to cook vegetables and other Real Foods. I started eating fruit again. But the scariest part was
 letting myself eat things like oats, rice and breakfast cereal (still not the best choice, but it didn’t matter). To my surprise and delight I didn’t gain weight. This was a huge win, since it was the first time in my adult life I remember not being constantly hungry. Then, slowly, I started to lose weight. As I experienced success and felt my health flourish, I gained confidence that I was on the right track and became
 even more adventurous with my food experiments. I even allowed myself to eat things like bread and cake on occasion. Today, nearly 10 years later, I hardly ever think of the word “carbs” unless I see it in the news. I eat and love Real Foods. Sometimes they’re starchy. Sometimes they’re sweet. But they’re always delicious. I even eat foods that have been processed if it sounds tasty and appropriate for the setting. When
 I’m in Italy I eat pasta, in Paris I eat baguettes, in Napa I’ll eat pretty much anything because the food is so amazing. Believe it or not I haven’t gained weight, I don’t have diabetes, and the apocalypse didn’t come. In other words, I’ve learned to eat the formerly forbidden “carbs” like a sane person. Carbs don’t have to be your enemy. Anyone with a healthy metabolism can learn to live with them in peace with the right
 attitude. Here are some of the lessons I’ve learned along the way: 1. Don’t moralize your choices. Foods, even those that contain carbohydrates, are not all “good” or “bad.” Some may support health more than others, and some may remind you of your childhood summers at grandma’s house. There’s value in both and no need for feeling guilty or virtuous in either case. Drop the moralization and you can start to see your actions
 more objectively, which is half the battle. 2. Prioritize unrefined starches. I’ve come to accept that I don’t function well without some starchier foods in my life. Going completely carb-free gets me very hungry, making it harder to eat mindfully and more likely I’ll binge (meat binges are not pretty). It also makes my workouts suffer and makes it nearly impossible to eat in public without being that obnoxious person who
 has a problem with every single thing on the menu. At the same time I still prefer to eat unprocessed foods, which help me have more energy and look my best. I’ve found that when I eat small amounts of grains (e.g. oats, rice, farro, etc.) and legumes (e.g. beans, lentils) regularly, my cravings for bread and sweets completely disappear and I’m satisfied with less food. It also helps vary my meals so they’re less boring and
 generally makes life more delicious. Win-win-win. You may do better with more or less starchy foods in your personal healthstyle, but regardless of the quantity focusing on unrefined, intact starches should be your default. 3. Own your indulgences. When outside your normal habits—maybe it’s your birthday or you’re on vacation—you’ll occasionally have an opportunity to eat something that is made almost entirely of flour and/or
 sugar. Only you can decide what is or isn’t worth it for you. Now that I am totally in love with the Real Foods I eat every day, it’s easy for me to be really picky in this regard, which I’m thankful for. But even if Ben & Jerry’s ice cream cake still makes you swoon, that’s fine. What’s important is that if you decide to go for it, go for it. That doesn’t mean shoveling as much into your mouth hole as you can fit in a
 20-minute sitting. It means being honest with yourself about what a satisfying piece is for you—not too skimpy, not so big it’ll make you sick. It means putting it on a plate, finding a place to sit, putting a smile on your face, and enjoying the hell out of it. Because life should be awesome. 4. Don’t pretend processed carbs don’t matter. No one eats processed carbs because they’re healthy. You eat them because they’re
 delicious. Because there’s more to life than eating like a robot. Because you don’t know what the future will bring. Because one croissant won’t kill you. That doesn’t mean you can throw caution to the wind and eat like that every meal of every day. Your food choices have consequences, and the frequency and quantity of processed starches and sugars you eat is strongly predictive of your future health and body weight.
 Finding the balance between health and enjoyment gets much, much easier when you stop moralizing your food choices, pay attention to your body, and prioritize your own well-being. But it is still work you need to do for yourself, since everyone is different. Learning to enjoy delicious food without sacrificing your health requires mastering your own psychology and being realistic about what you really want, and what you
 can really do. 5. Don’t believe the hype. In recent years it feels like starchy foods have become even more controversial than meat. Every week new sensationalist headlines rekindle the battle between the low-carb and low-fat camps, providing next to zero actionable advice for average people. Just ignore it. The science is interesting to us geeks, but it tells you almost nothing about yourself as an individual. So don’t
 worry about it. Focus on eating real, unprocessed food most of the time and choose your indulgences based on what you love and what works to keep you feeling and looking your best. That’s all you really care about anyway, and it will help keep you sane."}

fitness_4 = {title: "", content_type: "text", completion_time: , link: "", content: ""}

fitness_5 = {title: "", content_type: "text", completion_time: , link: "", content: ""}

fitness_list = [fitness_1, fitness_2, fitness_3, fitness_4, fitness_5]


# NEWS ACTIVITIES
news_1 = { title: "Article: Online Attacks on Infrastructure Are Increasing at a Worrying Pace", content_type: "text", completion_time: 5, link: "http://bits.blogs.nytimes.com/2015/10/14/online-attacks-on-infrastructure-are-increasing-at-a-worrying-pace/", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


news_2 = {title: "Article: Ethiopia, a Nation of Farmers, Strains Under Severe Drought", content_type: "text", completion_time: 55, link: "http://www.nytimes.com/2015/10/19/world/africa/ethiopia-a-nation-of-farmers-strains-under-severe-drought.html", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


news_3 = {title: "Article: Guinea's President Is Re-elected" , content_type: "text", completion_time: 28, link: "http://www.nytimes.com/2015/10/18/world/africa/guineas-president-is-re-elected.html", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


news_4 = { title: "Migrants Diverted to Slovenia After Hungary Closes Border", content_type: "text", completion_time: 16, link: "http://www.nytimes.com/2015/10/18/world/europe/hungary-closes-border-changing-refugees-path.html", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


news_5 = { title: "QuizUp Will Be Developed Into an NBC Game Show", content_type: "text", completion_time: 8, link: "http://www.nytimes.com/2015/10/19/business/media/quizup-will-be-developed-into-an-nbc-game-show.html", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


news_6 = { title: "Bear Killed After Escape From Russia Shopping Mall", content_type: "video", completion_time: 2, link: "https://www.youtube.com/watch?v=PM7h5Ptun28", like_count: 0 }


news_list = [news_1, news_2, news_3, news_4, news_5, news_6]


# TECH ACTIVITIES
tech_1 = { title: "Bill Gates: Can online classrooms educate the developing world?", completion_time: 3, link: "http://www.theverge.com/2015/2/11/8016647/bill-gates-online-classes-education-the-big-future", content_type: "video", like_count: 0 }


tech_2 = { title: "A first look at the Google Play store redesign", completion_time: 1, link: "http://www.theverge.com/2015/10/16/9549121/google-play-redesign", content_type: "text", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


tech_3 = { title: "HAVANA'S HOTSPOTS: Cuba is coming online, but who will control its internet?", completion_time: 10, link: "http://www.theverge.com/2015/10/15/9534205/cuba-internet-access-google-huawei-government-censorship", content_type: "text", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


tech_4 = { title: "Golden State Warrior Harrison Barnes Talks Tech", completion_time: 8, link: "http://techcrunch.com/video/golden-state-warriors-harrison-barnes-talks-tech/519090478/", content_type: "video", like_count: 0 }


tech_5 = { title: "Tinder Owner Match Group Files To Go Public", completion_time: 8, link: "http://techcrunch.com/video/golden-state-warriors-harrison-barnes-talks-tech/519090478/", content_type: "video", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


tech_6 = { title: "Dropbox Announces Paper, A Google Docs Competitor", completion_time: 25, link: "http://techcrunch.com/2015/10/15/dropbox-announces-paper-a-google-docs-competitor/#.vxd9cs:iUbY", content_type: "text", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


tech_list = [tech_1, tech_2, tech_3, tech_4, tech_5, tech_6]


# SCIENCE ACTIVITIES
science_1 = { title: "10 Cool Science Experiments Compilation #9", completion_time: 5, link: "https://www.youtube.com/watch?v=TDMXs2hJv28", content_type: "video", like_count: 0 }


science_2 = { title: "These Huge Rats Can Sniff Out Land Mines", completion_time: 3, link: "http://video.nationalgeographic.com/video/news/151007-cambodia-rats-land-mines-sniff-vin?gc=%2Fvideo%2Fscience-space", content_type: "video", like_count: 0 }


science_3 = { title: "A Magical Answer to an 80-Year-Old Puzzle", completion_time: 20, link: "http://www.wired.com/2015/10/a-magical-answer-to-an-80-year-old-puzzle/", content_type: "text", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


science_4 = { title: "An Epidemic of Fear: How Panicked Parents Skipping Shots Endanger Us All", completion_time: 25, link: "http://www.wired.com/2009/10/ff_waronscience/", content_type: "text", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


science_5 = { title: "New solar phenomenon discovered: large-scale waves accompanied by particles emissions rich in helium-3", completion_time: 12, link: "http://thewatchers.adorraeli.com/2015/10/16/new-solar-phenomenon-discovered-large-scale-waves-accompanied-by-particles-emissions-rich-in-helium-3/", content_type: "text", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


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
history_1 = Activity.create({ title: "US History Overview 1: Jamestown to the Civil War", content_type: "video", completion_time: 19, link: "https://www.youtube.com/watch?v=ghgPq2wjQUQ", content: "" })
history_2 = Activity.create({ title: "Appomattox Court House and Lincoln's Assassination", content_type: "video", completion_time: 6, link: "https://www.youtube.com/watch?v=Frpq_A7Ky_Q", content: "" })
history_3 = Activity.create({ title: "US History Overview 2 - Reconstruction to the Great Depression", content_type: "video", completion_time: 15, link: "https://www.youtube.com/watch?v=zmBV87XA52Q", content: "" })
history_4 = Activity.create({ title: "US History Overview 3 - WWII to Vietnam", content_type: "video", completion_time: 15, link: "https://www.youtube.com/watch?v=j2eKaxU-8kA", content: "" })
history_5 = Activity.create({ title: "Communism", content_type: "video", completion_time: 16, link: "https://www.youtube.com/watch?v=MmRgMAZyYN0", content: "" })
history_6 = Activity.create({ title: "Korean War Overview", content_type: "video", completion_time: 17, link: "https://www.youtube.com/watch?v=MEGyRgYJKEY", content: "" })
history_7 = Activity.create({ title: "Bay of Pigs Invasion", content_type: "video", completion_time: 14, link: "https://www.youtube.com/watch?v=XmkbAduMD_E", content: "" })
history_8 = Activity.create({ title: "Cuban Missile Crisis", content_type: "video", completion_time: 19, link: "https://www.youtube.com/watch?v=VO40SpSBjbc", content: "" })
history_9 = Activity.create({ title: "Vietnam War", content_type: "video", completion_time: 18, link: "https://www.youtube.com/watch?v=9e9GWdT2pEQ", content: "" })
history_10 = Activity.create({ title: "Pattern of US Cold War Interventions", content_type: "video", completion_time: 10, link: "https://www.youtube.com/watch?v=aNkrawaaiZQ", content: "" })

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
health_1 = Activity.create({ title: "Flow through the Heart", content_type: "video", completion_time: 8, link: "https://www.youtube.com/watch?v=7XaftdE_h60", content: "" })
health_2 = Activity.create({ title: "Lub Dub", content_type: "video", completion_time: 10, link: "https://www.youtube.com/watch?v=-4kGMI-qQ3I", content: "" })
health_3 = Activity.create({ title: "Meet the heart!", content_type: "video", completion_time: 11, link: "https://www.youtube.com/watch?v=Vi1JK6IYVt8", content: "" })
health_4 = Activity.create({ title: "Electrical System of the Heart", content_type: "video", completion_time: 10, link: "https://www.youtube.com/watch?v=7K2icszdxQc", content: "" })
health_5 = Activity.create({ title: "Meet the Lungs", content_type: "video", completion_time: 10, link: "https://www.youtube.com/watch?v=qGiPZf7njqY", content: "" })
health_6 = Activity.create({ title: "Basics of Metabolism", content_type: "video", completion_time: 12, link: "https://www.youtube.com/watch?v=wQ1QGZ6gJ8w", content: "" })
health_7 = Activity.create({ title: "What's Inside of Blood?", content_type: "video", completion_time: 12, link: "https://www.youtube.com/watch?v=5MOn8X-tyFw", content: "" })
health_8 = Activity.create({ title: "How do our kidneys work? (Renal Anatomy)", content_type: "video", completion_time: 8, link: "https://www.youtube.com/watch?v=ctGkLYuUCvU", content: "" })
health_9 = Activity.create({ title: "Arteries vs. Veins - What's the Difference?", content_type: "video", completion_time: 12, link: "https://www.youtube.com/watch?v=7b6LRebCgb4", content: "" })
health_10 = Activity.create({ title: "Digesting Food", content_type: "video", completion_time: 17, link: "https://www.youtube.com/watch?v=v2V4zMx33Mc", content: "" })

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

