Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E48A2166BA0
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 20:20:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB78D101A53F
	for <linux-lvm@redhat.com>; Wed,  9 Sep 2020 20:20:54 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 09 Sep 2020 22:20:48 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <24409.12987.382863.95686@quad.stoffel.home>
References: <79061390.1069833.1599071934227.JavaMail.zimbra@karlsbakk.net>
	<53661d4eefb635710b51cf9bfee894ef@assyoma.it>
	<83152674.4938205.1599663690759.JavaMail.zimbra@karlsbakk.net>
	<3503b4f5b55345beb24de4b156ee75c7@assyoma.it>
	<24409.9033.527504.36789@quad.stoffel.home>
	<7d62cb86425416d5a3db115afdbd996c@assyoma.it>
	<24409.12987.382863.95686@quad.stoffel.home>
Message-ID: <dda927d81e53c08da1e5bbd8cc649581@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Looking ahead - tiering with LVM?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Stoffel <john@stoffel.org>
Cc: Sigurd Karlsbakk <roy@karlsbakk.net>, Roy, =?UTF-8?Q?H=C3=A5kon?= <hawken@thehawken.org>, LVM general discussion and development <linux-lvm@redhat.com>

Il 2020-09-09 21:53 John Stoffel ha scritto:
> Very true, numbers talk, annecdotes walk...

Sure - lets try to gather some numbers from the data you posted 
before...

> sudo lvcache status data/home
> +-----------------------+------------------+
> | Field                 | Value            |
> +-----------------------+------------------+
> | cached                | True             |
> | size                  | 806380109824     |
> | cache_lv              | home_cache       |
> | cache_lv_size         | 85899345920      |

You cache device is squarely in the 10x ballpark (ie: it is ~9.39x 
smaller than your SSD). Having ~10.64% more space would be nice, but 
hardly game-changer.

> | read_hits             | 138697828        |
> | read_misses           | 7874434          |

You have 94.6% hit rate from your hotspot cache - compare this to an 
ideally managed tiered storage, with its 100% (ideal, not reasonable in 
real world) hit rate. Does it really change anything?

> | write_hits            | 777455171        |
> | write_misses          | 9841866          |

And you have an even better ~98.7% write hit ratio. As you have a 
mirrored cache device, you should be able to set LVM for using a 
writeback cache without risking your data in case of a single cache 
drive failure. I suspect this would do wonder with your hit ratio - but 
again, testing is the only method to be sure.

Thanks for sharing your data!
Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
