<?xml version="1.0"?>
<!-- di-playlists -->
<!-- Transform Digitally Imported playlists into RSS 1.0 feeds. --> 
<!-- -->
<!-- (c) Karl-Martin Skontorp kms@skontorp.net ~ http://22pf.org/ -->
<!-- Licensed under the GNU GPL 2.0 or later. -->

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
