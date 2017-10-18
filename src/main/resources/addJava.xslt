<?xml version="1.0" encoding="utf-8"?>
<!--                                                                             -->
<!--  Copyright 2017 Claude N. Warren, Jr.                                       -->
<!--                                                                             -->
<!--  Licensed under the Apache License, Version 2.0 (the "License");            -->
<!--  you may not use this file except in compliance with the License.           -->
<!--  You may obtain a copy of the License at                                    -->
<!--                                                                             -->
<!--     http://www.apache.org/licenses/LICENSE-2.0                              -->
<!--                                                                             -->
<!--  Unless required by applicable law or agreed to in writing, software        -->
<!--  distributed under the License is distributed on an "AS IS" BASIS,          -->
<!--  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   -->
<!--  See the License for the specific language governing permissions and        -->
<!--  limitations under the License.                                             -->
<!--                                                                             -->
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" encoding="UTF-8" indent="yes" />

	<xsl:template match="buildSpec">
		<buildSpec>
			<xsl:copy-of select="*" />
			<xsl:if
				test="not(buildCommand/name/text() = 'org.eclipse.jdt.core.javabuilder')">
				<buildCommand><name>org.eclipse.jdt.core.javabuilder</name><arguments/></buildCommand>
			</xsl:if>
		</buildSpec>
	</xsl:template>


	<xsl:template match="natures">
		<natures>
			<xsl:copy-of select="*" />

			<xsl:if test="not(nature/text() = 'org.eclipse.jdt.core.javanature')">
				<nature>org.eclipse.jdt.core.javanature</nature>
			</xsl:if>
		</natures>
	</xsl:template>


	<xsl:template match="/">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="@* | node()">
		<xsl:copy>
			<xsl:apply-templates select="@* | node()" />
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>