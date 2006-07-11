Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6BJD1to003968
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 15:13:02 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6BJCtaQ011718
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 15:12:55 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id F08D81F4065
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 21:12:48 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06777-04 for <linux-lvm@redhat.com>;
	Tue, 11 Jul 2006 21:12:39 +0200 (CEST)
Message-ID: <44B3F826.7010100@conterra.de>
Date: Tue, 11 Jul 2006 21:12:38 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Copying LVM from one system to another
References: <32F72C4D4D0EC8458CA5BFD76A6D6C680ACF3C0B@gimli.xb.local>
In-Reply-To: <32F72C4D4D0EC8458CA5BFD76A6D6C680ACF3C0B@gimli.xb.local>
Content-Transfer-Encoding: 7bit
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

Shaun Mccullagh wrote:
> Thanks very much, but the problem is I want be able to restore my LVM filesystems from a backup. 
> This is why I came with the idea of booting the PC I want to restore from a USB stick. 
> The idea is the stick has a copy of the backup client. The LVM filesystems are mounted under 
> /restore and I restore all the data to /restore.
> 
> How do I tell LVM the data has moved? I've experimented using this method but I noticed devmapper 
> complains when I boot the PC from the newly restored data.

Do you have any concrete error message, which give a hint about what goes wrong?

If you mount a file system, the mount command first looks into /etc/fstab to find
the device to mount. So you may configure your mount points by editing /etc/fstab.

This is very different with LVM! There is no such configuration that determines your
LVM layout. Instead all data describing the layout of your LVM is saved on the LVM
disk(s) them self! When LVM starts up, it scans all disks to find for LVM informations.
If all this configurations are consistent (if you have several LVM disk), the VGs and
LVs are registered by name, regardless on which device they are found. 
LVM then writes a protocol of all it found to /etc/lvm/backup. 
Changing the configuration is not as easy as editing some config file, 
as there is no such thing! Instead it is not necessary at all.

In your case, I would suggest to create an independent volume group on the other
disk with a different VG-name. The LVs may have the same names on both VGs.
If you put them into different hosts, you may synchronize/backup them via network.
Else you may put both VGs into the same hosts without problems, mounting the LVs manually
and copy the data directly.

Don't worry about any config-files to save. You may connect any LVM disk to any IDE
port and it should be recognized automatically.

If you move an VG from one host to an other, you should do an "vgexport" first.
I don't know if this is still necessary with LVM2. I accidentally moved VGs back
and forth even without using lvexport and did not found a problem.

Dieter.
