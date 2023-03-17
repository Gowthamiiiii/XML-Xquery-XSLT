<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="firstLetter"></xsl:param>

    <xsl:template match="/">
       <hr/>
        <xsl:apply-templates select="mdb"/>
    </xsl:template>


    <xsl:template match="movies">
    
        <xsl:for-each select="movie">
             <xsl:sort select="year" order="descending"/>
            <xsl:call-template name="performers">
                <xsl:with-param name="movieName">
                   
                                <xsl:value-of select="@id"/>

               
                </xsl:with-param>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="performers" name="performers">
    <xsl:param name="movieName"></xsl:param>
     
    <xsl:if test='(starts-with( translate(title, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), translate($firstLetter, "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz")))'>
                        <li>
                            <a href="#" onclick="displayInfo('{$movieName}')">
                                <xsl:value-of select="concat(' ',title, '(', year ,')' )"/>
                            </a>
                        </li>
                    </xsl:if>
    </xsl:template>

</xsl:stylesheet>