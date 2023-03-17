<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="performers" name="Template">
    <xsl:param name="firstLetter"></xsl:param>
    <a href="#" onclick="displayMovies('{$firstLetter}')">
      <xsl:value-of select="$firstLetter"/>
    </a>,
  </xsl:template>

  <xsl:template match="/">
    <xsl:for-each select="abcd/char">
      <xsl:call-template name="Template">
        <xsl:with-param name="firstLetter">
            <xsl:value-of select="."/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>


</xsl:stylesheet>