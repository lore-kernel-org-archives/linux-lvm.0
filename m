From: Greg Freemyer <freemyer@NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020828233112.TOPE8089.imf02bis.bellsouth.net@TAZ2>
Subject: [linux-lvm] Draft Snapshot Regression Test
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
Date: Wed Aug 28 18:30:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

All,

I just sent the below snapshot regression test to the XFS mailing list

It is designed to run from the XFS test harness, but that it should be easy to =
convert to be simply run by hand.

I have only tried it on a LVM 1.0.3 / xfs 1.1 / 2.4.19pre4-aa kernel and it =
fails within 10 iterations every time.

I have seen a couple of successes, but only when I set the iteration count very =
low, like 2 or 3.

On one occasion, the lvcreate locked up so tight, I had to reboot my server to =
get that FS unlocked.  (i.e. cycle power because the shutdown command would not =
run.)

There are a few environmental variables at the beginning you can set to control =
a couple of things.

The script only uses the $SCRATCH_DEV and $SCRATCH_MNT variables from the xfs =
test harness, so you could simply uncomment the currently commented out =
assignments.  The lines with _notrun in them can probably be deleted, unless =
you have a similar test harness.

I have not tested any of the TODO lines, but you may or may not need them in =
your test environments.

I copied the license stuff from another SGI test script, but I changed it to my =
company instead of SGI.

Feel free to make changes to this as required.

The script is below my signature.

BTW: This is mostly lvm specific, not xfs specific, so you can likely extend it =
to other filesystem types fairly easily.

Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
#! /bin/sh
# XFS QA Test No. 068
# $Id: 1.1 $
#
# Test LVM snapshot creation
#
# The timing and placement of kills and waits is particularily sensitive.
#  Don't change them unless you want to spend some time getting it right again.
#
#-----------------------------------------------------------------------
# Copyright (c) 2000, 2002 The Norcross Group, Inc.  All Rights Reserved.
#=20
# This program is free software; you can redistribute it and/or modify it
# under the terms of version 2 of the GNU General Public License as
# published by the Free Software Foundation.
#=20
# This program is distributed in the hope that it would be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#=20
# Further, this software is distributed without any warranty that it is
# free of the rightful claim of any third person regarding infringement
# or the like.  Any license provided herein, whether implied or
# otherwise, applies only to this software file.  Patent licenses, if
# any, provided herein do not apply to combinations of this program with
# other software, or any other product whatsoever.
#=20
# You should have received a copy of the GNU General Public License along
# with this program; if not, write the Free Software Foundation, Inc., 59
# Temple Place - Suite 330, Boston MA 02111-1307, USA.
#=20
# Contact information: Silicon Graphics, Inc., 1600 Amphitheatre Pkwy,
# Mountain View, CA  94043, or:
#=20
# http://www.sgi.com=20
#=20
# For further information regarding this notice, see:=20
#=20
# http://oss.sgi.com/projects/GenInfo/SGIGPLNoticeExplan/
#-----------------------------------------------------------------------
#
# creator
owner=3Dfreemyer@NorcrossGroup.com

seq=3D`basename $0`
echo "QA output created by $seq"

DELAY_BETWEEN_ITERATIONS=3D20
ITERATIONS=3D30
VG=3D/dev/VGscratch
#SCRATCH_DEV=3D/dev/xxxx          # Only needed if running by hand
#SCRATCH_MNT=3D/scratch           # Only needed if running by hand

here=3D`pwd`
tmp=3D/tmp/$$
status=3D1        # failure is the default!

_cleanup()
{

       echo Cleanup beginning

       rm $tmp.running
       xfs_freeze -u $SCRATCH_MNT

       sleep 10      # Give the dd loop time to finish

       #Kill off any other possible stray stragglers that may be out there.
       fuser -k -m /scratch_snap/dummy     >/dev/null 2>&1
       fuser -k -m /$SCRATCH_MNT/dummy          >/dev/null 2>&1

       wait

       umount /scratch_snap
       rmdir /scratch_snap
       umount $SCRATCH_MNT

       lvremove -f $VG/scratch_snap
       lvremove -f $VG/scratch

#TODO   vgremove $VG

       rm -f $tmp.*        # if we ever use tmp files
       trap 0 1 2 3 15
       exit $status
}

trap "_cleanup" 0 1 2 3 15


# get standard environment, filters and checks
. ./common.rc
. ./common.filter

if [ -e /scratch_snap ]; then _notrun "This test requires that /scratch_snap =
not exist."; fi

mkdir /scratch_snap

#Verify we have the lvm user tools
LVM=3D`rpm -qa | grep 'lvm-'`

