Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n79Nh8Zt012520
	for <linux-lvm@redhat.com>; Sun, 9 Aug 2009 19:43:08 -0400
Received: from karif.server-speed.net (karif.server-speed.net [188.40.51.140])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n79Ngqll028717
	for <linux-lvm@redhat.com>; Sun, 9 Aug 2009 19:42:52 -0400
Received: from [192.168.4.247] (h081217049118.dyn.cm.kabsi.at [81.217.49.118])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by karif.server-speed.net (Postfix) with ESMTPSA id E2C5A138034
	for <linux-lvm@redhat.com>; Mon, 10 Aug 2009 01:42:43 +0200 (CEST)
Message-ID: <4A7F5EF3.2080501@server-speed.net>
Date: Mon, 10 Aug 2009 01:42:43 +0200
From: Florian Pritz <bluewind@server-speed.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] can't remove snapshots
References: <4A7F5C5C.3020601@server-speed.net>
	<20090809233657.GA7033@agk-dp.fab.redhat.com>
In-Reply-To: <20090809233657.GA7033@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alasdair G Kergon wrote:
> On Mon, Aug 10, 2009 at 01:31:40AM +0200, Florian Pritz wrote:
>> lsof/fuser don't show anything and it's not mounted. This happens if
>> roughly 50% of the cases and after that the creation of snapshots
> 
> Then check your udev rules - wouldn't be the first time udev
> tried to use a device lvm wanted to remove...
> 
> [Quick test is to stop udev processing events temporarily and see if the
> problem disappears.]

Hey cool that seems to help. Gonna try to find the offending rule.
Thanks.

- --
Florian Pritz -- {flo,bluewind}@server-speed.net
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iQIcBAEBAgAGBQJKf17zAAoJEG0WVcFM4cE+uRAQANcFSYRvP5EE//QeaNaaytb1
1hjHcvsplD9zsHfkYL/AvIbw2vdzIzYHFlMnBNZHIJXNgLt8g1NinKI2Wl2JXHsy
YZ37aqnRBSXXN8Q2X5zrKOgRTuKmK8j037fKVm79Hv8eIUTIbu6NnW2KQgss+izb
p6syRAxLA1JBMccyhFZeWglNInvfHSHwpGP+fGOxnI0DrJiE1BunTb35hUNjaeS1
lj4nTbg7gBctL4KR0YW4OHqNz8/35oM+T+jccY1Cec2G3qNFkQ+Q7j3z7ObJCBFx
gZM5Y4GOiZWH1Z1q+fN/SkNYE2p+sXWUM0mpf8ERURE14n4NgMtm8DVIhmVYCUJH
cSyCfmFIADL749mzo/hmWv6hPkCKWqHxAxNdVWyJMnPLQ4StpcK3PwLoh2VWCX8w
O6GvvLHOU//pB2p86v0sHqs6+J7jcdum39EMkaj7ubiqszRWj3iFEM/QNrpAjIqy
ClOI1RQZHh4S9kWxea0lMs78tF+hvY4/u+tKTo2MpAxoNuunXd9vY0X4h971sRVT
OZiB93qed1d0R7aPfhLEjX7/Qje0KEeDyQbQdcTATbL0ccy/WTLu3l9Y6RJTWiIA
r7Wfswl/i7fl85xY/tQU1Eluy+h1J//P0ZrGjGvzN+QSVSGEWEBJLFruHlH4YYkj
uhlJzprwbaDR+3IZUn3s
=XAST
-----END PGP SIGNATURE-----
