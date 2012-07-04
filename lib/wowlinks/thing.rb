module Wowlinks
  class Thing
    attr_reader :id, :key, :name, :texture, :quality

    def initialize(id)
      @id = id
      @key = "#{type}#{@id}"

      get_data
    end

    def type
      'thing'
    end

    def to_html
      return @html if @html

      params = {
        class: "wowlinks #{@quality}",
        href: "http://wowhead.com/#{type}=#{@id}",
        style: "background-image:url(http://static.wowhead.com/images/wow/icons/tiny/#{@texture}.gif)",
      }.map { |k,v | "#{k}='#{v}'" }.join(' ')

      @html = "<a #{params}>#{@name}</a>"
    end

    def to_json
      @json
    end

    private

    def get_data
      @json = Wowlinks.cache.read(@key) || Wowlinks.cache.write(@key, get_json!)
      data = JSON.parse(@json)

      @name = data['name']
      @texture = data['texture']
      @quality = data['quality']
    end

    def get_json!
      {
        name: "[#{type.capitalize} #{id}]",
        texture: 'inv_misc_questionmark',
        quality: 'error',
      }.to_json
    end
  end
end
