<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
                xmlns:foaf="http://xmlns.com/foaf/0.1/">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>FOAF Profile</title>
      </head>
      <body>
        <h1>FOAF Profile</h1>
        <!-- Display Person Information -->
        <xsl:for-each select="//foaf:Person">
          <h2>Profile of <xsl:value-of select="foaf:name"/></h2>
          <p><strong>Title:</strong> <xsl:value-of select="foaf:title"/></p>
          <p><strong>Homepage:</strong> <a href="{foaf:homepage/@rdf:resource}"><xsl:value-of select="foaf:homepage/@rdf:resource"/></a></p>
          <p><strong>Email:</strong> <xsl:value-of select="foaf:mbox/@rdf:resource"/></p>

          <h3>Knows</h3>
          <ul>
            <xsl:for-each select="foaf:knows/foaf:Person">
              <li>
                <xsl:value-of select="foaf:name"/> (<a href="{foaf:homepage/@rdf:resource}">Homepage</a>)
              </li>
            </xsl:for-each>
          </ul>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>