Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBCAIXwk008061
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 05:18:33 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBCAIWA6000364
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 05:18:32 -0500
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 160FE1459B
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 10:18:32 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id k84z7hPBnsMo for <linux-lvm@redhat.com>;
	Tue, 12 Dec 2006 10:18:27 +0000 (UTC)
Received: from openwrt (dsl081-113-044.dfw1.dsl.speakeasy.net [64.81.113.44])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id 2062614592
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 10:18:27 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] Later extents allocated
Date: Tue, 12 Dec 2006 04:18:24 -0600
References: <el1rq3$fcf$1@sea.gmane.org>
In-Reply-To: <el1rq3$fcf$1@sea.gmane.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200612120418.25150.krakrjak@volumehost.net>
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

On Monday 04 December 2006 13:09, Ian Pilcher wrote:
> Trying to reduce the size of a physical volume with pvresize, and being
> told "cannot resize to 1022 extents as later ones are allocated".
>
> Any way to "reorganize" the PV, or am I stuck?
Yes and No.  What you want is an lvm repacker.  Basically a defragmentation 
program for PV Extents.  This way you can put all the extents that are not 
allocated contiguously into contiguous blocks.  Currently no such tool 
exists.  Right now extents can get fragmented with more growing and shrinking 
of logical volumes.

You can accomplish this same task manually with a bit of work.  All you need 
to do is look at the allocated extents on the pv you wish to make smaller and 
allocate them elsewhere.

The tools you'll need are lvdisplay -m and pvmove.  Here's an example:
I figured out that I needed to make /dev/sdb only have 45000 PEs allocated.  
Through a bit of poking around at my lvdisplay -m output I discovered that I 
could accomplish this by moving some extents allocated to main/usr 
on /dev/sdb over to /dev/sda3.  So all I need to do is put some of /usr 
on /dev/sda3 to free up enough extents to shrink /dev/sdb.  
lvdisplay -m main/usr
  --- Logical volume ---
  LV Name                /dev/main/usr
  VG Name                main
  LV UUID                T6Otoe-ksvl-xalm-qxIM-CzoY-0jsr-ZbdKVb
  LV Write Access        read/write
  LV Status              available
  # open                 2
  LV Size                34.00 GB
  Current LE             8704
  Segments               3
  Allocation             inherit
  Read ahead sectors     0
  Block device           253:1

  --- Segments ---
  Logical extent 0 to 3071:
    Type                linear
    Physical volume     /dev/sda3
    Physical extents    26170 to 29241

  Logical extent 3072 to 3583:
    Type                linear
    Physical volume     /dev/sdb
    Physical extents    34941 to 35452

  Logical extent 3584 to 8703:
    Type                linear
    Physical volume     /dev/sdb
    Physical extents    43133 to 48252

So I'm going to move LE 3584-8703 off onto /dev/sda3, this will put me under 
45000 PEs allocated on /dev/sdb so I turn to pvmove.
pvmove /dev/sdb:43133-48252 /dev/sda3

Once the pvmove completes I can pvresize /dev/sdb down to the proper size.  
The thing to keep in mind here is that to get to this point you have to do 
some legwork and look at the LV mappings to see where the extents on your PV 
are allocated.  If you move the extents that are allocated after your target 
PV size you will be able to successfully use pvresize.

-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
