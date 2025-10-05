package org.grails.samples

import grails.testing.gorm.DataTest
import spock.lang.Specification
import spock.lang.Unroll


class SpecialitySpec extends Specification implements DomainDataFactory, DataTest {

	Speciality speciality = validSpeciality()
	void setup(){
		mockDomain(Speciality)
	}
	
	def 'a valid Speciality has no errors'() {
		when:
		speciality.validate()
		
		then:
		!speciality.hasErrors()
	}
	
	@Unroll
	def 'name with value #value validation error is #error'() {
		given:
		// mockForConstraintsTests Speciality, [validSpeciality(), speciality]
		validSpeciality().save(flush:true)
		speciality.name = value
		speciality.validate()
		
		expect:
		speciality.errors['name']?.code == error
		
		where:
		value                   || error
		' '                     || 'blank'
		'dentistry'             || 'unique'
		'do'                    || 'minSize.notmet'
		'fr'.padRight(21, '_')  || 'maxSize.exceeded'
		'su'.padRight(20, '_')  || null
	}
}
