Received: from o.ww.redhat.com (vpn50-9.rdu.redhat.com [172.16.50.9])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i2FClMIE030508
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 13:47:23 +0100
Date: Mon, 15 Mar 2004 13:47:21 +0100
From: Heinz Mauelshagen <hjm@redhat.com>
Subject: Re: [linux-lvm] Hard disk failure, restore problem
Message-ID: <20040315124721.GB17078@redhat.com>
References: <40520E04.5090505@howest.be>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40520E04.5090505@howest.be>
Reply-To: hjm@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Mar 12, 2004 at 11:22:44AM -0800, Thomas Berton wrote:
> Hi,
> I've recently encountered some problems with my LVM.
> 
> I had (and still have) a bad hd /dev/hda (used part. /dev/hda1)
> 
> I started:
>    pvmove /dev/hda1 /dev/hdf1
> yet the hd gave an error and I had to reboot.
> 
> I have a metadata backup made before I've started the move.
> 
> The volume group name is bigspace, yet the 'dir' /dev/bigspace/bigspace1 
> is also gone...
> 
> now I got
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hdg1" is in no VG  [74.53 GB]
> pvscan -- inactive PV "/dev/hde1" is in no VG  [149.05 GB]
> pvscan -- inactive PV "/dev/hdf1" is in no VG  [149.05 GB]
> pvscan -- inactive PV "/dev/hdc1" is in no VG  [111.79 GB]
> pvscan -- inactive PV "/dev/hdd1" is in no VG  [74.53 GB]
> pvscan -- inactive PV "/dev/hda1" is in no VG  [74.53 GB]
> pvscan -- inactive PV "/dev/hdb1" is in no VG  [74.53 GB]
> pvscan -- total: 7 [708 GB] / in use: 0 [0] / in no VG: 7 [708 GB]

Thomas,

you ran 'pvcreate -ff' *and* vgcfgrestore ... on all PVs ok ?
pvscan output looks like the vgcfgrestore went wrong.

> 
> yet if I do the restore I get
> 
> I also did a pvcreate -ff /dev/hdx1 for every disk... I've read 
> somewhere that should fix it. yet id did not.

Yes, you need "pvcreate -ff ..." before you vgcfgrestore to the devices.

> 
> pvscan -- inactive PV "/dev/hda1"  is associated to unknown VG 
> "bigspace" (run vgscan)
> 
> vgscan gives
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
> volume group "bigspace" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume 
> group
> 
> there is a LOT of data on this array of disk (as you can imagine)
> 
> sometimes, hda is working good, so i hope it want to work long enough to 
> restore the data.

If you want to activate "bigspace" just in order to backup date *and*
remove/recreate it afterwards, you might want to use the following workaround:

o identify your actual metadata backup (say, bigspace.conf)

o mkdir /etc/lvmtab.d

o cp bigspace.conf /etc/lvmtab.d/bigspace

o echo -ne "bigspace\0" > /etc/lvmtab

o vgchange -ay

> 
> My guess now is to make a new vg and add those disks... but I want to be 
> sure, so I don't lose the data.

That won't work, because the PVs are falgged *new* after pvcreate -ff
and you will just have empty PVs that way.

> 
> Any suggestions to recover the data or to replace the broken harddisk 
> with a new one with as little data loss as possible.
> 
> Regards,
> Thomas.
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

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
