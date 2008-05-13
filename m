Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4D1Tcp8027987
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 21:29:38 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4D1TS7H014559
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 21:29:28 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m4D1TMVu006649
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 21:29:22 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m4D1TMYd023612
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 21:29:22 -0400
Date: Mon, 12 May 2008 21:29:22 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] lvm partition on ramdisk
In-Reply-To: <1c748a490805121347q514af7a1xfcd5df3d5c8c4697@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0805122114030.23559-100000@bmsred.bmsi.com>
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

On Mon, 12 May 2008, Larry Dickson wrote:

> However, let me follow up your (and Stuart's) point. Are you saying that an
> unmounted LVM volume will mess up the boot, even if the volume in question
> is not mapped to boot or /? I was proceeding under the assumption that LVM
> would be happy to sew the pieces together again later, even if the data in
> them is trashed.

As long as the VG is not needed in initrd (e.g. a test VG), you should
be ok.  You will simply have to go through the procedure of removing the
"failed" PV and adding it back after a reboot.  As long as your root fs
(and /usr and other stuff needed at startup) are not on the test VG, you
should be fine.  The problem is that the VG will not activate automatically
with a missing PV.  Even with --partial, it will activate the VG
as readonly metadata.  Yes, AIX handles this better, IMO.  But Linux LVM is
getting there.

For your application, you should make a separate "testvg" VG for your test
that does not have your system.  At boot, activate the VG with --partial, 
then use "pvcreate -u " to set the UUID on the ramdisk to match the UUID
originally on the ramdisk, followed by vgcfgrestore.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
