Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q81NE0Mh024715
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 19:14:00 -0400
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q81NDvh2027494
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2012 19:13:58 -0400
Received: by lbbgj3 with SMTP id gj3so2061274lbb.33
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2012 16:13:57 -0700 (PDT)
Received: by lbbgj3 with SMTP id gj3so2061264lbb.33
	for <linux-lvm@redhat.com>; Sat, 01 Sep 2012 16:13:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+ZVM8t--4TFtJ+cb=86-38ggjwYTUz5q+JAqv9sdPJW9XDV7A@mail.gmail.com>
References: <CA+ZVM8t--4TFtJ+cb=86-38ggjwYTUz5q+JAqv9sdPJW9XDV7A@mail.gmail.com>
From: Scott Merrilees <scott@merrilees.net>
Date: Sun, 2 Sep 2012 09:13:33 +1000
Message-ID: <CANN7Ug34MtUPMorfLxZqRTG7CDsaP0vD+8CBk+e-B4+JG8tX5w@mail.gmail.com>
Subject: Re: [linux-lvm] Removing vg and lv after physical drive has been
	removed
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I don't think the dumpconfig is particularly useful. as it only show
lvm internal configuration.
Much more useful would be something like the output of

pvs -o +pv_uuid,lv_name 2>/dev/null

as this would show the lvm disk configuration, and

(pvs -o +pv_uuid,lv_name >/dev/null) 2>&1 | sort -u

which  will show the unique errors.

Another key question is can you reboot to fix, or do you have to fix online?

Certainly you can do things in dmsetup, but you need to ensure a
result that removes any persistent
lvm disk configuration too, otherwise you will probably just get a
same/similar problem on reboot.
--
Scott Merrilees


On Sat, Sep 1, 2012 at 11:54 PM, Rene C. <openvz@dokbua.com> wrote:
> We had a disk fail in a server and replaced it before removing the
> drive from LVM.
>
> The server has 4 physical drives (PV's), each with it's own volume
> group (VG). Each VG has 2 or more logical volumes (LV's.) Now LVM is
> complaining about the missing drive. So we have a VG (vg04) with two
> LV's that have become orphans than we need to clear out of the system.
>
> The problem is every time we run any LVM command we get some 'read
> failed' errors. I've tried different commands to try to clear it out
> but so far without luck:
>
> # lvscan
>   /dev/vg04/swap: read failed after 0 of 4096 at 4294901760: Input/output error
>   /dev/vg04/swap: read failed after 0 of 4096 at 4294959104: Input/output error
>   /dev/vg04/swap: read failed after 0 of 4096 at 0: Input/output error
>   /dev/vg04/swap: read failed after 0 of 4096 at 4096: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 995903864832: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 995903922176: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 0: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 4096: Input/output error
>
> # vgreduce vg04 --removemissing --force
>   /dev/vg04/swap: read failed after 0 of 4096 at 4294901760: Input/output error
>   /dev/vg04/swap: read failed after 0 of 4096 at 4294959104: Input/output error
>   /dev/vg04/swap: read failed after 0 of 4096 at 0: Input/output error
>   /dev/vg04/swap: read failed after 0 of 4096 at 4096: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 995903864832: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 995903922176: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 0: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 4096: Input/output error
>   Volume group "vg04" not found
>
> # vgchange -a n /dev/vg04
>   /dev/vg04/swap: read failed after 0 of 4096 at 4294901760: Input/output error
>   /dev/vg04/swap: read failed after 0 of 4096 at 4294959104: Input/output error
>   /dev/vg04/swap: read failed after 0 of 4096 at 0: Input/output error
>   /dev/vg04/swap: read failed after 0 of 4096 at 4096: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 995903864832: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 995903922176: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 0: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 4096: Input/output error
>   Volume group "vg04" not found
>
> # lvchange -a n /dev/vg04/vz
>   /dev/vg04/swap: read failed after 0 of 4096 at 4294901760: Input/output error
>   /dev/vg04/swap: read failed after 0 of 4096 at 4294959104: Input/output error
>   /dev/vg04/swap: read failed after 0 of 4096 at 0: Input/output error
>   /dev/vg04/swap: read failed after 0 of 4096 at 4096: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 995903864832: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 995903922176: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 0: Input/output error
>   /dev/vg04/vz: read failed after 0 of 4096 at 4096: Input/output error
>   Volume group "vg04" not found
>   Skipping volume group vg04
>
> The missing VG and LV's are not important, we just want to remove them.
>
> I don't know if it's useful, but this is the output from 'lvm dumpconfig':
>
> # lvm dumpconfig
>   devices {
>         dir="/dev"
>         scan="/dev"
>         preferred_names=["^/dev/mpath/", "^/dev/mapper/mpath", "^/dev/[hs]d"]
>         filter="a/.*/"
>         cache_dir="/etc/lvm/cache"
>         cache_file_prefix=""
>         write_cache_state=1
>         sysfs_scan=1
>         md_component_detection=1
>         md_chunk_alignment=1
>         data_alignment_detection=1
>         data_alignment=0
>         data_alignment_offset_detection=1
>         ignore_suspended_devices=0
>         disable_after_error_count=0
>         require_restorefile_with_uuid=1
>   }
>   dmeventd {
>         mirror_library="libdevmapper-event-lvm2mirror.so"
>         snapshot_library="libdevmapper-event-lvm2snapshot.so"
>   }
>   activation {
>         udev_sync=1
>         udev_rules=1
>         missing_stripe_filler="error"
>         reserved_stack=256
>         reserved_memory=8192
>         process_priority=-18
>         mirror_region_size=512
>         readahead="auto"
>         mirror_log_fault_policy="allocate"
>         mirror_image_fault_policy="remove"
>         snapshot_autoextend_threshold=100
>         snapshot_autoextend_percent=20
>         use_mlockall=0
>         monitoring=1
>         polling_interval=15
>   }
>   global {
>         umask=63
>         test=0
>         units="h"
>         si_unit_consistency=1
>         activation=1
>         proc="/proc"
>         locking_type=1
>         wait_for_locks=1
>         fallback_to_clustered_locking=1
>         fallback_to_local_locking=1
>         locking_dir="/var/lock/lvm"
>         prioritise_write_locks=1
>         abort_on_internal_errors=0
>         metadata_read_only=0
>   }
>   shell {
>         history_size=100
>   }
>   backup {
>         backup=1
>         backup_dir="/etc/lvm/backup"
>         archive=1
>         archive_dir="/etc/lvm/archive"
>         retain_min=10
>         retain_days=30
>   }
>   log {
>         verbose=0
>         syslog=1
>         overwrite=0
>         level=0
>         indent=1
>         command_names=0
>         prefix="  "
>   }
> #
>
> Any hints appreciated!
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
