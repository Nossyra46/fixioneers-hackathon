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
    @xls = Roo::Spreadsheet.open(Rails.root.join('import.xlsx').to_s)

    1.upto(@xls.last_row) do |index|
      row = @xls.row(index).compact
      ref_params = {
        first_name: row[0].to_s,
        phone_number: row[1].to_s,
        locale: row[2].to_s
      }

      if ref = Refugee.find_by(phone_number: ref_params[:phone_number])
        ref.update(first_name: ref_params[:first_name], locale: ref_params[:locale])
        refugee = ref
      else
        refugee = organisation.refugees.create!(ref_params)
      end

      row[3].split(',').each do |r|
        refugee.add_role r.downcase
      end
    end
  end
end
