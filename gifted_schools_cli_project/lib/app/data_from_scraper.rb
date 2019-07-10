# class GiftedSchoolsCLIProject::DataFromScraper
# attr_accessor :name, :description, :more_info_url, :email_address, :phone_number, :city, :state, :type, :learning_profile, :levels, :grades, :webpage

# @@all_schools = []

# def initialize
#   gifted_school = GiftedSchoolsCLIProject::School.new


#   gifted_school.learning_profile = "Gifted"
#   gifted_school.city = "unknown"  #ideal scraped page would include city name
#   gifted_school.name = school.search('h2.search_link').text
#   gifted_school.description = school.css('p').text
#   gifted_school.more_info_url = school.css('a')[0].attribute('href').value
#   gifted_school.webpage = school.css('a')[1].attribute('href').value

#   gifted_school.type = "Onsite"
#   # In case school is online, run next line of code to change default value of line above
#   gifted_school.type = school.css('span')[2].children.text

#   # !!! TODO: Fix!!!  This is scraping the wrong word sometimes... see Bridges, Bronx, Davidson 
#   #                   schools, Fulton, Illinois Math and Science, Johns Hopkins, etc.
#   gifted_school.state = school.css('span')[3].children[1].text

#   gifted_school.grades = []
#   school.css('span')[1].children.children.each do |el|
#       gifted_school.grades << el.text
# end


