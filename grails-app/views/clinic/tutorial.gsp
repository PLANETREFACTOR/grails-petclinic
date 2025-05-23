<head>
	<title>The Grails PetClinic Application</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="layout" content="main">
</head>

<body>

<div id="main">

	<h1>The Grails PetClinic Application</h1>

    <table class="updated">
       <tr><td>Updated:</td><td>August 2014</td><td>Ken Krebs (kktec)</td></tr>
    </table>

    <h2>What's New</h2>
    <table class="updated">
       <tr><td>Running on Grails 6.2.3</td></tr>
       <tr><td>Asset Pipeline plugin replaces Resources</td></tr>
       <tr><td>Domain validation tests</td></tr>
       <tr><td>Geb functional tests</td></tr>
    </table>


<!-- === INTRODUCTION ====================================================== -->
	<h2>Introduction</h2>

	<p>Java web development as it stands today is dramatically more complicated than it needs to be. Most modern web frameworks in the Java space are over complicated and don't embrace the Don't Repeat Yourself (DRY) principals.</p>

	<p>Dynamic frameworks like Rails, Django and TurboGears helped pave the way to a more modern way of thinking about web applications. Grails builds on these concepts and dramatically reduces the complexity of building web applications on the Java platform. What makes it different, however, is that it does so by building on already established Java technology like Spring &amp; Hibernate.</p>

	<p>Grails is a full stack framework and attempts to solve as many pieces of the web development puzzle through the core technology and it's associated plug-ins. Included out the box are things like:

	<ul>
		<li> An easy to use Object Relational Mapping (ORM) layer built on Hibernate </li>
		<li> An expressive view technology called Groovy Server Pages (GSP) </li>
		<li> A controller layer built on Spring MVC </li>
		<li> A command line scripting environment built on the Groovy-powered Gant </li>
		<li> An embedded Tomcat container which is configured for on the fly reloading </li>
		<li> Dependency injection with the inbuilt Spring container </li>
		<li> Support for internationalization (i18n) built on Spring's core MessageSource concept </li>
		<li> A transactional service layer built on Spring's transaction abstraction </li>
	</ul>
	<p>
	All of these are made easy to use through the power of the Groovy language and the extensive use of Domain Specific Languages (DSLs)</p>
<!-- === REQUIREMENTS ====================================================== -->
	<h2>PetClinic Sample Application Requirements</h2>

	<p>
		The application requirement is for an information system that is
		accessible through a web browser. The users of the application are
		employees of the clinic who in the course of their work need to view
		and manage information regarding the veterinarians, the clients, and their
		pets. The sample application supports the following:
	</p>

	<h3>Use Cases</h3>
	<ul>
		<li>View a list of veterinarians and their specialties</li>
		<li>View information pertaining to a pet owner</li>
		<li>Update the information pertaining to a pet owner</li>
		<li>Add a new pet owner to the system</li>
		<li>View information pertaining to a pet</li>
		<li>Update the information pertaining to a pet</li>
		<li>Add a new pet to the system</li>
		<li>View information pertaining to a pet's visitation history</li>
		<li>Add information pertaining to a visit to the pet's visitation history</li>
	</ul>

	<h3>Business Rules</h3>
	<ol>
		<li>An owner may not have multiple pets with the same case-insensitive name.</li>
	</ol>

