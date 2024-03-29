#!/usr/bin/ruby -w
# iTUNES
# Copyright Mark Keane, All Rights Reserved, 2014

#This is the top level
require 'csv'
require 'set'
require_relative 'actor'
require_relative 'album'
require_relative 'song'
require_relative 'reader'
require_relative 'utilities'
require_relative 'error'

#songs_file = ARGV[0]                  #for command line
#owners_file = ARGV[1]                 #for command line

reader = Reader.new
songs_file = 'songs.csv' #in RubyMine
owners_file = 'owners.csv' #in RubyMine

puts "\nProcessing Songs from file: #{songs_file}"
$songs = reader.read_in_songs(songs_file)

puts "Processing Ownership from file: #{owners_file}"
$hash_owners = reader.read_in_ownership(owners_file)

# If there is an error in the CSV files, it will show up below
puts ''
puts 'If there is an error in owners.csv or in songs.csv, it will be printed below (between the "***")'
puts '***'
Util.check_song_id
puts '***'
puts ''

puts 'Building all owners...'
$actors = Actor.build_all

puts 'Updating songs with ownership details...'
$songs.each { |song| song.owners = $hash_owners[song.id] }

puts 'Building All Albums...'
$albums = Album.build_all

# Given the name of a song and a person; let them buy the song
puts "\nRCA buys Vaka..."
song1 = Util.fetch('Vaka')
rca = Util.fetch('RCA')
rca.to_s
song1.to_s
rca.buys_song(song1)
song1.to_s

# What songs does RCA own
puts "\nHow many songs does RCA own..."
p rca.what_songs_does_he_own.size

puts "\nPlay Vaka..."
song1.play_song

# Print out all songs
puts "\nPrinting full details of all songs..."
$songs.each { |song| p song }

# Print out all albums
puts "\nPrinting full details of all albums..."
$albums.each { |album| p album }

# Call it like this in the command line.
# markkean% ruby itunes.rb songs.csv owners.csv