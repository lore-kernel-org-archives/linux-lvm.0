From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] VG has wrong num of PV's; won't vgscan
Message-Id: <20020210193549.A26435@sistina.com>
References: <Pine.LNX.4.33L0.0202091613040.16109-100000@fcofer2>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8t9RHnE3ZwKMSgU+"
In-Reply-To: <Pine.LNX.4.33L0.0202091613040.16109-100000@fcofer2>;
    from lvm@lifelabs.net on Sat, Feb 09, 2002 at 04:28:14PM -0500
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
Date: Sun Feb 10 12:37:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii


Sean,

I have attached a quick hack perl script to fix your VGDA on
/dev/ide/host0/bus1/target0/lun0/part1.

Please recognize that it *just* solves the very purpose of getting your
VG with the single PV on /dev/ide/host0/bus1/target0/lun0/part1 back!

Save your metadata before you run it by

dd if=/dev/ide/host0/bus1/target0/lun0/part1 bs=1k count=1024 of=vgda.sav

in order to be able to redi from start in case something goes badly wrong.

Regards,
Heinz    -- The LVM Guy --


On Sat, Feb 09, 2002 at 04:28:14PM -0500, Sean C. McCord wrote:
> I was attempting to add another PV to my VG 'mccord', and vgextend
> segfaulted in the middle.  After I rebooted (the kernel dumped its LVM
> core), there was no volume group found by vgscan.
> 
> I have seen similar posts in the archives, but most of them reference a
> bug that was supposedly fixed before LVM 1.0, so this must not be it.
> 
> Anyway, pvdisplay on /dev/ide/host0/bus1/target0/lun0/part1 says
> everythings's great, and that it is PV #1 of VG mccord.
> 
> pvdata says VG mccord has two PVs and that both are active.  The other PV,
> though, is completely trashed.  pvdata also says that the LV seems to be
> fine.
> 
> I have no backup of the vgdata that I can find (they are stored on the
> first PV...), so I can't do what many of the other people did to get their
> VGs back.
> 
> Is there any way to change the VG info back to having only one PV, and if
> so, will that get vgscan to find the VG again?  If you need the debug
> info, I can provide it.
> 
> My system is using LVM 1.0.1-rc4, devfs, Reiserfs, and I have my root file
> system on that VG.
> 
> Thanks for any assistance anyone can offer,
> 
> Sean C. McCord
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=patch_vgda

#!/usr/bin/perl
#
# For Sean C. McMord to patch his metadata on
# /dev/ide/host0/bus1/target0/lun0/part1 to reflect a VG
# with just 1 PV
#

$PVNAME="/dev/ide/host0/bus1/target0/lun0/part1";

# various offsets we need to retrieve and patch members
$VG_ON_DISK_OFFSET = 12;
$PV_UUIDLIST_ON_DISK_OFFSET = 20;
$PV_MAX_OFFSET=152;
$PV_UUID_OFFSET=44;
$PV_PE_TOTAL_OFFSET=456;
$VG_PE_TOTAL_OFFSET=176;
$NAME_LEN=128;

open ( PV, "$PVNAME") || die "Error opening \"$PVNAME\" to read\n";

# get the offset of the VG structure

seek ( PV, $VG_ON_DISK_OFFSET, 0);
$vg_on_disk_base = unpack ('V', <PV>);
printf ( "VG on-disk base is at %d bytes\n", $vg_on_disk_base);

# get the PV UUID
seek ( PV, $PV_UUID_OFFSET, 0);
$pv_uuid = unpack ( "a$NAME_LEN", <PV>);
printf ( "PV UUID at offset %d is: \"%s\"\n",  $PV_UUID_OFFSET, $pv_uuid);

# get the current PV and actual PV count from the VG structure
seek ( PV, $vg_on_disk_base + $PV_MAX_OFFSET, 0);
( $pv_max, $pv_cur, $pv_act) = unpack ('V3', <PV>);
printf ( "pv_max: %d   pv_cur: %d   pv_act: %d\n", $pv_max, $pv_cur, $pv_act);

# get the total PE count from the PV strcuture
seek ( PV, $PV_PE_TOTAL_OFFSET, 0);
( $pe_total, $pe_allocated) = unpack ('V2', <PV>);
printf ( "pe_total: %d   pe_allocated: %d\n", $pe_total, $pe_allocated);

# get start of the PV UUID list
seek ( PV, $PV_UUIDLIST_ON_DISK_OFFSET, 0);
$pv_uuidlist_on_disk = unpack ( 'V', <PV>);
printf ( "PV UUIDLIST is at %d bytes\n", $pv_uuidlist_on_disk);

close ( PV);
open ( PV, ">$PVNAME") || die "Error opening \"$PVNAME\" to write\n";

# Now we've got all the parameters -> got to change them

# change the current PV and actual PV count in the VG structure
$pv_cur = $pv_act = 1;
seek ( PV, $vg_on_disk_base + $PV_MAX_OFFSET, 0);
syswrite ( PV, pack ( 'V3', $pv_max, $pv_cur, $pv_act), 12);
printf ( "Changed pv_cur and pv_act to %d in the VG structure\n", $pv_cur);

# change PE total and PE allocated in the VG structure
seek ( PV, $vg_on_disk_base + $VG_PE_TOTAL_OFFSET, 0);
syswrite ( PV, pack ( 'V2', $pe_total, $pe_allocated), 8);
print ( "Changed pv_total and pv_allocated in the VG structure\n");

# change the PV UUID list
seek ( PV, $pv_uuidlist_on_disk, 0);
syswrite ( PV, $pv_uuid, $NAME_LEN);

for ( $i = 1; $i < $pv_max; $i++) {
     seek ( PV, $pv_uuidlist_on_disk + $i * $NAME_LEN, 0);
     syswrite ( PV, 0, 1);
};
print ( "Changed PV UUID list\n");

close ( PV);
print ( "Done\n\n");

--8t9RHnE3ZwKMSgU+--
