require_relative "../../../db/bugs/bugs"

module Bugs
  class Load
    BUGS_SVG_DIR = Rails.root.join("db/bugs/svgs")

    def self.call(only_data: false)
      Bug.delete_all

      BUGS_LOAD_DATA.each_with_index do |bug_data, i|
        bug_data[:svg] = File.read(BUGS_SVG_DIR.join("#{bug_data[:load_identifier]}.svg"))
        LoadBug.call(bug_data, only_data)
      end
    end
  end
end
