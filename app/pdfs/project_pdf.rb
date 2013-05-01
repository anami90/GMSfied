class ProjectPdf < Prawn::Document
	def initialize(project, view)
		super(top_margin: 50)
		@project = project
		@view = view
		text "Grant: #{@project.name}", size: 30, style: :bold
		header_message
		line_items
		budg
		regards_message
	end


	def header_message
    move_down 10
    text "Printout for: #{@project.name.capitalize}"
    move_down 10
    text "File Reference: #{@project.accountnumber}",
    :size => 13, style:  :bold
    text "Project start date : #{@project.startdate.strftime("%d/%m/%Y")}", :size => 13, style:  :bold
    text "Anticipated end date : #{@project.finish.strftime("%d/%m/%Y")}", :size => 13, style:  :bold
    end

	def line_items
		move_down 20
		table line_items_rows do 
		 	row(0).align = :center
			row(0).font_style = :bold
			self.row_colors = ["DDDDDD","FFFFFF"]	
			self.column_widths = {0 => 80, 1 => 80, 2 => 90, 3 => 90,4 => 80, 5 => 50, 6 => 70 }
      
		end
	end

	def line_items_rows
		[["Name", "Location", "Balance", "Amount", "File Number", "Donor", "Grantee"],
		[@project.name, @project.location, price(@project.balance), price(@project.amount), @project.accountnumber,@project.donor.name, @project.grantee.organization]]
		
	end	
	def budg
		[["Budget"],[@budgets]]
	end	

	def regards_message
    move_down 50
    text "Thank You," 
    move_down 6
    text "GMS",
    :size => 14, style:  :bold
  end

  def price(num)
  	@view.number_to_currency(num)
  end	
end

