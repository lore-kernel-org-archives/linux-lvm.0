From: "Yves Alloyer" <Yves.ALLOYER@slpinfoware.com>
Subject: RE: [linux-lvm] Does LVM work with NBD?
Message-Id: <NEBBLHFAEINCLDICDLOAAEELCKAA.yves.alloyer@slpinfoware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1BD922A62552D411B48A00D0B74723751120A947@kecmsg04.ad.infosys.com>
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
Date: Wed Mar 20 09:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I had a similar problem once upon a time (1.0.1rc4) with LVM over software
RAID. The fix here was to tell LVM that the device type did not support
partitions.
The source file is tools/lib/lvm_check_partitioned_dev.c

From what I see however (lines 62 through 66), in 1.0.3 devices that are
known not be partitioned are:
	LVM_DEVICE_TYPE_NBD
	LVM_DEVICE_TYPE_LOOP
	LVM_DEVICE_TYPE_MD
	LVM_DEVICE_TYPE_ATARAID

1.0.2 used the same list but it went into the source code sometime after
1.0.1rc4. I don't know when exactly.

In other words, what version of LVM userland are you using? My guess is you
should be fine with 1.0.3.

Hope that helps.
Yves
-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of ASHISH GUPTA
Sent: Wednesday, March 20, 2002 11:35 AM
To: linux-lvm@sistina.com
Subject: [linux-lvm] Does LVM work with NBD?


Hi All,

1) I'm using NBD and LVM . I have mounted the remote device
using NBD(version 2.4.27). When I do pvcreate on mounted disk,it is
successful.

#pvcreate /dev/nb0
pvcreate -- physical volume "/dev/nb0" successfully created

But when we try out other commands such as pvdisplay, vgcreate etc. it gives
the
following error.

 #pvdisplay /dev/nb0
pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID physical
volume "/d
ev/nb0"

# ./vgcreate /dev/nb0
vgcreate -- please enter physical volume name(s)

pvcreate uses the information from /proc/partitions.
It  works although the /proc/partitions is not updated with the remote
device information.
However the other LVM commands like "vgcreate", "pvdisplay" look for remote
device
information in /proc/partition and as the entry is not there in dir_cache,
it fails.

To make it run, I have added a entry for nb0 in the file lvm_dir_cache.c in
_noprocdir.
/* devices *not* showing up in /proc/partitions must be scanned anyway */
static char *_noprocdir[] = {
        LVM_DIR_PREFIX "loop",
        LVM_DIR_PREFIX "nb0",
        NULL
};

After doing,I am able to do pvcreate, vgcreate and so.Is it right way to do
this?

2)As per some mail in lvm-linux archieve, if I make an entry for nbd device
in _devdir[] in file lvm_dir_cache.c
 and just modify this following check by replacing _cache_size with
'1'.Still pvcreate fails.And it gives the following error.

if(!_cache_size)
                        _scan_devs( TRUE);
                else
                        _scan_devs( FALSE);
        }


# pvcreate /dev/nb0
"/dev/nb0 has a partition table"


3) Is there any patch available to make NBD working with LVM?



Regards,
Ashish
