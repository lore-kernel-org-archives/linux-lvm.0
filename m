Received: from o.ww.redhat.com (vpn50-1.rdu.redhat.com [172.16.50.1])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1JC3ri16013
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 07:03:53 -0500
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] inactive PV associated to unknown VG
Message-ID: <20040219120352.GA32407@redhat.com>
References: <20040218235656.60660.qmail@web14705.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040218235656.60660.qmail@web14705.mail.yahoo.com>
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
Date: Thu Feb 19 10:38:31 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Randy,

the PV structure on /dev/sdb hasn't been removed.
Overwrite the first 128 bytes of /dev/sdb and rerun vgscan.


On Wed, Feb 18, 2004 at 03:56:56PM -0800, Randy Rubins wrote:
> I'm having a problem importing a VG after
> re-installing the server (original OS version RH 7.3,
> new RHEL 3 AS).  LVM is picking up the /dev/sdb, as
> well as the new /dev/sdb1 PV.  Any way to tell LVM to
> ignore /dev/sdb and force it to use /dev/sdb1?  
> BTW, the LVM version used on RH 7.3 was 0.9.1_beta7,
> the new LVM version - whatever comes with RHEL 3 AS
> update 1.

1.0.3

> 
> Thanks,
> Randy
> 
> pvscan -- reading all physical volumes (this may take
> a while...)
> pvscan -- ACTIVE   PV "/dev/sda2" of VG "rootvg" 
> [16.45 GB / 4.69 GB free]
> pvscan -- inactive PV "/dev/sdb"   is associated to
> unknown VG "localvg" (run vgscan)
> pvscan -- inactive PV "/dev/sdb1"  is associated to
> unknown VG "localvg" (run vgscan)
> pvscan -- total: 3 [45.42 GB] / in use: 3 [45.42 GB] /
> in no VG: 0 [0]
> 
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

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat, Inc.
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
