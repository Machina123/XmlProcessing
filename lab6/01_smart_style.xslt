<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="header">
        <thead>
            <tr>
                <th>Category</th>
                <th>Name</th>
                <th>Screen size</th>
                <th>RAM</th>
                <th>Color</th>
                <th>CPU</th>
            </tr>
        </thead>
    </xsl:variable>
    <xsl:template match="/">
        <html>
            <head>
                <title>Smartdevices</title>
            </head>
            <body>
                <h2>Tablets:</h2>
                <table border="1">
                    <xsl:copy-of select="$header"/>
                    <xsl:for-each select="//tablet">
                        <tr>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="@category='top'">
                                        <img src="icon_top.png" style="max-height: 100px; object-fit:contain;" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <img src="icon_action.png" style="max-height: 100px; object-fit:contain;" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td>
                                <xsl:attribute name="style">
                                    <xsl:if test="ram &gt; 2">
                                        background-color: rgba(255,0,0,0.5);
                                    </xsl:if>
                                </xsl:attribute>
                                <xsl:value-of select="name"/>
                            </td>
                            <td><xsl:value-of select="screen_size"/>"</td>
                            <td><xsl:value-of select="ram"/>GB</td>
                            <td>
                                <xsl:attribute name="style">
                                    background-color: <xsl:value-of select="color"/>;
                                </xsl:attribute>
                            </td>
                            <td><xsl:value-of select="procesor"/></td>
                        </tr>
                    </xsl:for-each>
                </table><br />
                <h2>Phones:</h2>
                <table border="1">
                    <xsl:copy-of select="$header"/>
                    <xsl:for-each select="//phone">
                        <tr>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="@category='top'">
                                        <img src="icon_top.png" style="max-height: 100px; object-fit:contain;" />
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <img src="icon_action.png" style="max-height: 100px; object-fit:contain;" />
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td>
                                <xsl:attribute name="style">
                                    <xsl:if test="ram &gt; 2">
                                        background-color: rgba(255,0,0,0.5);
                                    </xsl:if>
                                </xsl:attribute>
                                <xsl:value-of select="name"/>
                            </td>
                            <td><xsl:value-of select="screen_size"/>"</td>
                            <td><xsl:value-of select="ram"/>GB</td>
                            <td>
                                <xsl:attribute name="style">
                                    background-color: <xsl:value-of select="color"/>;
                                </xsl:attribute>
                            </td>
                            <td><xsl:value-of select="procesor"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>