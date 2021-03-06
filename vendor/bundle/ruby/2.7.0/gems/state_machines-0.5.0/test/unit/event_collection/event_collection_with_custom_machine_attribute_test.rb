require_relative '../../test_helper'

class EventCollectionWithCustomMachineAttributeTest < StateMachinesTest
  def setup
    @klass = Class.new do
      def save
      end
    end

    @machine = StateMachines::Machine.new(@klass, :state, attribute: :state_id, initial: :parked, action: :save)
    @events = StateMachines::EventCollection.new(@machine)

    @machine.state :parked, :idling
    @events << @ignite = StateMachines::Event.new(@machine, :ignite)
    @machine.events.concat(@events)

    @object = @klass.new
  end

  def test_should_not_have_transition_if_nil
    @object.state_event = nil
    assert_nil @events.attribute_transition_for(@object)
  end

  def test_should_have_valid_transition_if_event_can_be_fired
    @ignite.transition parked: :idling
    @object.state_event = 'ignite'

    assert_instance_of StateMachines::Transition, @events.attribute_transition_for(@object)
  end
end
