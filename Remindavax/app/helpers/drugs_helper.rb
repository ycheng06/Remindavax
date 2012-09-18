module DrugsHelper
  def setup_drug(drug)
    drug.dosage ||= Dosage.new
    drug.frequency ||= Frequency.new
    drug
  end
end
