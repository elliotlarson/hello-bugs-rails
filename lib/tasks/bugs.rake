namespace :bugs do
  desc "Load bugs and process images"
  task load: :environment do
    Bugs::Load.call(only_data: false)

    puts "Run pngcrush on thumbnails in app/assets/images/bugs/thumb"
    puts "$ find -f app/assets/images/bugs/thumb png | while read line; do pngcrush -ow -brute $line; done"
  end

  desc "Load only the bug data (images are already processed)"
  task load_data: :environment do
    Bugs::Load.call(only_data: true)
  end

  task generate_json: :environment do
    attributes = %w[id hashid term language translation color_scheme text_color wikipedia batch]
    json = JSON.pretty_generate(Bug.all.map { |b| b.attributes.slice(*attributes) })
    filepath = Rails.root.join("tmp/bugs.json")
    File.write(filepath, json)
  end
end
