<?xml version="1.0"?>
<!-- Transform Digitally Imported (http://www.di.fm/) playlists
     into RSS 1.0 feed with links to the discussion forum
     for every track. The number in paranthesis after track name
     is number of comments in forum. -->
<!-- (c) Karl-Martin Skontorp <kms@skontorp.net> -->

<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns="http://purl.org/rss/1.0/">

  <xsl:output method="xml" omit-xml-declaration="no" encoding="ISO-8859-1"/>

    <xsl:template match="/">
        <rdf:RDF>
            <channel rdf:about="http://www.di.fm/">
                <title>Digitally Imported Playlist</title>
                <link>http://www.di.fm/</link>
                <description>
                    Playlists for the Digitally Imported radio stations. With
		    links to discussion forum.
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
                <xsl:text> (</xsl:text>
                <xsl:value-of select="TRACKS/TRACK/BOARDCOUNT" />
	        <xsl:text>)</xsl:text>
            </title>
	    <link>
	        <xsl:value-of select="TRACKS/TRACK/TRACKURL" />
	    </link>
        </item>
    </xsl:template>

</xsl:stylesheet>
