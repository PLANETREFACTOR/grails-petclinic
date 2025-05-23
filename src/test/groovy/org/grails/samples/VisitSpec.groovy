package org.grails.samples

import grails.testing.gorm.DataTest
import spock.lang.Specification
import spock.lang.Unroll;


class VisitSpec extends Specification implements DomainDataFactory, DataTest {
	
	Visit visit = validVisit()

	void setup(){
		mockDomain(Visit)
	}
		
	def 'a valid Visit has no errors'() {
		when:
		visit.validate()
		
		then:
		!visit.hasErrors()
	}
	
	@Unroll
	def 'description with value #value validation error is #error'() {
		given:
		visit.description = value
		visit.validate()
		
		expect:
		visit.errors['description']?.code == error
		
		where:
		value    || error
		' '      || 'blank'
		'baylee' || null
	}
}
