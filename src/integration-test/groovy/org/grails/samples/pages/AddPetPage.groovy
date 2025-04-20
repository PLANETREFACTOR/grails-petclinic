package org.grails.samples.pages

class AddPetPage extends PageWithFooter {

  static url = '/pet/add'

  static at = {
    title == 'Add Pet'
  }
  
  static content = {
    name { $('#pet_name') }
    addPet { $('input', type: 'submit') }
    errors(required: false) { $('.errors') }
  }
}
