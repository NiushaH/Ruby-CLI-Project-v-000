=================
    NARRATIVE
=================
Children in single parent households depend on one person to support them
in all aspects of their lives as they grow through ages and stages of
development.  It is a challenge for one person to create their best life
let alone to support the best life for all their children as well.  That
is why their "village", their community is so vital to the livelihood and
outcome of how their children grow to become who they are meant to be.
Add in more challenges like neurodiversity, economic insecurity, and lack
of familial ties and all of a sudden single parenting becomes a chapter
in life that a family needs all the good, educated, and kind help they
can get.  That is why Villagetopia was created -- to help connect
families who need the connections and support organizations have to offer
so they can live their best lives and rise up to their potential, paying
forward their gifts and talents to society.

=========================
    PRE-CLI CHECKLIST
=========================
1. An overall summary of the application.
 An application that will triangulate data from multiple sources to give
 you the "best places in USA" to live.

When you're a parent of children with learning differences you want to
gather the best resources to support your child's development so that
they can grow up with a strong foundation.  There is a big world of
scholars and educators who are dedicated to helping your child learn
best and thrive in society, but often such resources are difficult to
find and tap into while you're learning about how to best support your
children today.  This app will help triangulate data available on the
WWW so that parents can ultimately find the best place for their family
to set up roots by narrowing down the possibilities where their children
can realistically be in the best environment possible.


2. What is your application going to do?

Output a list of metropolitan areas that have schools for family's makeup
to give a list of possible good places for them to consider relocating by
asking the user for its family makeup: single or married and kids learning
profile.

If single with gifted kids, take the best places to live for singles list
   and run through gifted schools list to see if any matches.
If single with gifted and dyslexic kids, take the best places to live for
   singles list and run  through gifted schools list and dyslexic schools
   list to see if any matches.
If single with dyslexic kids, take the best places to live for singles list
   and run through dyslexic schools list to see if any matches.

If married with gifted kids, take the best places to live for couples list
   and run through gifted schools list to see if any matches.
If married with gifted and dyslexic kids, take the best places to live for
   couples list and run through gifted schools list and dyslexic schools
   list to see if any matches.
If married with dyslexic kids, take the best places to live for couples
   list and run through dyslexic schools list to see if any matches.

================
  STRETCH GOAL
================
If no matches of above selections, run through list again using Google's
   Distance Matrix API and output those best places locations with schools
   less than one hour driving time distance from each other and output those.

============================================
    Responses to the best of my ability:
============================================

What website will you be scraping?
Level 1 Autism/HfA Asperger's Schools: https://www.ourkids.net/aspergers-schools-usa.php
Dyslexia Schools: https://www.dyslexia-reading-well.com/schools-for-dyslexia-united-states.html, private school list: https://www.ortonacademy.org/accreditation/dyslexia-in-schools/ or http://dyslexiahelp.umich.edu/answers/independent-schools, ed developer site for APIs: https://nces.ed.gov/ccd/schoolsearch/ or https://nces.ed.gov/ccd/elsi/
Gifted Schools: Institute for Educational Advancement <a href: https://educationaladvancement.org/resource/schools>
Twice Exceptional: https://educationaladvancement.org/resource/schools/?_sft_school-type=twice-exceptional
Best Places for Families: https://realestate.usnews.com/places/rankings/best-places-to-live
Best Places for Single Parents: https://www.magnifymoney.com/blog/strategies-to-save/best-places-for-raising-a-family-as-a-single-parent/


What will you need to do with the data you return from scraping?
I will need to create schools with location attributes and places objects (that are locations) so that the code can search for exact matches.  When exact location matches are not found, I will need the Google Distance Matrix API to calculate the distance between school and places locations, sort it by distance length, and then consider those with less than one hour distances to be a possible "match" of schools and places.

What classes will you be using?
Schools
Places

What will be the flow of displaying data for your application. ex How will your CLI portion work.
* Ask the user if they are a one or two parent family.
* Ask the user what learning differences their child has (level 1 autism/asperger's, dyslexia, gifted).
* Take data from 6 sites (a 2e directory of schools, a gifted schools directory, a dyslexia schools directory, a best places for families, a best places for single parents, a best places for entrepreneurs) and then run code that will:
           - compare locations of the schools with best places list user identified with, and
           - any that are within 1 hour driving distance of each other will be grouped into a set, and
           - the results will output a list of metropolitan areas that have schools for family's makeup to give a list of possible good places for them to consider relocating.
           - then the user can have the option to go one level deep (school website, city website) to learn more about any of the places or schools in the output list

How will you display data one level deep to the user?
Ask user to select a metropolitan area if they want to see the details about the metropolitan area: i.e. one level deep on best place to live, 2e school data, gifted school data, dyslexia school data