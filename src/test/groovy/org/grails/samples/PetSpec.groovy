package org.grails.samples

import grails.testing.gorm.DataTest
import spock.lang.Specification
import spock.lang.Unroll

class PetSpec extends Specification implements DomainDataFactory, DataTest {
	
	Pet pet = validPet()

	void setup(){
		mockDomain(Pet)
	}
	
	Owner owner = pet.owner
	
	
	def 'a valid Pet has no errors'() {
		when:
		pet.validate()
		
		then:
		!pet.hasErrors()
		!pet.visits
	}
	
	@Unroll
	def 'name with value #value validation error is #error'() {
		given:
		pet.name = value
		pet.validate()
		
		expect:
		pet.errors['name']?.code == error
		
		where:
		value    || error
		' '      || 'blank'
		'baylee' || null
	}
	
	def 'an Owner can NOT have more than Pet with the exact same name'() {
		given:
		owner.pets = [pet]
		Pet duplicatePet = validPet()
		duplicatePet.owner = owner
		
		when:
		duplicatePet.validate()
		
		then:
		duplicatePet.errors['name'].code == 'pet.duplicate'
	}
}
