package org.grails.samples.pages

class EditPetPage extends PageWithFooter {

  static url = '/pet/edit'

  static at = {
    title == 'Update Pet'
  }
  
  static content = {
    name { $('#pet_name') }
    id { $('#owner_id') }
    editPet { $('input', type: 'submit') }
    errors(required: false) { $('.errors') }
  }
}