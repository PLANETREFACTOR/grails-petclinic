package org.grails.samples

class UrlMappings {
    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: 'clinic')
        "500"(view:'/error')
        "404"(view:'/notFound')

    }
}
