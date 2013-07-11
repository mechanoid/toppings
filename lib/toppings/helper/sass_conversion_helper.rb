require 'tempfile'
require 'sass'
require 'sass/exec'
require 'digest'

module Toppings::Helper::SassConversionHelper

  def convert_to_scss(content)
    file_name    = Digest::MD5.new.update(content)
    # checking sass before converting
    @source_file = Tempfile.new("#{file_name}_source")
    @target_file = Tempfile.new("#{file_name}_target")

    # prepare source
    @source_file.write(content)
    @source_file.rewind

    # convert source content to the target format, placed in the target file
    Sass::Exec::SassConvert.new(["-F", "sass", "-T", "scss", @source_file, @target_file]).parse

    # read result from target file
    @target_file.rewind
    @target_file.read
  ensure
    [@source_file, @target_file].each(&:close)
    [@source_file, @target_file].each(&:unlink)
  end

  def valid_sass?(content)
    load_dependencies

    result = begin
      Sass::Engine.new(content, sass_engine_options.merge(check_syntax: true)).render
    rescue ::Sass::SyntaxError => e
      say e.message
      false
    end

    !!result
  end

  def load_dependencies
    # TODO: make dependencies configurable
    %w{susy}.each { |dep| require dep }
    load_compass_paths
  end

  def load_compass_paths
    load_paths.merge Compass.configuration.sass_load_paths
  end

  def load_paths
    # TODO: sass_engine_options[:load_paths].uniq!
    sass_engine_options[:load_paths] ||= Set.new
  end

  def sass_engine_options
    @sass_engine_options ||= {}
  end

end