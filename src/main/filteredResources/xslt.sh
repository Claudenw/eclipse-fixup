#
# Copyright 2017 Claude N. Warren, Jr.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if [ -z $1 ]
then
	export dir=$PWD
else
	export dir=$1
fi
export cpth=`cat ${project.build.directory}/classpath.txt`
export fixup_dir=${project.build.directory}

echo fixing up $dir

cp $dir/.project $dir/.project_old

java -cp $cpth org.apache.xalan.xslt.Process -XML -IN $dir/.project_old -XSL $fixup_dir/addJava.xslt -OUT $dir/.project 

mkdir -p $dir/src/main/java
mkdir -p $dir/src/main/resources
mkdir -p $dir/src/test/java
mkdir -p $dir/src/test/resources

cp $fixup_dir/classpath.xml $dir/.classpath

