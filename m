Date: Mon, 15 Mar 2004 13:34:45 +0100
From: Heinz Mauelshagen <hjm@redhat.com>
Subject: Re: [linux-lvm] LVM Problems when moving data off a PV
Message-ID: <20040315123445.GA17078@redhat.com>
References: <1079271129.2414.7.camel@rockley.barbados>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1079271129.2414.7.camel@rockley.barbados>
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
To: nick@gushlow.com, LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Mar 14, 2004 at 01:32:09PM +0000, Nick Gushlow wrote:
> I've got a volume group (vg2) that spans 3 partitions on two disks;
> hdb1, hdb5, hdc.  hdb1 and hdb5 are the only partitions on disk hdb.
> 
> Disk hdb is failing and I've got an identical replacement from Maxtor,
> so I stuck the new disk in and tried to follow the instructions on the
> LVM howto for removing a disk. 
> 
> I've successfully transfered hdb5 to the new disk (hdd) but I got an
> error when trying to move hdb1; I can't remember that error now but I am
> assuming that there may be damage to that part of the disk as the disk
> is failing.
> 
> After trying a few things I found on the lvm lists and other places and
> I'm now at a stage where a vgscan reports

Nick,

what exactly were those 'things' ?

> 
> ------------------------------------------------------------------------
> vgscan -- only found 4253 of 4267 LEs for LV /dev/vg2/storage (0) 
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> data of volume group "vg2" from physical volume(s)
> ------------------------------------------------------------------------

You need to select the last valid metadata backup of vg2 from /etc/lvmconf
(check it with vgcfgrestore -ll -f /etc/lvmconf/vg2.conf[.#.old]; see
'man vgcfgrestore for metadata archive file names) and restore it.

Say vg.conf.1.old is the valid one:

for dev in AllPVsOfVG2 # list all PVs reported by vgcfgrestore -ll above
do
	pvcreate -ff $dev
	vgcfgrestore -f /etc/lvmconf/vg.conf.1.old $dev
done
vgscan
vgchange -ay vg2

> 
> I tried a couple of things from very old posts I found on the lvm
> mailing list including compiling LVM2 from cvs so I could do a vgreduce
> --removemissing but that didn't work (I assume because they are lvm1) 

The LVM2 tools support LVM1 metadata format.
What went wrong running vgreduce --removemissing ?

In order to activate LVM1 VGs with LVM2, you need a kernel with device-mapper.

> 
> Can anyone tell me what might be wrong, and more importantly how I can
> get the volume group back up. 

See vgcfgrestore above.

> 
> I am assuming that as the data is spread across 3 disks if I can't
> recover from this error then I will have lost everything on them. 
> 
> Unfortunately I don't have a backup because I have nothing large enough
> to backup the data in the volume group. 

<preach>
You need backups in order to be able to survive user/sw/hw failure.
</preach>

> 
> TIA,
> 
> Nick Gushlow.
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
