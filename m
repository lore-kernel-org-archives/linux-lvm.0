Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1K505i14512
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 00:00:05 -0500
Received: from web14713.mail.yahoo.com (web14713.mail.yahoo.com [216.136.225.226])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1K504b32556
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 00:00:04 -0500
Message-ID: <20040220050003.68594.qmail@web14713.mail.yahoo.com>
From: Randy Rubins <lv_hockey@yahoo.com>
Subject: Re: [linux-lvm] inactive PV associated to unknown VG
MIME-Version: 1.0
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 19 23:59:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Thanks, Heinz!

I got impatient this morning and executed:
dd if=/dev/zero of=/dev/sdb bs=1 count=1

hoping the result would be that /dev/sdb1 would
contain the only valid VG descriptor, and it worked.

Just for confirmation,

1) Does VG always get written at the beginning of PE
(first 128 bytes), whether it's the whole disk
(/dev/sdb) or a partition (/dev/sdb1)? 

2) I was expecting kickstart to clear the disk label,
but looking at my ks.cfg I only see
clearpart --all
It probably should have said:
clearpart --all --initlabel
to avoid the situation of having an "old" PV structure
info on /dev/sdb...  I haven't tried it yet but would
that have been the right approach?

3) AJ Lewis's LVM-HOWTO contains a statement:
"The recommended method of partitioning a disk is to
create a single partition that covers the whole disk.
This avoids any nasty accidents with whole disk drive
device nodes and prevents the kernel warning about
unknown partition types at boot-up."

Is there a general agreement amongst lvm developers
and users that the partition based PE (/dev/sdb1) is
preferred over the "partitionless" PE (/dev/sdb) in a
"normal" production environment when the intent is to
use the entire physical disk as a PE?

Cheers,
Randy

--------------------------------------------------------------------------------

From: Heinz Mauelshagen <mauelshagen redhat com> 
To: linux-lvm redhat com 
Subject: Re: [linux-lvm] inactive PV associated to
unknown VG 
Date: Thu Feb 19 10:38:31 2004 

--------------------------------------------------------------------------------

Randy,

the PV structure on /dev/sdb hasn't been removed.
Overwrite the first 128 bytes of /dev/sdb and rerun
vgscan.


On Wed, Feb 18, 2004 at 03:56:56PM -0800, Randy Rubins
wrote:
> I'm having a problem importing a VG after
> re-installing the server (original OS version RH
7.3,
> new RHEL 3 AS).  LVM is picking up the /dev/sdb, as
> well as the new /dev/sdb1 PV.  Any way to tell LVM
to
> ignore /dev/sdb and force it to use /dev/sdb1?  
> BTW, the LVM version used on RH 7.3 was 0.9.1_beta7,
> the new LVM version - whatever comes with RHEL 3 AS
> update 1.

1.0.3

> 
> Thanks,
> Randy
> 
> pvscan -- reading all physical volumes (this may
take
> a while...)
> pvscan -- ACTIVE   PV "/dev/sda2" of VG "rootvg" 
> [16.45 GB / 4.69 GB free]
> pvscan -- inactive PV "/dev/sdb"   is associated to
> unknown VG "localvg" (run vgscan)
> pvscan -- inactive PV "/dev/sdb1"  is associated to
> unknown VG "localvg" (run vgscan)
> pvscan -- total: 3 [45.42 GB] / in use: 3 [45.42 GB]
/
> in no VG: 0 [0]
> 
> =====
> Randy Rubins (eBay ID: lv_hockey)
> mailto://lv_hockey yahoo com
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail SpamGuard - Read only the mail you want.
> http://antispam.yahoo.com/tools
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm redhat com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to
solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red
Hat, Inc.
Consulting Development Engineer                   Am
Sonnenhang 11
                                                 
56242 Marienrachdorf
                                                 
Germany
Mauelshagen RedHat com                            +49
2626 141200
                                                      
FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-





=====
Randy Rubins (eBay ID: lv_hockey)
mailto://lv_hockey@yahoo.com

__________________________________
Do you Yahoo!?
Yahoo! Mail SpamGuard - Read only the mail you want.
http://antispam.yahoo.com/tools
