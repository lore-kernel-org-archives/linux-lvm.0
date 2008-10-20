Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9KHF6fv020311
	for <linux-lvm@redhat.com>; Mon, 20 Oct 2008 13:15:06 -0400
Received: from cdc-exfep1.ciber.cbr.inc (fw.ciber.com [12.10.248.50])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9KHEqIR016108
	for <linux-lvm@redhat.com>; Mon, 20 Oct 2008 13:14:52 -0400
Subject: Re: [linux-lvm] [IMPORTANT]LVM+iSCSI issue..Local Disk disappeared..
From: Peter Larsen <plarsen@CIBER.com>
In-Reply-To: <d5dce2210810200040m29fc29b2n694979990f8d7ad8@mail.gmail.com>
References: <d5dce2210810150620l2e9c4b44uc519eeeebadd604f@mail.gmail.com>
	<1224086814.7418.11.camel@localhost.localdomain>
	<d5dce2210810160327r52de7ca4ne982934f5918aebc@mail.gmail.com>
	<1224170455.7716.4.camel@localhost.localdomain>
	<d5dce2210810200040m29fc29b2n694979990f8d7ad8@mail.gmail.com>
Date: Mon, 20 Oct 2008 13:14:47 -0400
Message-Id: <1224522887.6013.46.camel@localhost.localdomain>
Mime-Version: 1.0
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

On Mon, 2008-10-20 at 13:10 +0530, himanshu padmanabhi wrote:
> Thnx everyone(Esp. peter).....Your comments were really useful.
> 
> Just want to ask one thing....
> 
> We can get physical volumes associated with given LV using "lvdisplay
> -m "/dev/vgname/lvname".....Is the information given by it no so
> sure.....

Conceptually, don't think of PVs as disks with LVM. The VG is your disk.
Just like you're not concerned about what goes on each platter of your
disk/raid, the same with LVM. You're not concerted what goes on the
physical devices - but instead what goes on the VG. The VG is where you
manage your "physical" space. And while you could find out what disk(s)
a given LV is located on, why bother?  LVM manages your disk allocation
for you.

As I indicated - if you want redundancy you should use software raid.
LVM does have a mirror option but it's NOT to be mistaken for RAID1
mirror. Once you have your MD setup, loosing a disk doesn't impact your
LVM except for performance. And you'll use your raid tools to
replace/rebuild the missing disk.

> Because you specified that "we cannot get which PV's are associated
> with which LV".

Right - LVs are not associated with PV - only VG. Consider your LV a
"partition" and your VG your disk. The PV is an "abstract" layer that
implements the VG. But you don't operate on the PV. This is on purpose -
this is what gives you the flexibility. Your VG is full? Add a new PV! A
"partition" is too small? Reallocate space on the VG so the partition
(LV) gets more space!

Think about what your goal is. If it's redundancy, use software raid. If
it's storage allocation flexibility it's LVM. And they can be combined
to give you the best of both worlds.

That said - creating a mirror'ed pair of out two disks on different bus
systems isn't exactly "business as usual". While possible, the slowest
disk wins every time.

I have a feeling you want the LVs to allocate to the physical devices
and in particular that the iSCSI contains one LV you want to go offline
in case the ISCSI isn't connected?  If that's the case,  you have to
create two VGs - one for each disk. Assign the LVs as you find fit, and
once the iSCSI target is unavailable, the VG goes offline and all the
LVs on the VG like that (you'll get a loooot of errors - I wouldn't
recommend it). It doesn't work by something computing where on the VG a
LV is located and only the LVs that's on the bad disk gets an error. If
*any* PV on a VG is unavailable, the VG comes unavailable - including
all the LVs that's implemented on the VG.

--- 
Regards
    Peter Larsen

 netgod:  8:42pm is not late.
 doogie: its 2:42am in Joeyland
	-- #Debian
