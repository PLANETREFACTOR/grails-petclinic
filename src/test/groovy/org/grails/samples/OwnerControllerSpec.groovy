package org.grails.samples

import grails.testing.gorm.DataTest
import grails.testing.web.controllers.ControllerUnitTest
import spock.lang.Specification


class OwnerControllerSpec extends Specification implements ControllerUnitTest<OwnerController>, DataTest{

	void setup() {
		mockDomain(Owner)
		controller.petclinicService = new PetclinicService()
	}

	void 'can add with the get method'() {
        when:
        request.method = 'GET'
        def model = controller.add()

		then:
        model.ownerBean instanceof Owner
	}

	void 'fails on invalid owner'() {
		when:
        request.method = 'POST'
        def model = controller.add()

        then:
        model.ownerBean.hasErrors()
        !view.contains("show")
	}

	void 'can add a valid owner with the post method'() {
        given:
		request.method = 'POST'
		params.with {
			owner_firstName = 'fred'
			owner_lastName =  'flintstone'
			owner_address =   'rocky street'
			owner_city =      'dinoville'
			owner_telephone = '347239873'
		}
		
        when:
		controller.add()

        then:
		response.redirectUrl =~ '/owner/show/\\d+'
	}

	void 'finds no owners when there are none'() {
		when:
        request.method = 'POST'
		def model = controller.find()

        then:
        model.message == 'owners.not.found'
	}

	void 'can find a specific owner'() {
		given:
        Owner owner = createOwner(lastName: 'flintstone')

        when:
        boolean validated = owner.validate()
        Owner saved = owner.save()

        then:
        validated
        saved

        when:
        request.method = 'POST'
		params.lastName = 'flintstone'
		controller.find()

        then:
        response.redirectUrl == '/owner/show/' + owner.id
	}

	void 'can find several owners'() {
		given:
        createOwner(lastName: 'flintstone').save()
		createOwner(lastName: 'flintstone').save()

		when:
        request.method = 'POST'
		params.lastName = 'flintstone'
		controller.find()

		then:
        view == '/owner/selection'
        model.owners.size() == 2
	}

	private Owner createOwner(Map data) {
		def owner = new Owner(address: 'the address', city: 'the city', telephone: '1234567890',
		                      firstName: 'first', lastName: 'last')
		owner.properties = data
		owner
	}
}
