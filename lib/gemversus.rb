module GemVersus
  require 'rubygems'
  require 'hpricot'
  require 'rest-client'
  require 'uri'
  
  
  def self.foo
    "Gem Versus module"
  end
  
  def self.go
    2+2
  end
  
  class Entry
    attr_accessor :title, :description
 
      
    def initialize(title = nil,description=nil)
      @title =  title
      @description = description
    end
  
  end
  
  class Enttt
    attr_accessor :title, :description
   
    def initialize(title = nil,description=nil)
      @title =  title
      @description = description
    end
  
  end
  
  class Foo
    attr_accessor :url, :xml
    
    def initialize(url)
      @url =  URI.parse(url)
    end
    
    def get
      begin
      @xml =  RestClient.get @url.to_s
      rescue => e
         e.response
       end
    end
    
    def get_items
      self.get
      items = Array.new
      doc = Hpricot(@xml)
      (doc/"channel/item").each do |item|
         ob = GemVersus::Entry.new
         ob.title = item.search('title').inner_html.gsub(/\n/,"").gsub(/\t/,'')
         ob.description = item.search('description').inner_html.gsub(/\n/,"").gsub(/\t/,'')
         items.push(ob)
       end
       return items
    end
    
    def to_s
      @xml
    end
    
    def boo
      "foo boo"
    end
  end
  
end