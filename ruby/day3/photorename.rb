#!/usr/bin/env ruby

require 'rubygems'
require 'exifr'

# Day 3's exercise was kind of silly so I threw in this script I built to help 
# simplify photo publishing. (I refuse to use prefab sites or let Facebook 
# have my soul)
#
# iterate over files, group by day
# display one, prompt for name/comment, allow "ignore"
# resave to destination dir, create thumbnail and metadata

DEST = "d:/git/site/img/photos"


class Photo
  attr_accessor :file, :date, :datetime, :title

  def initialize(f)
    @file = f
    d = EXIFR::JPEG.new(file).date_time
    @datetime = d
    @date = d.strftime "%Y%m%d"
    @title = d.strftime "%H%m%S"
  end

  def resave
    `convert #{file} -auto-orient -resize 1600x1600 "#{DEST}/#{to_s}.jpg"`
    `convert #{file} -auto-orient -strip -resize 230x230 -bordercolor black -border 1 "#{DEST}/t/#{to_s}.jpg"`
  end

  def to_s
    "#{@date} - #{@title}"
  end

  def inspect
    "#{file}: #{to_s}"
  end
end

dirname = ARGV[0]

photos = {}

saved = []

Dir.new(dirname).each do |x|
  if x[/jpg/i] then
    file = dirname + '/' + x
    photo = Photo.new(file)
    photos[photo.date] ||= []
    photos[photo.date].push photo
  end
end

# do some sorting
photos.keys.sort.each do |date|
  puts date
  list = photos[date]
  list = list.sort_by {|x| x.datetime}

  puts list.inspect

  list.each do |photo|
    path = photo.file
    `start #{path}`
    puts "title:"
    input = STDIN.gets.chomp
    if input == "d" then
      # ignore
      puts "Ignored"
    else
      photo.title = input
      photo.resave
      saved.push photo
      puts "Resaved"
    end
  end
end

saved.each do |photo|
  puts "{% photo #{photo.to_s} %}"
end


