module Images
  def imageable_attach_new_file(path, success = true)
    click_link "Add image"
    within "#nested-image" do
      image = find(".image-fields")
      attach_file "Choose image", path
      within image do
        if success
          expect(page).to have_css(".loading-bar.complete")
        else
          expect(page).to have_css(".loading-bar.errors")
        end
      end
    end
  end

  def imageable_fill_new_valid_proposal
    fill_in_new_proposal_title with: "Proposal title"
    fill_in "Proposal summary", with: "Proposal summary"
    check :proposal_terms_of_service
  end

  def imageable_fill_new_valid_budget
    fill_in "Name", with: "Budget name"
  end

  def imageable_fill_new_valid_budget_investment
    fill_in_new_investment_title with: "Budget investment title"
    fill_in_ckeditor "Description", with: "Budget investment description"
    check :budget_investment_terms_of_service
  end
end
