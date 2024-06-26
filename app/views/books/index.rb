# frozen_string_literal: true

module HanamiErp
  module Views
    module Books
      class Index < HanamiErp::View
        include Deps["persistence.rom"]

        expose :books do |page:, per_page:|
          rom.relations[:books]
            .select(:title, :author)
            .order(:title)
            .page(page)
            .per_page(per_page)
            .to_a
        end
      end
    end
  end
end
