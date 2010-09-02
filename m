Message-ID: <4C7F7B48.3010005@redhat.com>
Date: Thu, 02 Sep 2010 11:24:08 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <AANLkTinf2_y2j+i_xNZpiJBQNkkYo7_xv8iLnT-tHpVY@mail.gmail.com>
In-Reply-To: <AANLkTinf2_y2j+i_xNZpiJBQNkkYo7_xv8iLnT-tHpVY@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Removing a failed PV from VG/LV
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Tom Wizetek <tom@wizetek.com>

On 09/02/2010 06:56 AM, Tom Wizetek wrote:
> Can someone please outline the process of removing a failed PV
> (without replacing it) from a single VG / single LV? Let's say we just
> want to continue using what's left of the LV and accept the data loss.

You can activate the VG in partial mode, allowing you to access what's
left of the data on the LVs. This lets you recover as much as remains on
the surviving disks.

E.g.:

Set up some test devices & a test VG/LV:

# pvcreate /dev/loop0
  Physical volume "/dev/loop0" successfully created
# pvcreate /dev/loop1
  Physical volume "/dev/loop1" successfully created
# vgcreate tvg1 /dev/loop0 /dev/loop1
  Volume group "tvg1" successfully created
# lvcreate -L 80M -n l0 tvg1
  Logical volume "l0" created
# lvs tvg1
  LV   VG      Attr   LSize  Origin Snap%  Move Log Copy%  Convert
  l0   tvg1    -wi-a- 80.00M

De-activate the VG and "hide" a PV:

# vgchange -an tvg1
  0 logical volume(s) in volume group "tvg1" now active
# losetup -d /dev/loop1

Try to re-activate:

# vgchange -ay tvg1
  Couldn't find device with uuid 'YU47yZ-CWBj-dANw-kc4Y-gLEt-KcqK-yWXWEn'.
  Couldn't find device with uuid 'YU47yZ-CWBj-dANw-kc4Y-gLEt-KcqK-yWXWEn'.
  Refusing activation of partial LV l0. Use --partial to override.
  0 logical volume(s) in volume group "tvg1" now active

Add the partial flag:

# vgchange -ay --partial tvg1
  Partial mode. Incomplete volume groups will be activated read-only.
  Couldn't find device with uuid 'YU47yZ-CWBj-dANw-kc4Y-gLEt-KcqK-yWXWEn'.
  Couldn't find device with uuid 'YU47yZ-CWBj-dANw-kc4Y-gLEt-KcqK-yWXWEn'.
  1 logical volume(s) in volume group "tvg1" now active

Now we can get at what's left:

# dd if=/dev/tvg1/l0 of=/dev/null
dd: reading `/dev/tvg1/l0': Input/output error
122880+0 records in
122880+0 records out
62914560 bytes (63 MB) copied, 1.04186 s, 60.4 MB/s

To see what's happened here we can look at the device-mapper tables for
the device:

# dmsetup table tvg1-l0
0 122880 linear 7:0 384      # this is the surviving PV
122880 40960 linear 253:7 0  # this is the missing PV

The device 253:7 is device dm-7 which has been created by the vgchange
--partial to fill in the missing space:

# dmsetup table tvg1-l0-missing_1_0
0 40960 error

The error target is a special target that just returns I/O errors - you
can't (obviously) read the data that is not there but you can still
attempt to recover whatever's left on the surviving disks.

Older versions of the tools needed you to set up the "missing stripe
filler" device manually but since about 2.02.40 this is automatic.

It's a bit dated now but you might also find some of this presentation
from a couple of years back helpful:

http://people.redhat.com/breeves/talks/iotc-2008-recovering-lvm2/index.html

Regards,
Bryn.
