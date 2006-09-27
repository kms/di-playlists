<?xml version="1.0"?>
<!-- Transform Digitally Imported (http://www.di.fm/) playlists
     into plain text. -->
<!-- (c) Karl-Martin Skontorp <kms@skontorp.net> -->

    <xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="text" indent="no" />

	<xsl:template match="/">
	    <xsl:value-of select="document('http://xml.skontorp.net/misc/datetime.php')/datetime/full-iso8601" />
<xsl:text>

</xsl:text>
	    <xsl:apply-templates select="/PLAYLISTS/CHANNELS/CHANNEL" />
	</xsl:template>

	<xsl:template match="/PLAYLISTS/CHANNELS/CHANNEL">
<xsl:text>[</xsl:text>
<xsl:value-of select="CHANNELTITLE" />
<xsl:text>] </xsl:text>
<xsl:value-of select="TRACKS/TRACK/TRACKTITLE" />
<xsl:text>
</xsl:text>
	</xsl:template>

    </xsl:stylesheet>
