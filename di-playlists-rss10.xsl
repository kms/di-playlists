<?xml version="1.0"?>
<!-- di-playlists -->
<!-- Transform Digitally Imported playlists into RSS 1.0 feeds. --> 
<!-- -->
<!-- (c) Karl-Martin Skontorp kms@skontorp.net ~ http://picofarad.org/ -->
<!-- Licensed under the GNU GPL 2.0 or later. -->

<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns="http://purl.org/rss/1.0/">

  <xsl:output method="xml" omit-xml-declaration="no" encoding="ISO-8859-1"/>

    <xsl:template match="/">
        <rdf:RDF>
            <channel>
                <title>Digitally Imported Playlist</title>
                <link>http://www.di.fm/</link>
                <description>
                    Playlists for the Digitally Imported radio stations.
                </description>
                <dc:date>
                    <xsl:value-of select="document('http://xml.skontorp.net/misc/datetime.php')/datetime/full-iso8601" />
                </dc:date>
            </channel>
            <xsl:apply-templates select="/PLAYLISTS/CHANNELS/CHANNEL" />
        </rdf:RDF>
    </xsl:template>

    <xsl:template match="/PLAYLISTS/CHANNELS/CHANNEL">
        <item>
            <title>
                <xsl:text>[</xsl:text>
                <xsl:value-of select="CHANNELTITLE" />
                <xsl:text>] </xsl:text>
                <xsl:value-of select="TRACKS/TRACK/TRACKTITLE" />
            </title>
        </item>
    </xsl:template>

</xsl:stylesheet>
