Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p361L9Kr019770
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 21:21:09 -0400
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p361L547030608
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 21:21:06 -0400
Received: from bast.ankh.org ([172.22.128.4])
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1Q7HQe-0006e7-IQ
	for linux-lvm@redhat.com; Wed, 06 Apr 2011 02:21:04 +0100
Message-ID: <4D9BBFF9.3040706@ankh.org>
Date: Wed, 06 Apr 2011 01:20:57 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<4D6572C0.6070008@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>	<4D9B82C5.3020704@ankh.org>	<4D9B8B5A.2070104@abpni.co.uk>	<4D9B9AB9.8070202@ankh.org>	<4D9B9D48.5010008@abpni.c!	o.uk>	<4D9BA196.20006@ankh.org>	<4D9BA39A.8020008@abpni.co.uk>	<4D9BA845.10607@an!	kh.org>	<4D9BAD26.5010405@abpni.co.uk>	<4D9BB0D4.8050401@ankh.org>	<4D9BB398.5070007@abpni.co.uk>	<4D9BB703.3030101@ankh.org>
	<4D9BB8DB.6070906@abpni.co.uk>
In-Reply-To: <4D9BB8DB.6070906@abpni.co.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots and disk re-use
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 06/04/2011 00:50, Jonathan Tripathy wrote:
>
> If the PV used for snapshots were to fail while the snapshot was open, 
> or the server rebooted and the PV wasn't available at boot, what would 
> happen? I ask these questions because a loopback device or iSCSI is 
> really my only feasible option right now for the snapshot PV...

What would happen is... if the file systems are mounted at boot time 
(in  the fstab) it will fail the fsck because the device is not there. 
and drop to single user mode, you could then edit the fstab to to remove 
those file systems that would bring the system online, at which point 
you could fix what stopped the iscsi from working, and mount the file 
systems.

At one place I worked they never mounted the data file systems at "boot" 
but in a rc.local so the system always got to be interactive before any 
problems so it was easy to go in and fix.

DO NOT... create a loop back device on the same on a file system that 
the loopback that will then form a pv of, if you do your system is 
DOOOMMMED! to get it to boot again your have to mount a part volume 
group and block copy the devices to a new one, even worse if you 
extended the file system with the loop back on it onto the pv of the 
loop back it will NEVER work again. So the only place you can create a 
loopback device is outside of a vg it is to be a part of and frankley 
better that its in NO vg as you may get recursion problems.

The problem with a loop back is that you need to do a the loopback setup 
to enable the device before the vgscan and vgchange can bring it online 
in the volume, very hard to get right at boot time.  If you have 
partitioned it you will also need to do kpartx.

If you use loopbacks i  would extend the volume group onto the disk only 
during backups then nreduce it out afterwards to reduce risks.

Steal space from somewhere you say you have the OS on a physical 
paritions, so LVM everything but / and /boot redo the make a pv on the 
space freed. to rescue a system is easy if you can mount / everything 
else does not matter.

If you have everything in / ... you are insane as you should set /var, 
/tmp and perhaps even /home to noexec as if you get an automated break 
in that is normally where the write stage two, to get executed, this 
normally stops them in there tracks, No public writiable filesystems 
should be executable.... !

James
