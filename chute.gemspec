# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "chute"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Darko Grozdanovski", "Chris Burkhart", "Petr Bela"]
  s.date = "2013-04-11"
  s.description = "wrapper for the API for getchute.com"
  s.email = "support@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "chute.gemspec",
    "lib/chute.rb",
    "lib/chute/client.rb",
    "lib/chute/configuration.rb",
    "lib/chute/connection.rb",
    "lib/chute/response.rb",
    "lib/chute/v2/albums.rb",
    "lib/chute/v2/assets.rb",
    "lib/chute/v2/comments.rb",
    "lib/chute/v2/flags.rb",
    "lib/chute/v2/hearts.rb",
    "lib/chute/v2/parcels.rb",
    "lib/chute/v2/tags.rb",
    "lib/chute/v2/triggers.rb",
    "lib/chute/v2/users.rb",
    "lib/chute/v2/votes.rb",
    "lib/chute/version.rb",
    "spec/chute/chute_spec.rb",
    "spec/chute/client_spec.rb",
    "spec/chute/connection_spec.rb",
    "spec/chute/response_spec.rb",
    "spec/chute/v2/albums_spec.rb",
    "spec/chute/v2/assets_spec.rb",
    "spec/chute/v2/comments_spec.rb",
    "spec/chute/v2/flags_spec.rb",
    "spec/chute/v2/hearts_spec.rb",
    "spec/chute/v2/parcels_spec.rb",
    "spec/chute/v2/tags_spec.rb",
    "spec/chute/v2/trigger_spec.rb",
    "spec/chute/v2/users_spec.rb",
    "spec/chute/v2/votes_spec.rb",
    "spec/fixtures/chute_cassettes/albums/album_create_with_permission_view.yml",
    "spec/fixtures/chute_cassettes/albums/albums_add_remove_assets.yml",
    "spec/fixtures/chute_cassettes/albums/albums_create.yml",
    "spec/fixtures/chute_cassettes/albums/albums_delete.yml",
    "spec/fixtures/chute_cassettes/albums/albums_get.yml",
    "spec/fixtures/chute_cassettes/albums/albums_list.yml",
    "spec/fixtures/chute_cassettes/albums/albums_stats.yml",
    "spec/fixtures/chute_cassettes/albums/albums_update.yml",
    "spec/fixtures/chute_cassettes/assets/assets_delete.yml",
    "spec/fixtures/chute_cassettes/assets/assets_geo.yml",
    "spec/fixtures/chute_cassettes/assets/assets_get.yml",
    "spec/fixtures/chute_cassettes/assets/assets_import.yml",
    "spec/fixtures/chute_cassettes/assets/assets_list.yml",
    "spec/fixtures/chute_cassettes/assets/assets_update.yml",
    "spec/fixtures/chute_cassettes/comments/comments_create.yml",
    "spec/fixtures/chute_cassettes/comments/comments_list.yml",
    "spec/fixtures/chute_cassettes/flags/flags_methods.yml",
    "spec/fixtures/chute_cassettes/hearts/hearts_methods.yml",
    "spec/fixtures/chute_cassettes/tags/tags_assets.yml",
    "spec/fixtures/chute_cassettes/triggers/trigger_errors.yml",
    "spec/fixtures/chute_cassettes/triggers/triggers_cleanup.yml",
    "spec/fixtures/chute_cassettes/triggers/triggers_create.yml",
    "spec/fixtures/chute_cassettes/triggers/triggers_delete.yml",
    "spec/fixtures/chute_cassettes/triggers/triggers_list.yml",
    "spec/fixtures/chute_cassettes/triggers/triggers_update.yml",
    "spec/fixtures/chute_cassettes/users/users_get.yml",
    "spec/fixtures/chute_cassettes/users/users_me.yml",
    "spec/fixtures/chute_cassettes/votes/votes_methods.yml",
    "spec/spec_helper.rb"
  ]
  s.homepage = "https://github.com/chute/chute-sdk-2"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "getchute API wrapper"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_runtime_dependency(%q<hashie>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<hashie>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<hashie>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

