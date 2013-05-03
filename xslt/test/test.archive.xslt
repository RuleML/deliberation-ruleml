<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
		<xsl:apply-templates />
</xsl:template>

<xsl:template match="Implies">
	<xsl:element name="Test" >
		<xsl:for-each select="*[not(self::if) and not(self::then)]">
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:apply-templates select="if"/>
		<xsl:apply-templates select="then"/>
	</xsl:element>
</xsl:template>

<xsl:template match="if">
	<xsl:copy>
	  <xsl:apply-templates/>
	</xsl:copy>
</xsl:template>

<xsl:template match="then">
	<xsl:copy>
	  <xsl:apply-templates/>
	</xsl:copy>
</xsl:template>

<xsl:template match="*">
	<xsl:copy>
	  <xsl:apply-templates/>
	</xsl:copy>
</xsl:template>

</xsl:stylesheet>