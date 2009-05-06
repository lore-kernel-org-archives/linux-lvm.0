Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n46CSrBr016018
	for <linux-lvm@redhat.com>; Wed, 6 May 2009 08:28:53 -0400
Received: from mickey.mouse-hole.com (mickey.mouse-hole.com [87.194.144.122])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n46CSeEj020879
	for <linux-lvm@redhat.com>; Wed, 6 May 2009 08:28:40 -0400
From: karl@mouse-hole.com
Subject: Re: [linux-lvm] Resize physical volume SOLVED
Message-Id: <1241612917.8151@mouse-hole.com>
Date: Wed, 06 May 2009 13:28:37 +0100 (BST)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bound1241612917"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

--bound1241612917
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi all

Just to let you all know, I finally got this sorted.

The problem was these partitions had been part of an md raid. By zeroing them out (mdadm wouldnt zero the superblock, but dding from /dev/zero worked) then following the exact same procedure it worked flawlessly.

Rgds
Karl

karl@mouse-hole.com wrote ..
> Hi
> 
> Does anyone have any advice on this matter?
> 
> Regards
> Karl
> 
> Karl Wagner wrote ..
> > Hi all
> >
> > I have just been through a fairly major reorganisation of my data, and need to
> > resize the physical volumes in my LVM setup.
> >
> > Currently I have sd[a-d]6, which are physical volumes for the volume group =91data=92,
> > and sd[a-d]7, which contain nothing. My plan was to get rid of p7 on each device
> > and extend p6 to include that space. However when I tried on sda, I got an error
> > after of Couldn't find device with uuid=85
> >
> > These are the steps I took:
> >
> > * Deactivate all vg=92s
> > * Fdisk /dev/sda
> > * Delete p7
> > * Delete p6
> > * Create p6 with start at start of old p6, end at end of old p7
> > * Write part table
> >
> > At this point, sda7 has gone and sda6 is the correct size (checked with blockdev
> > =96getsz). But running a pvscan, lvm tells me it cant find sda6.
> >
> > What am I missing?
> >
> >
> >
> > Regards
> >
> > Karl

--bound1241612917--
