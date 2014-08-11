module CsvFormatter
  def to_csv(items, sort_field = :name)
    CSV.generate do |csv|
      csv << column_names
      items.sort_by{|item| item.send(sort_field) }.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
end
