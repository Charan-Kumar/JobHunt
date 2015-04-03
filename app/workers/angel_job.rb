class AngelJob
  include Sidekiq::Worker
  def perform()
    # if AngelTag.where(:tag_name => name)
    puts "Hello, How are you"
  end
end