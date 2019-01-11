<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" />
                <link rel="stylesheet" type="text/css" href="style.css" />
                <title>MachiPhones.net</title>
            </head>
            <body>
                <div class="container-fluid">
                    <div class="row">
                        <xsl:for-each select="/phonestore/phone">
                            <div class="col-12 col-md-3">
                                <div class="card mx-3">
                                    <img class="card-img-top" style="max-height: 300px; object-fit:contain">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="image" />
                                        </xsl:attribute>
                                    </img>
                                    <div class="card-body">
                                        <xsl:attribute name="class">
                                            card-body <xsl:value-of select="@type" />
                                        </xsl:attribute>
                                        <h5 class="card-title"><xsl:value-of select="make"/>&#160;<xsl:value-of select="model"/></h5>
                                        <div class="card-text">
                                            Type: <xsl:value-of select="@type" /><br />
                                            <xsl:choose>
                                                <xsl:when test="model/@known-as">
                                                    Also known as: <xsl:value-of select="model/@known-as" />
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    No other known model names
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <br />
                                            <xsl:choose>
                                                <xsl:when test="stock &lt; 1">
                                                    <strong>Not available for sale</strong>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="stock" /> pcs available<br />
                                                    <xsl:choose>
                                                        <xsl:when test="stock/@warehouse='internal'">
                                                            Ships immediately
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            Ships within 72 hours
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <h4 class="text-center text-uppercase">
                                            <xsl:attribute name="style">
                                                <xsl:if test="stock &lt; 1">
                                                    text-decoration: line-through
                                                </xsl:if>
                                            </xsl:attribute>
                                            <xsl:value-of select="price/@currency"/>&#160;<xsl:value-of select="price" />
                                        </h4>
                                    </div>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>