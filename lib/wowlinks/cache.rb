module Wowlinks
  class Cache
    attr_reader :directory

    def initialize(directory = './.wowlinks-cache')
      @directory = File.expand_path(directory)

      FileUtils.mkdir(@directory) unless File.directory?(@directory)
    end

    def write(file, data)
      file = file_path(file)

      data if File.open(file, 'w') { |f| f.write(data) }
    end

    def read(file, threshold = nil)
      file = file_path(file)

      File.read(file) if File.exists?(file) && (!threshold || Time.now - File.mtime(file) <= threshold)
    end

    def delete(file)
      file = file_path(file)

      File.delete(file)
    end

    def file_path(file)
      File.expand_path(File.join(@directory, file))
    end
  end

  def self.cache
    @_cache ||= Wowlinks::Cache.new
  end
end