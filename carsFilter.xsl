<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="year" />
    <xsl:param name="make" />
    <xsl:param name="model" />
    <xsl:param name="engine" />
    <xsl:param name="price" />
    <xsl:param name="minPrice" />
    <xsl:param name="maxPrice" />

    <!-- The template for the root node -->
    <xsl:template match="/">
        <html>
            <body>
                <div
                    class="px-4 py-3 mt-4 mb-1 d-flex gap-3 flex-wrap col-12 col-lg-9 mx-auto justify-content-center"
                    style="border-radius: 15px; background:#f0f0f0;">
                    <xsl:if test="$year or $make or $model or $engine or $price">
                        <xsl:if test="$year">
                            <div class="mb-2">
                                Година: <b><xsl:value-of select="$year" /></b>
                            </div>
                        </xsl:if>

                        <xsl:if test="$make">
                            <div class="ml-2">
                                Марка: <b><xsl:value-of select="$make" /></b>
                            </div>
                        </xsl:if>

                        <xsl:if test="$model">
                            <div class="ml-2">
                                Модел: <b><xsl:value-of select="$model" /></b>
                            </div>
                        </xsl:if>

                        <xsl:if test="$engine">
                            <div class="ml-2">
                                Тип двигател: <b><xsl:value-of select="$engine" /></b>
                            </div>
                        </xsl:if>

                        <xsl:if test="$price">
                            <div class="ml-2">
                                Ценови диапазон:
                                <b> 
                                    <xsl:value-of select="$minPrice" />$ - 
                                    <xsl:value-of select="$maxPrice" />$
                                </b>
                            </div>
                        </xsl:if>
                    </xsl:if>
                </div>

                <div class="d-flex flex-wrap p-4">
                    <xsl:for-each select="carMarket/dealer/inventory/car">

                        <xsl:variable name="carYear" select="@yearManufactured" />

                        <xsl:variable name="carMake" select="translate(make, ' ', '')" />
                        <xsl:variable name="carModel" select="translate(model, ' ', '')" />
                        <xsl:variable name="carPrice" select="translate(price, ' ', '')" />
                        <xsl:variable name="carEngine" select="translate(engineType, ' ', '')" />

                        <xsl:if test="(not($make) or $carMake = $make) and
                                    (not($model) or $carModel = $model) and
                                    (not($engine) or $carEngine = $engine) and
                                    (not($year) or $carYear = $year) and
                                    (not($price) or ($carPrice &gt;= $minPrice and $carPrice &lt;= $maxPrice))
                                    ">
                            
                            <div class="col-12 col-sm-6 col-lg-4 py-3">
                                <div class="card-wrap">
                                    <div class="offer-card">

                                        <xsl:choose>
                                            <xsl:when test="mainPicture">
                                                <img class="img-fluid offer-card-image"
                                                    src="{mainPicture}" alt="Car image" />
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <img class="img-fluid offer-card-image"
                                                    src="default_image.jpg" alt="Default image" />
                                            </xsl:otherwise>
                                        </xsl:choose>

                                        <div
                                            class="offer-card-title px-1 pt-2 px-4 d-flex align-items-top justify-content-between">
                                            <div
                                                class="offer-card-title pt-2 d-flex align-items-center my-2 my-lg-0 me-lg-auto">
                                                <h5 class="text-break">
                                                    <xsl:value-of select="make" />
                                                    <xsl:text> </xsl:text>
                                                    <xsl:value-of select="model" />
                                                    <xsl:text>, </xsl:text>
                                                    <xsl:value-of select="@yearManufactured" />
                                                    <xsl:text>г.</xsl:text>
                                                </h5>
                                            </div>
                                            <div class="offer-card-price">
                                                <div class="text-white pe-3 py-2 text-end float-end"
                                                    style="background: #d35400; text-align:end;">
                                                    <div class="fs-4 fw-normal"><xsl:value-of
                                                            select="price" /> лв.</div>
                                                    <div class="price-vat-label fs-6">с ДДС/мес</div>
                                                    <div class="price-period-label fs-9"
                                                        style="color:white; font-size:0.7rem;">средно
                                                        за
                                                        периода</div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="specs-list px-1 py-1 px-4">
                                            <div class="py-1">
                                                <xsl:choose>
                                                    <xsl:when test="mileage">
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                            width="62" height="62"
                                                            viewBox="0 0 62 62">
                                                            <path
                                                                d="M50,978.206a30.968,30.968,0,0,1,25.688,48.313l-3.125-2.469a27,27,0,1,0-45.125,0l-3.125,2.469A30.968,30.968,0,0,1,50,978.206ZM32.313,997.518l21.219,14.156a4.994,4.994,0,0,1-7.062,7.062L32.313,997.518Z"
                                                                transform="translate(-19 -978.206)" />
                                                        </svg>
                                                        <span class="ps-1 text-dgray">Пробег: <xsl:value-of
                                                                select="mileage" /> км.</span>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                            width="62" height="62"
                                                            viewBox="0 0 62 62">
                                                            <path
                                                                d="M50,978.206a30.968,30.968,0,0,1,25.688,48.313l-3.125-2.469a27,27,0,1,0-45.125,0l-3.125,2.469A30.968,30.968,0,0,1,50,978.206ZM32.313,997.518l21.219,14.156a4.994,4.994,0,0,1-7.062,7.062L32.313,997.518Z"
                                                                transform="translate(-19 -978.206)" />
                                                        </svg>
                                                        <span class="ps-1 text-dgray">Пробег: Няма
                                                            информация</span>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </div>

                                            <div class="py-1">
                                                <xsl:choose>
                                                    <xsl:when test="engineType">
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                                            version="1.1" x="0px" y="0px"
                                                            viewBox="0 0 100 100"
                                                            enable-background="new 0 0 100 100"
                                                            xml:space="preserve">
                                                            <path d="M88.43,32.506l3.557-2.534C86.633,17.089,76.426,7.418,63.973,4.313v6.318c0,0,1.125,0.523,1.672,0.813 c8.197,4.334,13.879,12.624,14.787,21.868l2.951,38.615l0.002,0.17c0,3.146-2.561,5.708-5.709,5.708s-5.711-2.563-5.711-5.708 v-22.08c0-6.974-5.24-12.738-11.99-13.585V12.903c0-4.396-3.598-7.994-7.994-7.994H20.005c-4.396,0-7.994,3.598-7.994,7.994v74.228 H8.015v7.994h11.99H51.98h11.992v-7.994h-3.998V44.6c2.309,0.73,3.998,2.869,3.998,5.417v22.08c0,7.555,6.146,13.703,13.703,13.703 c7.555,0,13.703-6.148,13.703-13.703c0-0.174-0.002-0.345-0.008-0.517L88.43,32.506z M20.005,12.903H51.98v23.268H20.005V12.903z"></path>
                                                        </svg>
                                                        <span class="ps-1 text-dgray">Тип двигател: <xsl:value-of
                                                                select="engineType" /></span>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                                            version="1.1" x="0px" y="0px"
                                                            viewBox="0 0 100 100"
                                                            enable-background="new 0 0 100 100"
                                                            xml:space="preserve">
                                                            <path d="M88.43,32.506l3.557-2.534C86.633,17.089,76.426,7.418,63.973,4.313v6.318c0,0,1.125,0.523,1.672,0.813 c8.197,4.334,13.879,12.624,14.787,21.868l2.951,38.615l0.002,0.17c0,3.146-2.561,5.708-5.709,5.708s-5.711-2.563-5.711-5.708 v-22.08c0-6.974-5.24-12.738-11.99-13.585V12.903c0-4.396-3.598-7.994-7.994-7.994H20.005c-4.396,0-7.994,3.598-7.994,7.994v74.228 H8.015v7.994h11.99H51.98h11.992v-7.994h-3.998V44.6c2.309,0.73,3.998,2.869,3.998,5.417v22.08c0,7.555,6.146,13.703,13.703,13.703 c7.555,0,13.703-6.148,13.703-13.703c0-0.174-0.002-0.345-0.008-0.517L88.43,32.506z M20.005,12.903H51.98v23.268H20.005V12.903z"></path>
                                                        </svg>
                                                        <span class="ps-1 text-dgray">Тип двигател:
                                                            Няма
                                                            информация</span>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </div>

                                            <div class="py-1">
                                                <xsl:choose>
                                                    <xsl:when test="transmission">
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                            class="w-4 h-4 fill-[#6C6C6C]"
                                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                                            version="1.1" x="0px" y="0px"
                                                            viewBox="0 0 100 100"
                                                            xml:space="preserve"><g><g><path d="M50,2.9C24,2.9,2.9,24,2.9,50S24,97.1,50,97.1S97.1,76,97.1,50S76,2.9,50,2.9z M73.9,52.3    c0,1.7-1.4,3.1-3.1,3.1H52.3v13.9c0,1.7-1.4,3.1-3.1,3.1c-1.7,0-3.1-1.4-3.1-3.1V55.4H32.2v13.9c0,1.7-1.4,3.1-3.1,3.1    s-3.1-1.4-3.1-3.1V30.7c0-1.7,1.4-3.1,3.1-3.1s3.1,1.4,3.1,3.1v18.5h13.9V30.7c0-1.7,1.4-3.1,3.1-3.1c1.7,0,3.1,1.4,3.1,3.1v18.5    h15.4V30.7c0-1.7,1.4-3.1,3.1-3.1s3.1,1.4,3.1,3.1V52.3z"></path></g></g></svg>
                                                        <span class="ps-1 text-dgray">Скоростна
                                                            кутия: <xsl:value-of
                                                                select="transmission" /></span>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                            class="w-4 h-4 fill-[#6C6C6C]"
                                                            xmlns:xlink="http://www.w3.org/1999/xlink"
                                                            version="1.1" x="0px" y="0px"
                                                            viewBox="0 0 100 100"
                                                            xml:space="preserve"><g><g><path d="M50,2.9C24,2.9,2.9,24,2.9,50S24,97.1,50,97.1S97.1,76,97.1,50S76,2.9,50,2.9z M73.9,52.3    c0,1.7-1.4,3.1-3.1,3.1H52.3v13.9c0,1.7-1.4,3.1-3.1,3.1c-1.7,0-3.1-1.4-3.1-3.1V55.4H32.2v13.9c0,1.7-1.4,3.1-3.1,3.1    s-3.1-1.4-3.1-3.1V30.7c0-1.7,1.4-3.1,3.1-3.1s3.1,1.4,3.1,3.1v18.5h13.9V30.7c0-1.7,1.4-3.1,3.1-3.1c1.7,0,3.1,1.4,3.1,3.1v18.5    h15.4V30.7c0-1.7,1.4-3.1,3.1-3.1s3.1,1.4,3.1,3.1V52.3z"></path></g></g></svg>
                                                        <span class="ps-1 text-dgray">Скоростна
                                                            кутия:
                                                            Няма информация</span>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </div>

                                            <div class="py-1">
                                                <xsl:choose>
                                                    <xsl:when test="power">
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                            class="w-4 h-4 fill-[#6C6C6C]"
                                                            viewBox="0 0 48 48" x="0px" y="0px">
                                                            <title>Chess horse</title>
                                                            <g data-name="Chess horse">
                                                                <path
                                                                    d="M37,43H11a2,2,0,0,0-2,2v2H39V45A2,2,0,0,0,37,43Z"></path>
                                                                <path
                                                                    d="M14,39a2,2,0,0,0-2,2H36a2,2,0,0,0-2-2Z"></path>
                                                                <path
                                                                    d="M22,18c-.72,5-5.06,9-7.44,10.89C12.63,30.39,13,32.35,13,35a3.55,3.55,0,0,1,1.77,2H33.23c.61-1.74,2-2.09,4.57-3.4l-4.17-1.67a1,1,0,0,1,.74-1.86L39,31.91,38.88,30l-5.25-2.1a1,1,0,0,1,.74-1.86l4.43,1.78L38.72,26l-5.09-2a1,1,0,0,1,.74-1.86l4.26,1.7-.07-1.87-4.93-2a1,1,0,0,1,.74-1.86l4.1,1.64a15.88,15.88,0,0,0-.14-1.9l-4.7-1.88a1,1,0,0,1,.74-1.86l3.41,1.36A13.93,13.93,0,0,0,27,6a11.88,11.88,0,0,0-7-5l1,5a8.34,8.34,0,0,0-7.9,5.69c-.14.44.48-.27-4.1,4.31l3,4Zm-3.71-7.71A1,1,0,0,1,20,11a1,1,0,0,1-1,1A1,1,0,0,1,18.29,10.29Z"></path>
                                                            </g>
                                                        </svg>
                                                        <span class="ps-1 text-dgray">Мощност: <xsl:value-of
                                                                select="power" />
                                                            <xsl:text> к.с.</xsl:text></span>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <svg xmlns="http://www.w3.org/2000/svg"
                                                            class="w-4 h-4 fill-[#6C6C6C]"
                                                            viewBox="0 0 48 48" x="0px" y="0px">
                                                            <title>Chess horse</title>
                                                            <g data-name="Chess horse">
                                                                <path
                                                                    d="M37,43H11a2,2,0,0,0-2,2v2H39V45A2,2,0,0,0,37,43Z"></path>
                                                                <path
                                                                    d="M14,39a2,2,0,0,0-2,2H36a2,2,0,0,0-2-2Z"></path>
                                                                <path
                                                                    d="M22,18c-.72,5-5.06,9-7.44,10.89C12.63,30.39,13,32.35,13,35a3.55,3.55,0,0,1,1.77,2H33.23c.61-1.74,2-2.09,4.57-3.4l-4.17-1.67a1,1,0,0,1,.74-1.86L39,31.91,38.88,30l-5.25-2.1a1,1,0,0,1,.74-1.86l4.43,1.78L38.72,26l-5.09-2a1,1,0,0,1,.74-1.86l4.26,1.7-.07-1.87-4.93-2a1,1,0,0,1,.74-1.86l4.1,1.64a15.88,15.88,0,0,0-.14-1.9l-4.7-1.88a1,1,0,0,1,.74-1.86l3.41,1.36A13.93,13.93,0,0,0,27,6a11.88,11.88,0,0,0-7-5l1,5a8.34,8.34,0,0,0-7.9,5.69c-.14.44.48-.27-4.1,4.31l3,4Zm-3.71-7.71A1,1,0,0,1,20,11a1,1,0,0,1-1,1A1,1,0,0,1,18.29,10.29Z"></path>
                                                            </g>
                                                        </svg>
                                                        <span class="ps-1 text-dgray">Мощност: Няма
                                                            информация</span>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </xsl:if>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>