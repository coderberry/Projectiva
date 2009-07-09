class AddDefaults < ActiveRecord::Migration
  def self.up
    
    ##
    # Add Default Color Schemes
    schemes = [
        ['Header Background', '003366'],
        ['Header Foreground', 'FFFF00'],
        ['Tab Inactive Background', '1A4F85'],
        ['Tab Inactive Foreground', 'FFFFFF'],
        ['Tab Hover Background', '1D64AD'],
        ['Tab Hover Foreground', 'FFFFFF'],
        ['Tab Active Background', 'E5E5E5'],
        ['Tab Active Foreground', '000000'],
        ['Background', 'E5E5E5'],
        ['Main Navigation Background', 'EDF3FE'],
        ['Main Navigation Foreground', '000000'],
        ['Main Navigation Links', '0000FF']]
    schemes.each do |key, value|
      DefaultColorScheme.create(:name => key, :default_hex_value => value, :locked => true)
    end
    
    ##
    # Add Default Message Categories
    message_categories = %w(Assets Code Copywriting Design Miscellaneous Transcripts)
    message_categories.each do |category|
      DefaultMessageCategory.create(:name => category)
    end
    
    ##
    # Add Default File Categories
    file_categories = %w(Pictures Sounds)
    file_categories.each do |category|
      DefaultFileCategory.create(:name => category)
    end
    
  end

  def self.down
  end
end
