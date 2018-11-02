require 'rails_helper'

describe ZombieFeedingService do
  subject { ZombieFeedingService.new }

  let!(:person) { create(:person) }
  let!(:hungry_zombie) { create(:zombie, hungry: true) }

  context 'when the service is called' do
    it 'deletes a person' do
      expect { subject.call(person, hungry_zombie) }
        .to change(Person, :count)
        .by(-1)
    end

    it 'increases zombie hp' do
      expect { subject.call(person, hungry_zombie) }
        .to change(hungry_zombie, :hit_points)
        .by(person.hp)
    end

    it 'increases zombie brains eaten' do
      expect { subject.call(person, hungry_zombie) }
        .to change(hungry_zombie, :brains_eaten)
        .by(1)
    end

    it 'changes hungry attr to false' do
      expect { subject.call(person, hungry_zombie) }
        .to change(hungry_zombie, :hungry)
        .from(true)
        .to(false)
    end
  end
end
