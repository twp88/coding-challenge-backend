require 'rails_helper'

describe ZombieFeedingService do
  subject { ZombieFeedingService.new }

  let!(:person) { create(:person) }
  let!(:hungry_zombie) { create(:zombie) }

  context 'when the service is called' do
    it 'deletes a person' do
      expect { subject.call(person, hungry_zombie) }
        .to change(Person, :count)
        .by(-1)
    end

    it 'increases zombie hp' do
      expect { subject.call(person, hungry_zombie) }
        .to change(hungry_zombie, :hp)
        .by(person.hp)
    end
  end
end
