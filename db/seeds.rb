# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
include Sprig::Helpers

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/#{file_name}"))
end

# path = Rails.root.join('db', 'seeds', "#{Rails.env}.rb")
# load path if File.exist?(path)
#
# categories = Category.create([{ name: 'Circus' },
#                                 { name: 'Crossfit' },
#                                 { name: 'Dance' },
#                                 { name: 'Gymnastics' },
#                                 { name: 'Parkour' }
#                                ])

Circus = Category.find_by name: 'Circus'
Crossfit = Category.find_by name: 'Crossfit'
Dance = Category.find_by name: 'Dance'
Gymnastics = Category.find_by name: 'Gymnastics'
Parkour = Category.find_by name: 'Parkour'

#Google template
=begin
=resources = Resource.create({ name:'" & $A2 & "',
                              website: '" & $C2 & "',
                              facebook: '" & $I2 & "',
                              instagram: '" & $J2 & "',
                              logo: seed_image('" & $J2 & "'),
                              twitter: '" & $K2 & "',
                              desc: '" & $H2 & "',
                              postcode: '" & $D2 & "',
                              category: [" & $B2 & "],
                      		  approved: " & $L2 & "
                            })
=end

resources = Resource.create({ name:'Gravity Circus',
                              website: 'http://gravitycircuscentre.com/',
                              facebook: 'Gravity-Circus-Centre',
                              instagram: '',
                              logo: seed_image('gravity-circus-centre-medium.png'),
                              twitter: 'gravityccentre',
                              desc: 'A London based circus training centre offering Aerial & circus training classes for professional & kids. Training available & private hire.',
                              postcode: 'E10 7QZ',
                              category: [Circus],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'National Centre for Circus Arts ',
                              website: 'https://www.nationalcircus.org.uk/',
                              facebook: 'NationalCentreforCircusArts',
                              instagram: 'nationalcircus',
                              logo: seed_image('national-circus-medium.png'),
                              twitter: 'nationalcircus',
                              desc: 'The National Centre for Circus Arts is a registered charity and one of Europe’s leading providers of circus education.',
                              postcode: 'N1 6HD',
                              category: [Circus],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Aircraft Circus',
                              website: 'http://aircraftcircus.com',
                              facebook: 'AirCraftCircus',
                              instagram: '',
                              logo: seed_image('aircraft-circus-medium.png'),
                              twitter: 'AirCraftCircus',
                              desc: 'AirCraft Circus is South London''s best circus training facility, offering courses and workshops to help you get fit through circus skills.',
                              postcode: 'SE18 5NR',
                              category: [Circus],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Flying Fantastic',
                              website: 'http://www.flyingfantastic.co.uk',
                              facebook: 'flyingfantastic1',
                              instagram: '',
                              logo: seed_image('flying-fantastic-medium.png'),
                              twitter: 'FlyingFantastic',
                              desc: 'London''s brand new aerial fitness centre based at the Wilditch Centre in Battersea. Classes for all levels - no experience necessary!',
                              postcode: 'SW11 5BB',
                              category: [Circus],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'London Academy of Pole Dancing',
                              website: 'http://www.laphq.co.uk/',
                              facebook: 'LAPHQ/',
                              instagram: 'londondanceacademy',
                              logo: seed_image('laphq-medium.png'),
                              twitter: '',
                              desc: 'The London Academy of Poledancing is London''s premium pole dancing company.  We offer training at over 15 venues throughout Greater London.  Our instructors all have formal dance and fitness qualifications as well as extensive pole dancing experience.',
                              postcode: 'EC1V 8AB',
                              category: [Circus],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'London Dance Academy',
                              website: 'http://londondanceacademy.laphq.co.uk',
                              facebook: 'LAPHQ/',
                              instagram: 'londondanceacademy',
                              logo: seed_image('london-dance-academy-medium.png'),
                              twitter: '',
                              desc: 'LDA is a new dance studio right in the middle of the City, just 5 mins walk from Old Street & Barbican.',
                              postcode: 'EC1V 8AB',
                              category: [Circus],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'École de Pole',
                              website: 'http://www.ecoledepole.co.uk',
                              facebook: 'ecoledepole',
                              instagram: 'ecoledepole',
                              logo: seed_image('ecoloe-de-pole-medium.png'),
                              twitter: 'ecoledepole',
                              desc: 'École de Pole (London) delivers the most elite pole dancing tuition available, keeping groups very small with a max of 2 per pole to ensure your goals, whether fitness related or as a performer are reached and exceeded. ',
                              postcode: 'NW1 9JX',
                              category: [Circus],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'My Aerial Home',
                              website: 'http://www.myaerialhome.co.uk',
                              facebook: 'MyAerialHome',
                              instagram: '',
                              logo: seed_image('my-aerial-home-medium.png'),
                              twitter: '',
                              desc: 'My Aerial Home - aerial & circus inspired classes for beginners & improvers. Intensive courses for professional development. ',
                              postcode: 'SE26 4PR',
                              category: [Circus],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Stratford Circus',
                              website: 'https://stratford-circus.com/classes/',
                              facebook: 'stratfordcircus1',
                              instagram: '',
                              logo: seed_image('stratford-circus-medium.png'),
                              twitter: 'StratfordCircus',
                              desc: 'Performing arts centre in Stratford, East London. A hub for imagination, developing local talent, bringing our community together with world-class artists.',
                              postcode: 'E15 1BX',
                              category: [Circus],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Dance London',
                              website: 'http://www.dance-london.com',
                              facebook: 'dancelondonuk',
                              instagram: 'dancelondonuk',
                              logo: seed_image('dance-london-medium.png'),
                              twitter: 'dancelondonuk',
                              desc: 'An inclusive community for all dancers and courses for international dancers.',
                              postcode: 'SE1',
                              category: [Circus],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Crossfit Centrol London',
                              website: 'http://crossfitcentrallondon.co.uk/',
                              facebook: 'CFCentralLondon',
                              instagram: '',
                              logo: seed_image('crossfit-cental-london-medium.png'),
                              twitter: 'cfcentrallondon',
                              desc: 'At CrossFit Central London, the training happens in small groups, with expert coaches and a high coach to student ratio. The positive, encouraging atmosphere feeds the sense of community you get when people share in the challenges and triumphs.',
                              postcode: 'SE1 0NR',
                              category: [Crossfit],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Reebok CrossFit Thames',
                              website: 'http://crossfitthames.com/',
                              facebook: 'thamescrossfit',
                              instagram: '',
                              logo: seed_image('reebok-crossfit-thames-medium.png'),
                              twitter: 'crossfitthames',
                              desc: 'Providing world class fitness in Canary Wharf, London',
                              postcode: 'E14 4AS',
                              category: [Crossfit],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'CrossFit Vauxhall',
                              website: 'http://crossfitvauxhall.co.uk/',
                              facebook: 'CrossfitVauxhall',
                              instagram: '',
                              logo: seed_image('crossfit-vauxhall-medium.png'),
                              twitter: 'cfvauxhall',
                              desc: 'At CrossFit Vauxhall, the training happens in small groups, with expert coaches and a high coach to student ratio. The positive, encouraging atmosphere feeds the sense of community you get when people share in the challenges and triumphs.',
                              postcode: 'SW8 1RZ',
                              category: [Crossfit],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Crossfit 1971',
                              website: 'http://crossfit1971.com/',
                              facebook: 'crossfit1971',
                              instagram: 'crossfit1971',
                              logo: seed_image('crossfit-1971-medium.png'),
                              twitter: 'crossfit1971',
                              desc: 'East London''s premiere crossfit facility only 5 mins walk from Stratford station.',
                              postcode: 'E15 2JE',
                              category: [Crossfit],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'CrossFit Performance 360',
                              website: 'http://www.p360uk.com',
                              facebook: 'Performance360-246350145485231',
                              instagram: '',
                              logo: seed_image('crossfit-performance-360-medium.png'),
                              twitter: 'p360uk',
                              desc: 'We offer a variety of classes seven days a week – including CrossFit, Olympic Lifting and Brazilian Jiu Jitsu. ',
                              postcode: 'SE19 3RW',
                              category: [Crossfit],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Crossfit SE11',
                              website: 'http://crossfitse11.com',
                              facebook: 'crossfitse11',
                              instagram: 'crossfitse11',
                              logo: seed_image('crossfit-SE11-medium.png'),
                              twitter: 'CrossFit',
                              desc: '',
                              postcode: 'SE11 5EQ',
                              category: [Crossfit, Gymnastics],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Crossfit London',
                              website: 'http://crossfitlondonuk.com',
                              facebook: 'crossfitlon.UK',
                              instagram: 'crossfitlondon',
                              logo: seed_image('crossfit-london-medium.png'),
                              twitter: 'crossfitlondon',
                              desc: 'London''s first CrossFit affiliate and home to the City''s top strength, conditioning and CrossFit coaches. ',
                              postcode: 'E2 0EU',
                              category: [Crossfit, Gymnastics],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Pineapple',
                              website: 'http://www.pineapple.uk.com',
                              facebook: 'pineappledance',
                              instagram: 'pineappledancestudios',
                              logo: seed_image('pineapple-medium.png'),
                              twitter: 'pineappledance',
                              desc: 'Indulge your passion for dance at Europe''s Premier Dance Studios in the Heart of London''s West End. Whether you are a beginner or a Principal Artist, you will find a suitable class to suit your needs. Open Studio Classes Every Day of the Week.
',
                              postcode: 'WC2H 9JA',
                              category: [Dance],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Husky Studio',
                              website: 'http://www.huskystudios.co.uk',
                              facebook: 'huskystudiosLDN',
                              instagram: '',
                              logo: seed_image('husky-studio-medium.png'),
                              twitter: 'huskystudiosLDN',
                              desc: 'With the studios now in their 36th year at the vibrant and regenerated, Elephant & Castle (Zone 1), Husky rehearsal rooms and dance studios are one of the largest rehearsal studios in Central London, offering unbeatable value.',
                              postcode: 'SE17 3PY
',
                              category: [Dance],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Dancework',
                              website: 'http://danceworks.net ',
                              facebook: 'danceworksw1',
                              instagram: 'danceworkslondon',
                              logo: seed_image('dancework-medium.png'),
                              twitter: 'danceworks1',
                              desc: 'Dance passion in the heart of London. Drop-in classes for everyone, every day.',
                              postcode: 'W1K 6TN',
                              category: [Dance],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Studio68',
                              website: 'http://www.studio68london.net',
                              facebook: 'studio68london',
                              instagram: 'studio68london',
                              logo: seed_image('studio68-medium.png'),
                              twitter: 'studio68london',
                              desc: 'Studio 68 London is a multimedia solution centre providing an array of services including dance classes, studio hires, and much more.',
                              postcode: 'SE1 0NR
',
                              category: [Dance],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'The Place',
                              website: 'http://www.theplace.org.uk/',
                              facebook: 'theplace',
                              instagram: '',
                              logo: seed_image('the-place-medium.png'),
                              twitter: 'ThePlaceLondon',
                              desc: 'The UK''s premier centre for contemporary dance. Home to London Contemporary Dance School and Richard Alston Dance Company.
',
                              postcode: 'WC1H 9PY',
                              category: [Dance],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Greenwich ',
                              website: 'http://www.greenwichdance.org.uk/',
                              facebook: '',
                              instagram: '',
                              logo: seed_image('greenwich-medium.png'),
                              twitter: 'GreenwichDance',
                              desc: 'Greenwich Dance Agency provides dance classes for all abilities. Located in historical Greenwich. South East London, UK.',
                              postcode: 'SE10 8RE',
                              category: [Dance],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Southwark Gymnastics Club',
                              website: 'http://southwarkgymnastics.co.uk',
                              facebook: 'SouthwarkGymnasticsClub',
                              instagram: 'southwarkgymnasticsclub',
                              logo: seed_image('southwark-gymnastics-club-medium.png'),
                              twitter: 'southwarkgym',
                              desc: 'SGC is a Community based Gymnastics Club based in South East London. We offer classes for 4 years to 99 years old both recreational and competitive based.
',
                              postcode: 'SE5 8TS',
                              category: [Gymnastics],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Parkour Generations',
                              website: 'http://parkourgenerations.com',
                              facebook: 'parkourgenerations',
                              instagram: 'ParkourGenerations',
                              logo: seed_image('parkour-generations-medium.png'),
                              twitter: 'PKGenerations',
                              desc: 'Parkour Generations is the world''s largest professional organisation and community for the stunning movement discipline known as Parkour or Freerunning. ',
                              postcode: 'E14 0JY',
                              category: [Parkour],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'The Chainstore Gym & Parkour Academy - Parkour Generations',
                              website: 'http://parkourgenerations.com/chainstore/facilities/',
                              facebook: 'parkourgenerations',
                              instagram: 'ParkourGenerations',
                              logo: seed_image('parkour-generations-medium.png'),
                              twitter: 'PKGenerations',
                              desc: 'Parkour Generations is the world''s largest professional organisation and community for the stunning movement discipline known as Parkour or Freerunning. ',
                              postcode: 'E14 0JY',
                              category: [Parkour],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'3Run Evolution Academy',
                              website: 'http://www.3run.co.uk/academy/',
                              facebook: '3RUNTEAM',
                              instagram: '',
                              logo: seed_image('3run-evolution-academy-medium.png'),
                              twitter: '3run_official',
                              desc: '3RUN - Parkour and FreeRunning performance team',
                              postcode: 'RG21 6XR
',
                              category: [Parkour],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Paramount Parkour Academy',
                              website: 'http://paramountparkour.com',
                              facebook: 'ParamountParkour',
                              instagram: '',
                              logo: seed_image('paramount-parkour-academy-medium.png'),
                              twitter: 'Paramountpk',
                              desc: 'Paramount Parkour Academy  (The UKs first dedicated indoor Parkour gym built in January 2013) Provides a safe and controlled environment that people can practise the art Parkour and Free Running.',
                              postcode: 'MK10 0BA',
                              category: [Parkour],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'LEAP',
                              website: 'http://parkourgenerations.com/chainstore/leap/',
                              facebook: '',
                              instagram: '',
                              logo: seed_image('parkour-generations-medium.png'),
                              twitter: '',
                              desc: '',
                              postcode: 'E14 0JY',
                              category: [Parkour],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Free Move',
                              website: 'http://www.freemove.co.uk ',
                              facebook: '',
                              instagram: '',
                              logo: seed_image('freemove-medium.png'),
                              twitter: 'FreemoveUK',
                              desc: 'Freemove are a leading provider of pre-fabricated and bespoke Parkour Training Facilities.',
                              postcode: 'TW20 8PG',
                              category: [Parkour],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'North London Street Dance Academy',
                              website: 'http://www.nlsda.co.uk/',
                              facebook: 'northlondonstreetdanceacademy',
                              instagram: 'northlondonstreetdanceacademy',
                              logo: seed_image('north-london-street-dance-medium.png'),
                              twitter: 'nslda1',
                              desc: 'The North London Street Dance Academy is getting bigger and better as we enter in to our 5th year.
',
                              postcode: 'EN2 0NQ',
                              category: [Dance],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'Tropicana Dance School',
                              website: 'http://www.tropicanadanceschool.com/',
                              facebook: 'tropicanadanceschool',
                              instagram: '',
                              logo: seed_image('tropicana-dance-school-medium.png'),
                              twitter: 'TropicanaDanceS',
                              desc: 'TROPICANA DANCE SCHOOL teaches a mixture of Cuban, Colombian and Puertorican styles of salsa for all levels.
',
                              postcode: '',
                              category: [Dance],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'Salsateca',
                              website: 'http://www.salsateca.co.uk/',
                              facebook: 'salsatecadanceschool',
                              instagram: '',
                              logo: seed_image('salsateca-dance-school-medium.png'),
                              twitter: 'SalsatecaLondon',
                              desc: 'SALSATECA Dance School is a Latin American-dance school in London.',
                              postcode: '',
                              category: [Dance],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'Young Dancers Academy and West London School of Dance',
                              website: 'http://www.westlondonschoolofdance.co.uk/',
                              facebook: 'Young-Dancers-Academy-and-West-London-School-of-Dance-338598709526848',
                              instagram: '',
                              
                              twitter: '',
                              desc: 'The YDA was set up in 2006 by Anna du Boisson and Kerry Williams and is affiliated to the WLSD (a non-vocational school directed by Anna du Boisson)',
                              postcode: 'W12 8AR
',
                              category: [Dance],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'Crossfit Aldgate',
                              website: 'http://crossfitaldgate.com/',
                              facebook: 'crossfitaldgate',
                              instagram: 'crossfit_aldgate',
                              logo: seed_image('crossfit-aldgate-medium.png'),
                              twitter: 'crossfitaldgate',
                              desc: 'CrossFit Aldgate brings the global CrossFit sensation into the heart of the City of London.',
                              postcode: 'EC3A 7BT',
                              category: [Crossfit],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'CrossFit Evolving',
                              website: 'http://www.crossfitevolving.com/',
                              facebook: 'CrossFitEvolving',
                              instagram: 'crossfitevolving',
                              logo: seed_image('crossfit-evolving-medium.png'),
                              twitter: 'crossfitevolvin',
                              desc: 'CrossFit Evolving is an established North London CrossFit affiliated training facility',
                              postcode: 'N7 8HS',
                              category: [Crossfit],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'London Gymnastics',
                              website: 'https://www.british-gymnastics.org/london',
                              facebook: 'LondonGymnastics',
                              instagram: 'londongymnastics',
                              logo: seed_image('london-gymnastics-medium.png'),
                              twitter: 'londongymnastic',
                              desc: 'London Gymnastics provides the structure for Gymnastics in the London region. It develops membership, coaching and events, research information about the different gymnastic disciplines.',
                              postcode: 'TF10 9NB
',
                              category: [Gymnastics],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'Elite Gymnastics Club',
                              website: 'http://www.elite-gymnastics.co.uk/',
                              facebook: 'Elite-Gymnastics-Club-195481340583763',
                              instagram: '',
                              logo: seed_image('elite-gymnastics-club-medium.png'),
                              twitter: '',
                              desc: '',
                              postcode: '',
                              category: [Gymnastics],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'Flair Gymnastics',
                              website: 'http://www.ukflair.com/',
                              facebook: 'ukflair',
                              instagram: '',
                              logo: seed_image('flair-gymnastics-medium.png'),
                              twitter: 'ukflair',
                              desc: 'Leading Surrey & UK Gymnastics Clubs, offering fun and exciting classes for all ages and abilities.',
                              postcode: 'GU9 7QQ',
                              category: [Gymnastics],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'Jamies Gymnastics Academy',
                              website: 'http://www.jamiesgymnasticsacademy.co.uk/',
                              facebook: 'jga86',
                              instagram: '',
                              logo: seed_image('jamies-gymnastic-a-medium.png'),
                              twitter: 'jamiesgym86',
                              desc: 'We are the original and largest network for part time recreational gymnastics in South East London with over 3000 members in 75 locations each week.',
                              postcode: '',
                              category: [Gymnastics],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'East London Gym',
                              website: 'http://www.eastlondongym.co.uk/',
                              facebook: 'elgadults',
                              instagram: '',
                              logo: seed_image('east-london-gym-medium.png'),
                              twitter: 'eastlondongym',
                              desc: '',
                              postcode: 'E6 5LW',
                              category: [Gymnastics],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'Blaze Gymnastics UK',
                              website: 'http://www.blazegymnastics.co.uk/',
                              facebook: 'blazegymuk',
                              instagram: '',
                              logo: seed_image('blaze-gymnastics-uk-meduim.png'),
                              twitter: 'blazegymuk',
                              desc: 'Blaze Gymnastics currently caters for general Floor and Vault and recreational gymnastics.
',
                              postcode: 'SW17 8HE',
                              category: [Gymnastics],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'Aspire GYmnastics Academy',
                              website: 'http://www.aspiregymnastics.com/',
                              facebook: 'Aspire-GYmnastics-Academy-506498729414414',
                              instagram: '',
                              logo: seed_image('aspire-gymnastics-academy-medium.png'),
                              twitter: '',
                              desc: 'Aspire Gymnastics Academy is a gymnastics club based in the London Borough of Havering. Aspire caters for recreational beginners through to National Squad levels.',
                              postcode: 'RM12 4AJ',
                              category: [Gymnastics],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'Parkour UK',
                              website: 'http://www.parkouruk.org/',
                              facebook: 'ParkourUK',
                              instagram: '',
                              logo: seed_image('parkour-uk-medium.png'),
                              twitter: 'ParkourUK',
                              desc: 'Established by some of the most experienced practitioners and coaches of the discipline of parkour/freerunning in the world and the City of Westminster, Parkour UK is the National Governing Body for the rapidly growing discipline and works in partnership with various organisations and other agencies to develop and spread parkour across the UK.',
                              postcode: 'SW1H 0QT',
                              category: [Parkour],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'SingleBound',
                              website: 'http://www.singlebound.co.uk/',
                              facebook: 'SingleBoundCoaching',
                              instagram: '',
                              logo: seed_image('singlebound-medium.png'),
                              twitter: 'sbounduk',
                              desc: 'A group of dedicated Traceurs and Martial Artists offering Parkour and Martial Arts sessions in Leeds, Lincoln, Wakefield, G-bro and the surrounding areas.',
                              postcode: '',
                              category: [Parkour],
                                        approved: FALSE
                            })
