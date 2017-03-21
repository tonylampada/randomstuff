# UM titulo

## Um subtitulo


texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto texto 
texto texto texto texto texto texto texto texto 
texto texto texto texto texto texto 

hagsjhsadg  **negão** *itálico*

1. Uma
1. Lista
1. Numerada

* Presta
* Atencao
* Nos bullets

```

    def _update_prices(self, produto, sellerprices):
        SellerPrice.objects.filter(produto=produto).delete()
        for spdic in sellerprices:
            seller, price = spdic['seller'], spdic['price']
            sp = django_utils.get_or_none(SellerPrice, produto=produto, seller=seller)
            if not sp:
                sp = SellerPrice.create(produto=produto, seller=seller, price=price)
                self.lg.info('new sellerprice %s/%s/%s' % (price, seller, produto.title))
            else:
                oldprice = sp.price
                sp.updateprice(price)
                if oldprice != price:
                    self.lg.info('update sellerprice %s --> %s/%s/%s' % (oldprice, price, seller, produto.title))
                    # yield spdic
        produto.update_sellercount(len(sellerprices))

    def _extract_seller_price_from_product_page(self, response):
        trs = response.css('table.os-main-table').css('tr.os-row')
        sellers = trs.css('span.os-seller-name-primary a ::text').extract()
        prices = trs.css('span.os-base_price ::text').extract()
        return [{
            'seller': seller,
            'price': _asfloat(price)
        } for seller, price in zip(sellers, prices)]

    def _extract_seller_price_from_search_page(self, response):
        return [{
            'seller': span_merchant.css('span::text').extract_first(),
            'price': _asfloat(span_merchant.xpath('..').css('span::text').extrac
```
