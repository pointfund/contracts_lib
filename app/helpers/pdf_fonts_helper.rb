module PdfFontsHelper
	class AddFontsPdf < Prawn::Document 
		def initialize(pdf)
			loadfonts(pdf)

		end

		def loadfonts(pdf)

			pdf.font_families.update("Arial" => {
    			:normal => Rails.root.join("app/assets/fonts/Spirax-Regular.ttf")
  				})
			# pdf.font "Arial"
			pdf.font_families.update("OpenSans" => {
    			:normal => Rails.root.join("app/assets/fonts/OpenSans-Regular.ttf"),
    			:bold => Rails.root.join("app/assets/fonts/OpenSans-Bold.ttf")
  				})
			# pdf.font "OpenSans"
			pdf.font_families.update("PTSerif" => {
    			:normal => Rails.root.join("app/assets/fonts/PT_Serif-Web-Regular.ttf"),
    			:bold => Rails.root.join("app/assets/fonts/PT_Serif-Web-Bold.ttf")
  				})
  			pdf.font "PTSerif"
			pdf.font_families.update("Tinos" => {
    			:normal => Rails.root.join("app/assets/fonts/Tinos-Regular.ttf"),
    			:bold => Rails.root.join("app/assets/fonts/Tinos-Bold.ttf"),
    			:italic => Rails.root.join("app/assets/fonts/Tinos-Italic.ttf")
  				})
  			pdf.font "Tinos"
		end

	


	end
end