if [ x$LVM =3D "x" ]; then _notrun "LVM Must be installed to run this test"; fi

#Verify we have the a lvm enabled kernel
# TODO (This assumes lvm is a module.  What if it is linked?  I don't know how =
to check that.
lsmod | grep lvm-mod;
if [ $? !=3D 0 ]; then _notrun "This test requires the LVM kernel module be =
present"; fi

# real QA test starts here

# Create a PV set from the scratch partition
# TODO # (I don't know if this is needed.and it is dangerous because it =
intentionally deletes the partition table!!!=20
# TODO # dd if=3D/dev/zero of=3D$SCRATCH_DEV bs=3D512 count=3D1
# TODO # pvcreate $SCRATCH_DEV

# Create a VG from the PV
# TODO # vgcreate $VG $SCRATCH_DEV

# Create a LV in the VG to snapshot
# TODO # lvcreate -L 2G -n scratch $VG

# Mount the LV
mkdir /$SCRATCH_MNT > /dev/null 2&>1

mount $VG/scratch /$SCRATCH_MNT

# Create a large 64 Meg zero filled file on the LV
dd if=3D/dev/zero of=3D$SCRATCH_MNT/dummy bs=3D64k count=3D1000=20

#setup an infinite loop to copy the large file, thus generating heavy i/o

touch $tmp.running

while [ -f $tmp.running ]
do
   dd if=3D$SCRATCH_MNT/dummy of=3D$SCRATCH_MNT/junk bs=3D64k > /dev/null 2>&1
   rm $SCRATCH_MNT/junk        # This forces metadata updates the next time =
around
   sync
done &

ii=3D1

while [ $ii -le $ITERATIONS ]
do

       # echo $ii      Usefull if your are running interactive, but not from =
the xfs test scripts

       #if the VFS lock patch is present, the calls to xfs_freeze are =
redundant, but should cause no problems
       #       OPTIONAL
       xfs_freeze -f /$SCRATCH_MNT
       if [ $? !=3D 0 ] ; then
               echo xfs_freeze -f /$SCRATCH_MNT failed
       fi
       (
               lvcreate --snapshot --size 1G --name scratch_snap $VG/scratch > =
/dev/null 2>&1
               ret=3D$?
               if [ $ret !=3D 0 ] ; then
                       echo snapshot creation for /$SCRATCH_MNT failed with =
return code $ret
               fi
       ) &
       SNAPSHOT_shell_pid=3D$!

       #if the Snapshot has not completed in ten minutes, kill it
       (
                       # I have NOT figured out how to kill the sleep 600 =
before it exits naturally.
                       # This does not cause a problem, but it clutters the ps =
table.
               sleep 600
                       # The kill $TIMEOUT_shell_pid keeps the below from =
occuring
               echo Snapshot Lockup Occured on loop $ii
               xfs_freeze -u /$SCRATCH_MNT
               kill $$
       ) &
       TIMEOUT_shell_pid=3D$!

       wait $SNAPSHOT_shell_pid

       exec 2> /dev/null               # Send the shells stderr to /dev/null
       kill $TIMEOUT_shell_pid    #Cancel the timeout
       wait $TIMEOUT_shell_pid    # This causes consistent shell notification =
for some unknow reason
       exec 2>&1                       # Put it back to the same as stdout

       #if the VFS lock patch is present, the calls to xfs_freeze are =
redundant, but should cause no problems
       #       OPTIONAL
       xfs_freeze -u /$SCRATCH_MNT
       if [ $? !=3D 0 ] ; then
               echo xfs_freeze -u /$SCRATCH_MNT failed
       fi
       #          MANDANTORY   (end)

       mount -t xfs -o ro,nouuid $VG/scratch_snap /scratch_snap
       if [ $? !=3D 0 ] ; then
               echo mount for /scratch_snap failed
       fi
       umount /scratch_snap
       if [ $? !=3D 0 ] ; then
              echo unmount for /scratch_snap failed
       fi
       lvremove -f $VG/scratch_snap > /dev/null 2>&1
       if [ $? !=3D 0 ] ; then
              echo lvremove for /scratch_snap failed
       fi

ii=3D`expr $ii + 1`
       sleep $DELAY_BETWEEN_ITERATIONS # The VG seems to need time to stabalize =
between snapshots
                       # With LVM 1.0.3 and XFS 1.1, I have tried this at 3600 =
seconds and still had failures

done

# success, all done
echo SUCCESS, COMPLETED ALL ITERATIONS WITH NO TIME OUTS!!!!!!!!!!!!
status=3D0
_cleanup
exit 1   # _cleanup should exit, so we should never get here.
