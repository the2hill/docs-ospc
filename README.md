# Rackspace OSPC Documentation

This repository contains the source files for ospc products that generate the OSPC documentation


## Migration steps
The objective is to migrate from individual ospc documentation repos to a single repo that will be hosted on github pages.

Following the below steps should get your project included in the build with minimal updates:

* `Clone or checkout the latest of this repo(docs-ospc)`
* `Clone or checkout the latest for the product repo being migrated`
* `Within the docs-ospc repo copy the repo to be migrated over, example: $docs-ospc cp -R /some/path/to/repo .`
* `Once copied over, cd into the project folder and remove related .git/hub dirs, example: $docs-ospc/myproject rm -rf .git .github`

Now that your repo has been pulled in to docs-ospc we can make a few needed changes starting with the makefile:

* `In the Makefile generally found in '<project>/<api-docs>' refactor the BUILDDIR from _build to ../../ospc/docs. Make sure the levels match your repo configuration`
* `Also in the Makefile 'html' section refactor/remove the '/html/docs' from the build and echo lines, example: $(BUILDDIR)/html/docs/cloud-load-balancers/v1 should become $(BUILDDIR)/cloud-load-balancers/v1`

Now we can add our project to the setup and index files that build our projects documentation and is indexed on the landing page:

First let's update the 'docs-ospc/index.html', there's two spots we'll need to add the list item for our projects. 
The href in the list items should map to the output file defined in the Makefile we adjusted earlier:
* `Near line 170 of 'docs-ospc/index.html' add the first list item, example: '<li class="toctree-l1"><a class="reference internal" href="cloud-load-balancers/v1/index.html">Cloud Load Balancers</a></li>'`
* `Similarly near line 191 of 'docs-ospc/index.html' add the first list item, example: '<li><a class="reference internal" href="cloud-load-balancers/v1/index.html"><span class="std std-ref">Cloud Load Balancers</span></a></li>'`

Now we can add our project to the setup script:
* `In 'docs-ospc/setup.sh' add a make line that maps to your project where the makefile lives, usually in 'myproject/api-docs' but not always, example: make html -C ./docs-cloud-load-balancers/api-docs/cloud-load-balancers-v1`

The migration and setup is done for the most part... but there is one more thing(so far) that needs to be done to fix some of the relative links:
* `In 'myproject/api-docs/_templates/header.html update any occurances of '/docs' of a relative path to '/' which should work with custom domain. In files and clb case it was one instance on line 43 for Developer Documentation: '<li class="nav-item "><a href="/" class="nav-link">Developer Documentation</a></li>'`


### Verify things...

To verify that the project builds with your new additions simply run the setup.sh script, example:
* `$docs-ospc ./setup.sh`

This will trigger sphinx builds for all projects and update the landing page. This can then be viewed from your browser by navigating to the index.html in the build dir of docs-ospc(docs-ospc/ospc/docs) and opening it in your browser of choice. 

If sphinx failed for any reason or things aren't showing up as expected some debugging is required after this point. 

### TBD...

There's probably plenty of things we can tweak and fix but this should get us going. If other's discover issues/bugs/fixes 
that need to be updated please document them here and inform the others so we can make the adjustments! 

