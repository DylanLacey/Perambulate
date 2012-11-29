module Perambulate
  class Designations
    AVENUE = :avenue

    PARSELIST = /Alley|Avenue|Circle|Close|Court|Crescent|Drive|Esplanade|Fairway|Lane|Place|Parade|Park|Street|Terrace|Way/

    def self.names_for_all
      PARSELIST.to_s.gsub!('|', ', ').gsub!("(?-mix:", "").gsub(")", "")
    end
  end
end