resources = Resource.create({ name:'Trinity Laban Conservatoire of Music and Dance',
                              website: 'http://www.trinitylaban.ac.uk/',
                              facebook: 'trinity.laban',
                              instagram: '',
                              logo: seed_image('trinity-laban-conservatoire-of-music-and-dance-medium.png'),
                              twitter: 'trinitylaban',
                              desc: 'Trinity Laban Conservatoire of Music and Dance is the UK’s only conservatoire of music and contemporary dance.',
                              postcode: 'SE10 9JF',
                              category: [Dance],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Rambert School of Ballet and Contemporary Dance',
                              website: 'http://www.rambertschool.org.uk/',
                              facebook: 'Rambert-School-of-Ballet-and-Contemporary-Dance-127864160561762',
                              instagram: 'rambertschool',
                              logo: seed_image('rambert-school-of-ballet-and-contemporary-dance-medium.png'),
                              twitter: '',
                              desc: 'Rambert School, since its first incarnation under Marie Rambert more than ninety years ago, has been associated with a reflective, innovative and individualised approach to teaching, learning and making dance. The School continues and cherishes this tradition.',
                              postcode: 'TW1 1QN
',
                              category: [Dance],
                                        approved: TRUE
                            })
resources = Resource.create({ name:'Jackson Lane',
                              website: 'http://www.jacksonslane.org.uk',
                              facebook: 'jacksonslane',
                              instagram: 'jacksons_lane',
                              logo: seed_image('jacksons-lane-medium.png'),
                              twitter: 'jacksons_lane',
                              desc: 'Jacksons Lane is a multi-arts venue in Highgate North London. Housed in a striking red-bricked gothic church conversion, the building is home to a 160 capacity theatre, a large scale dance and rehearsal studio a cafe and bar and four other multi-purpose spaces.',
                              postcode: 'N6 5AA',
                              category: [Circus],
                                        approved: TRUE
                            })

=begin
user1 = User.find_or_initialize_by(email: 'nfelix@gmail.com', first_name: 'Felix', last_name: 'Ng', is_admin: true, encrypted_password: 'Idontknow')

auth = Authentication.find_or_initialize_by(user: user1,
                                            provider: 'Facebook',
                                            proid: '10156275788830526',
                                            token: 'CAAWhOUEm27EBAKtcU47e9ZBwpZC5zvcKyv67DPmHuxgfPMyJuW2BAnyoWD6q0YC4klTWEfhdM2eES3kTm5sZAPyqtIUWfZBueNLOn29X5lgG1CdNngLqgXVV8agKldewsFisESLOS21sF3yAUOaenYfU4vXVyzZA65Se9BMW3Bu5VryTZAoiJyf3uZCiv1qEnMZD')

user1.save!
=end

=begin
Google = {
    :class  => Resource,
    :source => open('https://spreadsheets.google.com/feeds/list/1p_57ky6F0791RZd0baSSBI9wuqs1hydLydEPs5ANlYE/1/public/values?alt=json'),
    :parser => Sprig::Parser::GoogleSpreadsheetJson,
    :option => find_existing_by['name']
}

sprig [
          Google
      ]
=end

