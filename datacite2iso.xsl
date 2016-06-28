<?xml version="1.0" encoding="UTF-8"?>
<!-- apply to http://get.iedadata.org/outgoing/datacite/ecl/ -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0"
    xmlns:dcite="http://datacite.org/schema/kernel-3" 
    xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco"
    xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:gml="http://www.opengis.net/gml"
    xmlns:xlink="http://www.w3.org/1999/xlink">
<xsl:template match="/">
        <xsl:apply-templates/>
</xsl:template>  
    

    
<!--   
<xsl:template match="link">
    <xsl:value-of select="concat('http://service.re3data.org',@href)"/>
    <xsl:variable name="doc" select="document(concat('http://service.re3data.org',@href))/r3d:re3data"/>
    <xsl:apply-templates select='$doc' >
        <xsl:with-param name="identifier"><xsl:value-of select="../id"/></xsl:with-param>
    </xsl:apply-templates>
</xsl:template>   
  -->
    
<xsl:template match='dcite:resource'>
    <xsl:variable name="identifier" select="dcite:identifier[@identifierType='DOI']"/>
    <xsl:variable name="cleanedidentifier" select="translate(translate($identifier, '/', '+'), '.', '_')"/>
  
    
    <xsl:result-document method="xml"  indent="yes"  href="datacite_iso/{$cleanedidentifier}.xml">

 <!--   
    
   <resource xmlns="http://datacite.org/schema/kernel-3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://datacite.org/schema/kernel-3 http://schema.datacite.org/meta/kernel-3/metadata.xsd">
  <identifier identifierType="DOI">10.1594/IEDA/100004</identifier>
  <creators>
    <creator>
      <creatorName>Shaw, Alison</creatorName>
    </creator>
  </creators>
  <titles>
    <title>Gakkel Ridge basalt melt inclusion and mineral chemistry</title>
  </titles>
  <publisher>Integrated Earth Data Applications (IEDA)</publisher>
  <publicationYear>2011</publicationYear>
  <subjects>
    <subject subjectScheme="ECL">Geochemistry</subject>
  </subjects>
  <dates>
    <date dateType="Available">2011-03-25</date>
  </dates>
  <language>en</language>
  <resourceType resourceTypeGeneral="Dataset"/>
  <alternateIdentifiers>
    <alternateIdentifier alternateIdentifierType="URL">http://www.earthchem.org/library/browse/view?id=124</alternateIdentifier>
  </alternateIdentifiers>
  <formats>
    <format>application/vnd.ms-excel</format>
  </formats>
  <version>1.0</version>
  <contributors>
    <contributor contributorType="Editor">
      <contributorName>EarthChem Library (ECL)</contributorName>
      <nameIdentifier nameIdentifierScheme="DOI">10.17616/R3V644</nameIdentifier>
    </contributor>
  </contributors>
  <rightsList>
    <rights rightsURI="https://creativecommons.org/licenses/by/3.0/us/">Creative Commons Attribution-NonCommercial-Share Alike 3.0 United States [CC BY-NC-SA 3.0]</rights>
  </rightsList>
  <relatedIdentifiers>
    <relatedIdentifier relatedIdentifierType="DOI" relationType="IsReferencedBy">10.1016/j.epsl.2009.11.018</relatedIdentifier>
  </relatedIdentifiers>
  <descriptions>
    <description descriptionType="Abstract">Analyses of volatile, major, and trace elements for a suite of glasses and melt inclusions from the 85 degrees E segment of the ultra-slow spreading Gakkel Ridge.</description>
    <description descriptionType="Other">volatiles, ultra-slow spreading ridges mantle, melting, CO2 fluxes, Ridge related</description>
  </descriptions>
  <geoLocations>
    <geoLocation>
      <geoLocationBox>85.5945 85.1788 85.6263 85.5817</geoLocationBox>
    </geoLocation>
    <geoLocation>
      <geoLocationPlace>Gakkel Ridge Arctic Ocean</geoLocationPlace>
    </geoLocation>
  </geoLocations>
