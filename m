Received: from o.ww.redhat.com (vpn50-1.rdu.redhat.com [172.16.50.1])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1JCDIi17469
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 07:13:19 -0500
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Lost free PV  -> error reading VG
Message-ID: <20040219121317.GB32407@redhat.com>
References: <15173.1077120428@www19.gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15173.1077120428@www19.gmx.net>
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
Date: Thu Feb 19 10:39:07 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Feb 18, 2004 at 05:07:08PM +0100, Stefan Jenkner wrote:
> Hi Folks!
> 
> I had a vg "debian" with the pvs /dev/hda2 /dev/hda3 /dev/hda4
> I wanted to remove /dev/hda4, so i did:  pvmove -v /dev/hda4 
> Everything went well, so I removed /dev/hda4, but _without_ the use of:
> vgreduce debian /dev/hda4 :-( 

D'oh!

> I also did: pvcreate /dev/hda4 , so /dev/hda4 seems to be an empty pv, and
> it does not know that it belongs
> to the vg "debian".

Must have been a "pvcreate -ff /dev/hda4" to achive the recreation,
while /dev/hda4 was a member of VG "debian" still.

> 
> And now, I get:
> 
> root@ttyp0[root]# vgscan 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
> volume group "debian" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
> root@ttyp0[root]# pvscan 
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hda2"  is associated to unknown VG "debian" (run
> vgscan)
> pvscan -- inactive PV "/dev/hda3"  is associated to unknown VG "debian" (run
> vgscan)
> pvscan -- inactive PV "/dev/hda4" is in no VG  [23.85 GB]
> pvscan -- total: 3 [57.24 GB] / in use: 2 [33.38 GB] / in no VG: 1 [23.85
> GB]
> 
> How can I recover my vg? There are no backups :-(

/me wonders how often we mentioned to take backups of /etc/lvmconf/* yet :->

> How can I tell the vg "debian" to do not use: the empty pv /dev/hda4?
> Or, how can I tell /dev/hda4 that it belongs to the vg "debian"?
> There is no lvmconf too :-(

lvm2 tools are able to reduce VGs by missing PVs.
Fetch and build them and run "vgreduce --removemissing debian".

Afterwards continue with LVM1 (unless you want to migrate to LVM2 anyway):

# vgscan -f
# vgchange -ay

> 
> What additional information do you need to be able to help me?
> 
> Thanks
>  Stefan
> 
> -- 
> GMX ProMail (250 MB Mailbox, 50 FreeSMS, Virenschutz, 2,99 EUR/Monat...)
> jetzt 3 Monate GRATIS + 3x DER SPIEGEL +++ http://www.gmx.net/derspiegel +++
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
