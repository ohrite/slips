#!/usr/bin/env ruby

guard :bundler do
  watch('Gemfile')
end

guard :rack, :port => 9292 do
  watch('Gemfile.lock')
  watch('config.ru')
end

guard :shell do
  watch(%r{^([^\/]+)\.md$}) do |m|
    puts "Rebuilding #{m[0]}"
    slips_path = File.expand_path("..", __FILE__)
    site_path = File.expand_path("../_site", __FILE__)
    ["css", "deck.js", "images", "js"].each do |component|
      source = File.join(slips_path, component)
      puts "* Regenerating #{source}"
      FileUtils.cp_r(source, site_path)
    end
    
    require 'keydown'
    html_path = Keydown::Tasks.new.slides(m[1])
    FileUtils.mv(html_path, File.join(site_path, File.basename(html_path)))
  end
end

guard :livereload do
  watch(%r{_site/[^\/]+\.html})
end