</resource>

      
      
   -->     
        <gmd:MD_Metadata xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco"
                 xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:gml="http://www.opengis.net/gml"
                 xmlns:xlink="http://www.w3.org/1999/xlink">

    <gmd:fileIdentifier>
        <gco:CharacterString><xsl:value-of select="$cleanedidentifier"/></gco:CharacterString>
    </gmd:fileIdentifier>
    <gmd:language>
        <gco:CharacterString>en</gco:CharacterString>
    </gmd:language>

    <!--
    <gmd:hierarchyLevel>
        <gmd:MD_ScopeCode codeSpace="ISOTC211/19115" codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode"
        codeListValue="service">service</gmd:MD_ScopeCode>
    </gmd:hierarchyLevel>
   -->
            <xsl:call-template name="title">
                <xsl:with-param name="titles" select="dcite:titles"></xsl:with-param>
            </xsl:call-template>
            
    <gmd:contact>
        <gmd:CI_ResponsibleParty>
            <gmd:organisationName>
                <gco:CharacterString>Earthcube CINERGI Metadata Pipeline</gco:CharacterString>
            </gmd:organisationName>
            <gmd:positionName>
                <gco:CharacterString>CINERGI Metadata Contact</gco:CharacterString>
            </gmd:positionName>

            <gmd:contactInfo>
                <gmd:CI_Contact>
                    <gmd:address>
                        <gmd:CI_Address>
                            <gmd:electronicMailAddress>
                                <gco:CharacterString>metadata@earthcube.org</gco:CharacterString>
                            </gmd:electronicMailAddress>
                        </gmd:CI_Address>
                    </gmd:address>
                </gmd:CI_Contact>
            </gmd:contactInfo>
            <gmd:role>
                <gmd:CI_RoleCode codeSpace="ISOTC211/19115"
                                 codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode"
                                 codeListValue="pointOfContact">pointOfContact
                </gmd:CI_RoleCode>
            </gmd:role>
        </gmd:CI_ResponsibleParty>
    </gmd:contact>

            <gmd:dateStamp >
                <gco:Date><xsl:value-of select="dcite:publicationYear"/></gco:Date>
           </gmd:dateStamp>
    <!--
    <gmd:metadataStandardName>
        <gco:CharacterString>ISO 19139/19115 Metadata for Datasets</gco:CharacterString>
    </gmd:metadataStandardName>
    -->

    <gmd:metadataStandardVersion>
        <gco:CharacterString>2003</gco:CharacterString>
    </gmd:metadataStandardVersion>
           
            <!--  <alternateIdentifier alternateIdentifierType="URL">http://www.earthchem.org/library/browse/view?id=124</alternateIdentifier> -->
            <!--
            <gmd:dataSetURI>
                <gco:CharacterString><xsl:value-of select="./r3d:repositoryURL"/></gco:CharacterString>
            </gmd:dataSetURI>
-->
            <xsl:call-template name="dataseturi">
                <xsl:with-param name="urls"
                    select="dcite:alternateIdentifiers/dcite:alternateIdentifier[@alternateIdentifierType='URL']"></xsl:with-param>
            </xsl:call-template>
            
     
    <gmd:identificationInfo>
        <gmd:MD_DataIdentification>
            <gmd:citation>
                <gmd:CI_Citation>
                    <gmd:title>
                        <gco:CharacterString><xsl:value-of select="dcite:titles/dcite:title[1]"/></gco:CharacterString>
                    </gmd:title>
                    <xsl:choose> 
                        <xsl:when test="./dcite:dates/dcite:date[1] != ''">
                    <gmd:date>
                        <gmd:CI_Date>
                           
                               
                                <gmd:date>
                                    <gco:Date>
                                           <xsl:value-of select="./dcite:dates/dcite:date[1] "/>  
                                    </gco:Date>
                                </gmd:date>
                            
<!-- need to catch available and other terms -->
                            <gmd:dateType>
                                <gmd:CI_DateTypeCode codeSpace="ISOTC211/19115"
                                                     codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode"
                                                     codeListValue="publication">publication
                                </gmd:CI_DateTypeCode>
                            </gmd:dateType>
                        </gmd:CI_Date>
                    </gmd:date>
                        </xsl:when>
                        <xsl:otherwise>
                            
                            <gmd:date gco:nilReason="unknown"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </gmd:CI_Citation>
            </gmd:citation>

            <xsl:choose>
                <xsl:when test="./dcite:descriptions/dcite:description[@descriptionType='Abstract']">
            <gmd:abstract>
                <gco:CharacterString><xsl:value-of select="./dcite:descriptions/dcite:description[@descriptionType='Abstract']"/></gco:CharacterString>
            </gmd:abstract>
                </xsl:when>
