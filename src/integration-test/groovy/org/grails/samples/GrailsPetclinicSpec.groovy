package org.grails.samples
import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration

import geb.spock.*
import org.grails.samples.pages.AddOwnerPage

/**
 * See https://www.gebish.org/manual/current/ for more instructions
 */
@Integration
@Rollback
class GrailsPetclinicSpec extends GebSpec {

    void "test something"() {
        when:"The home page is visited"
            go '/'

        then:"The title is correct"
            title == "Welcome"
    }

    void "test something2"() {
        when:"The home page is visited"
//        go '/owner/add'
        to AddOwnerPage
        addOwner.click()

        then:
        at AddOwnerPage
        errors.size() == 5
    }

    protected void addOwner() {
        to AddOwnerPage
        firstName.value 'Sally'
        lastName.value 'Jones'
        address.value '987 State St.'
        city.value 'MSN'
        telephone.value '1234567890'
        addOwner.click()
        ownerId = $("form").find("input", name: "owner.id").value()
    }
}
