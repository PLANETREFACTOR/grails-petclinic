package org.grails.samples.bootstrap

import grails.gorm.transactions.Rollback
import grails.testing.mixin.integration.Integration
import org.grails.samples.Owner
import org.grails.samples.PetType
import org.grails.samples.Speciality
import org.grails.samples.Vet
import spock.lang.Specification

@Integration
@Rollback
class BootstrapSpec extends Specification {

    void "basic check for specialities when application starts and populates db with data using bootstrap.groovy"(){
        when: "the application has loaded and we have 3 specialities "
        Integer totalSpecialities = Speciality.count()

        then: "we are able to load only 3 specialities"
        totalSpecialities == 3
    }

    void "basic check for vets when application starts and populates db with data using bootstrap.groovy"(){
        when: "the application has loaded and we have 4 vets with specialities"
        List<Vet> vets = Vet.findAllBySpecialitiesIsNotEmpty()

        then: "we are able to load only 4 vets with specialities"
        vets.size() == 4
    }

    void "basic check for petType when application starts and populates db with data using bootstrap.groovy"(){
        when: "the application has loaded and we have 6 petTypes"
        Integer totalPetTypes = PetType.count()

        then: "we are able to load only 6 pet types"
        totalPetTypes == 6
    }

    void "basic check for owner when application starts and populates db with data using bootstrap.groovy"(){
        when: "the application has loaded and we have 3 owners"
        Integer totalOwners = Owner.count()

        then: "we are able to load only 3 owners"
        totalOwners == 3
    }
}
