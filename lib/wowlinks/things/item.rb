module Wowlinks
  class Item < Thing
    QUALITIES ||= %w(poor common uncommon rare epic legendary artifact heirloom)

    def type
      'item'
    end

    def get_json!
      json = JSON.load(open("http://us.battle.net/api/wow/item/#{@id}"))

      {
        name: json['name'],
        texture: json['icon'],
        quality: QUALITIES[json['quality']],
      }.to_json
    end
  end
end
