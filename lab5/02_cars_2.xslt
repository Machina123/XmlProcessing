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
                        <div>
                            <h2>
                                <xsl:attribute name="style">
                                    <xsl:choose>
                                        <xsl:when test="@category='SUV'">color: green;</xsl:when>
                                        <xsl:when test="@category='sport'">
                                            color: red;
                                        </xsl:when>
                                        <xsl:otherwise>
                                            color: orange;
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:attribute>
                                <xsl:value-of select="name" /> (<xsl:value-of select="made_in" />)
                            </h2>
                            <h3>Category: <xsl:value-of select="@category" /></h3>
                            <img>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="photo" />
                                </xsl:attribute>
                            </img>
                        </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>