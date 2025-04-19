package org.grails.samples


class ViewSourceInterceptor {
    ViewSourceInterceptor(){
        matchAll()
                .excludes(controller: 'assets')
                .excludes(uri: '/**/favicon.ico')
                .excludes(uri: '/assets/**')
                .excludes(uri: '/static/**')
                .excludes(uri: '/js/**')
                .excludes(uri: '/css/**')
                .excludes(uri: '/images/**')
    }

    boolean before() { true }

    boolean after() {
        if (model == null) {
            // Skip the insertion of model data.
            return true
        }

        // This is a call to the Grails API to get the associated
        // metadata for the current controller ('controllerName' is
        // a dynamic property).
        def controllerClass = grailsApplication.getArtefactByLogicalPropertyName("Controller", controllerName)

        // The 'View Source for' sidebar requires the class name of
        // the current controller and the path to the GPS view that's
        // being used for the current page.
        model["controllerClass"] = controllerClass.clazz.name
        model["viewPath"] = "$controllerName:${model['viewName'] ?: actionName}"
        // Return the model for use by the view.
        return model
//        true
    }

    void afterView() {
        // no-op
    }
}
