Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j9TK8hvl005251
	for <linux-lvm@redhat.com>; Sat, 29 Oct 2005 21:08:43 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EVx0N-0006qf-72
	for linux-lvm@redhat.com; Sat, 29 Oct 2005 21:08:43 +0100
Date: Sat, 29 Oct 2005 21:08:43 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvresize patch pending
Message-ID: <20051029200843.GB22575@agk.surrey.redhat.com>
References: <1130518796.4362590c75cf0@webmail.volumehost.com>
	<20051028170130.GH11086@agk.surrey.redhat.com>
	<1130519874.43625d4253324@webmail.volumehost.com>
	<1130522152.436266287429e@webmail.volumehost.com>
	<20051028192752.GJ11086@agk.surrey.redhat.com>
	<436286B3.80604@cantab.net>
	<20051028212102.GK11086@agk.surrey.redhat.com>
	<1130546247.4362c447c3718@webmail.volumehost.com>
	<20051029010217.GA22575@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051029010217.GA22575@agk.surrey.redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Are any of you are interested in working on something else in
a related area of the code?

New tool:
  lvimport - Bring an existing filesystem on a partition under LVM control

e.g. you have an ext3 filesystem on /dev/hda3 and you want to turn it
into an LV without moving it.

Requires an existing VG with at least one pre-existing mda.
 (could be from metadata/dirs of course)
Involves (equivalent of) running pvcreate -Zn --metadatacopies 0 
on the partition,
probably with --labelsector 1 (may depend on fs),
changing pe_start to 0,
getting the last sector used by the filesystem (add a new helper 
function to fsadm to give this info based on filesystem type?),
vgchange --physicalextentsize if necessary so that the entire 
filesystem is enclosed by PEs,
adding the new PV to the VG,
creating an LV enclosing the filesystem.

Now the PV label is within the new LV - but stored in a sector
that the filesystem doesn't use.

There might be a case for reducing the size of the filesystem
slightly before doing this if it's close to the end of the
partition, so that the pe size isn't too small.  
[The number of PEs is 32-bits, so tiny PEs put constraints
on the VG size - need to make sure the code detects problems here,
or consider implications of switching to 64 bits.]

Ensure none of the tools can leave you with a VG with no mdas
(eg split off the new PV with vgsplit)

Require filesystem to be unmounted first.

Alasdair
-- 
agk@redhat.com
