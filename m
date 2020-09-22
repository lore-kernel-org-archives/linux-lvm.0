Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 029E6111143E
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2020 09:20:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F7EE811E80
	for <linux-lvm@redhat.com>; Tue, 22 Sep 2020 09:20:47 +0000 (UTC)
From: nl6720 <nl6720@gmail.com>
Date: Tue, 22 Sep 2020 12:20:40 +0300
Message-ID: <8382436.m6imeTtB6z@walnut>
In-Reply-To: <2262429.nQIR6vq4BO@walnut>
References: <4972578.pTZnC5dHRY@walnut>
	<02099334-08df-112d-1d02-dd76cc5d8f65@redhat.com>
	<2262429.nQIR6vq4BO@walnut>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7344425.xyEAB7k1rO";
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

--nextPart7344425.xyEAB7k1rO
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: nl6720 <nl6720@gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: Why isn't issue_discards enabled by default?
Date: Tue, 22 Sep 2020 12:20:40 +0300
Message-ID: <8382436.m6imeTtB6z@walnut>
In-Reply-To: <2262429.nQIR6vq4BO@walnut>
References: <4972578.pTZnC5dHRY@walnut>
	<02099334-08df-112d-1d02-dd76cc5d8f65@redhat.com>
	<2262429.nQIR6vq4BO@walnut>

On Tuesday, 22 September 2020 12:14:19 EEST nl6720 wrote:
> On Monday, 21 September 2020 21:51:39 EEST Zdenek Kabelac wrote:
> > Dne 21. 09. 20 v 16:14 nl6720 napsal(a):
> > > Hi,
> > > 
> > > I wanted to know why the "issue_discards" setting isn't enabled by
> > > default. Are there any dangers in enabling it or if not is there a
> > > chance of getting the default changed?
> > > 
> > > Also it's not entirely clear to me if/how "issue_discards" affects
> > > thin pool discard passdown.
> > 
> > Hi
> > 
> > Have you checked it's enclosed documentation in within
> > /etc/lvm/lvm.conf ?
> > 
> > issue_discards is PURELY & ONLY related to sending discard to
> > removed
> > disk extents/areas after 'lvremove'.
> > 
> > It is't not in ANY way related to actual discard handling of the LV
> > itself. So if you have LV on SSD it is automatically processing
> > discards. From the same reason it's unrelated to discard processing
> > of thin-pools.
> > 
> > And finally why we prefer issue_discards to be disabled (=0) by
> > default. It's very simple - with lvm2 we try (when we can) to
> > support
> > one-command-back restore - so if you do 'lvremove' - you can use
> > vgcfgrestore to restore previous metadata and you have your LV back
> > with all the data inside.
> > 
> > When you have issue_discards=1  - the device gets TRIM - so all the
> > data are discarded at device level - so when you try to restore your
> > previous metadata - well it's nice - but content is gone forever....
> > 
> > If user can live with this 'risk' and prefers immediate discard -
> > perfectly fine - but it should be (IMHO) admin's  decision.
> > 
> > Regards
> > 
> > Zdenek
> 
> Thanks for your answer, so the reason it's not enabled by default is
> to allow vgcfgrestore to function.
> 
> I have read /etc/lvm/lvm.conf and understand that issue_discards
> affects things like lvremove. But I'd like to know, is it only for
> lvremove or also lvreduce and lvconvert (--merge/--uncache)? And what
> is its relation to thin_pool_discards; with issue_discards = 0 and
> thin_pool_discards = passdown (both the defaults) how far down are the
> discards passed?
> 

Oops, rereading it, lvreduce is actually mentioned in /etc/lvm/lvm.conf. 
Well, the question about lvconvert and thin pool still stands.

> Lastly, there's no fstrim equivalent for trimming unused space in a
> PV, right? To do that I'd need to lvcreate a LV occupying all free
> space and then use `lvremove --config devices/issue_discards = 1`.


--nextPart7344425.xyEAB7k1rO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQJGlXQbhb/L1xVy7xc6IU14YjTaQUCX2nB6AAKCRBc6IU14YjT
aY3MAQDn6iF3zdgNtOWz4w4lbtr/Fc9RUGx843K1LaQpuYf5DAD/VXTIuHAgk49L
PNbZabD2T7m67jvY9VrtBJ6LXe3Jywo=
=gUt1
-----END PGP SIGNATURE-----

--nextPart7344425.xyEAB7k1rO--
