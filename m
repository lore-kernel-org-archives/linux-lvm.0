From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm and a dead disk
Message-ID: <20030915152521.N2618@sistina.com>
References: <16228.26968.804811.803799@gargle.gargle.HOWL>
Mime-Version: 1.0
In-Reply-To: <16228.26968.804811.803799@gargle.gargle.HOWL>; from pk@q-leap.com on Sun, Sep 14, 2003 at 03:12:56PM +0200
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Sep 15 08:35:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Peter,

the LVM1 way is to replace the broken disk, pvcreate the new one and
vgcfgrestore the metadata to it.

In case you can install LVM2, vgchange has a "-P" option to activate
partially available volume groups. No need for a new drive that way.

3rd (hacky) option to avoid a new drive is to:

# mkdir -p /etc/lvmtab.d
# cp /etc/lvmconf/vg0.conf /etc/lvmtab.d
# echo -ne "vg0\0" > /etc/lvmtab
# vgchange -ay

Which will activate the volume group but you'll get errors/hangs accessing
the failed drive with this.

After retrieving whatever you still get off the logical volumes, you
need to recreate the volume group and logical volumes in order to restore
your data (and start thinking about RAID ;)

Regards,
Heinz    -- The LVM Guy --




On Sun, Sep 14, 2003 at 03:12:56PM +0200, Peter wrote:
> Hello,
> 
> using lvm under Debian woody with packages 
> lvm-common v1.5.5 and lvm10 v1.04-5 and linux 2.4.21 I once had a
> volume group vg0 with three physical volumes:
> 
> /dev/scsi/host0/bus0/target5/lun0/part1
> /dev/scsi/host0/bus0/target3/lun0/part1
> /dev/scsi/host0/bus0/target4/lun0/part6
> 
> Unfortunately the first disk failed, but while Linux was still up I
> could still access some of the files.  That obviously changed after I
> rebooted the system as the first disk was hopelessly broken and vg0
> could no longer be activated.
> 
> Now as there still are two pv's left and I can see the data on them
> (only with grep or strings), I was wondering if there is any way to
> activate the volume group in some sort of broken mode?  Just to access
> the files that are still there as it was before the reboot?
> 
> I already tried to vgcfgrestore the data to a newly created pv
> actually with success:
> 
> /dev/ide/host0/bus0/target0/lun0/part2
> /dev/scsi/host0/bus0/target3/lun0/part1
> /dev/scsi/host0/bus0/target4/lun0/part6
> 
> (replaced the SCSI disk with an IDE) but I don't seem to be able to do
> any useful (like mounting) with it.  I understand that the filesystem
> is missing a lot of data in order to start up.  I just thought I ask
> here before I finally overwrite the remaining partitions.
> 
> Before you ask why I don't restore the data from the backup I have to
> admit that the last backup is almost a year old, and please don't ask
> why :/
> 
> Thanks a lot in advance,
> 
>     Peter
> 
> --
> .signature: No such file or directory.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
