require 'roo'

class RefugeeImporter
  attr_reader :organisation

  def initialize(organisation)
    @organisation = organisation
  end

  def self.import(organisation)
    new(organisation).import
  end

  def import
    @xls = Roo::Spreadsheet.open("/Users/tib/techrefugees/fixoneers/import.xlsx")

    1.upto(@xls.last_row) do |index|
      row = @xls.row(index).compact
      ref_params = {
        first_name: row[0].to_s,
        phone_number: row[1].to_s,
        locale: row[2].to_s
      }

      organisation.refugees.create!(ref_params)
    end
  end
end
