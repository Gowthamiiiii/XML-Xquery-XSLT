<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="movieName"/>

    <xsl:template match="/">
        <hr/>

        <xsl:apply-templates select="mdb" />


    </xsl:template>


    <xsl:template match="movies/movie">
        <xsl:if test= "boolean(@id = $movieName)">
            <table>
                <tbody>
                    <tr>
                        <td class="title">Title:</td>
                        <td class="content">
                            <xsl:apply-templates select="title" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">Year:</td>
                        <td class="content">
                            <xsl:apply-templates select="year" />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">Director(s):</td>
                        <td class="content">
                            <xsl:for-each select="directors/director">
                                <div class="tablePadd">
                                    <xsl:variable name="dir" select="@idref" />
                                    <xsl:apply-templates select="//mdb/performers/performer[@id=$dir]/name" />
                                </div>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">Genre(s):</td>
                        <td class="content">
                            <xsl:for-each select="genres/genre">
                                <div class="tablePadd">
                                    <xsl:apply-templates select="." />
                                </div>
                            </xsl:for-each>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">Plot:</td>
                        <td class="content">
                            <xsl:apply-templates select="plot/." />
                        </td>
                    </tr>
                    <tr>
                        <td class="title">Cast:</td>
                        <td class="content">
                            <xsl:for-each select="cast/performer">
                                <div class="tablePadd">
                                    <xsl:variable name="act" select="actor/@idref" />
                                    <i style="font-style: normal; font-weight: bold;">Actor:</i>
                                    <xsl:apply-templates select="//mdb/performers/performer[@id=$act]/name" />
                                    <br></br>
                                    <i style="font-style: normal; font-weight: bold;">Role:</i>
                                    <xsl:apply-templates select="role" />
                                </div>
                            </xsl:for-each>
                        </td>
                    </tr>
                </tbody>
            </table>
        </xsl:if>
    </xsl:template>


    <xsl:template match="movie">
    </xsl:template>

    <xsl:template match="performers">
    </xsl:template>
</xsl:stylesheet>
