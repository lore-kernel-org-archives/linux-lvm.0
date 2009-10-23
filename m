Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9N0qRwV025066
	for <linux-lvm@redhat.com>; Thu, 22 Oct 2009 20:52:27 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9N0qGqh031153
	for <linux-lvm@redhat.com>; Thu, 22 Oct 2009 20:52:17 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n9N0qGUA019970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 22 Oct 2009 20:52:16 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n9N0qGw2021754
	for <linux-lvm@redhat.com>; Thu, 22 Oct 2009 20:52:16 -0400
Date: Thu, 22 Oct 2009 20:52:16 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
In-Reply-To: <a5a956f70910221726h589752f1p4d89b1711d0038b9@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0910222048060.21714@bmsred.bmsi.com>
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com>
	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com>
	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com>
	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>
	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
	<4ADF5E81.4070609@worldspice.net>
	<a5a956f70910221726h589752f1p4d89b1711d0038b9@mail.gmail.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 22 Oct 2009, Lou Arnold wrote:

> If the physical volume is still used you will have to migrate the data to
> another physical volume using pvmove. (But I have nothing to move and no
> pladce to move anything to.)

Apparently you *do* have stuff to move, hence why it is busy.  If you
have nowhere to move it to, then you can't remove the
physical volume.  (For that, you'll have to wait for quantum storage,
where storage space can be "borrowed" from the vacuum as long as it
is returned later.)

> Then use 'vgreduce' to remove the physical volume:
> # vgreduce my_volume_group /dev/hda1
> -- Result: The message says that the PV is busy.
> 
> No where does it say how to make it not busy.

It said you have to move all LE off the PV.  It is clear to me anyway.

> So now I have to figure out what to do to make the logical volume not busy
> and yet still let the computer operate. That last trial wasn't successful,
> and I really don't know where to start.

You can't make the logical volume not busy while it is mounted.  You can,
however, add another PV and use pvmove to move its extents to it.  That will
allow you to remove the original PV.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
