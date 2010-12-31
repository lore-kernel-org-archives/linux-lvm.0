Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBVFaim6006707
	for <linux-lvm@redhat.com>; Fri, 31 Dec 2010 10:36:44 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBVFaYZa013333
	for <linux-lvm@redhat.com>; Fri, 31 Dec 2010 10:36:34 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oBVFaXqI006775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 31 Dec 2010 10:36:33 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id oBVFaXD8027860
	for <linux-lvm@redhat.com>; Fri, 31 Dec 2010 10:36:33 -0500
Date: Fri, 31 Dec 2010 10:36:33 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4D1D5103.6030706@shiftmail.org>
Message-ID: <Pine.LNX.4.64.1012311034080.27769@bmsred.bmsi.com>
References: <4D1A9FAF.6050401@shiftmail.org> <4D1B3F6A.4070309@shiftmail.org>
	<Pine.LNX.4.64.1012292136500.19697@bmsred.bmsi.com>
	<4D1BF8DF.20908@shiftmail.org>
	<Pine.LNX.4.64.1012301402010.22982@bmsred.bmsi.com>
	<4D1D5103.6030706@shiftmail.org>
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

On Fri, 31 Dec 2010, Spelic wrote:

> Ok never mind, I found the problem:
> LVM probably uses O_DIRECT, right?
> Well it's absymally slow on MD parity raid (I checked with dd on the bare MD
> device just now) and I don't know why it's so slow. It's not because of the
> rmw because it's slow even the second time I try, when it does not read
> anything anymore because all reads are in cache already.

The point of O_DIRECT is to *not* use the cache.  Although a write-through
cache would seem to be OK, you have to make sure that ALL writes write-through
the cache, or the data on parity raid will be corrupted.

The R/M/W problem afflicts every level of parity raid in subtle ways.
That's why I don't like it.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