<xsl:otherwise>
            <gmd:abstract gco:nilReason="unknown"/>
</xsl:otherwise>
            </xsl:choose> 

            <xsl:for-each select="./dcite:creators/dcite:creator">
                
                <!-- TODO: named identifier samples/100262.xml
                    https://geo-ide.noaa.gov/wiki/index.php?title=ISO_Researcher_ID
                -->
            <gmd:pointOfContact>
                <gmd:CI_ResponsibleParty>
                    <xsl:if test="./dcite:creatorName">
                   <gmd:individualName>
                       <gco:CharacterString><xsl:value-of select="./dcite:creatorName"/></gco:CharacterString>
                    </gmd:individualName>
                   
                    </xsl:if>
                  <!-- 
                    <gmd:organisationName>
                        <gco:CharacterString><xsl:value-of select="r3d:institutionName"/></gco:CharacterString>
                    </gmd:organisationName>
                    </xsl:if>
                    -->
                    <!--multiple r3d:institutionContact -->
               <!--     {% if row['Resource POC e-mail#info'] or row['Resource POC voice phone#info'] %}

                    <gmd:contactInfo>
                        <gmd:CI_Contact>
                            {% if row['Resource POC voice phone#info'] %}
                            <gmd:phone>
                                <gmd:CI_Telephone>
                                    <gmd:voice>
                                        <gco:CharacterString>{{ row['Resource POC voice phone#info'] }}
                                        </gco:CharacterString>
                                    </gmd:voice>
                                </gmd:CI_Telephone>
                            </gmd:phone>
                            {% endif %}
                            {% if row['Resource POC e-mail#info'] %}
                            <gmd:address>
                                <gmd:CI_Address>
                                    <gmd:electronicMailAddress>
                                        <gco:CharacterString>{{ row['Resource POC e-mail#info'] }}</gco:CharacterString>
                                    </gmd:electronicMailAddress>

                                </gmd:CI_Address>
                            </gmd:address>
                            {% endif %}
                        </gmd:CI_Contact>
                    </gmd:contactInfo>
                    {% endif %}
                    -->
                    <!-- need to do some r3d:responsibilityType -->
                    <gmd:role>
                        <gmd:CI_RoleCode codeSpace="ISOTC211/19115"
                                         codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode"
                                         codeListValue="creator">creator
                        </gmd:CI_RoleCode>
                    </gmd:role>
                </gmd:CI_ResponsibleParty>
            </gmd:pointOfContact>
            </xsl:for-each>
            
            <xsl:if test="dcite:publisher">
                
                <!-- also  r3d:repositoryContact -->
                <gmd:pointOfContact>
                    <gmd:CI_ResponsibleParty>                        
                    <gmd:organisationName>
                        <gco:CharacterString><xsl:value-of select="./dcite:publisher"/></gco:CharacterString>
                    </gmd:organisationName>
                   
                       <!--multiple r3d:institutionContact -->
                        <!--     {% if row['Resource POC e-mail#info'] or row['Resource POC voice phone#info'] %}
                            
                    <gmd:contactInfo>
                        <gmd:CI_Contact>
                            {% if row['Resource POC voice phone#info'] %}
                            <gmd:phone>
                                <gmd:CI_Telephone>
                                    <gmd:voice>
                                        <gco:CharacterString>{{ row['Resource POC voice phone#info'] }}
                                        </gco:CharacterString>
                                    </gmd:voice>
                                </gmd:CI_Telephone>
                            </gmd:phone>
                            {% endif %}
                            {% if row['Resource POC e-mail#info'] %}
                            <gmd:address>
                                <gmd:CI_Address>
                                    <gmd:electronicMailAddress>
                                        <gco:CharacterString>{{ row['Resource POC e-mail#info'] }}</gco:CharacterString>
                                    </gmd:electronicMailAddress>
                                    
                                </gmd:CI_Address>
                            </gmd:address>
                            {% endif %}
                        </gmd:CI_Contact>
                    </gmd:contactInfo>
                    {% endif %}
                    -->
                        <!-- need to do some r3d:responsibilityType -->
                        <gmd:role>
                            <gmd:CI_RoleCode codeSpace="ISOTC211/19115"
                                codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_RoleCode"
                                codeListValue="publisher">publisher
                            </gmd:CI_RoleCode>
                        </gmd:role>
                    </gmd:CI_ResponsibleParty>
                </gmd:pointOfContact>
            </xsl:if>
            <xsl:for-each-group select="./dcite:subjects/dcite:subject" group-by="@subjectScheme" >
            <gmd:descriptiveKeywords>
                <gmd:MD_Keywords>
                    <xsl:variable name='subject' select="current-grouping-key()"/>
                    <xsl:for-each select="//dcite:subject[@subjectScheme=$subject]">
                                          
                    <gmd:keyword>
                        <gco:CharacterString><xsl:value-of select="."/>
                            
                        </gco:CharacterString>
                    </gmd:keyword>

                    </xsl:for-each>
                    <gmd:type>
                        <gmd:MD_KeywordTypeCode codeSpace="ISOTC211/19115"
                                                codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode"
                                                codeListValue="theme">theme
                        </gmd:MD_KeywordTypeCode>
                    </gmd:type>
                    <gmd:thesaurusName>
                        <gmd:CI_Citation>
                            <gmd:title>
                                <gco:CharacterString><xsl:value-of select="$subject"/></gco:CharacterString>
                            </gmd:title>
                            <gmd:date gco:nilReason="unknown">

                            </gmd:date>
                        </gmd:CI_Citation>
                    </gmd:thesaurusName>
                </gmd:MD_Keywords>
            </gmd:descriptiveKeywords>
            </xsl:for-each-group>

            <!--   <description descriptionType="Other">volatiles, ultra-slow spreading ridges mantle, melting, CO2 fluxes, Ridge related</description> -->
            
            <xsl:if test="./dcite:descriptions/dcite:description[@descriptionType='Other']">
            <gmd:descriptiveKeywords>
                <gmd:MD_Keywords>

                    <xsl:for-each select="./dcite:descriptions/dcite:description[@descriptionType='Other']">
                        <xsl:variable name="tokens" select="tokenize(.,',')"/>
                        <xsl:for-each select="$tokens">
                            <gmd:keyword>
                                <gco:CharacterString><xsl:value-of select="normalize-space(.)"></xsl:value-of></gco:CharacterString>
                    </gmd:keyword>
                        </xsl:for-each> 
                    </xsl:for-each>
                    <gmd:type>
                        <gmd:MD_KeywordTypeCode codeSpace="ISOTC211/19115"
                                                codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode"
                                                codeListValue="theme">theme</gmd:MD_KeywordTypeCode>
                    </gmd:type>
                </gmd:MD_Keywords>
            </gmd:descriptiveKeywords>
          </xsl:if>


           <xsl:if test="false()" >
            <gmd:descriptiveKeywords>
                <gmd:MD_Keywords>

                    {% for item in row['Subjects#multi'] .split(',') %}
                    <gmd:keyword>
                        <gco:CharacterString>{{ item|trim }}</gco:CharacterString>
                    </gmd:keyword>
                    {% endfor %}
                    <gmd:type>
                        <gmd:MD_KeywordTypeCode codeSpace="ISOTC211/19115"
                                                codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode"
                                                codeListValue="theme">theme
                        </gmd:MD_KeywordTypeCode>
                    </gmd:type>

                    <gmd:thesaurusName>
                        <gmd:CI_Citation>
                            <gmd:title>
                                <gco:CharacterString>re3 Themes</gco:CharacterString>
                            </gmd:title>
                            <gmd:date>
                                <gmd:CI_Date>
                                    <gmd:date>
                                        <gco:Date>2015-01-01</gco:Date>
                                    </gmd:date>
                                    <gmd:dateType>
                                        <gmd:CI_DateTypeCode codeListValue="publication" codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode"
                                                />
                                    </gmd:dateType>
                                </gmd:CI_Date>
                            </gmd:date>
                        </gmd:CI_Citation>
                    </gmd:thesaurusName>
                </gmd:MD_Keywords>
            </gmd:descriptiveKeywords>
           </xsl:if>

            <xsl:if test="./dcite:formats/dcite:format">
            <gmd:descriptiveKeywords>
                <gmd:MD_Keywords>

                    <xsl:for-each select="./dcite:formats/dcite:format">
                       
                        <gmd:keyword>
                            <gco:CharacterString><xsl:value-of select="."/></gco:CharacterString>
                        </gmd:keyword>
                        

                    </xsl:for-each>
                    <gmd:type>
                        <gmd:MD_KeywordTypeCode codeSpace="ISOTC211/19115"
                                                codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode"
                                                codeListValue="theme">theme
                        </gmd:MD_KeywordTypeCode>
                    </gmd:type>

                    <gmd:thesaurusName>
                        <gmd:CI_Citation>
                            <gmd:title>
                                <gco:CharacterString>DataCite Format</gco:CharacterString>
                            </gmd:title>
                            <gmd:date>
                                <gmd:CI_Date>
                                    <gmd:date>
                                        <gco:Date>2015-01-01</gco:Date>
                                    </gmd:date>
                                    <gmd:dateType>
                                        <gmd:CI_DateTypeCode codeListValue="publication" codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode"
                                                />
                                    </gmd:dateType>
                                </gmd:CI_Date>
                            </gmd:date>
                        </gmd:CI_Citation>
                    </gmd:thesaurusName>
                </gmd:MD_Keywords>
            </gmd:descriptiveKeywords>
            </xsl:if>

    <!--                  {% if row['Reuse'] %}
            <gmd:descriptiveKeywords>
                <gmd:MD_Keywords>

                    {% for item in row['Reuse'] .split(';') %}
                    <gmd:keyword>
                        <gco:CharacterString>{{ item|trim }}</gco:CharacterString>
                    </gmd:keyword>
                    {% endfor %}
                    <gmd:type>
                        <gmd:MD_KeywordTypeCode codeSpace="ISOTC211/19115"
                                                codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode"
                                                codeListValue="theme">theme
                        </gmd:MD_KeywordTypeCode>
                    </gmd:type>

                    <gmd:thesaurusName>
                        <gmd:CI_Citation>
                            <gmd:title>
                                <gco:CharacterString>re3 Reuse</gco:CharacterString>
                            </gmd:title>
                            <gmd:date>
                                <gmd:CI_Date>
                                    <gmd:date>
                                        <gco:Date>2015-01-01</gco:Date>
                                    </gmd:date>
                                    <gmd:dateType>
                                        <gmd:CI_DateTypeCode codeListValue="publication" codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode"
                                                />
                                    </gmd:dateType>
                                </gmd:CI_Date>
                            </gmd:date>
                        </gmd:CI_Citation>
                    </gmd:thesaurusName>
                </gmd:MD_Keywords>
            </gmd:descriptiveKeywords>
            {% endif %}
            -->
            <!-- https://geo-ide.noaa.gov/wiki/index.php?title=ISO_Constraints -->
   <!--         <gmd:resourceConstraints>
                <gmd:MD_Constraints>
                    <gmd:useLimitation>
                        <gco:CharacterString>Disclaimer - While every effort has been made to ensure that these data are 
                            accurate and reliable within the limits of the current state of the art, NOAA cannot assume liability for any 
                            damages caused by any errors or omissions in the data, nor as a result of the failure of the data to 
                            function on a particular system. NOAA makes no warranty, expressed or implied, nor does the fact 
                            of distribution constitute such a warranty.</gco:CharacterString>
                    </gmd:useLimitation>
                    
                </gmd:MD_Constraints>
            </gmd:resourceConstraints>
            -->
            <xsl:for-each select="./dcite:rightsList/dcite:rights">    
            <gmd:resourceConstraints>
                <gmd:MD_LegalConstraints>
             <!--       <gmd:accessConstraints>
                         <gmd:MD_RestrictionCode codeList="http://www.ngdc.noaa.gov/metadata/published/xsd/schema/resources/
                            Codelist/gmxCodelists.xml#MD_RestrictionCode" codeListValue="otherRestrictions">otherRestrictions</gmd:MD_RestrictionCode>
                    </gmd:accessConstraints>
  -->
                    <gmd:useConstraints>
                        <gmd:MD_RestrictionCode 
                            codeList="http://www.ngdc.noaa.gov/metadata/published/xsd/schema/resources/Codelist/gmxCodelists.xml#MD_RestrictionCode" codeListValue="license">license</gmd:MD_RestrictionCode>
                    </gmd:useConstraints>
                   
                    <gmd:otherConstraints>
                        <gco:CharacterString><xsl:value-of select="@rightsURI"/></gco:CharacterString>
                    </gmd:otherConstraints>
                    <gmd:otherConstraints>
                        <gco:CharacterString> <xsl:value-of select="."/></gco:CharacterString>
                    </gmd:otherConstraints>
                </gmd:MD_LegalConstraints>
            </gmd:resourceConstraints>
            </xsl:for-each>
            
            <xsl:choose>
                <xsl:when test="dcite:language">
                    
                        <gmd:language>
                            <gco:CharacterString><xsl:value-of select="dcite:language"></xsl:value-of></gco:CharacterString>
                        </gmd:language>

                </xsl:when>
                <xsl:otherwise>
                    <gmd:language>
                        <gco:CharacterString>en</gco:CharacterString>
                    </gmd:language>
                </xsl:otherwise>
            </xsl:choose>

            <!-- <r3d:type> ??? -->
            <!--
            <gmd:topicCategory>
                <gmd:MD_TopicCategoryCode>society</gmd:MD_TopicCategoryCode>
            </gmd:topicCategory>
