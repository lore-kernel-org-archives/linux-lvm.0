Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1MDAEfa000478
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 08:10:15 -0500
Received: from smtp.retaggio.net (q.retaggio.net [80.88.84.22])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1MDACTj015849
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 08:10:12 -0500
From: Daniele Palumbo <daniele@retaggio.net>
Subject: [linux-lvm] Re: Strange LVM Error With AoE Disks
Date: Thu, 22 Feb 2007 14:11:42 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200702221411.42321.daniele@retaggio.net>
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
To: linux-lvm@redhat.com
Cc: Ed L Cashin <ecashin@coraid.com>


First of all, sorry but i went on this ML after feb 7 2007, so i have to make 
a 'manual reply', hoping that thread will be not broken.

> > Feb  7 06:09:36 ey00-00 lvm[4869]: Couldn't find all physical volumes
> > for volume group ey00-data.
> > Feb  7 06:09:37 ey00-00 lvm[4869]: Couldn't find device with uuid
> > '0Cot9Z-BHjK-2Nkw-eEdy-fbFF-Wh1q-qhRaut'.
[...]
> > The only thing I can note about these devices that is particularly
> > different is that they appear to be using minor numbers above 256.

i have this error and setup too (e4.0, e5.0).

> I haven't looked at the CLVM sources really recently, but we have seen
> the large minor device number problem before in older versions of LVM
> where glibc's macros are used to work with the major and minor parts
> that are encoded within device numbers.  So if there's a problem, it
> might be possible to find it by looking for those macros.

i am using vblade daemon on gentoo (waiting for my coraid...).
i am now using e0.1 and e0.2 (i have changed my setup), but the problem was 
that i have a clustered volume but not the volume on the other server.

i am now trying to explain with ascii:
xen2 and backuphost are 2 machine.
Xen2Volume is a vg that belong to xen2, XenBackupVolume belong to backuphost.

now on:
i have vblade on backuphost, and xen2 can read it.
but, xen2 won't export (my choise) its Xen2Volume.

note that Xen2Volume is marked clustered (vgchange -cy Xen2Volume)

so, when i create a lv in Xen2Volume, an error will came on screen, cause 
backuphost can't see the volume.
clvm knows by cman that there is Xen2Volume but cannot find it!

setting clustered bit of Xen2Volume off, will resolve problem.
or, you can export your Xen2Volume to your backuphost...

HTH

bye
d.
