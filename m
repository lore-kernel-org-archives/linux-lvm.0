content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <772FBCA525B8FB4C9299D8D27FD4A5AA04105A@ABCSYSEXC1.abcsystems.ch>
From: "Michael Vogt" <MichaelVogt@abcsystems.ch>
Subject: [linux-lvm] (no subject)
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
Date: Fri May  2 03:51:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

hey everyone

well ewen, what do you mean with types recognised from matching against =
/proc/devices? it contains the following:

linuxsvm:~ # cat /proc/devices
Character devices:
  1 mem
  2 pty
  3 ttyp
  4 ttyS
  5 cua
  7 vcs
 10 misc
 13 input
 14 sound
 21 sg
 29 fb
 81 video_capture
109 lvm
116 alsa
128 ptm
136 pts
162 raw
180 usb
226 drm
240 vdd
248 vsd
254 HbaApiDev

Block devices:
  1 ramdisk
  2 fd
  7 loop
  8 sd
  9 md
 22 ide1
 58 lvm
240 vdd
241 vdd
242 vdd
243 vdd
244 vdd
245 vdd
246 svm
247 mv
248 vsd
249 vsd
250 vsd
251 vsd
252 vsd
253 vsd
254 vsd

ahh and im using lvm1.07. well so no solution for my problem? or is =
there another way to use lvm with my special devices? i woulnd like to =
hack the lvm code... a lvmdiskscan looks like this:

linuxsvm:/usr/src/linux # lvmdiskscan -vd
lvmdiskscan -- reading all disks / partitions (this may take a while...)
lvmdiskscan -- filling directory cache...
<1> lvm_dir_cache -- CALLED MICHU
<22> lvm_add_dir_cache -- CALLED with /dev/svmaa=20
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/svmab=20
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
<22> lvm_add_dir_cache -- CALLED with /dev/svmac=20
<22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED

it seems like he "sees" my device but simply dont add it.... what im =
doing wrong?

---OLD MESSAGE---
[linux-lvm] access special devices=20
Ewen McNeill linux-lvm@sistina.com=20
Wed Apr 30 04:00:02 2003=20

Previous message: [linux-lvm] access special devices=20
Next message: [linux-lvm] me=20
Messages sorted by: [ date ] [ thread ] [ subject ] [ author ]=20

-------------------------------------------------------------------------=
-------

In message =
<772FBCA525B8FB4C9299D8D27FD4A5AA04715E@ABCSYSEXC1.abcsystems.ch>, "M
ichael Vogt" writes:
>ive a question, i want to use lvm in my san environment, i use a san=20
>virtualisation. the point is, my (scsi) disks are not called /dev/sdX,=20
>they are called /dev/svm/svmXXX.  [not seen by lvmdiskscan]
>so i checked the source, and in the file /tools/lib/lvm_dir_cache.c are =

>some definitions called LVM_DIR_PREFIX. i tried to add my definitions=20
>(/dev/svm/svm and svm/svm) but this didnt work. what i need to do, that =

>my disks are aviable for lvm?

Having been down this road today (investigating the ataraid
issues I've posted about), you'll probably also need to look at
tools/lib/lvm_check_dev.c and tools/lib/lvm_check_partitioned_dev.c
and liblvm.h (and perhaps some others).  In particular with LVM 1 (eg,
1.0.7) there is an enumerated type, lvm_device_type_t used to identify
applicable devices, and a function lvm_get_device_type() which is used =
as
a filter on the lvm_dir_cache() results, based on that enumerated list,
and another table, when scanning for physical volumes.

I suspect your virtualisation layer isn't one of the types recognised
from matching against /proc/devices, and so it's being ignored.

In the case of ataraid it appears that (in addition to not having the
same hacks as for md to prevent aliasing, and hence the
accessing-raw-devices issues I've mentioned) LVM considers ataraid to be
unpartitioned (a la, md, loopback, etc).  In fact this isn't the case,
ataraid is a whole-disk device, with partitions (/dev/ataraid/dNpM where
N is the raid array, and M is the partition number).

BTW, I'm not sure if you're trying to use LVM 1 or LVM 2.  I've been
told that LVM 2 has a more configurable system for scanning for physical
volumes which might avoid some of the ataraid issues I found; and might
perhaps allow you to get it to see your san virtualisation devices
without hacking on the code.

For now, I've put aside the idea of using LVM on ataraid.  When LVM 2
is released, and I've got some more time, I might give that a go =
instead.

Ewen
