require 'terminal-table'
require 'term/ansicolor'

module Toquen
  class DetailsTable

    def initialize(instances, region)
      @instances = instances
      @region = region
      @color = Term::ANSIColor
    end

    def output
      table = Terminal::Table.new(
        :style => {
          :border_x => "",
          :border_i => "",
          :border_y => ""
        }
      )
      table.title = @color.bold { "Instances in #{@region}" }
      header = [ "Name", "Roles", "Public", "Private", "Type" ]
      table.add_row header.map { |h| @color.underline @color.bold h }
      @instances.each do |instance|
        table.add_row instance_to_row(instance)
      end
      puts table.to_s
    end

    def instance_to_row(instance)
      [
        @color.green { instance[:name] },
        @color.yellow { instance[:roles].join(",") },
        instance[:external_dns].nil? ? "(N/A)" : @color.cyan(instance[:external_dns]) + " (#{instance[:external_ip]})",
        instance[:internal_dns].nil? ? "(N/A)" : @color.cyan(instance[:internal_dns]) + " (#{instance[:internal_ip]})",
        @color.red { instance[:type] }
      ]
    end
  end
end
