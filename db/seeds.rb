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
eli5_interest = Interest.create({ name: "Explain it like I'm 5" })
history_interest = Interest.create({ name: "History" })


user1_interests = [news_interest, fitness_interest]
user2_interests = [science_interest, technology_interest, news_interest, fitness_interest]
interests = user1_interests + user2_interests


# SET UP ACTIVITIES
# template: { title: "", content_type: "", completion_time: 0, link: "", content: "" }

# FITNESS ACTIVITIES
fitness_1 = { title: "10 Minute Abs", content_type: "video", completion_time: 10, link: "https://www.youtube.com/watch?v=1919eTCoESo", like_count: 0}


fitness_2 = { title: "The Supp That Can Amp Muscle Stamina", content_type: "text", completion_time: 43, link: "http://www.mensfitness.com/nutrition/what-to-eat/supp-can-amp-muscle-stamina", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


fitness_3 = { title: "The Best Kept Secrets In Fitness", content_type: "video", completion_time: 9, link: "https://www.youtube.com/watch?v=aE05bn786gE", like_count: 0 }


fitness_4 = { title: "Get Fit, Fast: Your 30-Minute Workout Plan!", content_type: "text", completion_time: 30, link: "http://www.bodybuilding.com/fun/get-fit-fast-your-30-minute-workout-plan.html", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


fitness_5 = { title: "45-Minute Printable Cardio-and-Tonight Workout", content_type: "text", completion_time: 45, link: "http://www.popsugar.com/fitness/45-Minute-Gym-Plan-Treadmill-26564524", content: "Lorem ipsum dolor sit amet, mea et omnis pertinacia. Suavitate explicari aliquando has te. Est ea docendi repudiandae, essent numquam vocibus at duo, minim putant nam te. Erant nostrum similique no eam, quod malis utroque te vel, usu recusabo corrumpit eu.

Homero mucius vulputate ex qui. Quot soleat intellegam nec et, democritum assueverit disputationi te vel. Vim ad amet pericula appellantur, ut mel partem sapientem principes. Ne nam etiam recusabo, nullam legendos eos ad. Nam id vocent convenire.

Idque minim percipitur te est. Vero ullum legere te vel, cum an modus nonumes. Graecis mandamus at mea, eam id officiis expetenda. Pro modus harum ea. In alia utroque intellegebat sit, case voluptua assentior est ne.

Sed cu vivendo concludaturque. An est appellantur adversarium, qui graece ocurreret an, quando fastidii salutandi vix ne. Vis falli elitr appellantur ut, has at dicta dissentiet interpretaris. Te pro novum libris evertitur, vide tritani te vis. An adipisci partiendo pri. Ne per verear commodo accommodare, rebum possit nec ei, cum id maiorum expetendis reprimique. Tale splendide vis id, no vim audire definitiones.

Duo eu viris laudem, quo in appetere expetenda. Quidam voluptatum eos te, dolorem suscipit no sed, et vel iudico corpora. His cotidieque voluptatibus et, ut sed patrioque vulputate. Id vis nostrud constituam, no eum enim atqui, sit ad vero reque.", like_count: 0 }


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

# Test