<!-- === DESIGN AND IMPLEMENTATION ========================================= -->
	<h2>PetClinic Sample Application Design &amp; Implementation</h2>

	<h3>Server Technology</h3>
	<p>
		The sample application should be usable with any Java EE web application
		container that is compatible with the Servlet 2.5 and JSP 2.0
		specifications.
	</p>

	<h3>Database Technology</h3>
	<p>
		H2 is the default database used by Grails, but an alternative database
		can be configured as per <a href="https://docs.grails.org/latest/guide/conf.html#dataSource" target="_blank">the instruction in the Grails user guide</a>.
	</p>

	<h3>Development Environment</h3>
	<p>
		The
		developer will need to obtain the following tools externally, all of
		which are freely available:
	</p>

	<ul>
		<li>Grails 6.2.3 or above</li>
		<li>Java SDK 11 or above</li>
	</ul>

	<p>
		<strong>NOTE:</strong> The version numbers listed are those that were used
		in the development of the PetClinic application. Other versions of the same
		tools may or may not work.
	</p>

	<p>
		Download links for the various tools needed are provided in the Downloads section.
	</p>

	<h3>Directory Structure</h3>

	<p>
		<span style="font-weight: bold; font-style: italic;">petclinic</span>:
		the root directory of the project contains build related files<br>


		&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">grails-app</span>: contains
		main Grails sources<br>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">conf</span>: contains
		configuration files<br>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">controllers</span>: contains
		web controllers<br>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">domain</span>: contains domain objects (entities)<br>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">i18n</span>:
		contains internationalization (i18n) property bundles<br>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">services</span>:
		contains transactional services that implement business logic<br>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">taglibs</span>:
		contains tag libraries that serve as view helpers<br>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">utils</span>:
		contains utility classes<br>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">views</span>:
		contains views written in Groovy Server Pages (GSP)<br>


		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span style="font-weight: bold; font-style: italic;">layouts</span>:
		contains layouts for separating out view logic<br>

		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span style="font-weight: bold;"> <span style="font-style: italic;">common</span></span>:
		contains common view templates<br>

		&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">lib</span>: contains
		any user provided JAR files<br>

		&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">scripts</span>: contains
		any user provided scripts<br>

		&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">src</span>: contains
		additional Java and Groovy sources<br>

		&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">test</span>: contains
		unit and integration tests<br>


		&nbsp;&nbsp;&nbsp; <span style="font-weight: bold; font-style: italic;">lib</span>: contains
		all static web resources<br>

	</p>

