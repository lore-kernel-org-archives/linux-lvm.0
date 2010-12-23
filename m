Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBN3HVVf026579
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2010 22:17:31 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBN3HKmp021647
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2010 22:17:21 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oBN3HKZC006475
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2010 22:17:20 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id oBN3HJAP011944
	for <linux-lvm@redhat.com>; Wed, 22 Dec 2010 22:17:19 -0500
Date: Wed, 22 Dec 2010 22:17:19 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <1293047716.10784.28.camel@corn.betterworld.us>
Message-ID: <Pine.LNX.4.64.1012222210490.11910@bmsred.bmsi.com>
References: <1293047716.10784.28.camel@corn.betterworld.us>
MIME-Version: 1.0
Subject: Re: [linux-lvm] dealing with a failing drive (esp pvmove)
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

On Wed, 22 Dec 2010, Ross Boylan wrote:

> I have a volume group made from 3 partitions on 2 different physical
> disks.  One of the disks is failing.  I have a new disk connected via
> USB; it is large but a bit slow (5400RPM, though the USB might be
> temporary).  It is large enough to hold the entire contents of the
> existing VG.
> 
> I am looking for suggestions about how to  approach this.  The pvmove
> command looks promising, but the docs warn that things are in a delicate
> state during the migration (and advise backups).  Since it seems almost
> certain there will be I/O errors on the old drive, I'm not sure if
> pvmove is a good idea.  Is it?

If it is not necessary to keep the VG live, the following will handle
errors better and be faster (depending on how much of the failing 
PV is in use):

1) Make a new partition(s) at least as big as the failing partition, and use
ddrescue to copy the failing partition(s).  Don't do anything that might
cause a vgscan (lvm commands) during the copy (since the copy will have the
same UUID).  (Or else do the copy with the VG offline, booted from CD
if needed.)

2) Shutdown and remove the failing drive.  The new copy should be 
recognized by its UUID.

3) Record blocks skipped due to io errors, and map them to files
and filesystems to take appropriate action: 

  http://smartmontools.sourceforge.net/badblockhowto.html#id3073907

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
