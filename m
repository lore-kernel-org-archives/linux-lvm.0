Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id i1KFM5a5018242
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 16:22:06 +0100
From: Heinz Mauelshagen <Mauelshagen@redhat.com>
Subject: Re: [linux-lvm] inactive PV associated to unknown VG
Message-ID: <20040220152205.GB25086@redhat.com>
References: <20040220050003.68594.qmail@web14713.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040220050003.68594.qmail@web14713.mail.yahoo.com>
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
Date: Fri Feb 20 10:21:04 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Feb 19, 2004 at 09:00:03PM -0800, Randy Rubins wrote:
> Thanks, Heinz!
> 
> I got impatient this morning and executed:
> dd if=/dev/zero of=/dev/sdb bs=1 count=1
> 
> hoping the result would be that /dev/sdb1 would
> contain the only valid VG descriptor, and it worked.
> 
> Just for confirmation,
> 
> 1) Does VG always get written at the beginning of PE
> (first 128 bytes), whether it's the whole disk
> (/dev/sdb) or a partition (/dev/sdb1)? 

The LVM1 metadata starts at the very beginning of the device used as a PV.
If you use the whole disk /dev/sdb (which you did before) it starts at
the frist sector of thw disk, with /dev/sdb1 at the first sector of
that partition.

> 
> 2) I was expecting kickstart to clear the disk label,
> but looking at my ks.cfg I only see
> clearpart --all
> It probably should have said:
> clearpart --all --initlabel
> to avoid the situation of having an "old" PV structure
> info on /dev/sdb...  I haven't tried it yet but would
> that have been the right approach?

Yes.

> 
> 3) AJ Lewis's LVM-HOWTO contains a statement:
> "The recommended method of partitioning a disk is to
> create a single partition that covers the whole disk.
> This avoids any nasty accidents with whole disk drive
> device nodes and prevents the kernel warning about
> unknown partition types at boot-up."
> 
> Is there a general agreement amongst lvm developers
> and users that the partition based PE (/dev/sdb1) is
> preferred over the "partitionless" PE (/dev/sdb) in a
> "normal" production environment when the intent is to
> use the entire physical disk as a PE?

It is the recommended approach to avoid the mentioned hassle.
Using one partition which covers the whole disk does only
waste a tiny amount of space vs. the whole disk PV _but_
makes the PV *visible* in the partitioning tools.

Regards,
Heinz    -- The LVM Guy --

> 
> Cheers,
> Randy
> 
> --------------------------------------------------------------------------------
> 
> From: Heinz Mauelshagen <mauelshagen redhat com> 
> To: linux-lvm redhat com 
> Subject: Re: [linux-lvm] inactive PV associated to
> unknown VG 
> Date: Thu Feb 19 10:38:31 2004 
> 
> --------------------------------------------------------------------------------
> 
> Randy,
> 
> the PV structure on /dev/sdb hasn't been removed.
> Overwrite the first 128 bytes of /dev/sdb and rerun
> vgscan.
> 
> 
> On Wed, Feb 18, 2004 at 03:56:56PM -0800, Randy Rubins
> wrote:
> > I'm having a problem importing a VG after
> > re-installing the server (original OS version RH
> 7.3,
> > new RHEL 3 AS).  LVM is picking up the /dev/sdb, as
> > well as the new /dev/sdb1 PV.  Any way to tell LVM
> to
> > ignore /dev/sdb and force it to use /dev/sdb1?  
> > BTW, the LVM version used on RH 7.3 was 0.9.1_beta7,
> > the new LVM version - whatever comes with RHEL 3 AS
> > update 1.
> 
> 1.0.3
> 
> > 
> > Thanks,
> > Randy
> > 
> > pvscan -- reading all physical volumes (this may
> take
> > a while...)
> > pvscan -- ACTIVE   PV "/dev/sda2" of VG "rootvg" 
> > [16.45 GB / 4.69 GB free]
> > pvscan -- inactive PV "/dev/sdb"   is associated to
> > unknown VG "localvg" (run vgscan)
> > pvscan -- inactive PV "/dev/sdb1"  is associated to
> > unknown VG "localvg" (run vgscan)
> > pvscan -- total: 3 [45.42 GB] / in use: 3 [45.42 GB]
> /
> > in no VG: 0 [0]
> > 
> > =====
> > Randy Rubins (eBay ID: lv_hockey)
> > mailto://lv_hockey yahoo com
> > 
> > __________________________________
> > Do you Yahoo!?
> > Yahoo! Mail SpamGuard - Read only the mail you want.
> > http://antispam.yahoo.com/tools
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm redhat com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at
> http://tldp.org/HOWTO/LVM-HOWTO/
> 
> -- 
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to
> solve them ***
> =====
> Randy Rubins (eBay ID: lv_hockey)
> mailto://lv_hockey@yahoo.com
> 
> __________________________________
> Do you Yahoo!?
> Yahoo! Mail SpamGuard - Read only the mail you want.
> http://antispam.yahoo.com/tools
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
