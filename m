Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2OD0wj17934
	for <linux-lvm@redhat.com>; Wed, 24 Mar 2004 08:00:58 -0500
Received: from artemis.le.ac.uk (ntp2c.le.ac.uk [143.210.16.126])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2OD0uWA018290
	for <linux-lvm@redhat.com>; Wed, 24 Mar 2004 08:00:57 -0500
Received: from [143.210.12.128] (helo=pc-nt556.cc.le.ac.uk)
	by artemis.le.ac.uk with esmtp (Exim 4.30) id 1B6807-0002It-7Q
	for linux-lvm@redhat.com; Wed, 24 Mar 2004 13:00:55 +0000
Received: from rao3 (helo=localhost)
	by pc-nt556.cc.le.ac.uk with local-esmtp (Exim 3.35 #1 (Debian))
	id 1B6807-0000qs-00
	for <linux-lvm@redhat.com>; Wed, 24 Mar 2004 13:00:55 +0000
Date: Wed, 24 Mar 2004 13:00:54 +0000 (GMT)
From: "R.A.Owen" <rao3@leicester.ac.uk>
Message-ID: <Pine.LNX.4.44.0403241240510.929-100000@pc-nt556.cc.le.ac.uk>
MIME-Version: 1.0
Sender: "R.A.Owen" <rao3@leicester.ac.uk>
Subject: [linux-lvm] Re: linux-2.4.25, LVM-1.0.8 and VFS-lock.patch
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

To answer my own question so that others don't have to do so much testing
and to ask for feedback if any experts think I'm storing up trouble!
I have compiled a custom kernel which "works-for-me".

On Wed, 17 Mar 2004, R.A.Owen wrote:
> Should I still add the lvm-1.0.8 patch to linux-2.4.25 of is the code in
> linux-2.4.25 more uptodate than the lvm-1.0.8 patch ?

I took the _debian_ kernel source for linux-2.4.25 and patched it with
lvm-1.0.8 (again from debian  source package). (applied with offsets)

> Also is there an official VFS-lock patch for linux-2.4.25 or do I just
> have to force the VFS-lock-2.4.20 (from lvm-1.0.8) to fit?

lvm-1.0.8 only has VFS-lock patches for kernels upto linux-2.4.20.
device-mapper (ftp://sources.redhat.com/pub/dm/device-mapper.1.00.08.tgz)
also has VFS-lock patches which seem to be based on the lvm ones but for
later kernels, eg: linux-2.4.22-VFS-lock.patch .

This device mapper linux-2.4.22-VFS-lock.patch includes a HUNK for
patching $LINUX/drivers/md/dm-snapshot.c but that file does not exist in a
stock linux-2.4.25 kernel. So I touched the file so that the patch would
apply. (I'm not using device mapper so I don't care about dm-snapshot.c )

I did:
 cd $LINUX
 [ -f drivers/md/dm-snapshot.c ] || touch drivers/md/dm-snapshot.c
 patch -p1 </path/to/devicemapper/patches/linux-2.4.22-VFS-lock.patch

I then built the kernel and snapshots seem to work.

I rebuilt the VFS-lock.patch without the dm-snapshot.c HUNK, and could
post it, but it is against debain kernel sources not the linus tree so
I won't bother unless anyone asks!

Alex Owen
