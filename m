Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p361jKRc024873
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 21:45:21 -0400
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p361jFes001217
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2011 21:45:16 -0400
Message-ID: <4D9BC5AA.6050306@abpni.co.uk>
Date: Wed, 06 Apr 2011 02:45:14 +0100
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
References: <4D64FF3C.6080602@abpni.co.uk>	<Pine.LNX.4.64.1102231813180.17476@bmsred.bmsi.com>	<4D65A1A9.1040205@abpni.co.uk>	<Pine.LNX.4.64.1102231929520.17901@bmsred.bmsi.com>	<4D65A839.50107@abpni.co.uk>	<4D65A8F5.8040606@abpni.co.uk>	<Pine.LNX.4.64.1102232052520.18119@bmsred.bmsi.com>	<4D6609E4.10800@abpni.co.uk>	<Pine.LNX.4.64.1102240945480.20629@bmsred.bmsi.com>	<4D6671D7.7020301@abpni.co.uk>	<Pine.LNX.4.64.1102241011430.20629@bmsred.bmsi.com>	<4D667743.3010102@abpni.co.uk>	<4D9B7715.7090509@abpni.co.uk>	<alpine.LRH.2.00.1104051632580.19292@bmsred.bmsi.com>	<4D9B8015.2060503@abpni.co.uk>	<4D9B82C5.3020704@ankh.org>	<4D9B8B5A.2070104@abpni.co.uk>	<4D9B9AB9.8070202@ankh.org>	<4D9B9D48.5010008@abpni.c!	o.uk>	<4D9BA196.20006@ankh.org>	<4D9BA39A.8020008@abpni.co.uk>	<4D9BA845.10607@an!	kh.org>	<4D9BAD26.5010405@abpni.co.uk>	<4D9BB0D4.8050401@ankh.org>	<4D9BB398.5070007@abpni.co.uk>	<4D9BB703.3030101@ankh.org>	<4D9BB8DB.6070906@abpni.co.uk>
	<4D9BBFF9.3040706@ankh.org>
In-Reply-To: <4D9BBFF9.3040706@ankh.org>
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
To: linux-lvm@redhat.com



On 06/04/2011 02:20, James Hawtin wrote:
> On 06/04/2011 00:50, Jonathan Tripathy wrote:
>>
>> If the PV used for snapshots were to fail while the snapshot was 
>> open, or the server rebooted and the PV wasn't available at boot, 
>> what would happen? I ask these questions because a loopback device or 
>> iSCSI is really my only feasible option right now for the snapshot PV...
>
> What would happen is... if the file systems are mounted at boot time 
> (in  the fstab) it will fail the fsck because the device is not there. 
> and drop to single user mode, you could then edit the fstab to to 
> remove those file systems that would bring the system online, at which 
> point you could fix what stopped the iscsi from working, and mount the 
> file systems.
>
> At one place I worked they never mounted the data file systems at 
> "boot" but in a rc.local so the system always got to be interactive 
> before any problems so it was easy to go in and fix.
Since my vg is used purly for virtualisation, I don't mount any LVs in 
fstab in my host OS. LVs only get mounted once VMs start up.
>
> DO NOT... create a loop back device on the same on a file system that 
> the loopback that will then form a pv of, if you do your system is 
> DOOOMMMED! to get it to boot again your have to mount a part volume 
> group and block copy the devices to a new one, even worse if you 
> extended the file system with the loop back on it onto the pv of the 
> loop back it will NEVER work again. So the only place you can create a 
> loopback device is outside of a vg it is to be a part of and frankley 
> better that its in NO vg as you may get recursion problems.
Oh no, wouldn't dare to do that :) I was thinking of creating the image 
file on a non-LVM area of the drive (somewhere in the host OS partition)
>
> The problem with a loop back is that you need to do a the loopback 
> setup to enable the device before the vgscan and vgchange can bring it 
> online in the volume, very hard to get right at boot time.  If you 
> have partitioned it you will also need to do kpartx.
Well I wouldn't partition the image file, seems more trouble than it's 
worth. I did find an article from Novell that seems to guide me through 
what to do if my machine were to reboot with a PV missing:

http://www.novell.com/coolsolutions/appnote/19386.html

>
> If you use loopbacks i  would extend the volume group onto the disk 
> only during backups then nreduce it out afterwards to reduce risks.
Good Idea.
