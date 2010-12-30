Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBU2glbs023834
	for <linux-lvm@redhat.com>; Wed, 29 Dec 2010 21:42:47 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBU2gb4r008022
	for <linux-lvm@redhat.com>; Wed, 29 Dec 2010 21:42:37 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oBU2ga9b028345
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 29 Dec 2010 21:42:36 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id oBU2gZON019770
	for <linux-lvm@redhat.com>; Wed, 29 Dec 2010 21:42:36 -0500
Date: Wed, 29 Dec 2010 21:42:35 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D1B3F6A.4070309@shiftmail.org>
Message-ID: <Pine.LNX.4.64.1012292136500.19697@bmsred.bmsi.com>
References: <4D1A9FAF.6050401@shiftmail.org> <4D1B3F6A.4070309@shiftmail.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove painfully slow on parity RAID
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 29 Dec 2010, Spelic wrote:

> I tried multiple times for every device with consistent results, so I'm pretty
> sure these are actual numbers.
> What's happening?
> Apart from the amazing difference of parity raid vs nonparity raid, with
> parity raid it seems to vary randomly with the number of devices and the
> chunksize..?

This is pretty much my experience with parity raid all around.  Which
is why I stick with raid1 and raid10.

That said, the sequential writes of pvmove should be fast for raid5 *if*
the chunks are aligned so that there is no read/modify/write cycle.

1) Perhaps your test targets are not properly aligned?

2) Perhaps the raid5 implementation (hardware? linux md? 
   experimental lvm raid5?) does a read modify write even when it 
   doesn't have to.

Your numbers sure look like read/modify/write is happening for some reason.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
