Received: from o.ww.redhat.com (vpn-4-10.str.redhat.com [10.32.4.10])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	l0AH6Ye5001817
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2007 18:06:34 +0100
Received: from o.ww.redhat.com (localhost.localdomain [127.0.0.1])
	by o.ww.redhat.com (8.13.8/8.13.7) with ESMTP id l0AH8mAn005786
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2007 18:08:48 +0100
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.13.8/8.13.8/Submit) id l0AH8mqf005785
	for linux-lvm@redhat.com; Wed, 10 Jan 2007 18:08:48 +0100
Date: Wed, 10 Jan 2007 18:08:48 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] vgscan -- ERROR "vg_read_with_pv_and_lv(): current
	PV" can't get data of volume group
Message-ID: <20070110170848.GA19858@redhat.com>
References: <aec22fc50701091026i3b66ec18jbd18760e59164622@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aec22fc50701091026i3b66ec18jbd18760e59164622@mail.gmail.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Tue, Jan 09, 2007 at 09:26:03PM +0300, `VL wrote:
> Dear ALL, <linux-lvm@redhat.com>
> 
> I have a problem with LVM volume(details below) probably after bad shutdown:

Do you assume that, because your system died during
a running configuration change on "lvm1" ?

Are all PVs of "lvm1" accessible ?

If so, you need to fetch your most recent valid VG metadata archive
(see 'man vgcfgrestore'; option '-ll' to look at archive content)
and restore it. 'vgscan ; vgchange -ay' afterwards.

Regards,
Heinz    -- The LVM Guy --


> 
> There are 2 volumes: lvm2 and lvm1 (just names, type is lvm-1). lvm2 is fine
> and mounted,
> and lvm1 has problems:
> 
> # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sda1" of VG "lvm2" [372.56 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sdb1" of VG "lvm2" [372.56 GB / 0 free]
> pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG "lvm1" (run
> vgscan)
> pvscan -- inactive PV "/dev/hdf1"  is associated to unknown VG "lvm1" (run
> vgscan)
> pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG "lvm1" (run
> vgscan)
> pvscan -- total: 5 [1.36 TB] / in use: 5 [1.36 TB] / in no VG: 0 [0]
> 
> # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "lvm2"
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
> volume group "lvm1" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> groups
> 
> ls -l /dev/lvm*
> crw-r-----  1 root root 109, 0 2005-03-27 17:11 /dev/lvm
> 
> /dev/lvm1:
> total 0
> crw-r-----  1 root disk 109, 0 2007-01-05 17:14 group
> 
> /dev/lvm2:
> total 0
> crw-r-----  1 root disk 109, 1 2007-01-09 21:22 group
> brw-rw----  1 root disk  58, 1 2007-01-09 21:22 lv2
> 
> 
> System description:
> 
> kernel 2.4.31 vanilla
> slackware-10.2.0
> lvm-1.0.8-i486-1
> 
> any help will be greatly appreciated.

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
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
