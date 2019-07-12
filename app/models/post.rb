class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  include AASM
  aasm do
    state :unverified, initial: true
    state :pending
    state :verified
    state :rejected
    state :published
    state :archived

    event :pend do
      transitions from: [:unverified], to: :pending
    end

    event :verify do
      transitions from: [:pending], to: :verified
    end

    event :reject do
      transitions from: [:pending], to: :rejected
    end

    event :publish do
      transitions from: [:verified], to: :published
    end
      
    event :archive do
      transitions from: [:published, :verified, :unverified], to: :archived
    end
end

  def self.unverified
    where(aasm_state: 'unverified')
  end

  def self.pending
    where(aasm_state: 'pending')
  end
  
  def self.verified
    where(aasm_state: 'verified')
  end

  def self.published
    where(aasm_state: 'published')
  end

  def self.rejected
    where(aasm_state: 'rejected')
  end

  def self.archieved
    where(aasm_state: 'archived')
  end
end
