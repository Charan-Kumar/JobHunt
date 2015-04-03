task :tags => [:environment] do
  require 'nokogiri'
  require 'open-uri'
  
  for i in 1..12
    url = "https://angel.co/new_tags/tag_list_paginated?page="+i.to_s+"&sort=followers&type=SkillTag"
    doc = Nokogiri::HTML(open(url))

    doc.css("#tags_list > div.items").each do |item|
      name=item.css("div.item-tag > a").text
      id = item.attr('data-tag_id')
      AngelTag.create(:tag_id => id, :tag_name => name)
    end
  end
end