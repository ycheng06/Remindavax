module DrugsHelper
  def setup_drug(drug)
    drug.dosage ||= Dosage.new
    drug
  end
end
