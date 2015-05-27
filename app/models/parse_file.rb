class ParseFile

  attr_accessor :csv

  require 'csv'

  def initialize
    @file = "./data/Mobile_Food_Facility_Permit.csv"
    @csv = CSV.read(@file, headers: true, header_converters: :symbol, converters: :all).collect do |row|
      Hash[row.collect {|c, r| [c,r] }]
    end
  end

  def print
    puts @csv
  end

  def name
    @csv.each do |stuff|
      puts stuff[:applicant]
    end
  end
end
