Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pB2L1ahG030207
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:01:36 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB2L1Zmw029428
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:01:36 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id pB2L11J4016037
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:01:01 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id pB2L11YZ005402
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:01:01 -0500
Date: Fri, 2 Dec 2011 16:01:01 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <6.2.5.6.2.20111202132949.03b2cc68@binnacle.cx>
Message-ID: <alpine.LRH.2.00.1112021553440.5337@bmsred.bmsi.com>
References: <6.2.5.6.2.20111202121427.03b28738@flumedata.com>
	<6.2.5.6.2.20111202132949.03b2cc68@binnacle.cx>
MIME-Version: 1.0
Subject: Re: [linux-lvm] cmp of inactive mirrored LV fails
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Centuries ago, Nostradamus foresaw that on Dec 2, starlight@binnacle.cx...:

> After a little digging discovered and ran 'debugfs'
> and used the 'testb' command to determine that the
> mirror mismatch blocks are "not in use".
>
> So that's good.
>
> However I am rather disturbed that LVM
> mirroring appears to have bugs that allow
> images to become out-of-sync.

This is not necessarily a bug.  Both MD and LVM support
DISCARD, and discarded blocks are not necessarily synced
between mirror legs.  The same thing happens with MD,
and the MD "cmp" operation reports the number of blocks
out of sync, but not which blocks!  (So LVM is actually
an improvement on that score.)  Swap volumes make
heavy use of DISCARD and are especially likely to
have blocks out of sync.

> Have read that MD is the only way to go
> with any kind of RAID and now I see that
> is true.  If anyone can explain what
> happened here in any positive light I'd
> be interested in hearing about it.  For
> now I see LVM mirroring as a turkey that
> should be avoided.

Yes, I still consider LVM mirroring as
experimental (but not a "turkey").  I
especially don't like the way the mirror
log works.  I was spoiled by AIX LVM mirroring.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
