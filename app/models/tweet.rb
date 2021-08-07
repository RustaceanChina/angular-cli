
class Tweet < ApplicationRecord

  TWITTER_USERNAMES = ["katyperry", "justinbieber", "BarackObama", "taylorswift13", "ladygaga", "TheEllenShow", "jtimberlake", "britneyspears", "KimKardashian", "selenagomez", "jimmyfallon", "ArianaGrande", "ddlovato", "JLo", "Oprah", "KingJames", "nytimes", "BillGates", "KevinHart4real", "MileyCyrus", "SportsCenter", "Pink", "LilTunechi", "wizkhalifa", "BrunoMars", "kanyewest", "ActuallyNPH", "danieltosh", "aliciakeys", "NBA", "pitbull", "khloekardashian", "ConanOBrien", "kourtneykardash", "NASA", "NFL", "KendallJenner", "Eminem", "NICKIMINAJ", "KylieJenner", "chrisbrown", "blakeshelton", "aplusk", "MariahCarey", "LeoDiCaprio", "xtina", "SnoopDogg", "RyanSeacrest", "JimCarrey", "KDTrey5", "POTUS44", "Beyonce", "ParisHilton", "funnyordie", "tyrabanks", "ObamaWhiteHouse", "maroon5", "iamwill", "ashleytisdale", "ZacEfron", "SHAQ", "PlayStation", "FoxNews", "WSJ", "HillaryClinton", "tomhanks", "StephenAtHome", "voguemagazine", "SethMacFarlane", "diddy", "charliesheen", "Starbucks", "Ludacris", "Usher", "kelly_clarkson", "kobebryant", "azizansari", "TreySongz", "nickjonas", "TheRock", "enews", "camerondallas", "SarahKSilverman", "BigSean", "AustinMahone", "AP", "Pharrell", "VictoriaJustice", "jessicaalba", "TheOnion", "lindsaylohan", "MarcAnthony", "TEDTalks", "JohnCena", "JColeNC", "andersoncooper", "50cent", "ABC", "washingtonpost", "johnlegend"]

  def self.add_tweets_for_user(user)
    tweets = user.twitter.user_timeline(TWITTER_USERNAMES.sample, count: 200, exclude_replies: true, include_rts: false)
    values = tweets.map { |t|  "(#{t.id}, #{Tweet.connection.quote(t.text)}, now(), now())" }.join(',')

    Tweet.connection.execute("
      INSERT INTO tweets (tweet_id, text, created_at, updated_at)
      VALUES #{values}
      ON CONFLICT (tweet_id) DO NOTHING
    ")
  end

  def self.for_whisper
    tweet = Tweet.where(category_slug: nil, ignored: nil, in_use: nil).first
    tweet.update!(in_use: true)
    return tweet
  end

  def self.for_whisper?
    Tweet.exists?(category_slug: nil, ignored: nil, in_use: nil)
  end
end