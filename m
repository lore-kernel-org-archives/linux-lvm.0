Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1KMftjZ013881
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2012 17:41:55 -0500
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1KMfsSx012128
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2012 17:41:54 -0500
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id B6F2F21903
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2012 16:41:51 -0600 (CST)
Date: Mon, 20 Feb 2012 16:41:51 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120220164151.0c7f1b7a@bettercgi.com>
In-Reply-To: <20120220215911.GJ6331@barkeeper1-xen.linbit>
References: <4F3D098F.4010709@profitbricks.com>
	<20120220215911.GJ6331@barkeeper1-xen.linbit>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Allocation Policy for Cloud Computing needed
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

> > Then, I've tested to put all my RAID-1 arrays into a single VG,
> > because LV size should be adjustable over all hard drives.
... 
> > I want to have an allocation which distributes the LVs equally over
> > the PVs as long as space is left and LVs aren't resized.


Since you're using RAID anyway, consider testing RAID 10, which will 
distribute IO across spindles.

> You can get pretty complex in similar scripts, if you really want
> to... consider using
>   pvs -o vg_name,lv_name,pv_name,pvseg_start,pvseg_size,seg_pe_ranges
> and explicitly listing not only the PVS, but even the PE ranges to
> your lvcreate commands...

For scripting, see Linux::LVM on CPAN. It gives you that information 
as a nice data structure. I welcome feature requests and patches. 
(Linux::LVM::Do coming soon for modifying rather than just querying 
LVM objects.)
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Mon, 20 Feb 2012 22:59:11 +0100
Lars Ellenberg <lars.ellenberg@linbit.com> wrote:

> On Thu, Feb 16, 2012 at 02:50:07PM +0100, Sebastian Riemer wrote:
> > Hi LVM list,
> > 
> > I'm experimenting with storage for many QEMU/KVM virtual machines in
> > cloud computing. I've got many concurrent IO processes and 24 hard
> > drives. I've tested the scalability with a single IO reader process
> > per hard drive. Single drives scale best and have the best
> > performance of cause, but we need mirroring and volume management.
> > So I've created MD RAID-1 arrays and created on each a VG and two
> > LVs. This gives me good overall performance (up to 2 GB/s, HBA
> > limit: 2.2 GB/s).
> > 
> > Then, I've tested to put all my RAID-1 arrays into a single VG,
> > because LV size should be adjustable over all hard drives. I've
> > tried all allocation policies but none does what I want to achieve
> > here. Yeah, that this isn't implemented fully is in the man
> > page, ... .
> > 
> > I want to have an allocation which distributes the LVs equally over
> > the PVs as long as space is left and LVs aren't resized. The goal
> > is to minimize the number of concurrent IO processes per hard drive
> > (striping is total crap in this situation).
> > 
> > I've tested LVM2 2.02.66 and kernel 3.0.15. Is something like that
> > implemented in newer releases or is something like that intended to
> > be implemented in near future?
> 
> I don't know.  Does not look like it, though.
> 
> > Or does someone want to implement this together with me?
> 
> I would certainly be here for discussions.
> 
> Though, as you always will be more flexible with scripts than with
> pre-implemented fixed algorithms, I probably would first check if I
> can solve it with some scripting.
> [completely untested, but you get the idea]
> 
> #!/bin/bash
> export LANG=C LC_ALL=C
> name=$1 vg=$2 size_in_MiB=$3
> PVS=$(vgs --nohead --unit m -o pv_name,pv_free -O -pv_free,pv_name
> $vg | awk -v need=$size_in_MiB '{ print $1; sum += $2;
> 	if (sum >= need) exit; }')
> lvcreate -n $name -L ${size_in_MiB}m $vg $PVS
> 
> (similar for lvextend)
> 
> Which basically implements this allocation policy:
> use the pvs with most free space available,
> and no more than necessary.
> 
> If I understand you correctly, that would almost do what you asked
> for.
> 
> You can get pretty complex in similar scripts, if you really want
> to... consider using
>   pvs -o vg_name,lv_name,pv_name,pvseg_start,pvseg_size,seg_pe_ranges
> and explicitly listing not only the PVS, but even the PE ranges to
> your lvcreate commands...
> 
> 	Lars
> 
