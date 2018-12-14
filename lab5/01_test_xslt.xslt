<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/book">
        <html>
            <head>
                <title>My book</title>
            </head>
            <body>
                <img src="01_book.jpg" />
                <h1><xsl:value-of select="text()" /></h1>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>