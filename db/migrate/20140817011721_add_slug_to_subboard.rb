class AddSlugToSubboard < ActiveRecord::Migration
  class Subboard < ActiveRecord::Base
  end

  def change
    add_column :subboards, :slug, :string, index: true

    Subboard.all.each do |subboard|
      subboard.slug = subboard.name.parameterize
      subboard.save
    end
  end
end
