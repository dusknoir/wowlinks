module Wowlinks
  class Spell < Thing
    def type
      'spell'
    end

    def get_json!
      html = open("http://wowhead.com/spell=#{@id}").read

      {
        name: html[/>(.+) - Spell - World of Warcraft/, 1],
        texture: html[/Icon.create\('([A-Za-z0-9_-]+)', 2, null, 0, 0\)/, 1],
        quality: 'spell',
      }.to_json
    end
  end
end
