Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s84B79TO012664
	for <linux-lvm@redhat.com>; Thu, 4 Sep 2014 07:07:09 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
	[217.70.183.195])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s84B75cw025010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 4 Sep 2014 07:07:06 -0400
Message-ID: <1409828800.6181.19.camel@kurenai.local>
From: Jarkko Oranen <oranenj@iki.fi>
Date: Thu, 04 Sep 2014 14:06:40 +0300
In-Reply-To: <5211F372-B9BB-43A8-B569-AC1E3B077D15@redhat.com>
References: <1408896497.27190.12.camel@kurenai.local>
	<5211F372-B9BB-43A8-B569-AC1E3B077D15@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Does LVM RAID1 have TRIM support?
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
Cc: oranenj+lvm@iki.fi

On Tue, 2014-09-02 at 16:49 -0500, Brassow Jonathan wrote:
> On Aug 24, 2014, at 11:08 AM, Jarkko Oranen wrote:
> 
> > Hello
> > 
> > Yesterday I experimented a bit with my RAID configuration on a pair of
> > SSDs, and it seems that LVM's native RAID does not have TRIM support...
> > At least, when I try to run fstrim manually, it complains even though
> > issue_discards is enabled. Plain LVs on top of an MD RAID PV do work, of
> > course.
> > 
> > Am I perhaps missing some configuration, or do RAID1 logical volumes
> > simply not have support for TRIM yet? I'm running a fairly recent kernel
> > (3.15.8) and lvm version says this:
> > 
> >  LVM version:     2.02.106(2) (2014-04-10)
> >  Library version: 1.02.85 (2014-04-10)
> >  Driver version:  4.27.0
> 
> TRIM is not yet supported in LVM RAID.  However, if MD has a solid TRIM implementation, it should be simple to enable it for LVM.  (This is because the MD kernel modules are used to perform RAID for LVM.  There is only a thin wrapper layer (linux/drivers/md/dm-raid.c) in device-mapper used to set-up the device.)

Thanks for the reply! Unfortunately, "simple" is relative. I have no
experience with kernel hacking at all (or even much C programming,
though I can read it), but I took a look at the code anyway to try to
pinpoint the place that tells userspace the ioctl isn't supported. 

From my cursory browsing of the code I couldn't really tell how it
works, but for the most part it seemed like it *should* just work... It
does work just fine for linear volumes, and md/dm-linear.c doesn't seem
to do anything special to enable discard/FITRIM support, while discard
is specifically marked as supported in the md/linear.c and md/raid*.c
files if the underlying device supports it.

However, in dm.c there's the dm_blk_ioctl function which says the
following:
        /* We only support devices that have a single target */
        if (dm_table_get_num_targets(map) != 1)
                goto out;

Intuitively it looks like this could prevent a raid1 target from working
as it apparently consists of rmeta and rimage subcomponents, but I
couldn't determine for certain if my intuition is correct. I did some
testing, and discards work just fine on a linear volume spanning two
different partitions, while they fail on a "RAID" mirror of two similar
partitions. Clearly, two devices in a mapping are not a problem.

> 
> > As an aside, can anyone point me to documentation or other resources
> > about the pros and cons of LVM native RAID1 setup (which I understand
> > uses MD RAID internally?) vs. MD RAID PV + LVM. It seems I might be able
> > to save some SSD space and only mirror the LVs I actually need to keep
> > safe from crashes.
> 
> I don't know if there is a specific list to point to out there, but I can give you a couple pros/cons.
> PRO:
> - use one volume manager instead of two
> - LVM is better suited to creating devices of varying sizes - leaving spare capacity for snapshots, etc
> 
> CONS:
> - no trim support with RAID through LVM (although, I'm not sure of the state in MD)
> - no reshaping (changing from one RAID type to another) capability in LVM RAID.
> 
>  brassow
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
