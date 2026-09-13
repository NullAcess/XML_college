<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:key name="teacherKey" match="teacher" use="." />
    <xsl:key name="topicKey" match="topic" use="." />     <!-- Создаем ключи для быстрого поиска ну типо как ключ значение я бы назвал предположительно -->

    <xsl:template match="/">   <!-- точка входа в программу -->
        <html>
        <head>
            <title>Наши курсы</title>
        </head>
        <body>
            <h1>Наши курсы</h1>

            <h3>Курсы, которые читает Борисов И.О.</h3>
            <ul>
                <xsl:for-each select="key('teacherKey', 'Борисов И.О.')/../..">  <!-- типо цикл foreach и мы ищем по ключу элементы -->
                    <li><xsl:value-of select="name"/></li> <!-- выбираем name который высвителся по параметрам выше ну кого мы выбрали грубо говоря того и выводим -->
                </xsl:for-each>
            </ul>

            <h3>Курсы, которые используют XML</h3>
            <ul>
                <xsl:for-each select="key('topicKey', 'XML')/../.."> <!-- в добавок скажу что /../.. типо xpath -->
                    <li><xsl:value-of select="name"/></li>
                </xsl:for-each>
            </ul>

            <h3>Курсы, которые читает Борисов И.О. и в которых есть тема XSLT</h3>
            <ul>
                <xsl:for-each select="key('topicKey', 'XSLT')/../..[teachers/teacher = 'Борисов И.О.']"> <!-- берем только то где Борисов -->
                    <li><xsl:value-of select="name"/></li>
                </xsl:for-each>
            </ul>

        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>