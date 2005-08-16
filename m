Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7GCupV15994
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 08:56:51 -0400
Received: from itspmx1.state.ms.us (e3000a.state.ms.us [205.144.224.140])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7GCumMc018191
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 08:56:48 -0400
Received: from tcmail.mstc.state.ms.us (tcmail.mstc.state.ms.us [10.3.60.220])
	by itspmx1.state.ms.us (8.12.11/8.12.11) with ESMTP id j7GCufwe029746
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 07:56:41 -0500 (CDT)
	(envelope-from rray@mstc.state.ms.us)
Received: from rray.drdc.mstc.ms.gov (localhost.localdomain [127.0.0.1])
	by rray.drdc.mstc.ms.gov (8.13.1/8.13.1) with ESMTP id j7GCsCh7021396
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 07:54:12 -0500
Received: from localhost (rray@localhost)
	by rray.drdc.mstc.ms.gov (8.13.1/8.13.1/Submit) with ESMTP id
	j7GCsCDj021393
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2005 07:54:12 -0500
Date: Tue, 16 Aug 2005 07:54:11 -0500 (CDT)
From: Richard Ray <rray@mstc.state.ms.us>
Subject: Re: [linux-lvm] vg works fine under FC3, but not FC4
In-Reply-To: <20050816072600.26570.qmail@web52205.mail.yahoo.com>
Message-ID: <Pine.LNX.4.62.0508160752340.29127@rray.drdc.mstc.ms.gov>
References: <20050816072600.26570.qmail@web52205.mail.yahoo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I had a similar problem with FC4.
lvm2-2.01 has problems.
Downgrade to lvm2-2.00 from FC3.

Richard

On Tue, 16 Aug 2005 john_gore@yahoo.com wrote:

> My vg mounts fine under fc3, but when i installed fc4 on a new drive, I cant bring in the vg. I get errors for hdc like "Couldn't find device with uuid..." and PV unknown device (from pvscan).
>
> I can plug back in the old boot drive and run under fc3 and things work well.
>
> The vg consists of 1 lv and 2 pv drives configured as:
>
> my_vg:
>  my_lv1:
>     hdc2 (ext2)
>     hdd (single partition as ext2)
>
> The old hda boot disk is ext3 running FC3 and the new hda boot disk is running the dafault lvm partitions under FC4.
>
> hdc is formatted with boot and swap on hdc1 and hdc5 - probably this was from an earlier install (although I did have these disks plugged in while installing FC4 - when the installer started asking about reformatting hdc and hdd, I powered down, unplugged these drives, and redid the install)
>
> Any ideas to try?
>
> - John
>
>
>
