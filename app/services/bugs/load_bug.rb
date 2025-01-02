module Bugs
  class LoadBug
    attr_reader :params, :only_data

    def self.call(*args)
      new(*args).call
    end

    def initialize(params, only_data)
      @params = params
      @only_data = only_data
    end

    def call
      set_hashid
      generate_qrcode
      process_svg
      save_svg_to_file unless only_data
      generate_png_thumbnail unless only_data
      save_bug_model
    end

    private

    def set_hashid
      params[:hashid] = HashidCreator.call(params[:load_identifier].to_i)
    end

    def generate_qrcode
      qrcode = RQRCode::QRCode.new("https://www.hellobu.gs/#{params[:hashid]}")
      svg = qrcode.as_svg(offset: 0, color: params[:text_color].gsub("#", ""), shape_rendering: "crispEdges", module_size: 2.5, standalone: false)
      params[:qrcode] = svg
    end

    def process_svg
      params[:svg] = ProcessSvg.call(params[:svg], params[:hashid], params[:qrcode])
    end

    def save_svg_to_file
      File.open(svg_filepath, "w") do |f|
        f.puts params[:svg]
      end
    end

    def svg_filepath
      Rails.root.join("app/assets/images/bugs/svg/#{params[:hashid]}.svg")
    end

    def generate_png_thumbnail
      cmd = "convert #{svg_filepath} -thumbnail '400x>' #{thumbnail_filepath}"
      `#{cmd}`
    end

    def thumbnail_filepath
      Rails.root.join("app/assets/images/bugs/thumb/#{params[:hashid]}.png")
    end

    def save_bug_model
      Bug.create!(params)
    end
  end
end
