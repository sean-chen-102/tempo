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
fitness_1 = { title: "Why Weights Are Better Than Cardio for Fat Loss", content_type: "text", completion_time: 5, link: "http://www.bornfitness.com/weights-are-better-than-cardio-for-fat-loss/", content: "<p>Have you heard that one joke where some fitness professionals insist that running makes you fat?</p>
<p>In a world where diets sell you on the idea of eating cookies to lose weight, it&rsquo;s hard to believe that exercise professionals could consider any activity or form of exercise &ldquo;bad.&rdquo;</p>
<div class='twitter-quote'>
<div class='quote'>
<p>The majority of calories you burn in a day are not through activity, but instead through your resting metabolic rate (RMR).</p>
</div>
</div>
<p>And yet, the anti-running crusade is not joke. There are those that genuinely believe lower intensity cardio is directly causing weight gain problems.</p>
<p>This is what happens when weight loss frustration sets in and people are looking for a reason to explain why the scale goes the wrong direction despite plenty of effort.</p>
<p>After all, it becomes easier to understand if you slog away day after day doing cardio and don&rsquo;t see changes. Naturally, something must be wrong. But that usually that has more to do with why your cardio approach isn&rsquo;t working, than anything &ldquo;wrong&rdquo; with cardio.</p>
<p>Running is not the reason you gain weight. But if you&rsquo;re looking for the fastest way to see your body change, it&rsquo;s not necessarily the most efficient approach.</p>
<p>There&rsquo;s a big difference between &ldquo;doesn&rsquo;t work&rdquo; and &ldquo;doesn&rsquo;t work as well.&rdquo; Such is the case in the age-old debate between cardio and weight training.</p>
<p>Cardio has many benefits, including many related to weight loss, but also supports your ATP production (think energy for your workouts), aids in recovery, and even can help you relax and sleep better (by shifting your sympathetic drive in your autonomic nervous system; translation: longer, slower cardio can help you chill out.)</p>
<p>But if you&rsquo;re trying to create the fastest path to dropping a few extra pounds, here&rsquo;s why prioritizing weight training is important.</p>
<h2>The Argument for Cardio (And Why It Isn&rsquo;t For Everyone)</h2>
<p>Just for the sake of learning, remember, <em>cardio is not bad</em>. It just doesn&rsquo;t burn fat as quickly.</p>
<p>(Ok, let&rsquo;s pass that around until we kill that myth.)</p>
<p>In an ideal world, you&rsquo;d combine metabolic and high intensity workouts (think moderate-to-heavy weights combined with short rest periods) with longer, slower, less intense bouts of cardiovascular activity.</p>
<p>The short bouts of training would send your heart rate soaring, increase metabolic activity, and crush fat cells. The slower cardio would aid with recovery and make sure you don&rsquo;t walk around exhausted, but would also improve your heart efficiency.</p>
<p>Think about it, when you train you become exhausted. Most of the time you only think about how tired your muscles feel, and that&rsquo;s part of the equation. The other part is your heart just not being able to push harder.</p>
<p>When you perform slower, longer cardio, you actually are able to force more blood into your heart and expand the walls. This renovation means your heart can pump more blood and oxygen with each beat, making you much more efficient.</p>
<p>Rather than becoming gassed as you push harder, you can do a better job of fighting off fatigue and maintaining a higher intensity.</p>
<p>While it is easy to see why it&rsquo;s ideal to perform both a mix of lower intensity cardio and weight training, the reality is most people are pressed for time and impatient. You want results as fast as possible with the least amount of work needed.</p>
<p>Not to mention, you might not have time for the a little extra cardio. You can call it an excuse, but it&rsquo;s also a reality for many people. So why build a training plan you might not be able to maintain?</p>
<p>That&rsquo;s why if you had to choose between weights and cardio, weights would be the more direct approach.</p>
<h2>Mastering the Muscle-Metabolism Connection</h2>
<p>The majority of calories you burn in a day are not through activity, but instead through your resting metabolic rate (RMR).</p>
<p>For example, a 200-pound man might have an RMR of 1600 to 1900 calories, which is about <em>2-3 times</em> the amount of calories burned in a typical workout.</p>
<p>The point?</p>
<p><em>Weight training is better at preserving your RMR by preserving lean body mass (LBM), which is a significant contributor to RMR, or the calories you burn in a 24-hour period independently of physical activity.</em></p>
<p>Research has shown exactly why strength training does such a good job of being the top priority on fat loss plans.</p>
<p>West Virginia University researchers used obese female subjects to assess LBM and RMR and compared 12 weeks of resistance versus aerobic training on LBM and RMR.</p>
<p>Despite an 800 calorie liquid diet (mmm&hellip;delicious), the resistance-trained group had no significant LBM losses while the other group lost 4 kg of lean mass.</p>
<p>Think about that for a moment. Eating 800 calories per day is low enough that people would fear the dreaded &ldquo;starvation effect.&rdquo; And yet, that&rsquo;s not what was found. [Note: this is <em>not</em> an endorsement to eat 800 liquid calories per day.]</p>
<p>You, the resistance-trained group also lost significantly more body fat (around 2 kg) and the RMR <em>increased </em>by 4 percent. In comparison, the aerobic group experienced a 13.4 percent <em>drop</em> in RMR.</p>
<p>The resistance group also had greater endurance capacity in the time-to-fatigue test.</p>
<p>This study supports the idea that untrained obese subjects dieting severely will get across-the-board better benefits from strength training instead of aerobic training.</p>
<p>But the benefits aren&rsquo;t just limited to those that are overweight or obese.</p>
<p>When considered your most direct path to fat loss, it&rsquo;s understanding <em>why </em>these benefits were so pronounced.</p>
<p>Strength training allows you to maintain a better muscle-to-fat ratio, which not only helps with the way you process food, but also ensures that the amount of calories you burn outside the gym are enough to support all the hard work you dedicate inside the gym.</p>" }


fitness_2 = {title: "The Best Protein Sources", content_type: "text", completion_time: 5, link: "http://www.bornfitness.com/the-best-protein-sources/", content: "<p>Let&rsquo;s state the obvious: protein is good for you. You need protein, whether it&rsquo;s for building muscle, losing fat, staying full, or just maintaining your health.</p>
<p>What&rsquo;s not as settled is <em>where</em> you should get your protein and what are the best protein sources. And when you consider all the options, it&rsquo;s easy to see why. From meat to vegetarian sources, powders to dairy, there&rsquo;s a wide variety of options and plenty of difficulty understanding what you need, what is good, and if &ldquo;too much&rdquo; is really a danger.</p>
<div class='twitter-quote'>
<div class='quote'>
<p>Protein supplementation should not be catered around absorption speeds, marketing promises, or the latest and greatest protein powder modification.</p>
</div>
</div>
<p>While your own needs will be personal based on your body and goals, here&rsquo;s how you can make the protein column on your shopping list a little easier to understand.</p>
<h2>Understanding Your Protein Options</h2>
<h3><strong>&ldquo;Lean Proteins&rdquo;</strong></h3>
<p>The top sources of food protein are those that are high in protein while simultaneously lowest in fatty acids (kind of obvious). Meat rarely, if ever, has carbohydrate or alcohol content. These &ldquo;lean meats&rdquo; are fairly equivalent on a macronutrient basis to many protein powders, with roughly 100 calories per 20 to 25 grams of protein.</p>
<p>Your typical lean meats include warm-water fish, white poultry meat, and red meat sources considered extra lean. (For reference, red meat and pork tend to have higher fat content.) Egg whites also qualify, and most protein powders fall into this category.</p>
<p>Food sources of protein that also contain fatty acids are cold water fish (salmon as an example), most of the red meats, the dark meat of the poultry, and any of the lean category if you decided to cook it in oil. Whole eggs are similarly in this category as the yolk contains fatty acids.</p>
<p>If a meat has breading on it, it is now covered in carbs. That is not inherently bad, but you should understand that no meat can be breaded and still be considered lean.</p>
<p>Dairy products tend to never be as lean as the leanest meat products, although they are in a wide spectrum of fat content; checking the label or investigating nutritional information online would be prudent.</p>
<h3><strong>The Food Groups Richest in Protein</strong></h3>
<p>As mentioned earlier, it seems that the best sources of protein on a caloric basis come from animals. In general, the food groups and their overall protein contents are in the order (greatest to least content on a caloric basis):</p>
<ul>
<li>Meat and Dairy products (lean)</li>
<li>Most Vegetables</li>
<li>Meat and Dairy products (fatty)</li>
<li>Meat substitutes</li>
<li>Fruits and harvest vegetables</li>
<li>Most grains</li>
</ul>
<p>Vegetables are in a weird position, as they tend to have roughly 3 to 4 grams of protein per 40 calories (which is 30-40% by caloric weight). It is unlikely that they will form a substantial amount of your dietary intake due to their filling nature, but they are indeed decent protein sources from a caloric perspective.</p>
<p>Most root and harvest vegetables (pumpkin, squash, potatoes, etc.) are listed further down as they have a greatly increased amount of carbohydrates. Additionally, although some grains can indeed have a high protein content (such as quinoa), the majority of grains eaten in a standard diet tend to have a large degree of carbohydrates relative to protein; the focus on enhancing grains appears to be related to micronutrition and fiber, with minimal focus in increasing protein content.</p>
<h3><strong>Vegetarian and Vegan Proteins</strong></h3>
<p>Supplement-wise, a rice/pea blend as well as both soy and hemp appear to be viable vegan protein sources. Soy food products are viable options, as are vegetables themselves if you can eat sufficient amounts of them. Some microalgae protein sources also exist, mostly chlorella and spirulina.</p>
<h3><strong>What About Powders?</strong></h3>
<p>Overall, the importance of a protein supplement is only important if you <em>don&rsquo;t </em>consume enough protein your diet. Protein supplementation should be catered mostly around allergies, price range, flavor, and perhaps functional properties of the protein if pudding is desired.</p>
<p>Protein supplementation should not be catered around absorption speeds, marketing promises, or the latest and greatest protein powder modification.</p>
<p>Adding more amino acids tends to have the biggest impact when total protein intake is lower. Let&rsquo;s say you only consume 50g of protein a day. It is a good idea to increase that to 75g by adding whey because of its cysteine content.</p>
<p>However, if you&rsquo;re a 180 pound male and you eat 100 grams per day, you don&rsquo;t need to worry about consuming any specific protein, as even poor sources of one or another amino acid will add up.</p>
<p>Because of these reasons, BCAA and EAA supplements also seem to have less of a role as supplements when protein intake from food and supplements is comparatively high; they have a much larger role when your diet is low in protein overall, especially low in complete proteins.</p>
<p><strong>The bottom line:</strong> Consume enough protein and you do not need to worry about absorption speeds, amino acids, or complete vs incomplete. Instead, focus on consuming protein via your diet and/or supplementation, however works best for you.</p>" }


fitness_3 = {title: "Scared to Eat Carbs? Here’s How to Enjoy Them (Healthfully)", content_type: "text", completion_time: 8, link: "https://blog.myfitnesspal.com/scared-to-eat-carbs-heres-how-to-enjoy-them-healthfully/", content: "<p>When I first decided to stop dieting the single hardest thing for me to do was let myself eat carbs again.</p>
<p>Bread, rice and potatoes had been banned from my list of skinny-friendly foods for over 5 years. And even though I only weighed about 5 lbs less than when I ate them regularly, I couldn&rsquo;t help but think of carbs as impossibly fattening. Given my body image issues at the time, I think I would have preferred to eat something laced with anthrax.</p>
<p>What is it about carbs that makes people act insane?</p>
<p>Getting over my fear of carbs required several critical steps. The first big one was digging into the science and learning that the healthiest, longest lived humans on the planet eat intact grains, tubers and legumes regularly. I grudgingly had to accept that they were not subsisting on protein bars and Diet Coke like I was.</p>
<p>The next big test was trying for myself. I slowly phased out processed &ldquo;diet&rdquo; foods and started teaching myself to cook vegetables and other Real Foods. I started eating fruit again. But the scariest part was letting myself eat things like oats, rice and breakfast cereal (still not the best choice, but it didn&rsquo;t matter).</p>
<p>To my surprise and delight I didn&rsquo;t gain weight. This was a huge win, since it was the first time in my adult life I remember not being constantly hungry. Then, slowly, I started to lose weight.</p>
<p>As I experienced success and felt my health flourish, I gained confidence that I was on the right track and became even more adventurous with my food experiments. I even allowed myself to eat things like bread and cake on occasion.</p>
<p>Today, nearly 10 years later, I hardly ever think of the word &ldquo;carbs&rdquo; unless I see it in the news. I eat and love Real Foods. Sometimes they&rsquo;re starchy. Sometimes they&rsquo;re sweet. But they&rsquo;re always delicious.</p>
<p>I even eat foods that have been processed if it sounds tasty and appropriate for the setting. When I&rsquo;m in Italy I eat pasta, in Paris I eat baguettes, in Napa I&rsquo;ll eat pretty much anything because the food is so amazing.</p>
<p>Believe it or not I haven&rsquo;t gained weight, I don&rsquo;t have diabetes, and the apocalypse didn&rsquo;t come. In other words, I&rsquo;ve learned to eat the formerly forbidden &ldquo;carbs&rdquo; like a sane person.</p>
<p>Carbs don&rsquo;t have to be your enemy. Anyone with a healthy metabolism can learn to live with them in peace with the right attitude.</p>
<p>Here are some of the lessons I&rsquo;ve learned along the way:</p>
<p><span style='font-size: 14pt;'><strong>1. Don&rsquo;t moralize your choices.</strong></span></p>
<p>Foods, even those that contain carbohydrates, are not all &ldquo;good&rdquo; or &ldquo;bad.&rdquo; Some may support health more than others, and some may remind you of your childhood summers at grandma&rsquo;s house. There&rsquo;s value in both and no need for feeling guilty or virtuous in either case. Drop the moralization and you can start to see your actions more objectively, which is half the battle.</p>
<p><span style='font-size: 14pt;'><strong>2. Prioritize unrefined starches.</strong></span></p>
<p>I&rsquo;ve come to accept that I don&rsquo;t function well without some starchier foods in my life. Going completely carb-free gets me very hungry, making it harder to eat mindfully and more likely I&rsquo;ll binge (meat binges are not pretty). It also makes my workouts suffer and makes it nearly impossible to eat in public without being that obnoxious person who has a problem with every single thing on the menu.</p>
<p>At the same time I still prefer to eat unprocessed foods, which help me have more energy and look my best. I&rsquo;ve found that when I eat small amounts of grains (e.g. oats, rice, farro, etc.) and legumes (e.g. beans, lentils) regularly, my cravings for bread and sweets completely disappear and I&rsquo;m satisfied with less food. It also helps vary my meals so they&rsquo;re less boring and generally makes life more delicious. Win-win-win.</p>
<p>You may do better with more or less starchy foods in your personal healthstyle, but regardless of the quantity focusing on unrefined, intact starches should be your default.</p>
<p><strong><span style='font-size: 14pt;'>3. Own your indulgences.</span></strong></p>
<p>When outside your normal habits&mdash;maybe it&rsquo;s your birthday or you&rsquo;re on vacation&mdash;you&rsquo;ll occasionally have an opportunity to eat something that is made almost entirely of flour and/or sugar. Only you can decide what is or isn&rsquo;t worth it for you.</p>
<p>Now that I am totally in love with the Real Foods I eat every day, it&rsquo;s easy for me to be really picky in this regard, which I&rsquo;m thankful for. But even if Ben &amp; Jerry&rsquo;s ice cream cake still makes you swoon, that&rsquo;s fine.</p>
<p>What&rsquo;s important is that if you decide to go for it, go for it. That doesn&rsquo;t mean shoveling as much into your mouth hole as you can fit in a 20-minute sitting.</p>
<p>It means being honest with yourself about what a satisfying piece is for you&mdash;not too skimpy, not so big it&rsquo;ll make you sick.</p>
<p>It means putting it on a plate, finding a place to sit, putting a smile on your face, and enjoying the hell out of it. Because life should be awesome.</p>
<p><span style='font-size: 14pt;'><strong>4. Don&rsquo;t pretend processed carbs don&rsquo;t matter.</strong></span></p>
<p>No one eats processed carbs because they&rsquo;re healthy. You eat them because they&rsquo;re delicious. Because there&rsquo;s more to life than eating like a robot. Because you don&rsquo;t know what the future will bring. Because one croissant won&rsquo;t kill you.</p>
<p>That doesn&rsquo;t mean you can throw caution to the wind and eat like that every meal of every day. Your food choices have consequences, and the frequency and quantity of processed starches and sugars you eat is strongly predictive of your future health and body weight.</p>
<p>Finding the balance between health and enjoyment gets much, much easier when you stop moralizing your food choices, pay attention to your body, and prioritize your own well-being. But it is still work you need to do for yourself, since everyone is different.</p>
<p>Learning to enjoy delicious food without sacrificing your health requires mastering your own psychology and being realistic about what you really want, and what you can really do.</p>
<p><span style='font-size: 14pt;'><strong>5. Don&rsquo;t believe the hype.</strong></span></p>
<p>In recent years it feels like starchy foods have become even more controversial than meat. Every week new sensationalist headlines rekindle the battle between the low-carb and low-fat camps, providing next to zero actionable advice for average people.</p>
<p>Just ignore it.</p>
<p>The science is interesting to us geeks, but it tells you almost nothing about yourself as an individual. So don&rsquo;t worry about it. Focus on eating real, unprocessed food most of the time and choose your indulgences based on what you love and what works to keep you feeling and looking your best. That&rsquo;s all you really care about anyway, and it will help keep you sane.</p>" }


fitness_4 = {title: "Easy Ways to Make Exercise Happen", content_type: "text", completion_time: 3, link: "https://blog.myfitnesspal.com/easy-ways-to-make-exercise-happen/", content: "<p>If you&rsquo;ve been lacing up your sneakers and breaking a sweat a few times per week for a while now, you&rsquo;ve got a great fitness routine going&mdash;good on you! But what happens when things go haywire? Say, your calendar fills up with work deadlines, the babysitter cancels, or a tire goes flat on the way to the gym. Cut yourself some slack, and try one of these tricks to keep some activity in your day.</p>
<p><strong>Put it on the Calendar&mdash;in Pen!</strong> Schedule your workouts the same way you plan your week around your favorite TV shows. Yes, you can TiVo those episodes to watch on your time, and&mdash;guess what!?&mdash;you can do that with a run or power walk, too. Find a time that works for you and make fitness happen!</p>
<p><strong>Make it Fun </strong>Stop thinking of exercise as something you have to do. Fitness should be fun! Find an activity that you love&mdash;adult kickball, soccer, roller skating, anything!&mdash;and make that part of your routine. You&rsquo;re more likely to stick to an exercise plan that makes you smile than one you dread. Plus, there&rsquo;s no rule that says you have to spend an hour a day slogging it out on an elliptical machine, while staring at a wall. Open the door and&hellip;</p>
<p><strong>Get Outside!</strong> Skip up a hill&mdash;don&rsquo;t laugh, it&rsquo;s a calorie-torching workout! (Or do laugh&mdash;it&rsquo;s great for your abs!) Invite your friends for a power walk around the neighborhood and some girl time. Or turn your 2:15pm touch-base with a coworker into a walking meeting, and do a couple laps around the building. (Don&rsquo;t forget to log that walk in your MyFitnessPal exercise diary.)</p>
<p><strong>Don&rsquo;t Aim for Perfection</strong> Instead of getting bogged down with doing the perfect workout or signing up for the trendiest class, simply add more movement (any and all movement is great!) into your day.</p>
<p><strong>Just Keep Moving!</strong> You&rsquo;ve heard these little suggestions before: Take the stairs, park in the furthest spot possible, get off the bus one stop early&mdash;all that extra movement really does add up. Being more active in general will increase your calorie burn and enhance your weight loss efforts.</p>" }


fitness_5 = {title: "The One Trick That Will Help You Stick to Your Workouts", content_type: "text", completion_time: 3, link: "http://dailyburn.com/life/fitness/one-trick-workout-motivation-news-101215/", content: "<p>Did you know more than 43 percent of Americans get insufficient levels of exercise every day? That&rsquo;s why literally <em>millions </em>of dollars are being spent each year to encourage people to move more with initiatives like Let&rsquo;s Move. But now, a new study from the University of Pennsylvania has pinpointed the one thing that might actually improve your workout habits.</p>
<p><strong>RELATED:</strong> Denied Insurance, My Motivation to Lose 80 Pounds</p>
<p>It turns out the secret to keeping up lies in having a posse of &ldquo;health buddies.&rdquo; (It may<em> sound</em> corny, but hear us out.) When researchers asked 217 students to enroll in free exercise classes at their gym, they gave half of the subjects a virtual support system comprised of six of their peers. The other half either received motivational messages via e-mail to pump them up for workouts, or just the free membership.</p>
<h3>Strength in Numbers</h3>
<p>Throughout the 13-week study, each member regular received e-mail updates on their peers&rsquo; actions, though everyone&rsquo;s identity was kept anonymous. When one person signed up for a yoga or strength-training class, the other folks were notified. And they got updates only on the good stuff &mdash; not when one of them skipped a class to eat pizza, instead. (Because hey, that definitely happens.)</p>
<p><strong>RELATED:</strong> From Sedentary to Hiking Yosemite: How I Got Fit with DailyBurn</p>
<p>Results showed that students paired with &ldquo;health buddies&rdquo; were the only ones who showed a steady increase in workout attendance (rah-rah messaging and freebie classes alone didn&rsquo;t do much). &ldquo;You just have to put people into the right kind of social environment where they can interact with each other. Even anonymous social interaction will create behavior change,&rdquo; says study author Damon Centola, of Penn&rsquo;s Annenberg School for Communication and its School of Engineering and Applied Sciences.</p>
<p>The crazy thing, though, is that the subjects involved in the study didn&rsquo;t even know each other. So imagine what could happen if you formed a workout group of your <em>actual </em>friends? After all, you don&rsquo;t want to be the only one who stays at home when all your pals are getting in a quality sweat session together.</p>" }


fitness_list = [fitness_1, fitness_2, fitness_3, fitness_4, fitness_5]

# TECH ACTIVITIES
tech_1 = { title: "5 Mind Blowing Facts About Your Smartphone!", completion_time: 10, link: "https://www.youtube.com/embed/3MYhhO_nSAk", content_type: "video", like_count: 0 }

tech_2 = { title: "Nexus 6P Review!", completion_time: 14, link: "https://www.youtube.com/embed/Xc5fFvp8le4", content_type: "video"}

tech_3 = { title: "Apple's first Singapore store will be powered entirely by renewable energy", completion_time: 3, link: "http://www.cnet.com/news/apples-first-singapore-store-will-be-powered-entirely-by-renewable-energy/", content_type: "text", content: "Apple wants to end its dependence on fossil fuel for all of its global facilities and the upcoming store in the city-state of Singapore will be one of the first in the world to be powered entirely by solar energy. The Cupertino consumer
 electronics giant has partnered with Singapore's largest clean energy provider, Sunseap Group, who will provide power to Apple's 2,5000-person corporate campus and retail store. Energy will be obtained from solar panels laid on the rooftops of 800 buildings. \"We're thrilled to be working with Sunseap and the government of Singapore to pioneer new ways to bring solar energy to the country and bring Apple even closer to our goal
 of powering our facilities around the world with 100 percent renewable energy,\" said Lisa Jackson, Apple's vice president of environment, policy and social initiatives in a statement provided to CNET. The deal follows a recent announcement of two clean energy projects in China. The first involved building 200 megawatts of solar projects to offset the energy used in Apple's supply chain, while a second project consisted of working
 with its manufacturing partners to install more than 2 gigawatts of clean energy production over two years. In Singapore, Apple expects that this deal will generate 50 megawatts of energy, enough for 9,000 homes, though Apple will use 33 megawatts of the energy for its campus and upcoming store. The announcement also confirmed rumors that the company would finally open a retail store in Singapore. The island-state has long been in
 list of day one product launches alongside bigger markets such as the US, Hong Kong and Japan, but has never had an Apple Store. Instead, Apple relies on local distributors, Apple Premium Resellers, for retail and servicing to its customer base in Singapore. The upcoming retail store will likely see Apple placing a larger focus on the Singapore market, which currently also serves as a shopping hub for more devoted fanbase in the
 region, who often travel down to the island-state during product launches to get their hands on Apple devices such as the iPhone 6 Plus. The expected location of its upcoming store will be at the heart of Singapore's shopping district on Orchard Road, where it will be taking over 15,000 square feet of space. The company has also posted job listings for Apple Geniuses and other retail positions."}

tech_4 = { title: "Should you buy the iPhone 6s or iPad Pro?", completion_time: 8, link: "https://www.youtube.com/embed/g6ZfghiG70M", content_type: "video"}

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

tech_6 = { title: "The Best Tech Under $50 - November 2015", completion_time: 1, link: "https://www.youtube.com/embed/Gb8VJwT3OdU", content_type: "video"}

tech_list = [tech_1, tech_2, tech_3, tech_4, tech_5, tech_6]


# SCIENCE ACTIVITIES
science_1 = { title: "10 Cool Science Experiments Compilation #9", completion_time: 5, link: "https://www.youtube.com/embed/TDMXs2hJv28", content_type: "video" }

science_2 = { title: "10 Amazing Science Tricks Using Liquid!", completion_time: 7, link: "https://www.youtube.com/embed/HQx5Be9g16U", content_type: "video", like_count: 0 }

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

science_5 = { title: "The Brightest Part of a Shadow is in the Middle", completion_time: 8, link: "https://www.youtube.com/embed/y9c8oZ49pFc", content_type: "video"}

science_list = [science_1, science_2, science_3, science_4, science_5]


# combine activity lists
activity_list_science = Activity.create(science_list)
activity_list_tech = Activity.create(tech_list)
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

# Give science Interests to science Activities
activity_list_science.each do |science_activity|
  science_activity.interests << science_interest
end

# Give an Activity multiple interests
activity_list_tech[0].interests << news_interest
activity_list_tech[0].interests << science_interest

# Populate the database with food-based activities
food_1 = Activity.create({ title: "Recipe: Butternut Squash and Cranberry Muffins", content_type: "text", completion_time: 40, link: "http://allrecipes.com/recipe/239607/butternut-squash-and-cranberry-muffins/", content: "<p><strong>The author says:</strong> \"I got some butternut squash and cranberries (both I am not fond of) in my 'Bountiful Basket' last week. Not having a clue what to do with them, I came up with this surprisingly yummy muffin. I made up this recipe with what I had on hand. It is really very light, tasty, and not too sweet. I serve mine with honey or sweetened cream cheese. If possible, always choose organic.\"</p>
<img src='http://images.media-allrecipes.com/userphotos/720x405/1528573.jpg'>
<h3>Ingredients</h3>
<ul>
<li>3 cups all-purpose flour</li>
<li>1 cup white sugar</li>
<li>1 cup brown sugar</li>
<li>2 teaspoons ground cinnamon</li>
<li>1 teaspoon baking powder</li>
<li>1 teaspoon ground nutmeg</li>
<li>1/2 teaspoon ground cloves</li>
<li>1/2 teaspoon baking soda</li>
<li>1/4 teaspoon freshly grated nutmeg, or more to taste</li>
<li>1 cup fresh cranberries, or more to taste</li>
<li>2 cups mashed, cooked butternut squash</li>
<li>4 large eggs, lightly beaten</li>
<li>1/2 cup coconut oil</li>
<li>1/2 cup safflower oil</li>
<li>1 (1 inch) piece fresh ginger, peeled and pressed through a garlic press</li>
</ul>
<h3>Directions</h3>
<ol>
<li>Preheat oven to 350 degrees F (175 degrees C). Grease or line 24 muffin cups with paper liners.</li>
<li>Mix flour, white sugar, brown sugar, cinnamon, baking powder, ground nutmeg, cloves, baking soda, and freshly grated nutmeg together in a bowl; fold in cranberries. Beat butternut squash, eggs, coconut oil, safflower oil, and ginger together in a separate bowl until smooth; stir into flour mixture until batter is just mixed. Spoon batter into the prepared muffin cups.</li>
<li>Bake in the preheated oven until a toothpick inserted in the center of a muffin comes out clean, about 25 minutes.</li></ol>" })

food_2 = Activity.create({ title: "Recipe: Fluffy French Toast", content_type: "text", completion_time: 30, link: "http://allrecipes.com/recipe/16895/fluffy-french-toast/", content: "<p><strong>The author says:</strong> \"This French toast recipe is different because it uses flour. I have given it to some friends and they've all liked it better than the French toast they usually make!\"</p>
<img src='http://images.media-allrecipes.com/userphotos/720x405/2049275.jpg'>
<h3>Ingredients</h3>
<ul>
<li>1/4 cup all-purpose flour</li>
<li>1 cup milk</li>
<li>1 pinch salt</li>
<li>3 eggs</li>
<li>1/2 teaspoon ground cinnamon</li>
<li>1 teaspoon vanilla extract</li>
<li>1 tablespoon white sugar</li>
<li>12 thick slices bread</li>
</ul>
<h3>Directions</h3>
<ol>
<li>Measure flour into a large mixing bowl. Slowly whisk in the milk. Whisk in the salt, eggs, cinnamon, vanilla extract and sugar until smooth.</li>
<li>Heat a lightly oiled griddle or frying pan over medium heat.</li>
<li>Soak bread slices in mixture until saturated. Cook bread on each side until golden brown. Serve hot.</li></ol>" })

food_3 = Activity.create({ title: "Recipe: Salsa Chicken", content_type: "text", completion_time: 45, link: "http://allrecipes.com/recipe/16700/salsa-chicken/", content: "<p><strong>The author says:</strong> \"Someone gave me this recipe a few years back and it's become a household favorite. You can use mild, medium or hot salsa depending on your taste. I usually serve it with Spanish rice and Mexican-style canned corn. Very easy and quick!\"</p>
<img src='http://images.media-allrecipes.com/userphotos/250x250/117563.jpg'>
<h3>Ingredients</h3>
<ul>
<li>4 skinless, boneless chicken breast halves</li>
<li>4 teaspoons taco seasoning mix</li>
<li>1 cup salsa</li>
<li>1 cup shredded Cheddar cheese</li>
<li>2 tablespoons sour cream (optional)</li>
</ul>
<h3>Directions</h3>
<ol>
<li>Preheat oven to 375 degrees F (190 degrees C)</li>
<li>Place chicken breasts in a lightly greased 9x13 inch baking dish. Sprinkle taco seasoning on both sides of chicken breasts, and pour salsa over all.</li>
<li>Bake at 375 degrees F (190 degrees C) for 25 to 35 minutes, or until chicken is tender and juicy and its juices run clear.</li>
<li>Sprinkle chicken evenly with cheese, and continue baking for an additional 3 to 5 minutes, or until cheese is melted and bubbly. Top with sour cream if desired, and serve.</li></ol>" })


food_4 = Activity.create({ title: "Recipe: Easy Quiche", content_type: "text", completion_time: 60, link: "http://allrecipes.com/recipe/23389/easy-quiche/", content: "<p><strong>The author says:</strong> \"This is an easy mix-it-up-in-one-bowl-and-cook recipe. I make it for every brunch I attend. You may substitute chopped spinach for the broccoli if you wish.\"</p>
<img src='http://images.media-allrecipes.com/userphotos/720x405/834646.jpg'>
<h3>Ingredients</h3>
<ul>
<li>2 cups milk</li>
<li>4 eggs</li>
<li>3/4 cup biscuit baking mix</li>
<li>1/4 cup butter, softened</li>
<li>1 cup grated Parmesan cheese</li>
<li>1 (10 ounce) package chopped frozen broccoli, thawed and drained</li>
<li>1 cup cubed cooked ham</li>
<li>8 ounces shredded Cheddar cheese</li>
</ul>
<h3>Directions</h3>
<ol>
<li>Preheat oven to 375 degrees F (190 degrees C). Lightly grease a 10 inch quiche dish.</li>
<li>In a large bowl, beat together milk, eggs, baking mix, butter and parmesan cheese. Batter will be lumpy. Stir in broccoli, ham and Cheddar cheese. Pour into prepared quiche dish.</li>
<li>Bake in preheated oven for 50 minutes, until eggs are set and top is golden brown.</li></ol>" })


food_5 = Activity.create({ title: "Recipe: Lime Chicken Soft Tacos", content_type: "text", completion_time: 50, link: "http://allrecipes.com/recipe/25371/lime-chicken-soft-tacos/", content: "<p><strong>The author says:</strong> \"I was given this recipe by my mom when I went away to college, and it has become all of my friends' favorite!\"</p>
<img src='http://images.media-allrecipes.com/userphotos/720x405/642313.jpg'>
<h3>Ingredients</h3>
<ul>
<li>1 1/2 pounds skinless, boneless chicken breast meat - cubed</li>
<li>1/8 cup red wine vinegar</li>
<li>1/2 lime, juiced</li>
<li>1 teaspoon white sugar</li>
<li>1/2 teaspoon salt</li>
<li>1/2 teaspoon ground black pepper</li>
<li>2 green onions, chopped</li>
<li>2 cloves garlic, minced</li>
<li>1 teaspoon dried oregano</li>
<li>10 (6 inch) flour tortillas</li>
<li>1 tomato, diced</li>
<li>1/4 cup shredded lettuce</li>
<li>1/4 cup shredded Monterey Jack cheese</li>
<li>1/4 cup salsa</li>
</ul>
<h3>Directions</h3>
<ol>
<li>Saute chicken in a medium saucepan over medium high heat for about 20 minutes. Add vinegar, lime juice, sugar, salt, pepper, green onion, garlic and oregano. Simmer for an extra 10 minutes.</li>
<li>Heat an iron skillet over medium heat. Place a tortilla in the pan, warm, and turn over to heat the other side. Repeat with remaining tortillas. Serve lime chicken mixture in warm tortillas topped with tomato, lettuce, cheese and salsa.</li></ol>" })


food_6 = Activity.create({ title: "Recipe: Marinated Grilled Shrimp", content_type: "text", completion_time: 55, link: "http://allrecipes.com/recipe/21694/marinated-grilled-shrimp/", content: "<p><strong>The author says:</strong> \"A very simple and easy marinade that makes your shrimp so yummy you don't even need cocktail sauce! Don't let the cayenne pepper scare you, you don't even taste it. My 2 and 4 year-olds love it and eat more shrimp than their parents! It is also a big hit with company, and easy to prepare. I make this with frozen or fresh shrimp and use my indoor electric grill if the weather is not good for outside grilling. Try it with a salad, baked potato, and garlic bread. You will not be disappointed!!!\"</p>
<img src='http://images.media-allrecipes.com/userphotos/720x405/2374052.jpg'>
<h3>Ingredients</h3>
<ul>
<li>3 cloves garlic, minced</li>
<li>1/3 cup olive oil</li>
<li>1/4 cup tomato sauce</li>
<li>2 tablespoons red wine vinegar</li>
<li>2 tablespoons chopped fresh basil</li>
<li>1/2 teaspoon salt</li>
<li>1/4 teaspoon cayenne pepper</li>
<li>2 pounds fresh shrimp, peeled and deveined</li>
<li>skewers</li>
</ul>
<h3>Directions</h3>
<ol>
<li>In a large bowl, stir together the garlic, olive oil, tomato sauce, and red wine vinegar. Season with basil, salt, and cayenne pepper. Add shrimp to the bowl, and stir until evenly coated. Cover, and refrigerate for 30 minutes to 1 hour, stirring once or twice.</li>
<li>Preheat grill for medium heat. Thread shrimp onto skewers, piercing once near the tail and once near the head. Discard marinade.</li>
<li>Lightly oil grill grate. Cook shrimp on preheated grill for 2 to 3 minutes per side, or until opaque.</li></ol>" })


food_7 = Activity.create({ title: "Recipe: Easy Tuna Casserole", content_type: "text", completion_time: 45, link: "http://allrecipes.com/recipe/18871/easy-tuna-casserole/", content: "<p><strong>The author says:</strong> \"Tuna, macaroni, creamy soup, cheese and fried onions are all you need to make this super easy tuna casserole that I learned from my roommate. It's great as leftovers, too.\"</p>
<img src='http://images.media-allrecipes.com/userphotos/250x250/668635.jpg'>
<h3>Ingredients</h3>
<ul>
<li>3 cups cooked macaroni</li>
<li>1 (6 ounce) can tuna, drained</li>
<li>1 (10.75 ounce) can condensed cream of chicken soup</li>
<li>1 cup shredded Cheddar cheese</li>
<li>1 1/2 cups French fried onions</li>
</ul>
<h3>Directions</h3>
<ol>
<li>Preheat oven to 350 degrees F (175 degrees C).</li>
<li>In a 9x13-inch baking dish, combine the macaroni, tuna, and soup. Mix well, and then top with cheese.</li>
<li>Bake at 350 degrees F (175 degrees C) for about 25 minutes, or until bubbly. Sprinkle with fried onions, and bake for another 5 minutes. Serve hot.</li></ol>" })


food_8 = Activity.create({ title: "Recipe: Simple Hamburger Stroganoff", content_type: "text", completion_time: 30, link: "http://allrecipes.com/recipe/23260/simple-hamburger-stroganoff/", content: "<p><strong>The author says:</strong> \"I've always loved the taste of a good Stroganoff, but I hated the expense and preparation of beef tips or steak or roast beef to make it. So I created my own creamy Stroganoff.\"</p>
<img src='http://images.media-allrecipes.com/userphotos/250x250/730905.jpg'>
<h3>Ingredients</h3>
<ul>
<li>1 (16 ounce) package egg noodles</li>
<li>1 pound lean ground beef</li>
<li>1 (.75 ounce) packet dry brown gravy mix</li>
<li>1 (8 ounce) package cream cheese</li>
<li>1 (6 ounce) can chopped mushrooms, with liquid</li>
<li>1/2 cup milk</li>
<li>1 (8 ounce) container sour cream</li>
<li>2 (10.75 ounce) cans condensed cream of mushroom soup</li>
</ul>
<h3>Directions</h3>
<ol>
<li>Bring a large pot of lightly salted water to a boil. Add egg noodles and cook for 8 to 10 minutes or until al dente; drain.</li>
<li>In a skillet over medium heat, brown the ground beef until no pink shows, about 5 minutes; drain fat.</li>
<li>Mix brown gravy, cream cheese, and mushrooms with hamburger, stirring until cream cheese melts. Add milk, sour cream, and mushroom soup to cooked pasta. Blend hamburger mixture with pasta.</li></ol>" })


food_9 = Activity.create({ title: "Recipe: Taco Pie", content_type: "text", completion_time: 30, link: "http://allrecipes.com/recipe/17303/taco-pie/", content: "<p><strong>The author says:</strong> \"It's a quick, easy meal that is very filling. Some people will also top it with regular taco toppings, i.e. lettuce, tomatoes, black olives, etc. It also is great as leftovers for lunches! Serve with taco sauce.\"</p>
<img src='http://images.media-allrecipes.com/userphotos/720x405/144650.jpg'>
<h3>Ingredients</h3>
<ul>
<li>1 (8 ounce) package refrigerated crescent rolls</li>
<li>1 pound ground beef</li>
<li>1 (1 ounce) package taco seasoning mix</li>
<li>1 (16 ounce) container sour cream</li>
<li>8 ounces shredded Mexican-style cheese blend</li>
<li>1 (14 ounce) bag tortilla chips, crushed</li>
</ul>
<h3>Directions</h3>
<ol>
<li>Preheat oven to 350 degrees F (175 degrees C).</li>
<li>Lay crescent dough flat on the bottom of a square cake pan and bake according to package directions.</li>
<li>Meanwhile, brown the ground beef in a large skillet over medium high heat. Add the taco seasoning and stir together well. When dough is done, remove from oven and place meat mixture on top, then layer with sour cream and cheese, and then top off with the crushed nacho chips.</li>
<li>Return to oven and bake at 350 degrees F (175 degrees C) for 10 minutes, or until cheese has melted.</li></ol>" })


food_10 = Activity.create({ title: "Recipe: Suki's Spinach and Feta Pasta", content_type: "text", completion_time: 40, link: "http://allrecipes.com/recipe/19591/sukis-spinach-and-feta-pasta/", content: "<p><strong>The author says:</strong> \"Spinach, tomatoes, and mushrooms mingle with tangy feta cheese in this quick and easy dish for a summer night or anytime.\"</p>
<img src='http://images.media-allrecipes.com/userphotos/720x405/1442659.jpg'>
<h3>Ingredients</h3>
<ul>
<li>1 (8 ounce) package penne pasta</li>
<li>2 tablespoons olive oil</li>
<li>1/2 cup chopped onion</li>
<li>1 clove garlic, minced</li>
<li>3 cups chopped tomatoes</li>
<li>1 cup sliced fresh mushrooms</li>
<li>2 cups spinach leaves, packed</li>
<li>salt and pepper to taste</li>
<li>1 pinch red pepper flakes</li>
<li>8 ounces feta cheese, crumbled</li>
</ul>
<h3>Directions</h3>
<ol>
<li>Bring a large pot of lightly salted water to a boil. Cook pasta in boiling water until al dente; drain.</li>
<li>Meanwhile, heat olive oil in a large skillet over medium-high heat; add onion and garlic, and cook until golden brown. Mix in tomatoes, mushrooms, and spinach. Season with salt, pepper, and red pepper flakes. Cook 2 minutes more, until tomatoes are heated through and spinach is wilted. Reduce heat to medium, stir in pasta and feta cheese, and cook until heated through.</li></ol>" })


food_11 = Activity.create({ title: "Recipe: Sausage Balls", content_type: "text", completion_time: 35, link: "http://allrecipes.com/recipe/21649/sausage-balls/", content: "<p><strong>The author says:</strong> \"These are so yummy! My family makes every Christmas morning. Enjoy!\"</p>
<img src='http://images.media-allrecipes.com/userphotos/720x405/466969.jpg'>
<h3>Ingredients</h3>
<ul>
<li>1 pound ground pork sausage</li>
<li>2 cups biscuit baking mix</li>
<li>1 pound sharp Cheddar cheese, shredded</li>
</ul>
<h3>Directions</h3>
<ol>
<li>Preheat oven to 350 degrees F (175 degrees C).</li>
<li>In a large bowl, combine sausage, biscuit baking mix and cheese. Form into walnut size balls and place on baking sheets.</li>
<li>Bake in preheated oven for 20 to 25 minutes, until golden brown and sausage is cooked through.</li></ol>" })


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
health_1 = Activity.create({ title: "Flow through the Heart", content_type: "video", completion_time: 8, link: "https://www.youtube.com/embed/7XaftdE_h60", content: "" })
health_2 = Activity.create({ title: "Lub Dub", content_type: "video", completion_time: 10, link: "https://www.youtube.com/embed/-4kGMI-qQ3I", content: "" })
health_3 = Activity.create({ title: "Meet the heart!", content_type: "video", completion_time: 11, link: "https://www.youtube.com/embed/Vi1JK6IYVt8", content: "" })
health_4 = Activity.create({ title: "Electrical System of the Heart", content_type: "video", completion_time: 10, link: "https://www.youtube.com/embed/7K2icszdxQc", content: "" })
health_5 = Activity.create({ title: "Meet the Lungs", content_type: "video", completion_time: 10, link: "https://www.youtube.com/embed/qGiPZf7njqY", content: "" })
health_6 = Activity.create({ title: "Basics of Metabolism", content_type: "video", completion_time: 12, link: "https://www.youtube.com/embed/wQ1QGZ6gJ8w", content: "" })
health_7 = Activity.create({ title: "What's Inside of Blood?", content_type: "video", completion_time: 12, link: "https://www.youtube.com/embed/5MOn8X-tyFw", content: "" })
health_8 = Activity.create({ title: "How do our kidneys work? (Renal Anatomy)", content_type: "video", completion_time: 8, link: "https://www.youtube.com/embed/ctGkLYuUCvU", content: "" })
health_9 = Activity.create({ title: "Arteries vs. Veins - What's the Difference?", content_type: "video", completion_time: 12, link: "https://www.youtube.com/embed/7b6LRebCgb4", content: "" })
health_10 = Activity.create({ title: "Digesting Food", content_type: "video", completion_time: 17, link: "https://www.youtube.com/embed/v2V4zMx33Mc", content: "" })

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
eli5_1 = Activity.create({ title: "ELI5: Why does it take 5 seconds for credit card companies to take money out of my account but 5 days to refund it?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3hu553/eli5_why_does_it_take_5_seconds_for_credit/", content: "<p><strong>Best answer:</strong></p> <p>\"Different systems... First you have to realize there is a difference between authorizations and postings.   </p>
<p>A charge is only &quot;real&quot; against your account when it&#39;s posted.  It&#39;s posted when the merchant does their batch close (typically) except for debit.  When you do a credit transaction there is an authorization against your account but you don&#39;t &quot;owe&quot; the money until it posts.  </p>
<p>Refunds to debit if done at a POS terminal should be automatic (just like charges).</p>
<p>Refunds to credit take time because they go through the same path as charges.  If it took 3 days for your charge to post you can be assured it will take 3 days for the refund to post.</p>
<p>Now why don&#39;t they just authorize refunds?  I suspect because when you auth a charge no money has changed hands yet.  The bank [or credit company] still has the money they were lending you.  It only goes to the merchant when they do a batch close and post the transaction.  So if they did an auth refund there would be two copies of the same money.  You&#39;d have your refund and the merchant wouldn&#39;t have had to cough up the money yet.</p>
<p>Now why do they take so long to do batch closes?  Probably because each close costs money (+ transaction fees and percentages).  So they do them every few days to save money.\"</p>" })

eli5_2 = Activity.create({ title: "ELI5: How is Orange Juice economically viable when it takes 10 oranges to have enough for a single glass of Orange Juice?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3iarsy/eli5_how_is_orange_juice_economically_viable_when/", content: "<p><strong>Best answer:</strong></p> <p>\"My father worked in various divisions of Tropicana for nearly 40 years, going from factory work and into corporate. He has more knowledge about the industry than nearly anyone in the world, though he retired several years ago. </p>
<p>Here's what he has to say: </p>
<p>A standard box of oranges (as bought from a grower in Florida) weighs 90 lbs. That box when extracted by a processor will generate 5.5 to 6.0 gallons of orange juice. A typical box of oranges will supply 180 to 220 oranges ... depending on the maturity and the variety of orange. That means that it takes about 34.8 oranges to produce a gallon of OJ. </p>
<p>Re cost .... the economics of 'table fruit' that you buy to eat is different than the economics of field run processed fruit. Table run fruit is sorted for appearance, boxed, and sold at a premium. Some varieties of table fruit are also processed but mostly used as table fruit and sell at a significant premium to processed fruit. Valencia, Parson Brown, 'Pineapple' oranges and Hamlins are the main varieties of oranges used in Florida to make OJ in processing plants. Extractor do not 'grind up the fruit'. There are 2 types of extractors .... one 'reems' the fruit like you do at home and the objective of the reem is to get all of the juice, pulp and inside of the orange without impacting the white interior of the fruit (albedo) which is very bitter. The peels and waste material are then sent to a feed mill where they are pressed to reduce liquid content and dried to make cattle feed. The pressed liquid is run through an evaporator to turn it into molasses and added back to the cattle feed to sweeten it up. </p>
<p>A comment in the string says 'don't let them tell you they don't add water because they do'. They don't add water to not from concentrate Orange Juice .... it is against the law and no reputable brand would do this. The cost of the oranges is so different because when you buy table fruit it is at most a bag .... processors sign contracts to buy whole groves of oranges .... sometimes buying millions of 90 lb boxes at a time. If you look in the commodity exchange ... you will see 'Orange Juice Concentrate Futures'. This is the price a processor is expecting to pay for a standard pound solid (about one gallon of single strength orange juice) in the future. That cost typically runs from $1.25 to $2.00 ..... for about 35 processing oranges. (See math at the top of this note) </p>
<p>Nuf said ...\"</p>" })

eli5_3 = Activity.create({ title: "ELI5: What about Coca-Cola is so hard to replicate?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3hb0mo/eli5_what_about_cocacola_is_so_hard_to_replicate/", content: "<p><strong>Best answer:</strong></p> <p>\"It's not just about ingredients, the process is very important too. </p>
<p>Take sugar turned into caramel. The total length of time spent heating the sugar (total joules) and the temperature curve (at which point there were changes in heating) directly affects the flavor and texture. Too hot and it tastes burnt, too slow and it's all runny. </p>
<p>In the 90s Ruffles sales collapsed for a few quarters for no apparent reason. Frito-Lay used some very advanced processes, that included photographing every individual chip and rejecting (using timed puffs of air) those that do not meet color, size and shape requirements. </p>
<p>The root cause of the sales dip was a switch to a different blend of cooking oil. There's a delay between a change in process and a change in sales as new product makes its way out into the supply chain. A month later, sales started to really dip. They checked everything in the machines and the ingredients but the sales kept door dipping. It was only after a chance discussion with a consumer did they discover the oil change had altered the temperature curve, which in turn made the chips taste 'burnt' to some palates. But only some people could taste whatever new substance was now in the chip. </p>
<p>Tl;dr> The process is as important as the ingredients and way harder to figure out, especially at scale. </p>
<p>Source: I'm a former PepsiCo employee.\"</p>" })

eli5_4 = Activity.create({ title: "ELI5: What does the TPP (Trans-Pacific Partnership) mean for me and what does it do?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3az0fa/eli5_what_does_the_tpp_transpacific_partnership/", content: "<p><strong>Best answer:</strong></p> <p>\"'Free Trade' treaties like this have been around for a long time. The problem is, the United States, and indeed most of the world, has had practically free trade since the 50s. What these new treaties do is allow corporations to manipulate currency and stock markets, to trade goods for capital, resulting in money moving out of an economy never to return, and override the governments of nations that they operate in because they don't like policy. </p>
<p>For example, Australia currently has a similar treaty with Hong Kong. They recently passed a 'plain packaging' law for cigarettes, they cannot advertise to children anymore. The cigarette companies don't like this, so they went to a court in Hong Kong, and they sued Australia for breaking international law by making their advertising tactics illegal. This treaty has caused Australia to give up their sovereignty to mega-corporations. </p>
<p>Another thing these treaties do is allow companies to relocate whenever they like. This means that, when taxes are going to be raised, corporations can just get up and leave, which means less jobs, and even less revenue for the government. </p>
<p>The TPP has some particularly egregious clauses concerning intellectual property. It requires that signatory companies grant patents on things like living things that should not be patentable, and not deny patents based on evidence that the invention is not new or revolutionary. In other words, if the TPP was in force eight years ago, Apple would have gotten the patent they requested on rectangles.\"</p>" })

eli5_5 = Activity.create({ title: "ELI5: What's the difference between an Ave, Rd, St, Ln, Dr, Way, Pl, Blvd etc?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/2me7l2/eli5_whats_the_difference_between_an_ave_rd_st_ln/", content: "<p><strong>Best answer:</strong></p><ul>
<li>A <strong>road</strong> has no special qualifiers. It connects point a to point b.</li>
<li>A <strong>street</strong> connects buildings together, usually in a city, usually east to west, opposite of avenue.</li>
<li>An <strong>avenue</strong> runs north south. Avenues and streets may be used interchangeably for directions, usually has median</li>
<li>A <strong>boulevard</strong> is a street with trees down the middle or on both sides</li>
<li>A <strong>lane</strong> is a narrow street usually lacking a median.</li>
<li>A <strong>drive</strong> is a private, winding road</li>
<li>A <strong>way</strong> is a small out of the way road</li>
<li>a <strong>court</strong> usually ends in a cul de sac or similar little loop</li>
<li>a <strong>plaza or square</strong> is usually a wide open space, but in modern definitons, one of the above probably fits better for a plaza as a road.</li>
<li><strong>a terrace</strong> is a raised flat area around a building. When used for a road it probably better fits one of the above.</li>
<li>uk, <strong>a close</strong> is similar to a court, a short road serving a few houses, may have cul de sac</li>
<li><strong>run</strong> is usually located near a stream or other small body of water</li>
<li><strong>place</strong> is similar to a court, or close, usually a short skinny dead end road, with or without cul de sac, sometimes p shaped</li>
<li>bay is a small road where both ends link to the same connecting road</li>
<li><strong>crescent</strong> is a windy s like shape, or just a crescent shape, for the record, above definition of bay was also given to me for crescent</li>
<li>a <strong>trail</strong> is usually in or near a wooded area</li>
<li><strong>mews</strong> is an old british way of saying row of stables, more modernly seperate houses surrounding a courtyard</li>
<li>a <strong>highway</strong> is a major public road, usually connecting multiple cities</li>
<li>a <strong>motorway</strong> is similar to a highway, with the term more common in New Zealand, the UK, and Austrailia, no stopping, no pedestrian or animal traffic allowed</li>
<li>an <strong>interstate</strong> is a highway system connecting usually connecting multiple states, although some exist with no connections</li>
<li>a <strong>turnpike</strong> is part of a highway, and usully has a toll, often located close to a city or commercial are</li>
<li>a <strong>freeway</strong> is part of a highway with 2 or more lanes on each side, no tolls, sometimes termed <strong>expressway</strong>, no intersections or cross streets.</li>
<li>a <strong>parkway</strong> is a major public road, usually decorated, sometimes part of a highway, has traffic lights.</li>
<li>a <strong>causeway</strong> combines roads and bridges, usually to cross a body of water</li>
<li><strong>circuit and speedway</strong> are used interchangeably,  usually refers to a racing course, practically probably something above.</li>
<li>as the name implies, <strong>garden</strong> is usually a well decorated small road, but probably better fits an above </li>
<li>a <strong>view</strong> is usually on a raised area of land, a hill or something similar.</li>
<li><strong>byway</strong> is a minor road, usually a bit out of the way and not following main roads.</li>
<li>a <strong>cove</strong> is a narrow road, can be sheltered, usually near a larger body of water or mountains</li>
<li>a <strong>row</strong> is a street with a continuous line of close together houses on one or both sides, usually serving a specific function like a frat</li>
<li>a <strong>beltway</strong> is a highway surrounding an urban area</li>
<li><strong>quay</strong> is a concrete platform running along water</li>
<li><strong>crossing</strong> is where two roads meet</li>
<li><strong>alley</strong> a narrow path or road between buildings, sometimes connects streets, not always driveable</li>
<li><strong>point</strong> usually dead ends at a hill</li>
<li><strong>pike</strong> usually a toll road</li>
<li><strong>esplanade</strong> long open, level area, usually a walking path near the ocean</li>
<li><strong>square</strong> open area where multiple streets meet, guess how its usually shaped.</li>
<li><strong>landing</strong> usually near a dock or port, historically where boats drop goods.</li>
<li><strong>walk</strong> historically a walking path or sidewalk, probably became a road later in its history</li>
<li><strong>grove</strong> thickly sheltered by trees</li>
<li><strong>copse</strong> a small grove</li>
<li><strong>driveway</strong> almost always private, short, leading to a single residence or a few related ones</li>
<li><strong>laneway</strong> uncommon, usually down a country road, itself a public road leading to multiple private driveways.</li>
<li><strong>trace</strong> beaten path</li>
<li><strong>circle</strong> usually  circles around an area, but sometimes is like a &quot;square&quot;, an open place intersected by multiple roads.</li>
<li><strong>channel</strong> usually near a water channel, the water itself connecting two larger bodies of water,</li>
<li><strong>grange</strong> historically would have been a farmhouse or collection of houses on a farm, the road probably runs through what used to be a farm</li>
<li><strong>park</strong> originally meaning an enclosed space, came to refer to an enclosed area of nature in a city, usually a well decorated road.</li>
<li><strong>mill</strong> probably near an old flour mill or other mill.</li>
<li><strong>spur</strong> similar to a byway, a smaller road branching off from a major road.</li>
<li><strong>bypass</strong>  passes around a populated area to divert traffic</li>
<li><strong>roundabout or traffic circle</strong> circle around a traffic island with multiple connecting routes, a roundabout is usually smaller, with less room for crossing and passing, and safer  </li>
<li><strong>wynd</strong> a narrow lane between houses, similar to an alley, more common in UK</li>
<li><strong>drive</strong> shortened form of driveway, not a driveway itself, usually in a neighborhood, connects several houses</li>
<li><strong>parade</strong> wider than average road historically used as a parade ground.</li>
<li><strong>terrace</strong> more common in uk, a row of houses.</li>
<li><strong>chase</strong> on land historically used as private hunting grounds.</li>
<li><strong>branch</strong> divides a road or area into multiple subdivisions. </li>
</ul>" })

eli5_6 = Activity.create({ title: "ELI5: What exactly happens to your brain when you feel mentally exhausted?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3g1moj/eli5_what_exactly_happens_to_your_brain_when_you/", content: "<p><strong>Best answer:</strong></p> <p>\"There are probably about three different types of mental exhaustion. One, that has already been explained (to the best of anyone’s ability) is sleepiness. Basically, that is when you start feeling tired and want to sleep at the end of the day (or other times in the day if you didn’t get enough sleep). That is your brain telling you that you need to sleep for a while so that your brain can clean itself out and deal with memory consolidation. Although the purposes of sleep aren’t entirely understood, it is definitely totally necessary for brains to function and it plays a role in solidifying important memories (and forgetting irrelevant things).</p>
<p>Another type of mental exhaustion happens when you’ve just been engaging in difficult and unenjoyable mental work. So maybe you just finished a couple hours of awful homework, or had to be on your best behaviour during an uncomfortable lunch with racist grandparents. Or something like that. But you’ve been slugging along, doing something mentally difficult, and now you feel tired. Although sometimes people want to sleep after this, a lot of the time people really just want to take a break. You want to check Facebook, eat something, laze around at your house. That’s not the same thing as being sleepy, since you aren’t craving sleep, but people still refer to it as feeling 'mentally tired'. Researchers in this field are converging around this being caused by shifting motivations. Basically, it’s good to spend some of your time doing things that you have to do, and some time doing things that you want to do. Someone in the thread mentioned something about the brain running low on glucose … that was an earlier theory, that has been pretty thoroughly dismissed. The quantities of glucose that your brain uses doing difficult math problem sets is less than you use walking around, but 10 minutes of intense math can make you crave Facebook much more than 10 minutes of walking. Glucose is also sent to your brain pretty darn quickly, so running out of brain “fuel” is not an issue. You can get rid of this type of fatigue by taking a sufficient break, preferably doing something that you enjoy doing! Meditation (as someone posted) has been shown to rejuvenate people, as has prayer, youtube videos, smoking cigarettes, reminding yourself about your values... the list goes on! </p>
<p>A third type of mental exhaustion, that was also mentioned in passing, is an attentional habituation. If you do a single task for an extended period of time, your brain start to attend less to the relevant information in the task. (Interestingly, doing a mentally taxing task not only makes you attend less to task-relevant information like the math question, but increases your attention to rewarding stimuli like food and comfortable chairs, which seems to support the above idea of a 'trading off' of motivations). At least one paper has differentiated between this habituation type of fatigue and the previous fatigue (last paragraph), but they still might be overlapping in many contexts.\"</p>" })

eli5_7 = Activity.create({ title: "ELI5: How can Roman bridges be still standing after 2000 years, but my 10 year old concrete driveway is cracking?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/362pru/eli5_how_can_roman_bridges_be_still_standing/", content: "<p><strong>Best answer:</strong></p> <p>\"I'm actually a concrete inspector with a history degree. This might be the only question ever on reddit that I am qualified to answer in authority. Yay! </p>
<p>Before you build a bridge you have to make sure the soil under it can bear the weight, the soil has to be very compact and stable. They had ways of doing this similar to a proctor test and a sand cone testThe ancient Romans being the best civil engineers that history would see for centuries learned it the hard way. This is before science so it was just an ongoing record of learning from past mistakes with knowledge handed down to the next generation. They only built with the best plans, with the best material available. Earthquakes are a big problem in Italy so you have to 'over build' often. That means make something much stronger than necessary every step of the way so that when it's finished it's going to stick around. </p>
<p>They also made sure to pick the best spot for their bridges and would sometimes dig and dig and dig to make sure that if there is bed rock, they'll hit it. </p>
<p>Also, you have to remember that after thousands of years all of the ones who couldn't survive the test of time fell apart. What you're seeing is the ones who could and did. </p>
<p>What you are seeing in your driveway is the cheapest cement on discount at Home depot, poured by the cheapest guys a crooked sub contractor tricked into working in terrible conditions regardless of the untested soil.\"</p>" })

eli5_8 = Activity.create({ title: "ELI5: Why are humans so bad at growing teeth?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3g4z79/eli5_why_are_humans_so_bad_at_growing_teeth/", content: "<p><strong>Best answer:</strong></p> <p>\"Unlike most animals, human diets have undergone a relatively rapid change in a relatively short period of time. Take an animal species and you're looking a creature that's been eating the same general diet for the last...million years or so. </p>
<p>Take humans, however, and our diets have changed drastically in the past...tens of thousand years, which in evolutionary terms is break-neck speeds. We've gone from diets heavy in fibrous plant materials, which are tough and require a lot of chewing to fully utilize, to being able to eat an entire meal through a straw. Basically our early, early, early ancestors had to chew on really tough, hard foods. These required large jaws with lots of teeth in order to get more energy out of. </p>
<p>As our diets got softer, our ancestors could get away with smaller jaws - which required less energy to grow and use. Using less energy while still acquiring the same amount in your diet as your large-jawed brethren = advantage. </p>
<p>So our species have evolved much smaller jaws in a very short order of time...and basically these problems are issues left for us to deal with thanks to this rapid evolution of cramming a lot teeth into a smaller space. Were it not for dental medicine, for example, people born without (or fewer) wisdom teeth might have an evolutionary advantage and wisdom teeth could've been weeded out over a few thousands years. I, for example, only had three wisdom. If that had given me an advantage, then my children would likely have had only three and so on and so forth.\"</p>" })

eli5_9 = Activity.create({ title: "ELI5: Why is Australia full of poisonous creatures, but New Zealand has surprisingly few of them?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/3gg3cx/eli5_why_is_australia_chokefull_of_poisonous/", content: "<p><strong>Best answer:</strong></p> <p>\"As many have mentioned, New Zealand separated from Australia about 60-85 million years ago. The expanse of water between them had completely isolated New Zealand&#39;s ecosystem. Now what&#39;s interesting is what happened afterwards.</p>
<p>As you may know, New Zealand is a very volcanically active place. In fact the largest known eruption in the past 70,000 years originated in the Taupo Volcanic Zone in New Zealand around 24,000 BC. We know of eruptions that were even larger: one the same size as Yellowstone&#39;s largest eruption, except it was only 250,000 years ago! And these are just the ones we know about!</p>
<p>Now, before humans arrived, New Zealand had a very strange ecosystem. We have very few native mammals - bats, whales, dolphins and seals are all we&#39;ve got. Otherwise, New Zealand was populated by birds, fish, some insects, geckos and a few frogs. Because of its isolation, and the lack of predatory mammals, birds were the kings of the food chain. This allowed them to evolve into predatory animals themselves, in a way that wasn&#39;t seen anywhere else.</p>
<p><a href='https://upload.wikimedia.org/wikipedia/commons/2/2d/Giant_Haasts_eagle_attacking_New_Zealand_moa.jpg'>Here is an artist&#39;s impression</a> of the Moa (right) and the Haast&#39;s Eagle (left). <a href='https://upload.wikimedia.org/wikipedia/commons/8/87/Dinornithidae_SIZE_01.png'>This image</a> can help you understand the scale of these creatures (compare to number 4). These animals were able to evolve to such huge sizes because there were no mammals to &#39;fill&#39; that niche. There are also hundreds of other bird species that dominated the New Zealand forest.</p>
<p>You may see where I&#39;m going with this. However, before you jump the gun, realise that the following idea hasn&#39;t been proven and is only discussed theoretically. But the idea is this: millions of years ago, New Zealand did have many native mammals. This is because the land was at one point connected to the rest of the world, and so must have had the same animals. However, some time in the past 30 million years, a giant volcanic eruption destroyed all life on the subcontinent, save a few invertebrates and one reptile - the <a href='https://en.wikipedia.org/wiki/Tuatara'>Tuatara</a> (they call it the living dinosaur).</p>
<p>Once this extinction level event occurred, the ash settled to create a fertile volcanic soil that would lay the foundation for New Zealand&#39;s flora. After a few hundred thousand years, New Zealand became a bountiful land with very few species to take advantage of it. Mammals couldn&#39;t walk here, but birds could fly. So they did, bringing with them the seeds of trees, bushes and grasses from distant continents. </p>
<p>These new vegetative species flourished in the mineral-rich ground, and as forests sprung up birds migrated to the area, along with anything else that could fly or swim (bats, butterflies, fish, etc.). And so over the next several million years this ecosystem developed into one of the most unique on the planet - one free of predatory mammals, dangerous reptiles and venomous insects, and one full of colourful (and sometimes <a href='http://activeadventures.com/images/content/New_Zealand/Kiwi-bird-page.jpg'>not so colourful</a>) birds, land-averse mammals and beautiful, lush flora.</p>
<p><strong>TL;DR:</strong> After splitting from the rest of the world, a giant supervolcano explosion destroyed almost all life on the subcontinent. This eruption created ideal conditions for a land full of forest, which catered to the birds that could fly over here. These birds, isolated from other continents, evolved over time to become the dominant class of animal. Meanwhile, all the dangerous creatures in Australia weren&#39;t able to cross the Tasman sea, leaving New Zealand peaceful and murder-free.</p>
<p><strong>STILL TL;DR:</strong> Big boom kill the bad animals.</p>
<p>Source: I live in the aforementioned volcanic zone, and have been to a few museums with this information.\"</p>" })

eli5_10 = Activity.create({ title: "ELI5: How could Germany lose 2 wars and become one of the wealthiest countries in 80 years?", content_type: "text", completion_time: 10, link: "https://www.reddit.com/r/explainlikeimfive/comments/2mp3qh/eli5_how_could_germany_in_a_span_of_80_years/", content: "<p><strong>Best answer:</strong></p> <p>\"This is a really huge question, but I&#39;ll try and be brief. There are a couple of things to keep in mind about Germany; it is one of the largest and most populated states in Western Europe, and it has had a very strong industrial base for many many years.</p>
<p>After WWI, Germany was in pretty bad shape. It owed a ton of money in war reperations. This issue was dealt with by the Nazis basically just refusing to pay them.</p>
<p>More importantly though, Germany might have lost the war, but even the winners were in really rough shape. No one was willing to stand up to the Nazis until it was too late. When they started to remilitarize, no one stepped up because they either thought that the lot they were dealt in WW1 was too harsh, or because they were too war-weary to care. When Germany started to absorb parts of its neighbors, it was justified by claiming that it was done either to protect German nationals, or because the Germans had been invited to do it (which is partly true in some cases). </p>
<p>Further, once WW2 started, the Germans had a couple big benefits. Most of their immediate neighbors were too weak to do much, France and Britain wanted to avoid bloodshed. When they invaded Poland, they got help from the Soviet Union. Once the war really got underway, France folded almost immediately, and the British were pushed off of the continent not long after. France was gone, Britain was technically still at war but couldn&#39;t mount an offensive, Italy was an ally, America, Spain, and the USSR were neutral, and much of Central Europe was already under Nazi control. They were able to take most of Europe without much of a fight. </p>
<p>Helping matters even more, Germany benefited from having some pretty revoltionary tactics, scientists, and equipment. In particular, the Germans wrote the book on blitzkrieg and tank warfare, which proved instrumental.</p>
<p>After they lost the war, the country was split into four administrative zones, occupied by the Americans, British, Soviets, and French. The American, British, and French zones were evnetually consolidated to become the country of West Germany, while the Soviet zone became East Germany. The Western Powers poured a ton of resources into rebuilding West Germany and getting them back up to speed (so that they could help fight the Soviets in the event of WW3). Since they&#39;re still one of the biggest and most industrial states in Europe, it&#39;s only natural that they&#39;ve had a strong economy ever sense.\"</p>" })

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

# Populate the databse via external APIs
# TODO: UNCOMMENT THESE
#Activity.populate_database_with_news() # add news articles to the database
#Activity.populate_database_with_videos() # add videos with various interests to the database

