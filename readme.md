## Fixup Eclipse Maven Jave Settings ##

This project creates a script that you run on you system to fixup the maven configuration for a project so
that it will

* Have the Jave nature
* Read dependencies from the pom.xml

Projects should be imported into eclipse as maven projects.

## Usage ##

pull this project from git and run `mvn generate-sources`

This will create a file in the target subdirectory called xslt.sh

execute the xslt.sh script in the project home directory for the project that needs fixing.

for example:

    cd ~/eclipse-workspace/broken-project
    sh ~/eclipse-workspace/eclipse-fixup/target/xslt.sh
    
alternatively you may specify the path to the project to fix.

for example:

    sh ~/eclipse-workspace/eclipse-fixup/target/xslt.sh ~/eclipse-workspace/broken-project
    
After running the script you may need to run the maven -> update project within the project itself.

## License ##

This code is provided under the Apache license v2. http://www.apache.org/licenses/LICENSE-2.0

    