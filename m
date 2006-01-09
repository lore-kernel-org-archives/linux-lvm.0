Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k09NdY8g015052
	for <linux-lvm@redhat.com>; Mon, 9 Jan 2006 18:39:34 -0500
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <43BCEB3D.5090400@redhat.com>
References: <43BC8CF9.1080901@redhat.com> <43BCDC23.9010100@redhat.com>
	<43BCE669.8050702@redhat.com> <43BCEB3D.5090400@redhat.com>
Content-Type: multipart/mixed; boundary=Apple-Mail-2--371026752
Message-Id: <18677c3370014809684bd66ce6f8fc4d@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Use lvcreart -m to make a mirror
Date: Mon, 9 Jan 2006 17:39:23 -0600
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-2--371026752
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed

The attached script (originally from Jun'ichi Nomura) is what I've been 
using to validate mirror volumes.  You might be able to pull out things 
for use in your tests.  It uses device mapper and is design to attack a 
specific bug.

  brassow


--Apple-Mail-2--371026752
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0755;
	name="mirror_177067.sh"
Content-Disposition: attachment;
	filename=mirror_177067.sh

#!/bin/sh
#####################################################
# This test ensures that the contents of each side
# of a mirror are the same.
#
# Todo:
#   Extend to include mirrors with more sides
#
# Exits values
#   0 if test succeeds
#   1 if test failed
#   2 if problem running test
#####################################################

#####################################################
# Globals
#####################################################

vgname=vg
lvname=mtest1
M=1
SIZE=500M

VOL=${vgname}/${lvname}
MAP=${vgname}-${lvname}

mount_point=/tmp/tmp_mnt
mkdir -p ${mount_point}

#####################################################
# Functions
#####################################################

function write_data {
    mkfs.ext3 /dev/${VOL} >& /dev/null
# following should be removed if PVs are too fast
    mount /dev/${VOL} ${mount_point}
    cp -ar /usr/include/linux ${mount_point}/
    umount $mount_point
}

function show_log {
    echo "# dirty log dump: $1"
    blockdev --flushbufs /dev/mapper/${MAP}*
    od -Ax -x /dev/mapper/${MAP}_mlog
}

function wait_sync {
    dmsetup wait ${MAP}
}

function usage
{
    echo "Usage: $0 [options]"
    echo "Options:"
    echo " -h           Print this message."
    echo " -m <string>  Temporary mount point. (default = /tmp/tmp_mnt)"
    echo " -s <number>  Number of sides to the mirror. (default = 2)"
    echo " -v <string>  Volume group used for tests. (default = vg)"
}

#####################################################
# Main
#####################################################

while getopts :hm:s:v: opt; do
    case $opt in
	m) mount_point=$OPTARG;;
	s) M=$(($OPTARG - 1));;
	v) vgname=$OPTARG;;
	:) echo "$0: $OPTARG requires a value:"; usage ; exit 2;;
        \?) echo "$0: unknown option $OPTARG"; usage ; exit 2;;
        *) usage; exit 0 ;;
    esac
done

if [ $M -lt 1 ] || [ $M -gt 8 ]; then
    echo "Bad number of sides, $(($M + 1))"
    echo "Should be 2 - 8"
    exit 2
fi

echo -n "Creating volume ${VOL} ($(($M + 1))-sided mirror)::  "

if !(lvcreate -m ${M} --size ${SIZE} --name ${lvname} ${vgname} >& /dev/null); then
    echo "[FAILED]"
    echo "please check the followings:"
    echo "  * make sure volume group ${vgname} exists"
    echo "  * make sure ${VOL} doesn't exist yet"
    echo "  * ${vgname} contains $(($M + 2)) or more PVs"
    echo "  * ${vgname} has capacity larger than $SIZE x $(($M + 1))"
    exit 2
fi
echo "[  OK  ]"
echo "  Dirty log location:"
logtable=$(dmsetup table ${MAP}_mlog)
echo "  $logtable"
echo "  Current status:"
output=$(dmsetup status ${MAP})
echo "  $output"

#show_log "just-after-volume-creation"

echo -n "Writing data on the volume::  "
if write_data; then
    echo "[  OK  ]"
else
    echo "[FAILED]"
    exit 2
fi

echo "  Current status:"
output=$(dmsetup status ${MAP})
echo "  $output"

echo -n "Deactivating the volume::  "
if lvchange -an ${VOL} >& /dev/null; then
    echo "[  OK  ]"
else
    echo "[FAILED]"
    exit 2
fi

#echo $logtable | dmsetup create ${MAP}_mlog
#show_log "after-writing-data, sync-not-completed"
#dmsetup remove ${MAP}_mlog

echo -n "Re-activating the volume::  "
if lvchange -ay ${VOL} >& /dev/null; then
    echo "[  OK  ]"
else
    echo "[FAILED]"
    exit 2
fi

echo -n "Waiting for sync completion::  "
wait_sync &
wait
echo "[  OK  ]"
#show_log "sync-completed"

echo "  Image locations:  "
for i in $(seq 0 $M); do
    imgtable[$i]=$(dmsetup table ${MAP}_mimage_$i)
done
for i in $(seq 0 $M); do
    echo "  ${imgtable[$i]}"
done

echo -n "Deactivating the volume::  "
if lvchange -an ${VOL} >& /dev/null; then
    echo "[  OK  ]"
else
    echo "[FAILED]"
    exit 2
fi

echo "Comparing raw images."
for i in $(seq 0 $M); do
    echo ${imgtable[$i]} | dmsetup create ${MAP}_mimage_$i
done
blockdev --flushbufs /dev/mapper/${MAP}*

for i in $(seq $M); do
    echo -n "  Image 0 vs Image $i::  "
    if !(cmp /dev/mapper/${MAP}_mimage_0 /dev/mapper/${MAP}_mimage_$i > /dev/null); then
	# Should we leave the device-mapper images for examination?
	# I say no, because we'll leave the LV
	for j in $(seq 0 $M); do
	    dmsetup remove ${MAP}_mimage_$j
	done
	echo "[FAILED (bug 177067)]"
	exit 1
    else
	echo "[  OK  ]"
    fi
done

for j in $(seq 0 $M); do
    dmsetup remove ${MAP}_mimage_$j
done
lvremove -ff ${VOL} >& /dev/null

exit 0

--Apple-Mail-2--371026752
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed



On Jan 5, 2006, at 3:47 AM, Patrick Caulfield wrote:

> Fang,Dongyu wrote:
>> Thanks your replay.
>> How can I mount the "original" (mimage_0) or the "mirror" (mimage_1)
>> single?
>> Because I want to verify it write/read data in both LV indeed.
>
> Because of internal cacheing I don't know whether that's a sensible 
> thing to do.
>
>> And how can I remove the mirror relation between the two LV(let the
>> "original" and "mirror" become two singe LV)?   (I use `lvconvert -m 0
>> vg1/mirror1`  then LVs become one.)
>
> With current RPMs you currently can't. The code is in CVS but it needs 
> lots of
> testing.
> -- 
>
> patrick
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--Apple-Mail-2--371026752--
