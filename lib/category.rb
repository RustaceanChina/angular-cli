
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
      ]
    },
    home: {
      name: "Home & Garden",
      slug: "home",
      color: 'green',
      subcategories: [
        {name: 'Appliances', slug: 'home-appliances'},
        {name: 'Cleaning', slug: 'home-cleaning'},
        {name: 'Environmental Safety', slug: 'home-ecosafety'},
        {name: 'Gardening', slug: 'home-gardening'},
        {name: 'Home Repair', slug: 'home-homerepair'},
        {name: 'Home Theater', slug: 'home-hometheater'},
        {name: 'Interior Decorating', slug: 'home-interiordecorating'},
        {name: 'Remodeling & Construction', slug: 'home-remodeling'}
      ]
    },
    government: {
      name: "Law & Government",
      slug: "government",
      color: 'light-green',
      subcategories: [
        {name: 'Immigration', slug: 'government-immigration'},
        {name: 'Legal Issues', slug: 'government-legalissues'},
        {name: 'Government Resources', slug: 'government-govresources'}
      ]
    },
    lifestyle: {
      name: "Lifestyle",
      slug: "lifestyle",
      color: 'lime',
      subcategories: [
        {name: 'Dating', slug: 'lifestyle-dating'},
        {name: 'Divorce', slug: 'lifestyle-divorce'},
        {name: 'Gay Life', slug: 'lifestyle-gay'},
        {name: 'Holidays', slug: 'lifestyle-holidays'},
        {name: 'Marriage', slug: 'lifestyle-marriage'},
        {name: 'Senior Living', slug: 'lifestyle-seniorliving'},
        {name: 'Teens', slug: 'lifestyle-teen'},
        {name: 'Weddings', slug: 'lifestyle-wedding'}
      ]
    },
    music: {
      name: "Music",
      slug: "music",
      color: 'yellow',
      subcategories: [
        {name: 'Alternative Rock', slug: 'music-altrockmusic'},
        {name: 'Blues', slug: 'music-bluesmusic'},
        {name: 'Christian & Gospel Music', slug: 'music-christianmusic'},
        {name: 'Classic Rock', slug: 'music-rockmusic'},
        {name: 'Country Music', slug: 'music-countrymusic'},
        {name: 'Electronic Music', slug: 'music-electronicmusic'},
        {name: 'Hip Hop & Rap', slug: 'music-rapmusic'},
        {name: 'Indie Music', slug: 'music-indiemusic'},
        {name: 'Jazz', slug: 'music-jazzmusic'},
        {name: 'Latin Music', slug: 'music-latinmusic'},
        {name: 'Metal', slug: 'music-metalmusic'},
        {name: 'Pop', slug: 'music-popmusic'},
        {name: 'Progressive Rock', slug: 'music-progressiverockmusic'},
        {name: 'R&B & Soul', slug: 'music-soulmusic'},
        {name: 'Reggae', slug: 'music-reggaemusic'},
        {name: 'World Music', slug: 'music-worldmusic'}
      ]
    },
    news: {
      name: "News",
      slug: "news",
      color: 'amber',
      subcategories: [
        {name: 'Tabloids', slug: 'news-tabloids'},
        {name: 'International News', slug: 'news-intnews'},
        {name: 'Local News', slug: 'news-locnews'},
        {name: 'National News', slug: 'news-natnews'}
      ]
    },
    finance: {
      name: "Personal Finance",
      slug: "finance",
      color: 'orange',
      subcategories: [
        {name: 'Credit, Debt, & Loans', slug: 'finance-credit'},
        {name: 'Financial News', slug: 'finance-finnews'},
        {name: 'Financial Planning', slug: 'finance-finplanning'},
        {name: 'Hedge Fund', slug: 'finance-hedgefund'},
        {name: 'Insurance', slug: 'finance-insurance'},
        {name: 'Investing', slug: 'finance-investing'},
        {name: 'Mutual Funds', slug: 'finance-mutualfunds'},
        {name: 'Options', slug: 'finance-options'},
        {name: 'Retirement Planning', slug: 'finance-retirement'},
        {name: 'Stocks', slug: 'finance-stocks'},
        {name: 'Tax Planning', slug: 'finance-taxes'}
      ]
    },
    pets: {
      name: "Animals/Pets",
      slug: "pets",
      color: 'deep-orange',
      subcategories: [
        {name: 'Aquatic Life', slug: 'pets-aquaticlife'},
        {name: 'Birds', slug: 'pets-birds'},
        {name: 'Cats', slug: 'pets-cats'},
        {name: 'Dogs', slug: 'pets-dogs'},
        {name: 'Reptiles', slug: 'pets-reptiles'},
        {name: 'Veterinary Medicine', slug: 'pets-veterinarian'}
      ]
    },
    politics: {
      name: "Politics",
      slug: "politics",
      color: 'brown',
      subcategories: [
        {name: 'Democrat', slug: 'politics-democrat'},
        {name: 'Environmental Issues', slug: 'politics-ecoissue'},
        {name: 'Free Market Issues', slug: 'politics-freemarket'},
        {name: 'Republican', slug: 'politics-republican'}
      ]
    },
    property: {
      name: "Real Estate",
      slug: "property",
      color: 'grey',
      subcategories: [
        {name: 'Apartments', slug: 'realestate-apartments'},
        {name: 'Homes', slug: 'realestate-homeschooling'},
        {name: 'Timeshares', slug: 'realestate-timeshares'}
      ]
    },
    religion: {
      name: "Religion & Spirituality",
      slug: "religion",
      color: 'blue-grey',
      subcategories: [
        {name: 'Alternative Religions', slug: 'religion-altreligion'},
        {name: 'Atheism & Agnosticism', slug: 'religion-atheism'},
        {name: 'Buddhism', slug: 'religion-buddhism'},
        {name: 'Catholicism', slug: 'religion-catholicism'},
        {name: 'Christianity', slug: 'religion-christianity'},
        {name: 'Hinduism', slug: 'religion-hinduism'},
        {name: 'Islam', slug: 'religion-islam'},
        {name: 'Judaism', slug: 'religion-judaism'},
        {name: 'Latter Day Saints', slug: 'religion-mormon'},
        {name: 'Pagan', slug: 'religion-pagan'},
        {name: 'General Spirituality', slug: 'religion-spirituality'}
      ]
    },
    science: {
      name: "Science",
      slug: "science",
      color: 'green darken-4',
      subcategories: [
        {name: 'Astronomy', slug: 'science-astronomy'},
        {name: 'Biology', slug: 'science-biology'},
        {name: 'Chemistry', slug: 'science-chemistry'},
        {name: 'Geography', slug: 'science-geography'},
        {name: 'Geology', slug: 'science-geology'},
        {name: 'Paranormal', slug: 'science-paranormal'},
        {name: 'Physics', slug: 'science-physics'}
      ]
    },
    shopping: {
      name: "Shopping",
      slug: "shopping",
      color: 'light-blue darken-4',
      subcategories: [
        {name: 'Apps', slug: 'shopping-apps'},
        {name: 'Contests', slug: 'shopping-contests'},
        {name: 'E-Commerce', slug: 'shopping-ecom'},
        {name: 'Retail', slug: 'shopping-retail'},
        {name: 'Sales', slug: 'shopping-sales'}
      ]
    },
    sports: {
      name: "Sports",
      slug: "sports",
      color: 'red darken-4',
      subcategories: [
        {name: 'Auto Racing', slug: 'sports-racing'},
        {name: 'Baseball', slug: 'sports-baseball'},
        {name: 'Basketball', slug: 'sports-basketball'},
        {name: 'Bicycling', slug: 'sports-bicycling'},
        {name: 'Bodybuilding', slug: 'sports-bodybuilding'},
        {name: 'Boxing', slug: 'sports-boxing'},
        {name: 'Canoeing', slug: 'sports-canoeing'},
        {name: 'Cheerleading', slug: 'sports-cheerleading'},
        {name: 'Climbing', slug: 'sports-climbing'},
        {name: 'Cricket', slug: 'sports-cricket'},
        {name: 'Figure Skating', slug: 'sports-figureskating'},
        {name: 'Fishing', slug: 'sports-fishing'},
        {name: 'Football', slug: 'sports-football'},
        {name: 'Golf', slug: 'sports-golf'},
        {name: 'Horse Racing', slug: 'sports-horseracing'},
        {name: 'Inline Skating', slug: 'sports-skating'},
        {name: 'Martial Arts', slug: 'sports-martialarts'},
        {name: 'Mountain Biking', slug: 'sports-mountainbiking'},
        {name: 'Olympics', slug: 'sports-olympics'},
        {name: 'Paintball', slug: 'sports-paintball'},
        {name: 'Ice Hockey', slug: 'sports-hockey'},
        {name: 'Rodeo', slug: 'sports-rodeo'},
        {name: 'Rugby', slug: 'sports-rugby'},
        {name: 'Running', slug: 'sports-running'},
        {name: 'Sailing', slug: 'sports-sailing'},
        {name: 'Scuba Diving', slug: 'sports-scuba'},
        {name: 'Skateboarding', slug: 'sports-skateboarding'},
        {name: 'Skiing', slug: 'sports-skiing'},
        {name: 'Shooting', slug: 'sports-shooting'},
        {name: 'Snowboarding', slug: 'sports-snowboarding'},
        {name: 'Soccer', slug: 'sports-soccer'},
        {name: 'Surfing', slug: 'sports-surfing'},
        {name: 'Swimming', slug: 'sports-swimming'},
        {name: 'Table Tennis', slug: 'sports-tabletennis'},
        {name: 'Tennis', slug: 'sports-tennis'},
        {name: 'Volleyball', slug: 'sports-volleyball'},
        {name: 'Watersports', slug: 'sports-watersports'}
      ]
    },
    fashion: {
      name: "Style & Fashion",
      slug: "fashion",
      color: 'pink darken-4',
      subcategories: [
        {name: 'Accessories', slug: 'fashion-accessories'},
        {name: 'Beauty', slug: 'fashion-beauty'},
        {name: 'Body Art', slug: 'fashion-bodyart'},
        {name: 'Clothing', slug: 'fashion-clothing'},
        {name: 'Fashion', slug: 'fashion-fashion'},
        {name: 'Hair Styling', slug: 'fashion-hair'},
        {name: 'Jewelry', slug: 'fashion-jewelry'}
      ]
    },
    tech: {
      name: "Technology",
      slug: "tech",
      color: 'cyan accent-3',
      subcategories: [
        {name: 'Animation', slug: 'technology-animation'},
        {name: 'Cameras', slug: 'technology-cameras'},
        {name: 'Cellphones', slug: 'technology-phones'},
        {name: 'Computers', slug: 'technology-computers'},
        {name: 'Tablets', slug: 'technology-tablets'},
        {name: 'Tech Security', slug: 'technology-itsecurity'}
      ]
    },
    travel: {
      name: "Travel",
      slug: "travel",
      color: 'grey darken-4',
      subcategories: [
        {name: 'Adventure Travel', slug: 'travel-traveladventure'},
        {name: 'Air Travel', slug: 'travel-travelair'},
        {name: 'Business Travel', slug: 'travel-travelbusiness'},
        {name: 'Camping', slug: 'travel-camping'},
        {name: 'Cruises', slug: 'travel-cruises'},
        {name: 'Hotels', slug: 'travel-hotels'},
        {name: 'Leisure Travel', slug: 'travel-travelleisure'},
        {name: 'National Parks', slug: 'travel-nationalparks'},
        {name: 'Spas', slug: 'travel-spas'},
        {name: 'Theme Parks', slug: 'travel-themeparks'}
      ]
    }
  }
end