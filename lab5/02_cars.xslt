<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
    <xsl:template match="/">
        <html>
            <head>
                <title>Cars</title>
            </head>
            <body>
                <xsl:for-each select="/cars/car">
                    <xsl:sort select="@category" order="descending"></xsl:sort>
                    <xsl:sort select="name" order="ascending"></xsl:sort>
                    <!-- <xsl:if test="@category='sport'"> -->
                        <div>
                            <h2><xsl:value-of select="name" /> (<xsl:value-of select="made_in" />)</h2>
                            <h3>Category: <xsl:value-of select="@category" /></h3>
                            <img>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="photo" />
                                </xsl:attribute>
                            </img>
                            <xsl:if test="position()=last()">
                                <p>(End of list)</p>
                            </xsl:if>
                        </div>
                    <!-- </xsl:if> -->
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>