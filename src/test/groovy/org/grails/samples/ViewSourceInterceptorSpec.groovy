package org.grails.samples

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class ViewSourceInterceptorSpec extends Specification implements InterceptorUnitTest<ViewSourceInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test viewSource interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"viewSource")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
