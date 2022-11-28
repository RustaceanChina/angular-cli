
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