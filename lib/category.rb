
class Category
  attr_reader :color, :name, :slug, :subcategories

  def initialize(name: nil, slug: nil, subcategories: nil, color: nil)
    @name = name
    @slug = slug
    @color = color
    
    if subcategories
      @subcategories = subcategories.map { |sc| Category.new(sc) }
    end
  end

  def self.all
    @_categories ||= CATEGORIES.values.map{ |c| Category.new(c) }
  end

  def self.find(slug)
    Category.new(CATEGORIES[slug.to_sym])
  end

  private

  CATEGORIES = {
    arts: {
      name: "Art/Entertainment",
      slug: "arts",
      color: 'pink',
      subcategories: [
        {name: 'Art History', slug: 'arts-arthistory'},
        {name: 'Celebrity Gossip', slug: 'arts-gossip'},
        {name: 'Concerts', slug: 'arts-concerts'},
        {name: 'Fine Art', slug: 'arts-finearts'},
        {name: 'Humor', slug: 'arts-humor'},
        {name: 'Movies', slug: 'arts-movies'},
        {name: 'Television', slug: 'arts-tv'}
      ]
    },
    auto: {
      name: "Automotive",
      slug: "auto",
      color: 'red',
      subcategories: [
        {name: 'Auto Parts', slug: 'auto-autoparts'},
        {name: 'Consumer Cars', slug: 'auto-consumercars'},
        {name: 'Motorcycles', slug: 'auto-motorcycles'},
        {name: 'Off-Road Vehicles', slug: 'auto-offroaders'},
        {name: 'Sport Vehicles', slug: 'auto-sportcars'},
        {name: 'Roadside Assistance', slug: 'auto-roadsideassistance'},
        {name: 'Vintage Cars', slug: 'auto-vintagecars'},
      ]
    },
    business: {
      name: "Business",
      slug: "business",
      color: 'purple',
      subcategories: [
        {name: 'Advertising', slug: 'business-advertising'},
        {name: 'Agricultural', slug: 'business-agricultural'},
        {name: 'Bioengineering', slug: 'business-bioengineering'},
        {name: 'Business Software', slug: 'business-businesstech'},
        {name: 'Forestry', slug: 'business-forestry'},
        {name: 'Green Solutions', slug: 'business-eco'},
        {name: 'Human Resources', slug: 'business-hr'},
        {name: 'Logistics', slug: 'business-logistics'},
        {name: 'Marketing', slug: 'business-marketing'},
        {name: 'Metals', slug: 'business-metals'},
        {name: 'Real Estate', slug: 'business-realestate'},
        {name: 'Transportation', slug: 'business-transportation'}
      ]
    },
    career: {
      name: "Careers",
      slug: "career",
      color: 'deep-purple',
      subcategories: [
        {name: 'Career Advice', slug: 'careers-careeradvice'},
        {name: 'Career Planning', slug: 'careers-careerplanning'},
        {name: 'Financial Aid', slug: 'careers-finaid'},
        {name: 'Job Searching', slug: 'careers-jobsearch'},
        {name: 'Resume Advice', slug: 'careers-resumeadvice'},
        {name: 'Telecommuting', slug: 'careers-telecommuting'}
      ]
    },
    edu: {
      name: "Education",
      slug: "edu",
      color: 'indigo',
      subcategories: [
        {name: 'Adult Education', slug: 'education-adulted'},
        {name: 'College Life', slug: 'education-college'},
        {name: 'College Administration', slug: 'education-collegeadmin'},
        {name: 'Distance Learning', slug: 'education-distancelearning'},
        {name: 'ESOL', slug: 'education-esol'},
        {name: 'Graduate School', slug: 'education-graduateschool'},
        {name: 'Homeschooling', slug: 'education-homeschooling'},
        {name: 'Homework', slug: 'education-homework'},
        {name: 'Language Learning', slug: 'education-languagelearning'},
        {name: 'Primary School', slug: 'education-primaryschool'},
        {name: 'Private School', slug: 'education-privateschool'},
        {name: 'Scholarships', slug: 'education-scholarships'},
        {name: 'Secondary School', slug: 'education-secondaryschool'},
        {name: 'Special Education', slug: 'education-specialed'}
      ]
    },
    family: {
      name: "Family & Parenting",
      slug: "family",
      color: 'blue',
      subcategories: [
        {name: 'Parenting (Toddler/Infant)', slug: 'parenting-parentingtoddler'},
        {name: 'Parenting (K-6)', slug: 'parenting-parentingk6'},
        {name: 'Parenting (Teen)', slug: 'parenting-parentingteen'},
        {name: 'Pregnancy', slug: 'parenting-pregnancy'},
        {name: 'Special Needs Children', slug: 'parenting-specialneeds'}
      ]
    },
    food: {
      name: "Food & Drink",
      slug: "food",
      color: 'light-blue',
      subcategories: [
        {name: 'American Cuisine', slug: 'food-americanfood'},
        {name: 'Barbecue & Grilling', slug: 'food-barbecue'},
        {name: 'Beer', slug: 'food-beer'},
        {name: 'Cajun Cuisine', slug: 'food-cajunfood'},
        {name: 'Chinese Cuisine', slug: 'food-chinesefood'},
        {name: 'Cocktails', slug: 'food-cocktails'},
        {name: 'Coffee & Tea', slug: 'food-coffee'},
        {name: 'Desserts', slug: 'food-desserts'},
        {name: 'Food Allergies', slug: 'food-foodallergies'},
        {name: 'French Cuisine', slug: 'food-frenchfood'},
        {name: 'Healthy Cooking', slug: 'food-healthfood'},
        {name: 'Italian Cuisine', slug: 'food-italianfood'},
        {name: 'Japanese Cuisine', slug: 'food-japanesefood'},
        {name: 'Mexican Cuisine', slug: 'food-mexicanfood'},
        {name: 'Vegan Cuisine', slug: 'food-veganfood'},
        {name: 'Vegetarian Cuisine', slug: 'food-vegetarianfood'},
        {name: 'Wine', slug: 'food-wine'}
      ]
    },
    health: {
      name: "Health & Fitness",
      slug: "health",
      color: 'cyan',
      subcategories: [
        {name: 'Depression', slug: 'health-depression'},
        {name: 'Diabetes', slug: 'health-diabetes'},
        {name: 'Epilepsy', slug: 'health-epilepsy'},
        {name: 'Headaches & Migraines', slug: 'health-headache'},
        {name: 'Heart Disease', slug: 'health-diseaseheart'},
        {name: 'Herbal Therapies', slug: 'health-herbal'},
        {name: 'Crohns Disease', slug: 'health-diseasecrohns'},
        {name: "Men's Health", slug: 'health-healthmen'},
        {name: 'Nutrition', slug: 'health-nutrition'},
        {name: 'Anxiety Disorders', slug: 'health-anxiety'},
        {name: 'Physical Therapy', slug: 'health-physicaltherapy'},
        {name: 'Psychology & Psychiatry', slug: 'health-psychology'},
        {name: 'Smoking Cessation', slug: 'health-quitsmoking'},
        {name: 'Substance Abuse', slug: 'health-drugabuse'},
        {name: 'Vitamins & Supplements', slug: 'health-vitamins'},
        {name: 'Weight Loss', slug: 'health-weightloss'},
        {name: "Women's Health", slug: 'health-healthwomen'}
      ]
    },
    hobbies: {
      name: "Hobbies",
      slug: "hobbies",
      color: 'teal',
      subcategories: [
        {name: 'Astrology', slug: 'hobbies-astrology'},
        {name: 'Beadwork', slug: 'hobbies-beadwork'},
        {name: 'Bird watching', slug: 'hobbies-birdwatching'},
        {name: 'Board Games/Puzzles', slug: 'hobbies-puzzles'},
        {name: 'Boating', slug: 'hobbies-boating'},
        {name: 'Chess', slug: 'hobbies-chess'},
        {name: 'Comic Books', slug: 'hobbies-comics'},
        {name: 'Crafts', slug: 'hobbies-crafts'},
        {name: 'Drawing/Sketching', slug: 'hobbies-drawing'},
        {name: 'Genealogy', slug: 'hobbies-geneaology'},
        {name: 'Guitar', slug: 'hobbies-guitar'},
        {name: 'Home Recording', slug: 'hobbies-homerecording'},
        {name: 'Jewelry Making', slug: 'hobbies-jewelrymaking'},
        {name: 'Magic & Illusion', slug: 'hobbies-magic'},
        {name: 'Needlework', slug: 'hobbies-needlework'},
        {name: 'Painting', slug: 'hobbies-painting'},
        {name: 'Photography', slug: 'hobbies-photography'},
        {name: 'Radio', slug: 'hobbies-radio'},
        {name: 'Roleplaying Games', slug: 'hobbies-rpgs'},
        {name: 'Sci-Fi & Fantasy', slug: 'hobbies-scifi'},
        {name: 'Screenwriting', slug: 'hobbies-screenwriting'},
        {name: 'Stamps & Coins', slug: 'hobbies-stamps'},
        {name: 'Video & Computer Games', slug: 'hobbies-videogames'},
        {name: 'Woodworking', slug: 'hobbies-woodworking'},
        {name: 'Writing', slug: 'hobbies-writing'}