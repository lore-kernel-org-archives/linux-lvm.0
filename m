Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0ELdwr22457
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2005 16:39:58 -0500
Received: from postfix3-1.free.fr (postfix3-1.free.fr [213.228.0.44])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0ELdqrW015772
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2005 16:39:52 -0500
Received: from scorpion (unknown [82.227.230.101])
	by postfix3-1.free.fr (Postfix) with ESMTP id 09B5D173501
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2005 22:39:52 +0100 (CET)
Date: Fri, 14 Jan 2005 22:40:06 +0100
From: Stephane Dupuis <hoper@free.fr>
Message-ID: <1266458715.20050114224006@free.fr>
Subject: Re: [linux-lvm] understanding large LVM volumes
In-Reply-To: <41E80382.1000403@svs.gsfc.nasa.gov>
References: <41E80382.1000403@svs.gsfc.nasa.gov>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: hoper@free.fr,
	LVM general discussion and development <linux-lvm@redhat.com>
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


Hi,

>Does anyone have experience with very large LVM VGs?

Not me :o) And in fact I'm just a new user of lvm.

> What is the maximum size of a single VG?

What I guess is that there is no limit for a Volume group,
because in fact, a volume group is only a "logical group" of many
logical volume. You can group logicals volumes by applications,
or by criticity (dev, prod...) or whatever you want.
But theses "volume group" information doesn't require lot's of space anyway.

> How does the Physical Extent size affect the maximum VG size?
> How does one go about chosing a PE size for a VG?

The PE Size does not affect VG size, but it's affect the maximum
size of a logical volume.

extract of the vgcreate man page :

--
To limit kernel memory usage, there is a limit of 65536 physical extents (PE) per logical volume,  so
       the  PE  size determines the maximum logical volume size.  The default PE size of 4MB limits a single
       logical volume to 256GB (see the -s option to raise that limit).  There is also (as of Linux  2.4)  a
       kernel limitation of 2TB per block device.
--

So, to limit the size of the mapping between the physical extend (PE)
and the real physical location of the data, gods say that you can't
use more than 65536 PE for a logical volume.

So if you want to make logicals volumes as big a 1TB each, you need to
change the size of the PE to, at least : 1024*1024 MB /65536 = 16 MB
Of course, stick to the limit so much seems not really secure, so
I advive you to choose at least 32 MB for the PE size in this case
(or even more). I read that the maximum size for the physical extend
is 16 GB, so choosing a big value here (128 MB ?) is not a problem.

Also note that with a 32 bit kernel, you have a limit of 2TB per
logical volume, I don't know if this limit disappear with a 64 bit
kernel.

So, with 10 logical volume of 1B each for exemple, you will have
your 10TB of data in only one volume group.

But think hard about it....
Are you sure you can't "logicaly" split it ? and that the 10 TB of
data will concern the same software or pool of user and so on ?
Are you sure you will not have to move only a part of the data one day ?
(add a new server and need to export some of the data to import it
to the new server ?)
Also think about how you will (if you need) backup the whole thing...

Well, again, all this post is just guessing and a quick look
at the man page, so you should wait for a answer from someone
who really know it anyway :o)


Stephane Dupuis
-- 
()  ascii ribbon campaign
/\      - against html e-mail 
        - against microsoft attachments
