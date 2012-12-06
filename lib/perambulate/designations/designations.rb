module Perambulate
  class Designations
    AVENUE = :avenue

    @@parselist = /Alley|Avenue|Circle|Close|Court|Crescent|Drive|Esplanade|Fairway|Lane|Place|Parade|Park|Road|Street|Terrace|Way/

    def self.parselist
      @@parselist
    end

    def self.all
    end

    def self.names_for_all
      parselist.to_s.gsub!('|', ', ').gsub!("(?-mix:", "").gsub(")", "")
    end

    def self.add(options)
    end

    def self.count
      1
    end
  end
end
