From: Ewen McNeill <lvm@ewen.mcneill.gen.nz>
Subject: Re: [linux-lvm] access special devices 
In-Reply-To: Message from "Michael Vogt" <MichaelVogt@abcsystems.ch> 
   of "Wed, 30 Apr 2003 10:45:15 +0200." <772FBCA525B8FB4C9299D8D27FD4A5AA04715E@ABCSYSEXC1.abcsystems.ch> 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <16456.1051693240.1@basilica.la.naos.co.nz>
Message-Id: <20030430090041.35E0FAE4F5@basilica.la.naos.co.nz>
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
Date: Wed Apr 30 04:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In message <772FBCA525B8FB4C9299D8D27FD4A5AA04715E@ABCSYSEXC1.abcsystems.ch>, "M
ichael Vogt" writes:
>ive a question, i want to use lvm in my san environment, i use a san 
>virtualisation. the point is, my (scsi) disks are not called /dev/sdX, 
>they are called /dev/svm/svmXXX.  [not seen by lvmdiskscan]
>so i checked the source, and in the file /tools/lib/lvm_dir_cache.c are 
>some definitions called LVM_DIR_PREFIX. i tried to add my definitions 
>(/dev/svm/svm and svm/svm) but this didnt work. what i need to do, that 
>my disks are aviable for lvm?

Having been down this road today (investigating the ataraid
issues I've posted about), you'll probably also need to look at
tools/lib/lvm_check_dev.c and tools/lib/lvm_check_partitioned_dev.c
and liblvm.h (and perhaps some others).  In particular with LVM 1 (eg,
1.0.7) there is an enumerated type, lvm_device_type_t used to identify
applicable devices, and a function lvm_get_device_type() which is used as
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
is released, and I've got some more time, I might give that a go instead.

Ewen
