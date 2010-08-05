# encoding: utf-8

require 'mongo'

module Scrobbler
  module Cache
    # Caching Module which stores everything in a MongoDB Collection
    #
    # @author Uwe L. Korn
    class Mongo
      
      # Create a new Instance for caching Last.fmn requests.
      #
      # @param [Mongo:Collecion] collection The MongoDB collection for storage
      def initialize(collection)
        @hits = 0
        @misses = 0
        @collection = collection
        @write = true
      end
    
      # Could we write to this cache?
      #
      # @return [boolean]
      def writable?
        @write
      end
      
      # Is there already an entry for these query?
      #
      # @param [Hash] params The parameters for the Last.fm Request
      # @return [boolean]
      def has?(params={})
        # Check if there is a matching chache entry with no extra parameters
        @collection.find(params).each do |doc|
          if verify(doc, params) then
            @hits += 1
            return true
          end
        end
        
        # We have not found a mathing cache entry.
        @misses += 1
        false
      end
      
      # Store a result into the database.
      #
      # @param [String] data
      # @param [Hash] params
      # @return [void]
      def set(data, params={})
        if not has?(params) then
         @collection.insert(params.merge({:xml => data, :timestamp => Time.now.to_i}))
        end
      end
      
      # Get a cached result
      #
      # @param [Hash] params
      # @return [String]
      def get(params={})
        @collection.find(params).each do |doc|
          return doc['xml'] if verify(doc)
        end
      end
      
      # Verify that a specific document matches exactly the request cache.
      #
      # @param [Hash] params
      # @param [Hash] doc
      # @return [boolean]
      def verify(doc, params={}) 
        matches = true
        doc.each do |k,v|
          next if ['xml', 'timestamp', '_id'].include?(k)
          matches &&= (not (params[k].nil? && params[k.to_sym].nil?))
        end
        matches
      end
      
      # Print statistics how efficent this cache was
      #
      # @param [String] prefix The prefix which will be printed before each line
      # @return [void]
      def print_stats(prefix="")
        puts prefix + "Hits: #{@hits}"
        puts prefix + "Misses: #{@misses}"
        hitrate = @hits * 1.0 / (@misses + @hits)
        puts prefix + "Hit-Rate: #{hitrate}"
      end
    end
  end
end