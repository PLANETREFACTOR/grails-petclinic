package org.grails.samples

import grails.testing.gorm.DataTest
import spock.lang.Specification


class VetSpec extends Specification implements DomainDataFactory, DataTest {
	
	Vet vet = validVet()

	void setup(){
		mockDomain(Vet)
	}
	
	
	def 'a valid Vet has no errors'() {
		when:
		vet.validate()
		
		then:
		!vet.hasErrors()
		!vet.specialities
	}
}
