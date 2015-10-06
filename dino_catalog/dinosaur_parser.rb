require 'csv'
require 'pry'
load 'dino_dex.rb'
class DinosaurParser

  attr_accessor :dinosaurs

  def initialize
    @all_files = Dir.glob("*.csv")
    @dinosaurs = []
  end

  def parse_files
    @all_files.each do |file|
      file = CSV.read(file, headers: true)
      file.each do |row|
        dinosaurs << Dinosaur.new(row['Genus'] || row['NAME'],
                                      row['Period'] || row['PERIOD'],
                                      row['Carnivore'] || row['DIET'],
                                      row['Weight'] || row['WEIGHT_IN_LBS'],
                                      row['Walking'] || row['WALKING'],
                                      row['CONTINENT'],
                                      row['DESCRIPTION'])
      end
    end
  end

  def set_carnivore
    dinosaurs.each do |dinosaur|
      is_carnivore?(dinosaur) ? dinosaur.carnivore = "Yes" : dinosaur.carnivore = "no"
    end
  end

  def is_carnivore?(dinosaur)
    ["Carnivore","Insectivore", "Piscivore"].include? dinosaur.carnivore
  end
end

dinos = DinosaurParser.new
dinos.parse_files
dinos.set_carnivore
p dinos