#   # @@all_schools = [
#   #   # <GiftedSchoolsCLIProject::School:0x000000000531c158
#   #     @city="unknown",
#   #     @description=
#   #     "AcademyACL is a K-8 public charter school in the Pikes Peak region. They provide an academic home for advanced & creative learning, and a place for unusually advanced, gifted skills to flourish. Their gifted education specialty uses a higher degree of difficulty and more complex curriculum designed for academically gifted learners.",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/academy-for-advanced-and-creative-learning/",
#   #     @name="Academy for Advanced and Creative Learning",
#   #     @state="Colorado",
#   #     @type="School Types: Charter, Gifted, and Public",
#   #     @webpage="http://academyacl.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000054f0a10
#   #     @city="unknown",
#   #     @description=
#   #     "Academy Hill School\u00A0provides an intellectual, principled, creative, and enriching foundation\u00A0for gifted and high-potential students to become the next\u00A0visionaries, innovators, and leaders.",
#   #     @grades=["6-8", "K-5", "Pre-K"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/academy-hill-school/",
#   #     @name="Academy Hill School",
#   #     @state="Massachusetts",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://www.academyhill.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000055131f0
#   #     @city="unknown",
#   #     @description=
#   #     "ACCESS Academy is an alternative, accelerated program for highly gifted students in 1st through 8th grade, located in Portland, Oregon. A vibrant, supportive community of 350 gifted learners, ACCESS Academy provides curriculum acceleration and enrichment options,
#   #   including a flexible program design to meet students\u2019 needs based on ability level rather than chronological age or grade.",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/access-academy/",
#   #     @name="ACCESS Academy",
#   #     @state="Oregon",
#   #     @type="School Types: Gifted and Public",
#   #     @webpage="https://www.pps.net/access">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000005510978
#   #     @city="unknown",
#   #     @description=
#   #     "ACE Academy is a private, independent school for gifted students in Austin, Texas. ACE offers classes for students from three years old through middle school in flexible groupings and combines strong, integrated academic curriculum with a global outlook. They are
#   #   dedicated to bringing gifted students together with one another and with teachers who are passionate about giftedness and creativity.",
#   #     @grades=["6-8", "K-5", "Pre-K"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/ace-academy/",
#   #     @name="ACE Academy",
#   #     @state="Texas",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://austingifted.wpengine.com/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000055822a8
#   #     @city="unknown",
#   #     @description=
#   #     "Anderson School is a small, independent, private school founded in 1995 by Dr. and Mrs. Anderson out of the love for their own children and all gifted children. Since they do not accept government funding, this allows them to create true academic freedom for both
#   #   students and teachers. Based on extensive research into successful education, Anderson School has no traditional grading, no standardized tests, and no traditional homework; although learning after school hours is highly encourage. The goal of enrichment at Anderson School is to produce deep thinkers by redefining the core essence of education.",
#   #     @grades=["6-8", "9-12", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/anderson-private-school/",
#   #     @name="Anderson Private School",
#   #     @state="Texas",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://www.andersonschool.net/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000380a3b0
#   #     @city="unknown",
#   #     @description=
#   #     "ASMSA is one of only sixteen public, residential high schools nationwide which specializes in the education of gifted and talented students who have an interest and aptitude for mathematics and science. Created in 1991 by an act of the Arkansas Legislature, ASMSA
#   #   is one of the nation\u2019s top secondary schools for gifted students. Application is open to any sophomore student who resides in the state of Arkansas. ASMSA offers an innovative and challenging curriculum with courses such as Robotics, Quantum Mechanics, Immunology, Graphic Design, Documentary Films, and Artificial Intelligence. All curriculum is designed to promote creative thinking and problem
#   #   solving.",
#   #     @grades=["9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/arkansas-school-sciences-mathematics-arts/",
#   #     @name="Arkansas School for Sciences, Mathematics, and the Arts",
#   #     @state="Arts",
#   #     @type="School Types: Boarding, Gifted, and Public",
#   #     @webpage="http://www.asmsa.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000558a1b0
#   #     @city="unknown",
#   #     @description=
#   #     "Arroyo Pacific Academy is a four-year private, independent, coeducational, college preparatory high school located in Arcadia, California. It is a learning institution where academic attainment has the highest priority within a learning environment that is supportive and encouraging. Gifted middle school students enrolled at a local school, online school, or who are home-schooled, may apply to take advantage of the Academy\u2019s individual courses, including AP courses.\u00A0 Generally this opportunity is granted only to students whose parents have met with a counselor familiar with gifted student needs, and who have support from their parents and current school.\u00A0 The Academy recognizes the needs of those advanced students who are ready for a greater challenge than the standard grade level content may offer.",
#   #     @grades=["9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/arroyo-pacific-academy-gifted-student-extension-program/",
#   #     @name="Arroyo Pacific Academy Gifted Student Extension Program",
#   #     @state="California",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://www.arroyopacific.org/academics">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003802958
#   #     @city="unknown",
#   #     @description=
#   #     "Assets School serves gifted and capable students specializing in those with dyslexia and other language-based learning differences. They provide a strength-based program, complemented by outreach and training, that empowers students to become effective learners and confident self-advocates.",
#   #     @grades=["6-8", "9-12", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/assets-school/",
#   #     @name="Assets School",
#   #     @state="Twice-Exceptional",
#   #     @type="School Types: Gifted, Private, and Twice-Exceptional",
#   #     @webpage="http://assets-school.net/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000055ddef0
#   #     @city="unknown",
#   #     @description=
#   #     "Assets School provides premier educational services to gifted and dyslexic children by providing model, integrated learning environments and professional outreach programs. They utilize research-based teaching methodologies and resources to provide integrated curriculum and instruction to help students reach their full potential. They provide intensive academic remediation, acceleration and enrichment as well as on-going and continuous counseling services. The average student-to-teacher ratio is 8:1 which allows our faculty to truly focus on the needs of each individual student.",
#   #     @grades=["6-8", "9-12", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/assets-school-2/",
#   #     @name="ASSETS School",
#   #     @state="Twice-Exceptional",
#   #     @type="School Types: Gifted, Private, and Twice-Exceptional",
#   #     @webpage="http://assets-school.net/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000055e7810
#   #     @city="unknown",
#   #     @description=
#   #     "Bayside STEM Academy\u2019s dual focus on STEM (Science, Technology, Engineering and Mathematics) and Design Thinking methodologies positions students and staff on an innovative academic path. Located in San Mateo, CA, \u00A0Bayside serves students 6th through 8th grade and offers a special district GATE program utilizing a cluster model, where a significant cadre of gifted students travel with
#   #   each other throughout the day to most of their classes.",
#   #     @grades=["6-8"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/bayside-s-t-e-m-academy/",
#   #     @name="Bayside S.T.E.M. Academy",
#   #     @state="California",
#   #     @type="School Types: Gifted and Public",
#   #     @webpage="http://bayside.smfcsd.net/  ">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000055e50d8
#   #     @city="unknown",
#   #     @description=
#   #     "Bridges Academy is dedicated to understanding and educating gifted and highly gifted students with learning differences (twice-exceptional or 2e students) and fostering a successful academic and social experience for students and for the broader community through
#   #   work of two divisions: Bridges Academy and The Center for Twice-Exceptional Research and Professional Development (The 2e Center). Located in Studio City, CA, the Academy serves students 4th through 7th grade (The Phoenix Program) and 7th through 12th grade (The Da Vinci Program).",
#   #     @grades=["6-8", "9-12", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/bridges-academy/",
#   #     @name="Bridges Academy",
#   #     @state="Twice-Exceptional",
#   #     @type="School Types: Gifted, Private, and Twice-Exceptional",
#   #     @webpage="http://www.bridges.edu/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000562ee90
#   #     @city="unknown",
#   #     @description=
#   #     "Brightmont Academy offers full-time private school, individual courses, and tutoring. At the center of Brightmont\u2019s personalized learning approach is one-to-one instruction: one highly qualified teacher working with one student throughout every learning session. To foster continual progress, each teaching moment is optimized to accommodate a student\u2019s needs. Brightmont Academy\u2019s approach has been successful for a variety of students, including homeschool, gifted, and 2e students.",
#   #     @grades=["6-8", "9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/brightmont-academy/",
#   #     @name="Brightmont Academy",
#   #     @state="Twice-Exceptional",
#   #     @type="School Types: Gifted, Homeschool, Private, and Twice-Exceptional",
#   #     @webpage="https://www.brightmontacademy.com">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000562c4d8
#   #     @city="unknown",
#   #     @description=
#   #     "Since 1938, The Bronx High School of Science has been one of New York City\u2019s most selective public high schools. BHSS is one
#   #   of 9 specialized high schools located in New York and operated by the New York City Department of Education. Their mission is to provide educational and social opportunities that are unique for gifted and talented students to best prepare them for meaningful and useful roles in science and society. Bronx Science offers a well-rounded curriculum in English, Biology, Physical Science, Mathematics, Social Studies, Foreign Language, The Arts, Technology, Health and Physical Education as well as Advanced Placement, College Level, Honor Courses and an extensive selection of Electives.",
#   #     @grades=["9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/bronx-high-school-science/",
#   #     @name="Bronx High School of Science",
#   #     @state="Science",
#   #     @type="School Types: Gifted and Public",
#   #     @webpage="http://www.bxscience.edu/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000563a6f0
#   #     @city="unknown",
#   #     @description=
#   #     "Located in Denver, Colorado, the Challenge School is a magnet charter school in Cherry Creek School District that exists to inspire, empower and challenge students who are academically advanced or gifted. Through a rigorous academic program, Challenge encourages students to become compassionate and critical thinkers able to communicate their ideas. Challenge classes are primarily grouped by learning or developmental needs rather than by age to best meet the needs of each individual child. Students also work in multi-age groups in Connections, Mini-courses, and Immersion classes. Challenge School serves students Kindergarten through eighth grade.",
#   #     @grades=["6-8", "K-5", "Pre-K"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/challenge-school-denver/",
#   #     @name="Challenge School Denver",
#   #     @state="Colorado",
#   #     @type="School Types: Charter, Gifted, and Magnet",
#   #     @webpage="http://challenge.cherrycreekschools.org/Pages/default.aspx">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000037b6df0
#   #     @city="unknown",
#   #     @description=
#   #     "Housed at the Sterling School in Greenville, South Carolina, the Charles Townes Center is a select program for highly gifted students grades 3-8. The purpose of the Charles Townes Center (CTC) is to provide gifted and talented students with a highly challenging, full-time instructional program that enriches, accelerates, and extends the program of studies in Greenville County Schools. The curriculum in each content area exceeds South Carolina Standards. Differentiation in the depth, breadth, and pace of instruction is designed to challenge the abilities of advanced learners, with strong emphasis on the development of higher order thinking skills.",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/charles-townes-center/",
#   #     @name="Charles Townes Center",
#   #     @state="South Carolina",
#   #     @type="School Types: Gifted and Public",
#   #     @webpage="https://www.greenville.k12.sc.us/sterling/aboutss.asp">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000056968b0
#   #     @city="unknown",
#   #     @description=
#   #     "Cyprus Classical Academy is designed for advanced and gifted children who have the ability to learn beyond the typical school curriculum. Located in Burnsville, Minnesota, Cyprus offers customized and individualized classes and pacing for each student, and each subject is assessed individually. Currently they enroll students in Pre-K through Sixth grade.",
#   #     @grades=["6-8", "K-5", "Pre-K"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/cyprus-classical-academy/",
#   #     @name="Cyprus Classical Academy",
#   #     @state="Minnesota",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://www.cyprusclassicalacademy.com/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000037ab608
#   #     @city="unknown",
#   #     @description=
#   #     "Da Vinci Center began in 2009 in Catherine Cook\u2019s home in Alameda as various members of the gifted community came together to design and create an environment that would truly serve gifted children. Da Vinci Center provides opportunities far beyond the norm of traditional schools. They engage in high level scientific experiments, monthly field trips for exploration, discovery and connection to nature, design and build intricate projects, as well as support low income families with gifted children who need a highly specialized environment.",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/da-vinci-center/",
#   #     @name="Da Vinci Center",
#   #     @state="California",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://ourgiftedchildren.net/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003790c18
#   #     @city="unknown",
#   #     @description=
#   #     "The Davidson Academy offers two educational options for profoundly gifted students \u2013\u00A0 an online high school option (both full-time and single-course enrollments available)\u00A0and a free public day school for middle and high school students. Since 2006, Davidson has offered a unique educational environment for gifted and 2e learners, grouping students not by age but by ability. To attend, students must score in the 99.9th\u00A0percentile on accepted intelligence and/or achievement tests, as well as demonstrate motivation, social and emotional maturity, and an overall readiness for a fast-paced educational environment.",
#   #     @grades=["6-8", "9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/davidson-academy-nevada/",
#   #     @name="Davidson Academy",
#   #     @state="Twice-Exceptional",
#   #     @type="School Types: Gifted, Online, Public, and Twice-Exceptional",
#   #     @webpage="http://www.davidsonacademy.unr.edu/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000037303b8
#   #     @city="unknown",
#   #     @description=
#   #     "E.A. Young Academy is an accredited K-12, not-for-profit private academy dedicated to gifted, talented and high ability scholars in North Richland Hills, Texas. They are passionate about serving the needs of gifted students by providing a creative, challenging and unique learning environment. They believe the essential purpose of education is to empower learners to fully develop their talents and abilities in order to become innovative, problem solving, compassionate stewards of our global community.",
#   #     @grades=["6-8", "9-12", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/e-young-academy/",
#   #     @name="E. A. Young Academy",
#   #     @state="Texas",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://www.eayoungacademy.com/ ">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000349dec0
#   #     @city="unknown",
#   #     @description=
#   #     "Eagle Rock Junior/Senior High School is an International Baccalaureate (IB) World School, located in Eagle Rock, California. ERHS
#   #   serves students in grades 7 \u2013 12 through a comprehensive junior and senior high school, as well as a Magnet program serving gifted, high ability, and highly gifted students in grades 7 \u2013 12. The primary goal of the Magnet program is to provide opportunities
#   #   that meet the needs of the gifted learner which cannot be met in a regular classroom program in the areas of content, pace, process, and/or enrichment.",
#   #     @grades=["6-8", "9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/eagle-rock-jr-sr-high-school/",
#   #     @name="Eagle Rock Jr./Sr. High School",
#   #     @state="California",
#   #     @type="School Types: Gifted, Magnet, and Public",
#   #     @webpage="https://erhs.la/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000339c828
#   #     @city="unknown",
#   #     @description="",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/eagle-school/",
#   #     @name="Eagle School",
#   #     @state="Wisconsin",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="https://eagleschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000030ae648
#   #     @city="unknown",
#   #     @description=
#   #     "The Early College at Guilford (ECG) is a highly selective public high school with a rigorous curriculum track for students 9th through 12th grade. The mission of the ECG is to make a positive different in the lives of students by providing exceptionally challenging educational opportunities that support academic development at the highest standards. Students take honors and advanced placement courses in the ninth and tenth grades, and college courses with undergraduate students in grades eleven and twelve. Students graduate with a high school diploma and up to two years of credit from Guilford College.",
#   #     @grades=["9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/early-college-guilford/",
#   #     @name="Early College at Guilford",
#   #     @state="North Carolina",
#   #     @type="School Types: Early Entrance Program (EEP), Gifted, and Public",
#   #     @webpage="http://ecg.gcsnc.com/pages/Early_College_At_Guilford/About_Us">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000005695b18
#   #     @city="unknown",
#   #     @description=
#   #     "Edlin is an academically gifted private K4/K5 through 8 school established in 1989. The school emphasizes a classic curriculum in
#   #   combination with STEAM and uses proven methods to create the best learning conditions for gifted students. The program is intellectually demanding and prepares students for increasingly competitive and rigorous further education, while encouraging student value and self-esteem. The school is not parochial but does teach and support universal values of friendliness, cooperation, and social responsibility.",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/edlin-school/",
#   #     @name="Edlin School",
#   #     @state="Virginia",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://www.edlinschool.com/ ">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000563a4c0
#   #     @city="unknown",
#   #     @description=
#   #     "Edlin is an academically gifted private school for K4, K5, and 1st through 8th grade established in 1989. The school emphasizes a
#   #   classic curriculum in combination with STEAM (science, technology, engineering, arts, and mathematics), and uses proven methods to create the best learning conditions for gifted students. Our excellent teachers and small class sizes allow a variety of teaching methods.",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/edlin-school-2/",
#   #     @name="Edlin School",
#   #     @state="Virginia",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="https://www.edlinschool.com/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000562ee18
#   #     @city="unknown",
#   #     @description=
#   #     "Emerson School is a K-8 school in Ann Arbor, MI designed for gifted and academically talented students. The mission of Emerson School is to provide a whole child, multiple method approach to instruction for gifted and for academically talented students. The school encourages creativity, problem solving, and the development of basic skills, while providing a warm, supportive environment that promotes responsibility for oneself and others.",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/emerson-school/",
#   #     @name="Emerson School",
#   #     @state="Michigan",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="https://www.emerson-school.org">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000052c7e78
#   #     @city="unknown",
#   #     @description=
#   #     "FlexSchool is a unique learning network for gifted and twice exceptional (2e) middle and high school students. FlexSchool embraces students for who and where they are, then supports them as they learn to thrive. Small, ability-based discussion classes taught by subject experts ensure meaningful conversations and the opportunity to ask high-level questions.",
#   #     @grades=["6-8", "9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/flex-school/",
#   #     @name="Flex School",
#   #     @state="Twice-Exceptional",
#   #     @type="School Types: Gifted and Twice-Exceptional",
#   #     @webpage="http://www.flexschool.net/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000052c55d8
#   #     @city="unknown",
#   #     @description=
#   #     "Fulton Science Academy Private School envisions a pre-K through 12th grade nationally ranked and recognized school serving advanced and gifted student populations committed to academic success, civic responsibility, and high ethical values within a safe environment that celebrates diversity and is supported by the collaborative efforts of its stakeholders and the broader community. Their mission is to engineer an educational framework designed for the highest academic results and enduring strength of character utilizing an innovative STEAM curriculum for college preparedness and lifelong student success.",
#   #     @grades=["6-8", "9-12", "K-5", "Pre-K"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/fulton-science-academy-gifted-program/",
#   #     @name="Fulton Science Academy Gifted Program",
#   #     @state="Arts",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://fultonscienceacademy.org/fsa-gifted-program/">,
#   #     #<GiftedSchoolsCLIProject::School:0x0000000005275cb8
#   #     @city="unknown",
#   #     @description=
#   #     "Fusion Academy is an accredited private middle and high school for grades 6 \u2013 12, offering one-to-one classroom learning and
#   #     positive relationship building as the basis for academic success. Each student\u2019s educational experience is customized to ignite their passion for learning. Classes are self-paced and course material is presented in ways that suit students\u2019 individual interests, strengths and challenges, with options for full-time or part-time enrollment. Fusion has campuses in California, Connecticut, Illinois, New Jersey, New York, Texas, Virginia, and Washington D.C.",
#   #     @grades=["6-8", "9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/fusion-academy/",
#   #     @name="Fusion Academy",
#   #     @state="Twice-Exceptional",
#   #     @type="School Types: Gifted, Homeschool, Private, and Twice-Exceptional",
#   #     @webpage="http://www.fusionacademy.com/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000049a7528
#   #     @city="unknown",
#   #     @description=
#   #     "Galileo School for Gifted Learning is K-8 FDOE-certified High-Performing Charter School open to all students in Seminole County. Their purpose is to help nurture the unique gifts of each of our students using innovative, research-based approaches to instruction. They see differentiation and acceleration, not as \u201Cadd ons\u201D to the curriculum, but as core components of the entire orientation of the school.",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/galileo-school-for-gifted-learning/",
#   #     @name="Galileo School for Gifted Learning",
#   #     @state="Florida",
#   #     @type="School Types: Charter, Gifted, and Public",
#   #     @webpage="https://www.galileogiftedschool.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000049a4c10
#   #     @city="unknown",
#   #     @description=
#   #     "Portola Highly Gifted Magnet, established in 1979, shares the campus of Portola Middle School. It is the only middle school program in LAUSD designed specifically to meet the needs of highly gifted students. It is a well-rounded, academically rigorous program that emphasizes critical thinking and establishing a growth mindset.",
#   #     @grades=["6-8"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/portola-middle-school-highly-gifted-magnet/",
#   #     @name="Gaspar de Portola Middle School",
#   #     @state="California",
#   #     @type="School Types: Gifted, Magnet, and Public",
#   #     @webpage="https://www.portolams.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000048c21d0
#   #     @city="unknown",
#   #     @description=
#   #     "GATE Academy is a year-round day school dedicated to educating academically-gifted students in grades K\u20138 with an inquiry-based curriculum. GATE students are deep, reflective thinkers who have a passion for figuring out, doing, and understanding. They cluster motivated and cognitively gifted students in small groups with their intellectual peers and provide them with an inquiry-based, accelerated, self-paced curriculum in a school environment that celebrates them for who they are.",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/gate-academy/",
#   #     @name="GATE Academy",
#   #     @state="California",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://www.gateacademy.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000047fef78
#   #     @city="unknown",
#   #     @description=
#   #     "Provided by the Gifted Development Center, a list of schools by state dedicated to serving highly and profoundly gifted students.",
#   #     @grades=["6-8", "9-12", "K-5", "Pre-K"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/gifted-schools-by-state/",
#   #     @name="Gifted Schools by State",
#   #     @state="Articles & Media",
#   #     @type="School Types: Gifted and Twice-Exceptional",
#   #     @webpage="http://www.gifteddevelopment.com/sites/default/files/National%20Consortium%20List%20-%20By%20State_0.pdf">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000047df060
#   #     @city="unknown",
#   #     @description=
#   #     "Learning at Helios takes place through meaningful authentic projects which may include field work, inquiry, discovery, direct instruction, and interaction with the environment. This project-based learning environment offers the rigor, depth, and complexity gifted
#   #     learners need. Equally important, Helios students thrive socially. They have a community of peers who are willing to \u201Cgo deep\u201D and engage each other in their passions.",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/helios-school-gifted-children/",
#   #     @name="Helios School for Gifted Children",
#   #     @state="California",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://www.heliosns.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000047dc338
#   #     @city="unknown",
#   #     @description=
#   #     "The Gary K. Herberger Young Scholars Academy is a learning environment designed for highly gifted students in grades 7-12 located
#   #     on the Arizona State University West campus. Designed for gifted students who thrive in a highly engaging learning environment, the academy personalizes students\u2019 education by merging individual\u2019s academic talents and interests with advanced college preparatory coursework and mentorship opportunities.",
#   #     @grades=["6-8", "9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/herberger-young-scholars-academy/",
#   #     @name="Herberger Young Scholars Academy",
#   #     @state="Arizona",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="https://herbergeracademy.asu.edu/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000047e8908
#   #     @city="unknown",
#   #     @description=
#   #     "Hunter College High School (HCHS) is a part of the Hunter College Campus Schools, the laboratory schools of the City University of New York administered by Hunter College. HCHS serves students in grades 7 \u2013 12, with 7th grade as the only entry year for admissions. Their mission is to serve students who demonstrate advanced cognitive ability and to assist in the development of creative, intellectually curious, and original thinkers who are passionate about learning. HCHS prepares students to be life-long learners, offering a curriculum based on the principles of gifted education, including depth, complexity, challenge, enrichment, and acceleration.",
#   #     @grades=["6-8", "9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/hunter-college-high-school/",
#   #     @name="Hunter College High School",
#   #     @state="New York",
#   #     @type="School Types: Gifted and Public",
#   #     @webpage="https://www.hunterschools.org/hs">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000047d5d58
#   #     @city="unknown",
#   #     @description=
#   #     "Hyde Park Middle School is a Magnet school serving students grades 6 \u2013 8 in Las Vegas, Nevada. The Academy provides opportunities for gifted and high-achieving students to develop their academic talents through Honors and Pre-AP programs in Math, Science, Language Arts, and Social Studies, providing one to two year acceleration in all parts of the middle school curriculum.",
#   #     @grades=["6-8"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/hyde-park-middle-school-academy-science-mathematics/",
#   #     @name="Hyde Park Middle School Academy of Science and Mathematics",
#   #     @state="Nevada",
#   #     @type="School Types: Gifted, Magnet, and Public",
#   #     @webpage="http://www.hydeparkms.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000047ced28
#   #     @city="unknown",
#   #     @description=
#   #     "Established in 1985, the Illinois Mathematics and Science Academy (IMSA) is a tuition-free public residential high school for academically talented students in grades 10-12 located in Aurora, Illinois.\u00A0 \u00A0IMSA is recognized as a leader in mathematics and
#   #     science education at the national and international levels, developing creative, ethical leaders in science, technology, engineering and mathematics. Students apply in their ninth grade year, though some students who are younger and meet the admissions criteria have been admitted.\u00A0 IMSA offers a rigorous curriculum with additional opportunities for Independent Study, participation in Student Inquiry, Mentorship, and the TALENT program (Total Applied Learning for Entrepreneurs), the Great Minds Program, Interdisciplinary Seminars, and additional opportunities to pursue their passions during Intersession Week.",
#   #     @grades=["9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/illinois-mathematics-science-academy/",
#   #     @name="Illinois Mathematics and Science Academy",
#   #     @state="Math",
#   #     @type="School Types: Boarding, Gifted, and Public",
#   #     @webpage="https://www.imsa.edu/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000047c7a28
#   #     @city="unknown",
#   #     @description=
#   #     "CTY\u2019s gifted and talented Online Programs give academically advanced students the freedom to access more than 170 online courses, expert instructors, and engaging curriculum wherever they are. Gifted online courses range from elementary to college-level and include such courses as math, AP science, Chinese, grammar, critical reading, computer science, and writing. Courses are offered in session-based, individually paced, or flexi-paced formats for added convenience. Financial aid is available.",
#   #     @grades=["6-8", "9-12", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/johns-hopkins-cty-online-programs/",
#   #     @name="Johns Hopkins CTY Online Programs",
#   #     @state="National",
#   #     @type="School Types: Gifted and Online",
#   #     @webpage="https://cty.jhu.edu/ctyonline/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000047c4b20
#   #     @city="unknown",
#   #     @description=
#   #     "The Knox School of Santa Barbara is private school serving K through 8th grade and specifically designed for the gifted learner. Their mission is to provide a stimulating and nurturing environment where, alongside an engaging and challenging curriculum, the social and emotional needs of gifted and talented students are respected and compassionately supported.",
#   #     @grades=["6-8", "9-12", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/knox-school/",
#   #     @name="Knox School",
#   #     @state="California",
#   #     @type="School Types: Charter and Gifted",
#   #     @webpage="https://www.knoxschoolsb.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000047bd5a0
#   #     @city="unknown",
#   #     @description=
#   #     "Laurel Springs School is a fully accredited private online school for students in kindergarten through twelfth grade, offering challenging academic programs that honor each child\u2019s individual learning style and educational needs. As a distance learning program, we are able to create an individualized learning plan that is built upon each student\u2019s strengths and needs. Additionally, Academy students are placed in the most appropriate courses for their learning level, regardless of their chronological age. Laurel Springs offers experiences for gifted and talented students that develop the intellect, encourage achievement, and nurture academic and personal goals.",
#   #     @grades=["6-8", "9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/laurel-springs-school-gifted-talented-academy/",
#   #     @name="Laurel Springs School Gifted & Talented Academy",
#   #     @state="Online",
#   #     @type="School Types: Gifted, Online, and Private",
#   #     @webpage="https://laurelsprings.com/academics/gifted-talented-academy/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000047b5da0
#   #     @city="unknown",
#   #     @description=
#   #     "Lee Academy offers a unique experience for advanced, motivated learners Pre-K through 12th grade. Set in 3 1/2 acres of lakefront
#   #     property, Lee Academy offers a flexible program that encourages reflective and creative thinking, problem solving, critical evaluation, and opportunity to pursue special interests. The curriculum is tailored to meet the intellectual needs and learning styles of advanced and gifted students. They also work with each student in areas beyond academics, nurturing qualities such as teamwork, compassion,
#   #     respect and leadership through counseling, community service and group dynamic classes. Each student is guided toward social goals that are equal to their academic accomplishments.",
#   #     @grades=["6-8", "9-12", "K-5", "Pre-K"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/lee-academy-for-gifted-education/",
#   #     @name="Lee Academy for Gifted Education",
#   #     @state="Florida",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="https://leegiftedacademy.com/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000047ae2f8
#   #     @city="unknown",
#   #     @description=
#   #     "The Long Island School for the Gifted (LISG), located in South Huntington, New York, is a school for grades PreK \u2013 9. LISG is a community dedicated to providing an outstanding education for academically gifted children where they are nurtured and treasured.",
#   #     @grades=["6-8", "9-12", "K-5", "Pre-K"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/long-island-school-for-the-gifted/",
#   #     @name="Long Island School for the Gifted",
#   #     @state="New York",
#   #     @type="School Types: Gifted and Twice-Exceptional",
#   #     @webpage="http://www.lisg.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x0000000004767420
#   #     @city="unknown",
#   #     @description=
#   #     "The Long Island Whole Child Academy has taken the one-room schoolhouse and revolutionized it into a 21st Century center of experimentation and learning, offering a rigorous and open-ended academic program infused with clinically proven strategies to reduce school-related anxieties, ADHD, and dysregulation. Their team of educational and clinical collaborators work in tandem to deliver the best in gifted educational content designed for each unique child.",
#   #     @grades=["6-8", "9-12", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/long-island-whole-child-academy/",
#   #     @name="Long Island Whole Child Academy",
#   #     @state="New York",
#   #     @type="School Types: Gifted, Private, and Twice-Exceptional",
#   #     @webpage="https://www.liwholechild.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x0000000004764518
#   #     @city="unknown",
#   #     @description=
#   #     "The Loudoun School for the Gifted is a private middle and high school for gifted students located in Ashburn, Virginia.",
#   #     @grades=["6-8", "9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/loudoun-school-for-the-gifted/",
#   #     @name="Loudoun School for the Gifted",
#   #     @state="Virginia",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="https://www.loudounschool.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x000000000472c410
#   #     @city="unknown",
#   #     @description=
#   #     "Mackintosh Academy nurtures the keen minds and compassionate hearts of the gifted child in a responsive and caring community of learners. As an authorized International Baccalaureate (IB) School, Mackintosh Academy\u2019s mission aligns with the International Baccalaureate program\u2019s mission, \u201Cto create a better world through education.\u201D They have two campuses, located in Littleton and Boulder Colorado.",
#   #     @grades=["6-8", "K-5", "Pre-K"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/mackintosh-academy/",
#   #     @name="Mackintosh Academy",
#   #     @state="Colorado",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://mackintoshacademy.com/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000047081c8
#   #     @city="unknown",
#   #     @description=
#   #     "The Maggie L. Walker Governor\u2019s School for Government and International Studies (MLWGS) is an innovative public high school offering a comprehensive college preparatory program emphasizing government, international studies, science, mathematics, languages, and fine arts. Established in 1991, MLWGS is the product of a public/private partnership to support the needs and interests of the region\u2019s gifted high school students. The school serves students selected on the basis of aptitude and interest in its mission.",
#   #     @grades=["9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/maggie-l-walker-governors-school-government-international-studies/",
#   #     @name="Maggie L. Walker Governor\u2019s School for Government and International Studies",
#   #     @state="Virginia",
#   #     @type="School Types: Gifted and Public",
#   #     @webpage="http://mlwgs.com/">,
#   #     #<GiftedSchoolsCLIProject::School:0x0000000004657e90
#   #     @city="unknown",
#   #     @description=
#   #     "Mark Twain Intermediate School for the Gifted & Talented sets itself apart from others because of its dual mission. Students are immersed in an environment of academic rigor blended with a full visual art and performing arts experience, all in an extremely supportive environment. Twain is organized into clusters, or mini-schools, of four classes with a team of teachers assigned to each. Clusters are scheduled for conference periods to facilitate interdisciplinary planning, data analysis and communication with parents to discuss student progress.",
#   #     @grades=["6-8"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/mark-twain-intermediate-school-gifted-talented/",
#   #     @name="Mark Twain Intermediate School for the Gifted and Talented",
#   #     @state="New York",
#   #     @type="School Types: Gifted and Magnet",
#   #     @webpage="http://is239.schoolwires.com/">,
#   #     #<GiftedSchoolsCLIProject::School:0x0000000004655690
#   #     @city="unknown",
#   #     @description=
#   #     "The Program for the Exceptionally Gifted, established in 1985, offers the opportunity for bright 16- and 17-year-old students to skip their final years of high school and immerse themselves in college at MBU. PEG students live in a fully supervised, state-of-the-art residence hall with their true peers on the beautiful campus of Mary Baldwin College.",
#   #     @grades=["9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/mary-baldwin-university-early-college/",
#   #     @name="Mary Baldwin University Early College",
#   #     @state="Virginia",
#   #     @type="School Types: Early Entrance Program (EEP) and Gifted",
#   #     @webpage="http://www.marybaldwin.edu/early-college/">,
#   #     #<GiftedSchoolsCLIProject::School:0x000000000464eae8
#   #     @city="unknown",
#   #     @description=
#   #     "Menlo Park Academy is Ohio\u2019s only tuition-free K-8 community school focused solely on serving the needs of gifted learners, educating the whole child and offering flexible options for modern families.",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/menlo-park-academy/",
#   #     @name="Menlo Park Academy",
#   #     @state="Ohio",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://www.menloparkacademy.com/">,
#   #     #<GiftedSchoolsCLIProject::School:0x0000000004643418
#   #     @city="unknown",
#   #     @description=
#   #     "Metrolina Regional Scholars Academy is a charter school in Charlotte, NC which provides a differentiated and challenging learning
#   #     environment to support the distinctive intellectual, social, and emotional needs of highly gifted children. Metrolina serves students
#   #     K through 2nd grade (Discoverers), 3rd through 5th grade (Investigators), and 6th through 8th grade (Apprentice Scholars).",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/metrolina-regional-scholars-academy/",
#   #     @name="Metrolina Regional Scholars Academy",
#   #     @state="North Carolina",
#   #     @type="School Types: Charter and Gifted",
#   #     @webpage="http://www.scholarsacademy.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x00000000045975c8
#   #     @city="unknown",
#   #     @description=
#   #     "Midwest Academy for Gifted Education is a 501.c.3 not-for-profit school. MAGE was created because they detected an important need
#   #     in the Greater Chicagoland area for an independent elementary school focused on the unique socio-emotional and cognitive needs of gifted learners. They believe learning should develop collaboration skills, creativity and critical thinking in young people. They celebrate and promote the innate talent and interests of each individual student while challenging them to construct their unique understanding of the world.",
#   #     @grades=["6-8", "9-12", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/mid-west-academy-for-gifted-education/",
#   #     @name="Mid-West Academy for Gifted Education",
#   #     @state="Gifted Organizations",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="https://www.mage.education/">,
#   #     #<GiftedSchoolsCLIProject::School:0x0000000004594af8
#   #     @city="unknown",
#   #     @description=
#   #     "Located in Silver Springs, Maryland, the Mathematics, Science, Computer Science Program at Montgomery County Unified offers rigorous academic study in mathematics, science, and computer science to highly gifted students. This program is much more than accelerated
#   #     mathematics courses. Students have opportunities to work with professional scientists and mathematicians from government agencies. The program offers access to many academic competitions and the opportunity to conduct fieldwork. Throughout all of their specialized coursework, students work with an academic cohort to conduct independent inquiries using mathematics, computer science, and the scientific process to solve real-world problems.",
#   #     @grades=["6-8"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/takoma-park-middle-school-magnet-programs/",
#   #     @name="Montgomery County Unified Mathematics, Science, Computer Science Program",
#   #     @state="Maryland",
#   #     @type="School Types: Gifted, Magnet, and Public",
#   #     @webpage="http://www.montgomeryschoolsmd.org/curriculum/specialprograms/middle/math-sci-compsci.aspx">,
#   #     #<GiftedSchoolsCLIProject::School:0x0000000004581c50
#   #     @city="unknown",
#   #     @description=
#   #     "Located on the Lower East Side of NYC, NEST+m is the only K-12 public school located in Manhattan, and it educates gifted and talented students from all 5 boroughs. NEST+m is committed to nurturing and challenging all forms of giftedness, and to creating an environment that supports all forms of achievement. Our school is committed to providing not just an outstanding academic education for all
#   #     our students, but to creating programs that support their growth as scholars, artists, and citizens of the world.",
#   #     @grades=["6-8", "9-12", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/nest-m-school/",
#   #     @name="Nest + M School",
#   #     @state="Engineering",
#   #     @type="School Types: Gifted and Public",
#   #     @webpage="https://nestmk12.net/">,
#   #     #<GiftedSchoolsCLIProject::School:0x0000000004575e78
#   #     @city="unknown",
#   #     @description=
#   #     "Noe Middle School offers the only Gifted and Talented Magnet program in the Jefferson County Public School District of Louisville, Kentucky. They provide opportunities for student leadership through the Student Council, Student Technology Leadership Program (STLP), Peer Mediation, and service projects and they offer more than 40 extracurricular teams and programs.",
#   #     @grades=["6-8"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/noe-middle-school-gifted-talented-magnet-program/",
#   #     @name="Noe Middle School Gifted and Talented Magnet Program",
#   #     @state="Kentucky",
#   #     @type="School Types: Gifted, Magnet, and Public",
#   #     @webpage="http://schools.jefferson.kyschools.us/Middle/Noe/">,
#   #     #<GiftedSchoolsCLIProject::School:0x0000000004566b58
#   #     @city="unknown",
#   #     @description=
#   #     "The Highly Gifted Magnet (HGM) was established in 1989 as part of the voluntary integration program of the Los Angeles Unified School District. Its goals are twofold:\u00A0integration and a college preparatory curriculum that serves a special needs population (students who have an LAUSD intellectual assessment exam scoring in the 99.5%-99.9%).\u00A0 The HGM, which is mandated to maintain 60% minority students, includes and fosters a multi-racial, multi-ethnic student body. HGM students receive the benefits of a small academic
#   #     program \u2013 a core of teachers and a small student body who know each other well, mixed with the advantages of attending a public,
#   #     urban high school.",
#   #     @grades=["9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/north-hollywood-high-school-highly-gifted-magnet/",
#   #     @name="North Hollywood Highly Gifted Magnet",
#   #     @state="California",
#   #     @type="School Types: Gifted, Magnet, and Public",
#   #     @webpage="http://highlygiftedmagnet.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x000000000454ba38
#   #     @city="unknown",
#   #     @description=
#   #     "Located in Chicago, Illinois, Northside College Prep is a public high school dedicated to creating a community of learners who strive to fulfill individual and collective intellectual, emotional, social, and ethical potentials. Northside offers a rigorous and innovative curriculum, with all courses offered at the Honors or Advanced Placement levels. Northside is a full inclusion school, committed to supporting the needs of individuals with diagnosed disabilities. IEPs and 504 plans regarding testing and/or classroom accommodations can be arranged through the Office of Specialized Services.",
#   #     @grades=["9-12"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/northside-college-preparatory-high-school/",
#   #     @name="Northside College Preparatory",
#   #     @state="Twice-Exceptional",
#   #     @type="School Types: Gifted, Public, and Twice-Exceptional",
#   #     @webpage="http://www.northsideprep.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x0000000004548090
#   #     @city="unknown",
#   #     @description=
#   #     "NOVA Middle School, located in Olympia, Washington, is an intellectual home for highly capable learners, where curiosity is encouraged to expand the mind and meaningful relationships inspire transformation.",
#   #     @grades=["6-8", "K-5"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/nova-school/",
#   #     @name="NOVA School",
#   #     @state="Washington",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="https://www.novaschool.org/">,
#   #     #<GiftedSchoolsCLIProject::School:0x0000000004538eb0
#   #     @city="unknown",
#   #     @description=
#   #     "Founded in 1883, the Nysmith School for Gifted and Talented is a private school located in Herndon, Virginia. Recognized by Johns
#   #     Hopkins University CTY as one of the 2015 Top 10 Schools in the World, Nysmith allows gifted learners to work at their own level and pace by maintaining small class sizes and low teacher to student ratios. The environment is uniquely supportive because it encourages all gifted children to work toward their potential without fear of social consequences.",
#   #     @grades=["6-8", "K-5", "Pre-K"],
#   #     @learning_profile="Gifted",
#   #     @more_info_url="https://educationaladvancement.org/grc/nysmith-school-gifted/",
#   #     @name="Nysmith School for the Gifted",
#   #     @state="Virginia",
#   #     @type="School Types: Gifted and Private",
#   #     @webpage="http://www.nysmith.com/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000044ec538
#   #   @city="unknown",
#   #   @description=
#   #     "Oak Crest Academy is a fully accredited school for gifted and talented students, grades PreK-12, specifically designed to address
#   # the needs and learning styles of gifted learners; bringing together of highly trained faculty, carefully designed and award-winning gifted curricula, and like-minded peers; a community of enthusiastic learners who share a passion for intellectual inquiry, creativity,
#   # and discovery.",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/oak-crest-academy/",
#   #   @name="Oak Crest Academy",
#   #   @state="California",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="http://www.oakcrestacademy.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000044d9898
#   #   @city="unknown",
#   #   @description=
#   #     "Located in Bellevue, Washington, Open Window is an independent K-8 school, nurturing and inspiring students of high intellectual potential.",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/open-window-school/",
#   #   @name="Open Window School",
#   #   @state="Washington",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="https://www.openwindowschool.org/page">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000044cacf8
#   #   @city="unknown",
#   #   @description=
#   #     "Palmetto Scholars Academy (PSA) is a Gifted and Talented Charter School located in North Charleston, South Carolina. They have an
#   # advanced and rigorous curriculum designed to meet the educational, social, and emotional needs of gifted and talented learners. They encourage community involvement and students are required to complete a minimum of ten service hours per academic school year.",
#   #   @grades=["6-8", "9-12"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/palmetto-scholars-academy/",
#   #   @name="Palmetto Scholars Academy",
#   #   @state="South Carolina",
#   #   @type="School Types: Charter and Gifted",
#   #   @webpage="http://www.palmettoscholarsacademy.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000044c8160
#   #   @city="unknown",
#   #   @description=
#   #     "Pioneer School is a K-5 non-profit educational organization, founded in 1980 by Betty Burley-Wolf. They are committed to serving highly capable students whose primary need is academic stimulation and expect to work in partnership with parents who are significantly involved in the education of their children.",
#   #   @grades=["K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/pioneer-school/",
#   #   @name="Pioneer School",
#   #   @state="Educational Opportunities",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="https://www.pioneerschool.com/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000044c16d0
#   #   @city="unknown",
#   #   @description=
#   #     "Primoris Academy is a nonprofit 501(c)(3), private school for intellectually gifted learners in Pre-K through 12th grade. They believe that a learning environment befitting their level incites children to perform and develop at their true potential. Therefore, students are placed based on ability rather than by age, and experiential learning is at the core of our approach. Through an accelerated, rigorous program that emphasizes creativity and collaboration, they cultivate our students\u2019 ability to think critically and dream big.",
#   #   @grades=["6-8", "9-12", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/primoris-academy/",
#   #   @name="Primoris Academy",
#   #   @state="New Jersey",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="http://primorisacademy.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000004495170
#   #   @city="unknown",
#   #   @description=
#   #     "Located in Palatine, Illinois, Quest Academy provides gifted children with a challenging curriculum and a nurturing environment. Their program emphasizes sound character along with scholarship and creativity in both the academics and the arts. The Quest community
#   # values the individuality of each child and encourages each to strive for personal excellence.",
#   #   @grades=["6-8", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/quest-academy/",
#   #   @name="Quest Academy",
#   #   @state="Illinois",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="http://www.questacademy.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000004476518
#   #   @city="unknown",
#   #   @description=
#   #     "Rainard School is a community dedicated to education of gifted students in Pre-K through 8th grade. They are Houston\u2019s only non-profit private school for gifted children, helping them to develop socially, emotionally, and academically.",
#   #   @grades=["6-8", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/rainard/",
#   #   @name="Rainard School",
#   #   @state="Texas",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="http://www.rainard.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000004483178
#   #   @city="unknown",
#   #   @description=
#   #     "Realms of Inquiry was founded in 1972 as a special-purpose school for gifted, talented and creative individuals. It is a cooperative learning community that offers an accredited curriculum for grades 6 through 12 and is dedicated to providing a supportive learning environment for bright and intellectually creative students. Working closely with faculty, each student designs a program tailored to his or her particular interests and learning style.",
#   #   @grades=["6-8", "9-12"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/realms-of-inquiry/",
#   #   @name="Realms of Inquiry",
#   #   @state="Educational Opportunities",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="http://www.realmsofinquiry.org">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000446ec28
#   #   @city="unknown",
#   #   @description=
#   #     "Revo Academy is a K-8, high-ability and gifted learner school providing an enriched, educational experience for gifted learners to thrive. Their mission at Revo Academy is delivering an appropriately challenging learning experience that is purposeful, and leaves their students feeling excited and energized from a meaningful and fulfilling school day.",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/revo-academy/",
#   #   @name="Revo Academy",
#   #   @state="California",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="https://www.revoacademy.org/about-us">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000446c0b8
#   #   @city="unknown",
#   #   @description=
#   #     "The Rhoades School supports the positive development of bright, academically advanced, productive, creative, and socially able students in grades K-8. Students are provided with an appropriate curriculum, a supportive peer group, and suitable guidance in an encouraging and thoughtful manner. The structure of their curriculum and their personalized teaching approach is designed to meet the unique needs and passions of gifted students.",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/rhoades-school/",
#   #   @name="Rhoades School",
#   #   @state="California",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="https://www.rhoadesschool.com/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000443d560
#   #   @city="unknown",
#   #   @description=
#   #     "Located on the campus of the University of Denver, Ricks Center provides a nationally recognized gifted education program for gifted children pre-K through eighth grade who demonstrate exceptional, differentiated abilities and learning needs. Their mission is to provide a dynamic and challenging educational environment that anticipates and responds to the individual intellectual, social, emotional, physical, aesthetic, and cognitive needs of gifted children. Ricks offers an average student-teacher ratio of seven-to-one, where
#   # teachers can focus on multiple teaching strategies designed to address the specific needs, learning styles, intellectual abilities and interests of each child.",
#   #   @grades=["6-8", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/ricks-center-gifted-children/",
#   #   @name="Rick\u2019s Center for Gifted Children",
#   #   @state="Colorado",
#   #   @type="School Types: Gifted, Private, and Twice-Exceptional",
#   #   @webpage="http://www.du.edu/ricks/ ">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000444bca0
#   #   @city="unknown",
#   #   @description=
#   #     "The Center for Gifted Studies at Ridgecrest Elementary has been serving gifted students for over 20 years, the center admits students in grades one through five who meet gifted eligibility criteria, and who are selected in the magnet lottery process.Students use integrated pieces of information to develop a well-rounded approach to learning rather than basing education on isolated, often unrelated, facts. Program teachers work with the students one-on-one to help them identify their strengths and areas of need, thus enabling them to be self-directed learners while building a strong sense of accomplishment.",
#   #   @grades=["K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/ridgecrest-elementary-school-and-the-center-for-gifted-studies/",
#   #   @name="Ridgecrest Elementary School and the Center for Gifted Studies",
#   #   @state="Florida",
#   #   @type="School Types: Gifted, Magnet, and Public",
#   #   @webpage="https://www.pcsb.org/ridgecrest-es">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000044488c0
#   #   @city="unknown",
#   #   @description=
#   #     "The Halbert and Nancy Robinson Center for Young Scholars (RC) at the University of Washington is dedicated to teaching, research,
#   # and service, and to developing programs that serve highly capable young pre-college and college students. Through Early Entrance Programs (EEP), Transition Schools, enrichment and summer programming, RC provides intensive, in-depth learning experiences for gifted students in need of challenge. The Robinson Center for Young Scholars is located in Seattle, Washington, though out-of-state applicants can apply to UW Academy for early entrance.",
#   #   @grades=["6-8", "9-12", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/robinson-center-young-scholars-university-washington/",
#   #   @name="Robinson Center for Young Scholars at the University of Washington",
#   #   @state="Educational Opportunities",
#   #   @type="School Types: Early Entrance Program (EEP), Gifted, Online, and Private",
#   #   @webpage="https://robinsoncenter.uw.edu/ ">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000442db10
#   #   @city="unknown",
#   #   @description=
#   #     "Rubicon Academy brings education to life for gifted children. Their goal is to prepare students for the competitive global economy that awaits them in the future. They are committed to providing a challenging and enjoyable learning experience for those families who believe that character and academic accomplishment are vital to success.",
#   #   @grades=["6-8", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/rubicon-academy/",
#   #   @name="Rubicon Academy",
#   #   @state="Texas",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="https://rubiconacademy.com">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000004426978
#   #   @city="unknown",
#   #   @description=
#   #     "San Tan Charter School\u2019s Gifted program offers tuition-free, 1st-6th grade, self-contained gifted classes. Qualifying Gifted
#   # students enjoy the support and challenge that a peer group of similar academic interests and abilities provides. The goal of this program is to provide students who have advanced intellectual, academic, and/or creative thinking skills the opportunity to dynamically interact with teachers who specialize in Gifted education. To ensure students are kept at their cutting edge, Gifted classes are self-contained and utilize cluster groupings. All teachers within the Gifted classroom are highly qualified gifted endorsed or working towards gifted certification. Each gifted student will have an Individual Learning Plan (ILP) which will address their specific academic and emotional needs.",
#   #   @grades=["6-8", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/san-tan-charter-school/",
#   #   @name="San Tan Charter School",
#   #   @state="Arizona",
#   #   @type="School Types: Charter and Gifted",
#   #   @webpage="https://santancharterschool.com/gifted-1st-6th/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000441b758
#   #   @city="unknown",
#   #   @description=
#   #     "Scholars Together Always Reaching (STAR) is a secular and inclusive group for the families of highly gifted children. Through classroom settings and the ever-important lunch and recess hour, highly gifted children interact with others who are closer to being both
#   # intellectual and social peers than they may find in settings geared solely to their age or academic level.\u00A0The STAR community is
#   # self-selected, meaning that it does not require proof of giftedness. Classes are designed for children aged 5-18 (plus limited preschool activities) who tend to succeed when working 2-3 grade levels ahead and moving through material more quickly than traditional classes.",
#   #   @grades=["6-8", "9-12", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/star-homeschool-academy/",
#   #   @name="Scholars Together Always Reaching Homeschool Academy",
#   #   @state="Minnesota",
#   #   @type="School Types: Gifted and Homeschool",
#   #   @webpage="https://www.homeschool-life.com/mn/star/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000004413468
#   #   @city="unknown",
#   #   @description=
#   #     "Founded in 1982, the School for the Talented and Gifted (TAG) is a college-preparatory magnet high school in Dallas that features
#   # a dynamic community of learners who are guided by a dedicated faculty and supported by a rigorous curriculum, both of which prepare them for the most demanding college programs in the country. TAG prides itself on attracting curious, self-motivated students who love learning.",
#   #   @grades=["9-12"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/school-talented-gifted/",
#   #   @name="School for the Talented and Gifted",
#   #   @state="Texas",
#   #   @type="School Types: Gifted, Magnet, and Private",
#   #   @webpage="http://tagmagnet.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000436d158
#   #   @city="unknown",
#   #   @description=
#   #     "Seabury is the only independent school in the South Puget Sound area with programs specifically designed for intellectually advanced children in Pre-K through 8th grade. Although the instruction at Seabury is individualized and each student is encouraged to grow their individual strengths and talents, students are able to learn together with other intellectually advanced peers. Small class sizes allow their teachers, who have extensive training and experience in education for gifted learners, provide differentiated instruction to develop each child\u2019s individual talents and strengths.",
#   #   @grades=["6-8", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/seabury-school/",
#   #   @name="Seabury School",
#   #   @state="Washington",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="http://www.seabury.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000043625f0
#   #   @city="unknown",
#   #   @description=
#   #     "Southeastern Louisiana University offers many opportunities for high school students to earn college credits while they\u2019re still in high school through their early admission program, gifted-talented youth programs, and dual enrollment program.",
#   #   @grades=["9-12"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/southeastern-louisiana-university-youth-programs/",
#   #   @name="Southeastern Louisiana University Youth Programs",
#   #   @state="Educational Opportunities",
#   #   @type="School Types: Early Entrance Program (EEP) and Gifted",
#   #   @webpage="http://www.southeastern.edu/apply/high_school/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000435a670
#   #   @city="unknown",
#   #   @description=
#   #     "The Speyer Legacy School is a K-8 independent school in Manhattan with a unique focus on accelerated learners. The pedagogy is designed to meet the needs of learners through an accelerated and enriched curriculum addressing the mind, body and heart of each child.
#   # Speyer has developed an interdisciplinary curriculum with an innovative student-to-faculty led approach that inspires, encourages, and ignites a passion for learning and questioning.",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/speyer-legacy-school/",
#   #   @name="Speyer Legacy School",
#   #   @state="New York",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="http://www.speyerlegacyschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000434aea0
#   #   @city="unknown",
#   #   @description=
#   #     "Spring Branch Academic Institute provides individualized instruction at the appropriate pace, depth and complexity needed by highly gifted students in a multi-aged setting. By creating a school-within-a-school for this specific population, SBISD is filling a great need for students in Spring Branch ISD.",
#   #   @grades=["6-8", "9-12", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/spring-branch-academic-institute/",
#   #   @name="Spring Branch Academic Institute",
#   #   @state="Texas",
#   #   @type="School Types: Gifted and Public",
#   #   @webpage="https://sbai.springbranchisd.com/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000004333c78
#   #   @city="unknown",
#   #   @description=
#   #     "Spring Hill School is an independent school that was established in 1977 as a school for bright, talented and gifted children who
#   # will benefit from an advanced and differentiated curriculum. The original Design Thinking School and the only WASC-accredited K-6 school in Santa Cruz, they are known for their teachers\u2019 expertise, small class sizes, flexible and accelerated curriculum, and individualized education by design. Theyoffer a whole-child curriculum that includes Spanish, music, performing arts, design lab, outdoor sciences, STEAM days, mentorship programs and more.",
#   #   @grades=["6-8", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/spring-hill-school/",
#   #   @name="Spring Hill School",
#   #   @state="California",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="https://www.springhillschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000043312c0
#   #   @city="unknown",
#   #   @description=
#   #     "The Stanford Online High School (OHS) is an accredited, diploma-granting independent school serving students in grades 7 \u2013 12. The OHS brings together academically talented and motivated students from around the world into a vibrant intellectual community with teachers who are passionate about their disciplines, accomplished in their fields, and above all, dedicated to teaching. Students can customize their school experience with a variety of enrollment options: full-time, part-time, or single-course. OHS offers online instruction which includes live, synchronous seminars on a college-style class schedule, encouraging independence, discipline, and strong time-management skills. Learn more by visiting their website.",
#   #   @grades=["6-8", "9-12"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/stanford-online-high-school/",
#   #   @name="Stanford Online High School",
#   #   @state="Online",
#   #   @type="School Types: Gifted and Online",
#   #   @webpage="https://ohs.stanford.edu/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000431a9f8
#   #   @city="unknown",
#   #   @description=
#   #     "Steppingstone School for Gifted Education, located in a vibrant Michigan community, is dedicated to providing an outstanding education that addresses both the intellect and humanity of gifted children. They strive for accessibility to all gifted students regardless of ability to pay, for a sustainable population housed in an attractive facility that supports our mission, and to attract and retain the best teachers for our students and the best support staff for our teachers and parents. Steppingstone School is an internationally recognized resource for gifted education, where daily interactions and research with national and international education institutions are woven into the fabric of our operations.",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/steppingstone-school/",
#   #   @name="Steppingstone School",
#   #   @state="Michigan",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="https://www.steppingstoneschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000004313ec8
#   #   @city="unknown",
#   #   @description=
#   #     "Stuyvesant High has served as a premier school for the development of talent in science, mathematics and technology. They are part of eight specialized public high schools established and run by the New York City Department of Education to aimed at serving the needs of academically gifted students.",
#   #   @grades=["9-12"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/stuyvesant-high-school/",
#   #   @name="Stuyvesant High School",
#   #   @state="New York",
#   #   @type="School Types: Gifted and Public",
#   #   @webpage="http://stuy.enschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000004311790
#   #   @city="unknown",
#   #   @description=
#   #     "Sunland Elementary Gifted/ High Ability Magnet is designed to meet the educational needs of the students through an active, creative, and challenging curriculum, which is based on the Common Core State Standards. Their goal is to enrich students\u2019 knowledge and critical thinking skills, encouraging them to become life-long learners and well-rounded citizens in their community.",
#   #   @grades=["K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/sunland-elementary-school/",
#   #   @name="Sunland Elementary School",
#   #   @state="Twice-Exceptional",
#   #   @type="School Types: Gifted, Magnet, Public, and Twice-Exceptional",
#   #   @webpage="http://www.sunlandes-lausd-ca.schoolloop.com/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000430ad78
#   #   @city="unknown",
#   #   @description=
#   #     "At Sycamore School, they understand that gifted children need a special education, and their mission reflects their focus and drive. The school exists so that academically gifted students can experience the enriched, accelerated education they need to reach their
#   # full potential and to lead responsible, constructive, fulfilling lives.",
#   #   @grades=["9-12", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/sycamore-school/",
#   #   @name="Sycamore School",
#   #   @state="Indiana",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="https://www.sycamoreschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000042e3d40
#   #   @city="unknown",
#   #   @description=
#   #     "An independent K-8th grade school in Menlo Park, CA, Synapse offers an innovative academic curriculum fully integrated with social emotional learning (SEL). The program is carefully designed as a model school to demonstrate the power of blending Six Seconds\u2019
#   # emotional intelligence programs with leading-edge instruction (brain-based, project driven, constructivist learning in school-wide themes).",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/synapse-school/",
#   #   @name="Synapse School",
#   #   @state="California",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="https://www.synapseschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000042e14c8
#   #   @city="unknown",
#   #   @description=
#   #     "The T.H. Rogers School in Houston, Texas offers elementary and middle school students the option of participating in their Vanguard magnet program. The term \u201CVanguard\u201D is used synonymously with \u201Cgifted and talented.\u201D The program is open to gifted students who excel intellectually and have strong creative and leadership abilities. Vanguard courses are designed to be appropriately challenging for the gifted learner and require higher levels of thinking than the general school program.",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/t-h-rogers-school-vanguard-magnet/",
#   #   @name="T.H. Rogers School Vanguard Magnet",
#   #   @state="Texas",
#   #   @type="School Types: Gifted and Magnet",
#   #   @webpage="http://www.houstonisd.org/domain/39768">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000042aeb18
#   #   @city="unknown",
#   #   @description=
#   #     "At the Talented and Gifted School for Young Scholars faculties, parents and students work together to prepare all students to excel in life and develop to their full potential, both intellectually and socially.",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/tag-young-scholars/",
#   #   @name="TAG Young Scholars",
#   #   @state="New York",
#   #   @type="School Types: Gifted and Public",
#   #   @webpage="http://tagscholars.com/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000042a7660
#   #   @city="unknown",
#   #   @description=
#   #     "UNT\u2019s Texas Academy of Mathematics and Science is the nation\u2019s first early college entrance residential program for gifted high school students. Mentored by faculty at the University of North Texas, TAMS students tackle complex, real-world problems, working on solutions and breakthroughs in fields ranging from healthcare to energy consumption. TAMS serves as an important pipeline for STEM education, nurturing the next generation of innovators.",
#   #   @grades=["9-12"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/texas-academy-of-mathematics-and-science/",
#   #   @name="Texas Academy of Mathematics and Science",
#   #   @state="Texas",
#   #   @type="School Types: Early Entrance Program (EEP) and Gifted",
#   #   @webpage="https://tams.unt.edu">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000042a4b18
#   #   @city="unknown",
#   #   @description=
#   #     "The 30th Avenue School, also known as Q300, is a progressive, citywide gifted and talented school designed for bright kids that highlights three core values: inclusion, inquiry and responsibility. Through the inclusion of diverse student identities, inquiry-based
#   # learning, and data-driven decision-making, they aim to graduate students who collaborate with others to ask meaningful questions, to solve complex problems, and to engage responsibly with their communities and beyond.",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-30th-avenue-school/",
#   #   @name="The 30th Avenue School",
#   #   @state="New York",
#   #   @type="School Types: Gifted and Public",
#   #   @webpage="https://www.q300.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x000000000429df98
#   #   @city="unknown",
#   #   @description=
#   #     "The Anderson School P. S. 334 is a K-8 public gifted & talented school on the Upper West Side of Manhattan in New York City.",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-anderson-school-p-s-334/",
#   #   @name="The Anderson School P. S. 334",
#   #   @state="New York",
#   #   @type="School Types: Gifted and Public",
#   #   @webpage="http://www.ps334school.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000032dd9f0
#   #   @city="unknown",
#   #   @description=
#   #     "The Avery Coonley School is an independent school located in Downers Grove, Illinois, whose mission is to provide a learning environment that is appropriate for both academically bright and gifted children who are motivated to learn and have demonstrated the potential for the scholastic achievement necessary to succeed in a challenging academic program, in order that they may become positive, productive, and respectful members of society.",
#   #   @grades=["6-8", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/avery-coonley-school-2/",
#   #   @name="The Avery Coonley School",
#   #   @state="Illinois",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="http://www.averycoonley.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000032cf210
#   #   @city="unknown",
#   #   @description=
#   #     "The Calais School is a New Jersey special education private school for students in grades K through 12 Plus with multiple learning disabilities as well as anxiety, mood, behavior and autism spectrum disorders. Students are referred to The Calais School by school districts, health professionals, and concerned parents throughout northern New Jersey. They offer the only program for gifted and talented students with special needs in our Twice Exceptional Program, which has been recognized by the New Jersey School Boards Association (NJSBA) as one of the 10 best programs in the state.",
#   #   @grades=["6-8", "9-12", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-calais-school/",
#   #   @name="The Calais School",
#   #   @state="Twice-Exceptional",
#   #   @type="School Types: Gifted, Private, and Twice-Exceptional",
#   #   @webpage="https://www.thecalaisschool.org/educational-programs/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003ee3ab0
#   #   @city="unknown",
#   #   @description=
#   #     "The Dinoff School, recognizes that students who possess exceptional gifts and talents should be granted the direction, time, encouragement, and resources to maximize their potential, whether it be in the area of intellect, specific academics, creativity, or leadership. While a school for the gifted, the Dinoff School also has an emphasis on performing arts.",
#   #   @grades=["6-8", "9-12", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-dinoff-school/",
#   #   @name="The Dinoff School",
#   #   @state="Georgia",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="https://thedinoffschool.com/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003eba020
#   #   @city="unknown",
#   #   @description=
#   #     "The Grayson School is Pennsylvania\u2019s only independent school offering an accelerated academic program created specifically for gifted learners.\u00A0 Their innovative, research-based curriculum provides challenging academics, project-based learning, enrichment, and individualized pacing in a safe and nurturing environment for students in grades Pre-K through 8.",
#   #   @grades=["6-8", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-grayson-school/",
#   #   @name="The Grayson School",
#   #   @state="Pennsylvania",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="http://thegraysonschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003ea4680
#   #   @city="unknown",
#   #   @description=
#   #     "The High School for Math, Science and Engineering (HSMSE) at The City College of New York is a unique and unparalleled, collaborative, educational experience in which talented students are challenged to expand their intellect and to develop the habits of inquiry,
#   # expression, critical thinking, problem seeking as well as problem solving, research and presentation. The academically rigorous learning environment will focus on math, science and engineering while emphasizing civic responsibility and the value of knowledge for its own intrinsic reward.",
#   #   @grades=["9-12"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-high-school-for-math-science-engineering/",
#   #   @name="The High School for Math, Science & Engineering",
#   #   @state="Engineering",
#   #   @type="School Types: Gifted and Public",
#   #   @webpage="http://hsmse.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003e8b248
#   #   @city="unknown",
#   #   @description=
#   #     "The Lang School offers high potential, gifted, and twice exceptional (2E) learners in grades 1-12 a child-centered, STEM- and STEAM-driven education informed by the ethics and poetics of the humanities. Curious young minds thrive here \u2014 perhaps for the first
#   # time \u2014 learning at their level with affinity and ability peers in small classes of no more than 12 students. Specially trained educators differentiate the content and delivery of our flexibly standards-based academics, so every student receives an education that
#   # fits.",
#   #   @grades=["6-8", "9-12", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-lang-school/",
#   #   @name="The Lang School",
#   #   @state="Twice-Exceptional",
#   #   @type="School Types: Gifted, Private, and Twice-Exceptional",
#   #   @webpage="http://www.thelangschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003e5e658
#   #   @city="unknown",
#   #   @description=
#   #     "The Liberty School is an independent elementary school. The hallmarks of the school\u2019s scholastic program are a\u00A0customized curriculum for each child, one-on-one instruction, and progressive approaches to teaching.\u00A0 Their mission is to provide individualized, dynamic education for dyslexic, academically gifted, and twice-exceptional (both dyslexic and gifted) students.",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-liberty-school/",
#   #   @name="The Liberty School",
#   #   @state="Twice-Exceptional",
#   #   @type="School Types: Gifted, Private, and Twice-Exceptional",
#   #   @webpage="http://www.thelibertyschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003e4fdd8
#   #   @city="unknown",
#   #   @description=
#   #     "The Logan School for Creative Learning is a progressive school for the gifted in Denver, Colorado. They offer a dynamic curriculum that teaches the way children learn by giving them hands-on experiences fueled by their own curiosities. Their mission is to provide
#   # an experience-based educational opportunity for gifted children of all backgrounds that allow each child to develop individually to his or her full potential.",
#   #   @grades=["6-8", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-logan-school-for-creative-thinking/",
#   #   @name="The Logan School for Creative Thinking",
#   #   @state="Colorado",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="http://www.theloganschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003e3bcc0
#   #   @city="unknown",
#   #   @description=
#   #     "At the Lab School, the focus is to meet the needs of students identified as gifted and talented. Their goal is to provide an appropriate education for those students in one of several ways: acceleration, curriculum compacting, and in-depth study. The New York Lower Lab School is a District 2 Gifted and Talented Public Elementary school for students Kindergarten through Fifth grade. Students must apply for admission under the jurisdiction of the New York City Dept of Education.",
#   #   @grades=["K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/lower-lab-school-nyc/",
#   #   @name="The Lower Lab School NYC",
#   #   @state="New York",
#   #   @type="School Types: Gifted and Public",
#   #   @webpage="https://ps77lowerlab.org/about/our-mission/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003d224d8
#   #   @city="unknown",
#   #   @description=
#   #     "Mirman School is an independent, co-educational day school for highly gifted children in grades K-8 located in Los They cultivate
#   # the boundless potential of highly gifted children, nurture their passions and talents, and develop a diverse community of creative and constructive lifelong learners.",
#   #   @grades=["6-8", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-mirman-school/",
#   #   @name="The Mirman School",
#   #   @state="California",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="https://mirman.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003d0c750
#   #   @city="unknown",
#   #   @description=
#   #     "The Nueva School is an internationally-recognized independent school PK-12, serving gifted and talented students since 1967.\u00A0 A three-time winner of the US Department of Education National Blue Ribbon Award, Nueva is a student-centered school known for its distinctive inquiry-based interdisciplinary studies, constructivist project-based learning, and its pioneering work in social emotional
#   # learning and design thinking. Nueva has two campuses: Grades PreK \u2013 8 meet at the Hillsborough Campus in Hillsborough, CA and Grades 9 \u2013 12 meet at the Bay Meadows Campus located in San Mateo, CA.",
#   #   @grades=["6-8", "9-12", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-nueva-school/",
#   #   @name="The Nueva School",
#   #   @state="California",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="http://www.nuevaschool.org/  ">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003cefa10
#   #   @city="unknown",
#   #   @description=
#   #     "The Roeper School is a private coeducational day school for gifted children, with campuses in Birmingham and Bloomfield Hills, Michigan in Greater Detroit, serving students at all levels from preschool through the 12th grade. \u00A0Founded by George and Annemarie
#   # Roeper in 1941, The Roeper School is known for educating the whole child in an emotionally supportive, intellectually engaging environment. Roeper seeks students who are curious about learning, internally motivated, self-directed, and have a high ability to think abstractly.",
#   #   @grades=["6-8", "9-12", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-roeper-school/",
#   #   @name="The Roeper School",
#   #   @state="Michigan",
#   #   @type="School Types: Gifted, Private, and Twice-Exceptional",
#   #   @webpage="https://www.roeper.org/  ">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003cd66a0
#   #   @city="unknown",
#   #   @description=
#   #     "The Sage School\u2019s mission is to prepare gifted students to excel, by providing a comprehensive program of academic rigor and
#   # social growth inspired by passionate teachers within a nurturing community. They are a small, cohesive, nurturing community that values the free expression of ideas, the individual contributions of all its members, and all types of diversity. The Sage School is New England\u2019s recognized leader in gifted education, with a proven history of preparing graduates to confidently navigate and succeed in a dynamic world.",
#   #   @grades=["6-8", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-sage-school/",
#   #   @name="The Sage School",
#   #   @state="Massachusetts",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="http://www.sageschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003235340
#   #   @city="unknown",
#   #   @description=
#   #     "The Schilling School for Gifted Children is a not for profit, independent, coeducational institution founded in 1997. Nationally,
#   # it is one of only two schools serving gifted students K-12. They focus on individualized gifted education, embracing the \u201Cwhole child\u201D philosophy wherein the mental, physical, emotional, and spiritual facets of a child\u2019s development will be nurtured. Their curriculum is not bound by the common core and standardized testing limitations. The unique schedule allows for extensive elective offerings including 9 foreign language options available in all grades.",
#   #   @grades=["6-8", "9-12", "K-5"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/the-schilling-school-for-gifted/",
#   #   @name="The Schilling School for Gifted",
#   #   @state="Ohio",
#   #   @type="School Types: Gifted and Private",
#   #   @webpage="https://www.schillingschool.org/">,
#   #   #<GiftedSchoolsCLIProject::School:0x00000000031c4c30
#   #   @city="unknown",
#   #   @description=
#   #     "The University School of Milwaukee is a pre-primary through secondary school in the greater Milwaukee area and is one of the top college preparatory schools in the United States. Students are able to accelerate their learning through the school\u2019s Summer Institute for Academic Advancement, which offers summer courses to students who wish to continue their academic pursuits outside of the traditional school year.",
#   #   @grades=["6-8", "9-12", "K-5", "Pre-K"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/university-school-of-milwaukee/",
#   #   @name="University School of Milwaukee",
#   #   @state="Wisconsin",
#   #   @type="School Types: Gifted and Magnet",
#   #   @webpage="https://www.usmk12.org">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003be6088
#   #   @city="unknown",
#   #   @description=
#   #     "Walter Reed Middle School is a traditional school in North Hollywood, CA and has an enrollment of over 1600 students in grades 6,
#   # 7 and 8. The school implements a gifted curriculum model designed to offer a full program for many needs, including an IHP (Individual Honors Program) and a comprehensive program for students with challenging needs.",
#   #   @grades=["6-8"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/walter-reed-middle-school/",
#   #   @name="Walter Reed Middle School",
#   #   @state="California",
#   #   @type="School Types: Gifted, Public, and Twice-Exceptional",
#   #   @webpage="http://www.reedms.com/">,
#   #   #<GiftedSchoolsCLIProject::School:0x0000000003bd7a10
#   #   @city="unknown",
#   #   @description=
#   #     "Whitney High School is a public magnet school in Cerritos, California serving students 7th through 12th grade, offering alternative education for high achieving students selected throughout the district. WHS strives to develop intrinsically motivated, collaborative learners who approach their education purposefully and creatively, preparing academically proficient students for entrance to and success at their best-match university. Whitney has consistently ranked among the top high schools in the US since 2007.",
#   #   @grades=["6-8", "9-12"],
#   #   @learning_profile="Gifted",
#   #   @more_info_url="https://educationaladvancement.org/grc/whitney-high-school/",
#   #   @name="Whitney High School",
#   #   @state="California",
#   #   @type="School Types: Gifted, Magnet, and Public",
#   #   @webpage="https://www.whitneyhs.us/">
#   #   ]
#   #   end

#     def self.all 
#       @@all_schools
#     end

# end
