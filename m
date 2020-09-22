Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7BFA10BDF
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2020 10:38:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86FC2101A53F
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2020 10:38:16 +0000 (UTC)
From: nl6720 <nl6720@gmail.com>
Date: Tue, 22 Sep 2020 13:38:05 +0300
Message-ID: <5115744.4jzXO94mnC@walnut>
In-Reply-To: <a8b503ce-ab2f-20b0-05e0-e596459a7756@redhat.com>
References: <4972578.pTZnC5dHRY@walnut> <2262429.nQIR6vq4BO@walnut>
	<a8b503ce-ab2f-20b0-05e0-e596459a7756@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1749026.1bv9xxBkQs";
	micalg="pgp-sha512"; protocol="application/pgp-signature"
Subject: Re: [linux-lvm] Why isn't issue_discards enabled by default?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

--nextPart1749026.1bv9xxBkQs
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: nl6720 <nl6720@gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: Why isn't issue_discards enabled by default?
Date: Tue, 22 Sep 2020 13:38:05 +0300
Message-ID: <5115744.4jzXO94mnC@walnut>
In-Reply-To: <a8b503ce-ab2f-20b0-05e0-e596459a7756@redhat.com>
References: <4972578.pTZnC5dHRY@walnut> <2262429.nQIR6vq4BO@walnut>
	<a8b503ce-ab2f-20b0-05e0-e596459a7756@redhat.com>

On Tuesday, 22 September 2020 13:15:19 EEST Zdenek Kabelac wrote:
> Dne 22. 09. 20 v 11:14 nl6720 napsal(a):
> > On Monday, 21 September 2020 21:51:39 EEST Zdenek Kabelac wrote:
> >> Dne 21. 09. 20 v 16:14 nl6720 napsal(a):
> >>> Hi,
> >>> 
> >>> I wanted to know why the "issue_discards" setting isn't enabled by
> >>> default. Are there any dangers in enabling it or if not is there a
> >>> chance of getting the default changed?
> >>> 
> >>> Also it's not entirely clear to me if/how "issue_discards" affects
> >>> thin pool discard passdown.
> >> 
> >> Hi
> >> 
> >> Have you checked it's enclosed documentation in within
> >> /etc/lvm/lvm.conf ?
> >> 
> >> issue_discards is PURELY & ONLY related to sending discard to
> >> removed
> >> disk extents/areas after 'lvremove'.
> >> 
> >> It is't not in ANY way related to actual discard handling of the LV
> >> itself. So if you have LV on SSD it is automatically processing
> >> discards. From the same reason it's unrelated to discard processing
> >> of thin-pools.
> >> 
> >> And finally why we prefer issue_discards to be disabled (=0) by
> >> default. It's very simple - with lvm2 we try (when we can) to
> >> support
> >> one-command-back restore - so if you do 'lvremove' - you can use
> >> vgcfgrestore to restore previous metadata and you have your LV back
> >> with all the data inside.
> >> 
> >> When you have issue_discards=1  - the device gets TRIM - so all the
> >> data are discarded at device level - so when you try to restore
> >> your
> >> previous metadata - well it's nice - but content is gone
> >> forever....
> >> 
> >> If user can live with this 'risk' and prefers immediate discard -
> >> perfectly fine - but it should be (IMHO) admin's  decision.
> >> 
> >> Regards
> >> 
> >> Zdenek
> > 
> > Thanks for your answer, so the reason it's not enabled by default is
> > to allow vgcfgrestore to function.
> > 
> > I have read /etc/lvm/lvm.conf and understand that issue_discards
> > affects things like lvremove. But I'd like to know, is it only for
> > lvremove or also lvreduce and lvconvert (--merge/--uncache)? And
> > what is its
> There is currently one known exception - pvmove - which is not trivial
> to resolve.  All other 'removals' go through standard extent release
> and can be discarded when wanted (unless we missed some other
> use-case).
> > relation to thin_pool_discards; with issue_discards = 0 and
> > thin_pool_discards = passdown (both the defaults) how far down are
> > the discards passed?
> 
> thin-pool is using LVs  - so this is again about handling the discard
> on a _tdata LV and it is completely unrelated to issue_discards
> setting.

from lvmthin(7):
"passdown: Process discards in the thin pool (as with nopassdown), and 
pass the discards down the the underlying device.  This is the default 
mode."

It's the "underlying device" that's confusing me.

> > Lastly, there's no fstrim equivalent for trimming unused space in a
> > PV, right? To do that I'd need to lvcreate a LV occupying all free
> > space and then use `lvremove --config devices/issue_discards = 1`.
> 
> Well there is one easily 'scriptable'
> 
> You can simply allocate the free space in your VG (lvcreate
> -l100%FREE) and then simply use  'blkdiscard
> /dev/vg/my_discardable_lv'
> Once finished - release the LV.
> 
> We may eventually introduce some 'pollable' support as some discards
> can take extremely long time depending on type of a device.
> However at this moment this is not really seen as priority...
> 
> Regards
> 
> Zdenek


--nextPart1749026.1bv9xxBkQs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQJGlXQbhb/L1xVy7xc6IU14YjTaQUCX2nUDQAKCRBc6IU14YjT
aapIAP9gqJ31hqX4QSqd0neCa3aJwzwIq9bkRsWNlZtLv2MEeAD/WcokGCM166sB
0PdLx3qHf1H3l5w9UPVHv1yJrDKQfww=
=L8LL
-----END PGP SIGNATURE-----

--nextPart1749026.1bv9xxBkQs--
