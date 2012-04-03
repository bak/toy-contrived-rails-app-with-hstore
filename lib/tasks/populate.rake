namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    
    [Entry].each(&:delete_all)

    231.times do |i|
      entry = Entry.new
      entry.content = {}
      entry.content['type'] = 'text'
      entry.content['body'] = Faker::Lorem.sentences(5).join(" ")
      entry.content['author'] = Faker::Name.name
      entry.save
    end

    123.times do |i|
      entry = Entry.new
      entry.content = {}
      entry.content['type'] = 'link'
      entry.content['url'] = Faker::Internet.domain_name
      entry.content['title'] = Faker::Lorem.words(4).join(' ')
      entry.save
    end

    321.times do |i|
      entry = Entry.new
      entry.content = {}
      entry.content['type'] = 'document'
      entry.content['url'] = Faker::Internet.domain_name + '/' + Faker::Lorem.words(2).join('_') + ".pdf"
      entry.content['size'] = rand(10_000)
      entry.save
    end
  end
end
