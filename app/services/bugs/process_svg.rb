module Bugs
  class ProcessSvg
    attr_reader :raw_svg, :hashid, :qrcode, :doc

    def self.call(*args)
      new(*args).call
    end

    def initialize(raw_svg, hashid, qrcode)
      @raw_svg = raw_svg
      @hashid = hashid
      @qrcode = qrcode
      @doc = Nokogiri::XML.parse(raw_svg)
    end

    def call
      load_identifier = doc.at_css("title").content
      doc.at_css("title").content = hashid
      doc.at_css("##{load_identifier}")[:id] = hashid
      doc.at_css("#ID tspan").content = hashid
      doc.at_css("#qrcode rect").add_next_sibling qrcode
      doc.at_css("#qrcode #Rectangle").remove
      doc.to_s
    end
  end
end
