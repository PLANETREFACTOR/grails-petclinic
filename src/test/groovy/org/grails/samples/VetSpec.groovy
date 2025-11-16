package org.grails.samples

import grails.testing.gorm.DataTest
import spock.lang.Specification

class VetSpec extends Specification implements DomainDataFactory, DataTest {
	
	Vet vet

	void setup(){
		mockDomain(Vet)
		vet = validVet()
	}
	
	
	def 'a valid Vet has no errors'() {
		when:
		vet.validate()
		
		then:
		!vet.hasErrors()
		!vet.specialities
	}
}