<!-- === DESIGN ============================================================ -->
	<h2>PetClinic Application Design</h2>

	<h3>Logging</h3>
	<p>
		Grails supports the use of the Apache Commons Logging API. You can configure logging
		using the <a href="https://docs.grails.org/latest/guide/conf.html#logging" target="_blank">Grails Logback Xml</a> within the grails-app/conf/logback.xml file.
	</p>

	<h3>Business Layer</h3>
	<p>
		The Business Layer consists of a number of basic Grails domain classes
		representing the application domain objects and associated validation
		logic that are used by the Presentation Layer.
	</p>

	<ul>
		<li><span style="font-weight: bold; font-style: italic;">org.grails.samples.Speciality</span>
		Represents the specialization of a particular Vet (dentist, surgery etc.)</li>
		<li><span style="font-weight: bold; font-style: italic;">org.grails.samples.PetType</span>
		Represents the type of pet (dog, cat etc.)</li>
		<li><span style="font-weight: bold; font-style: italic;">org.grails.samples.Person</span> provides a superclass for all objects that	implement the notion of a person.</li>
		<li><span style="font-weight: bold; font-style: italic;">org.grails.samples.Vet</span> is
		an extension of <span style="font-weight: bold;">Person</span> that implements a
		veterinarian. It holds a <span style="font-weight: bold;">Set</span> of
		specialities that the <span style="font-weight: bold;">Vet</span> is capable of.</li>
		<li><span style="font-weight: bold; font-style: italic;">org.grails.samples.Owner</span>
		is an extension of <span style="font-weight: bold;">Person</span> that implements a pet owner.
		It holds a <span style="font-weight: bold;">Set</span> of pets owned.</li>
		<li><span style="font-weight: bold; font-style: italic;">org.grails.samples.Pet</span>
		Implements the notion of a pet. It holds a <span style="font-weight: bold;">Set</span> of
		visits made concerning the pet.</li>
		<li><span style="font-weight: bold; font-style: italic;">org.grails.samples.Visit</span>
		Implements the notion of a clinic visit
		for a pet. </li>
	</ul>


	<h3>Presentation Layer classes</h3>
	<ul>
		<li>
		<span style="font-weight: bold; font-style: italic;">org.grails.samples.ClinicController</span>
		Is a simple controller that displays the welcome page and lists all of the known Vets
		</li>
		<li>
		<span style="font-weight: bold; font-style: italic;">org.grails.samples.OwnerController</span>
		Handles the core logic for adding, updating and finding owners
		</li>
		<li>
		<span style="font-weight: bold; font-style: italic;">org.grails.samples.PetController</span>
		Handles the main logic of adding, updating and viewing pets and visits
		</li>

	</ul>

	<h3>Logical Views &amp; Implemented Use Cases</h3>

	<ul>
		<li><span style="font-weight: bold; font-style: italic;">grails-app/views/clinic/index.gsp</span> is
		the "home" screen. It provides links to display a list of all vets,
		find an owner, or view documentation.</li>
		<li><span style="font-weight: bold; font-style: italic;">grails-app/views/clinic/vets.gsp</span> displays all vets and their specialties.</li>
		<li><span style="font-weight: bold; font-style: italic;">grails-app/views/owner/find.gsp</span> is used to find owners by last name.</li>
		<li><span style="font-weight: bold; font-style: italic;">grails-app/views/owner/selection.gsp</span> allows user to select from a list of multiple owners with the same last name.</li>
		<li><span style="font-weight: bold; font-style: italic;">grails-app/views/owner/show.gsp</span> displays a owner's data and a list of the owner's pets and their data.</li>
		<li><span style="font-weight: bold; font-style: italic;">grails-app/views/owner/add.gsp</span> allows the addition of a new <b>Owner</b></li>
		<li><span style="font-weight: bold; font-style: italic;">grails-app/views/pet/add.gsp</span> allows the addition of a new <b>Pet</b></li>
		<li><span style="font-weight: bold; font-style: italic;">grails-app/views/pet/addVisit.gsp</span> allows the addition of a new <b>Visit</b></li>
		<li><span style="font-weight: bold; font-style: italic;">grails-app/views/common/_formField.gsp</span> A template used to render common markup</li>
		<li><span style="font-weight: bold; font-style: italic;">grails-app/views/layouts/main.gsp</span> The layout used to include common CSS and markup</li>
	</ul>


	<h3>Testing</h3>
	<ul>
        <li><span style="font-weight: bold; font-style: italic;">All Domain classes</span>
        have a set of Spock tests for validation logic.</li>
        <li><span style="font-weight: bold; font-style: italic;">Some pages/useCases</span>
        have a set of Geb functional tests: Welcome, Veterinarians, FindOwner, and AddOwner.</li>
        <li><span style="font-weight: bold; font-style: italic;">org.grails.samples.OwnerControllerSpec</span>
        is a simple controller Spock test that tests the OwnerController.</li>
	</ul>

	<h3>Downloads</h3>
	<ul>
		<li>Download and install the
		<a href="https://grails.org/download.html" target="_blank">Grails</a>
		(examples, including PetClinic are provided)</li>
		<li>Download and install a <a href="https://www.oracle.com/technetwork/java/index.html" target="_blank">Java (Oracle)</a>
		Software Developer Kit, version 11 or later</li>
		<li>Alternatively you can download and install <a href="https://adoptium.net/en-GB/temurin/releases/" target="_blank">Java (Eclipse Temurin)</a>
		Software Developer Kit, version 11 or later</li>
	</ul>

	<h3>Using the PetClinic Application</h3>
	<p>
		Make sure the PetClinic web application is running by typing "grails run-app" from the root of the project and then browse to
		<a href="http://localhost:8080/petclinic">http://localhost:8080/petclinic</a>.
    <p>
        NOTE: A feature is available to demonstrate live editing of the code in the running app itself.
        The live editing of source files will only work when executing "grails run-app", not when deployed as a war.
	</p>

	<h3>Deploying the PetClinic Application</h3>
	<p>
		Deploy the web application to the server in the usual way. If you need
		instructions for web application deployment, see the Tomcat
		documentation for details. The Web Archive (WAR) file can be created by running the "grails war" command, which places it in the root of the project.
	</p>

	</div>
</body>
