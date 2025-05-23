package org.grails.samples
import grails.testing.gorm.DataTest
import spock.lang.Specification
import spock.lang.Unroll


class PetTypeSpec extends Specification implements DomainDataFactory, DataTest {

	PetType petType = validPetType()

	void setup(){
		mockDomain(PetType)
	}
	
	
	def 'a valid PetType has no errors'() {
		when:
		petType.validate()
		
		then:
		!petType.hasErrors()
	}
	
	@Unroll
	def 'name with value #value validation error is #error'() {
		given:
		validPetType().save(flush:true)
		// mockForConstraintsTests PetType, [validPetType(), petType]
		petType.name = value
		petType.validate()
		
		expect:
		petType.errors['name']?.code == error
		
		where:
		value                   || error
		' '                     || 'blank'
		'cat'                   || 'unique'
		'do'                    || 'minSize.notmet'
		'fr'.padRight(21, '_')  || 'maxSize.exceeded'
		'bi'.padRight(20, '_')  || null
	}
}
