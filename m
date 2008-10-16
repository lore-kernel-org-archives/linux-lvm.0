Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9GFL7AX017405
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 11:21:07 -0400
Received: from cdc-exfep1.ciber.cbr.inc (fw.ciber.com [12.10.248.50])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9GFKu2Z030432
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 11:20:56 -0400
Subject: Re: [linux-lvm] [IMPORTANT]LVM+iSCSI issue..Local Disk disappeared..
From: Peter Larsen <plarsen@CIBER.com>
In-Reply-To: <d5dce2210810160327r52de7ca4ne982934f5918aebc@mail.gmail.com>
References: <d5dce2210810150620l2e9c4b44uc519eeeebadd604f@mail.gmail.com>
	<1224086814.7418.11.camel@localhost.localdomain>
	<d5dce2210810160327r52de7ca4ne982934f5918aebc@mail.gmail.com>
Date: Thu, 16 Oct 2008 11:20:55 -0400
Message-Id: <1224170455.7716.4.camel@localhost.localdomain>
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

On Thu, 2008-10-16 at 15:57 +0530, himanshu padmanabhi wrote:
> We configured it as
> 
> Case 1
> [....]
> Deleted lv1, 
> removed pv2,
> vg is getting displayed properly in vgs command
> Case 2
> [...]
> Deleted lv1,
> logout from iscsi target
> vg is not getting displayed properly in vgs command

Those are not the same? In case 1 you tell LVM to drop a storage (I
assume by removing pv2 you first take it out of the vg and then apply
pvremove). In case 2 you you're simulating media failure to LVM. You
can't just remove a media it depends on. Regardless if LVM has data on
the PV or not.

Are you trying to make failover work? If so, your approach is a bit
wrong. Setup a software raid 1 first, then build your PV on that. Once
done, you can remove one disk and your LVM will continue to run
(degraded).


--- 
Regards
    Peter Larsen
 
I don't kill flies, but I like to mess with their minds.  I hold them
above
globes.  They freak out and yell "Whooa, I'm *way* too high."
		-- Bruce Baum
