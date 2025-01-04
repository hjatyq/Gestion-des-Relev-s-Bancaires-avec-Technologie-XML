<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <title> le total des opérations de débit et le total des opérations de crédit. </title>              
            </head>
            <body>
                <h1>Relevé bancaire</h1>
                <ul>
                    <li>RIB : <xsl:value-of select="releve/@RIB"/></li>
                    <li>Date de relevé  : <xsl:value-of select="releve/dateReleve"/></li>
                    <li>Solde  :  <xsl:value-of select="releve/solde"></xsl:value-of></li>                    
                </ul>
            </body>
            <h1>Les opérations</h1>
                <table  border="2">
                    <tr>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Description</th>
                        
                    </tr>
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@type"></xsl:value-of></td>
                            <td><xsl:value-of select="@date"></xsl:value-of></td>
                            <td><xsl:value-of select="@montant"></xsl:value-of></td>
                            <td><xsl:value-of select="@description"></xsl:value-of></td>
                        </tr>
                    </xsl:for-each>
                </table>
            <h1>Total des opérations credit</h1>
            <h2> <xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/> </h2>
            <h1>Total des opérations DEBIT</h1>         
            <h2> <xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/> </h2>
        
            
            <h1>Releve bancaire des operation de type credit</h1>
            <table border="1">
                <tr>
                    <th>Type</th>
                    <th>Date</th>
                    <th>Montant</th>
                    <th>Description</th>
                </tr>
                <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
                    <tr>
                        <td><xsl:value-of select="@type"/></td>
                        <td><xsl:value-of select="@date"/></td>
                        <td><xsl:value-of select="@montant"/></td>
                        <td><xsl:value-of select="@description"/></td>
                    </tr>
                </xsl:for-each>
            </table>
            
        </html>
    </xsl:template>
</xsl:stylesheet>