-->

            <!--/resource/geoLocations[1]/geoLocation/geoLocationBox
            A box contains two white
space separated latitude‐
longitude pairs, with each pair
separated by whitespace. The
first pair is the lower corner
(normally south west), the
second is the upper corner
(normally north east).
Detailed usage instructions22
Example:
<geoLocationBox>
41.090 ‐71.032  42.893 ‐68.211
</geoLocationBox>
            -->
            <xsl:for-each select="dcite:geoLocations/dcite:geoLocation">
            <gmd:extent>
                <gmd:EX_Extent>
                               <xsl:if test="dcite:geoLocationBox">
                           <xsl:variable name="coords" select="tokenize(./dcite:geoLocationBox,'\s')"/>
       
                                 <gmd:geographicElement>
                                     <gmd:EX_GeographicBoundingBox>
                                         <gmd:westBoundLongitude>
                                             <gco:Decimal><xsl:value-of select="$coords[2]"/></gco:Decimal>
                                         </gmd:westBoundLongitude>
                                         <gmd:eastBoundLongitude>
                                             <gco:Decimal><xsl:value-of select="$coords[4]"/></gco:Decimal>
                                         </gmd:eastBoundLongitude>
                                         <gmd:southBoundLatitude>
                                             <gco:Decimal><xsl:value-of select="$coords[1]"/></gco:Decimal>
                                         </gmd:southBoundLatitude>
                                         <gmd:northBoundLatitude>
                                             <gco:Decimal><xsl:value-of select="$coords[3]"/></gco:Decimal>
                                         </gmd:northBoundLatitude>
                                     </gmd:EX_GeographicBoundingBox>
                                 </gmd:geographicElement>
            
                       </xsl:if>
                    <!-- A point contains a single
