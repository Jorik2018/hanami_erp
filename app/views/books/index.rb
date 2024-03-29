# frozen_string_literal: true

module HanamiErp
  module Views
    module Books
      class Index < HanamiErp::View
        include Deps["persistence.rom"]

        expose :books do
          rom.relations[:books]
            .select(:title, :author)
            .order(:title)
            .to_a
        end
      end
    end
  end
end
