# frozen_string_literal: true

module HanamiErp
  module Actions
    module Books
      class Create < HanamiErp::Action
        include Deps["persistence.rom"]

        params do
          required(:book).hash do
            required(:title).filled(:string)
            required(:author).filled(:string)
          end
        end

        def handle(request, response)
          if request.params.valid?
            book = rom.relations[:books].changeset(:create, request.params[:book]).commit

            response.flash[:notice] = "Book created"
            response.redirect_to routes.path(:show_book, id: book[:id])
          else
            response.flash.now[:alert] = "Could not create book"
            # Implicitly re-renders the "new" view
          end
        end
      end
    end
  end
end