latitude‐longitude pair,
separated by whitespace 
-->
                       <xsl:if test="dcite:geoLocationPoint">
                           <xsl:variable name="coords" select="tokenize(./dcite:geoLocationPoint,'\s')"/>
       
                                   <gmd:geographicElement>
                                       <gmd:EX_GeographicBoundingBox>
                                           <gmd:westBoundLongitude>
                                               <gco:Decimal><xsl:value-of select="$coords[2]"/></gco:Decimal>
                                           </gmd:westBoundLongitude>
                                           <gmd:eastBoundLongitude>
                                               <gco:Decimal><xsl:value-of select="$coords[1]"/></gco:Decimal>
                                           </gmd:eastBoundLongitude>
                                           <gmd:southBoundLatitude>
                                               <gco:Decimal><xsl:value-of select="$coords[2]"/></gco:Decimal>
                                           </gmd:southBoundLatitude>
                                           <gmd:northBoundLatitude>
                                               <gco:Decimal><xsl:value-of select="$coords[1]"/></gco:Decimal>
                                           </gmd:northBoundLatitude>
                                       </gmd:EX_GeographicBoundingBox>
                                   </gmd:geographicElement>
       
                       </xsl:if>
                       <xsl:if test="./dcite:geoLocationPlace"> 
                       <gmd:geographicElement>
                           <gmd:EX_GeographicDescription>
                               
                               <gmd:geographicIdentifier>
                                   <gmd:MD_Identifier>
                                    <!--   <gmd:authority>
                                           <gmd:CI_Citation>
                                               <gmd:title>
                                                   <gco:CharacterString>NASA/GCMD Location Keywords</gco:CharacterString>
                                               </gmd:title>
                                               <gmd:date>
                                                   <gmd:CI_Date>
                                                       <gmd:date>
                                                           <gco:Date>2009-01-01</gco:Date>
                                                       </gmd:date>
                                                       <gmd:dateType>
                                                           <gmd:CI_DateTypeCode codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode" codeListValue="revision">revision</gmd:CI_DateTypeCode>
                                                       </gmd:dateType>
                                                   </gmd:CI_Date>
                                               </gmd:date>
                                           </gmd:CI_Citation>
                                       </gmd:authority>
                                       -->
                                       <gmd:code>
                                           <gco:CharacterString><xsl:value-of select="./dcite:geoLocationPlace"/></gco:CharacterString>
                                       </gmd:code>
                                   </gmd:MD_Identifier>
                               </gmd:geographicIdentifier>
                           </gmd:EX_GeographicDescription>
                       </gmd:geographicElement>
                       </xsl:if>
                        
                    </gmd:EX_Extent>
                </gmd:extent>
            </xsl:for-each>
            <!-- repeatable -->
            <gmd:supplementalInformation>
                <gco:CharacterString></gco:CharacterString>
            </gmd:supplementalInformation> 
        </gmd:MD_DataIdentification>
    </gmd:identificationInfo>
  

            <!--r3d:repositoryURL
                r3d:api (multiple)
                <r3d:syndication syndicationType="RSS">http://www.globalresearchdatarepository.org/news.rss</r3d:syndication>  optional multiple 
 
                -->
            <xsl:if test="./dcite:alternateIdentifiers/dcite:alternateIdentifier[@alternateIdentifierType='URL']">              
   
    <gmd:distributionInfo>
        <gmd:MD_Distribution>
               
            <xsl:for-each select="./dcite:alternateIdentifiers/dcite:alternateIdentifier[@alternateIdentifierType='URL']"> 
                    <gmd:transferOptions>
                        <gmd:MD_DigitalTransferOptions>
                            <gmd:onLine>
                                <gmd:CI_OnlineResource>
                                    <gmd:linkage>
                                        <gmd:URL><xsl:value-of select="."/></gmd:URL>
                                    </gmd:linkage>
                                    
                                    <gmd:name>
                                        <gco:CharacterString>URL</gco:CharacterString>
                                    </gmd:name>
                                    <!--  <gmd:description>
                        <gco:CharacterString>Final Report for LCM2007 - the new UK Land Cover Map</gco:CharacterString>
                        </gmd:description>
                        -->
                                    
                                    <gmd:function>
                                        <gmd:CI_OnLineFunctionCode
                                            codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_OnLineFunctionCode"
                                            codeListValue="information"/>
                                    </gmd:function>
                                </gmd:CI_OnlineResource>
                            </gmd:onLine>
                        </gmd:MD_DigitalTransferOptions>
                    </gmd:transferOptions>
            </xsl:for-each>
                
            
        </gmd:MD_Distribution>
    </gmd:distributionInfo>
                </xsl:if>


 
         
      
</gmd:MD_Metadata>
    </xsl:result-document>   
    
    <!-- first title, for now -->
</xsl:template>
    <xsl:template name="title">
        <xsl:param name="titles"></xsl:param>
        <xsl:variable name="firstTitle"><xsl:value-of select="title[1]"/></xsl:variable>
        <gmd:hierarchyLevel>
            <gmd:MD_ScopeCode codeSpace="ISOTC211/19115" codeList="http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode"
                codeListValue="service"><xsl:attribute name="codeListValue"><xsl:value-of select="$firstTitle"/></xsl:attribute>
                <xsl:value-of select="$firstTitle"/></gmd:MD_ScopeCode>
            
        </gmd:hierarchyLevel>
    </xsl:template>
    <!--  <alternateIdentifier alternateIdentifierType="URL">http://www.earthchem.org/library/browse/view?id=124</alternateIdentifier> -->
 
    <xsl:template name="dataseturi">
        <xsl:param name="urls"></xsl:param>
        <xsl:for-each select="dcite:alternateIdentifier">
        <gmd:dataSetURI>
            <gco:CharacterString><xsl:value-of select="."/></gco:CharacterString>
        </gmd:dataSetURI>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>