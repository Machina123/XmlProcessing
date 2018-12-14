<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="header">
        <tr>
            <th>Name</th>
            <th>Origin</th>
            <th>Color</th>
        </tr>
    </xsl:variable>
    <xsl:template match="/">
        <html>
            <head>
                <title>Cars</title>
                <link rel="stylesheet" href="02_cars_style.css"/>
            </head>
            <body>
                <h1>SUV</h1>
                <table>
                    <xsl:copy-of select="$header" />
                    <xsl:for-each select="//car[@category='SUV']">
                        <tr>
                            <td><xsl:value-of select="name" /></td>
                            <td><xsl:value-of select="made_in" /></td>
                            <td><xsl:value-of select="color" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h1>Sport</h1>
                <table>
                    <xsl:copy-of select="$header" />
                    <xsl:for-each select="//car[@category='sport']">
                        <tr>
                            <td><xsl:value-of select="name" /></td>
                            <td><xsl:value-of select="made_in" /></td>
                            <td><xsl:value-of select="color" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h1>Roadster</h1>
                <table>
                    <xsl:copy-of select="$header" />
                    <xsl:for-each select="//car[@category='roadster']">
                        <tr>
                            <td><xsl:value-of select="name" /></td>
                            <td><xsl:value-of select="made_in" /></td>
                            <td><xsl:value-of select="color" /></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>