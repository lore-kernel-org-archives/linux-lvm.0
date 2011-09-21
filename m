From: Lukas Czerner <lczerner@redhat.com>
Date: Wed, 21 Sep 2011 18:45:19 +0200
Message-Id: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [RFC][PATCH 00/35] fsadm update
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
Content-Type: text/plain; charset="utf-8"
To: zkabelac@redhat.com
Cc: dchinner@redhat.com, rwheeler@redhat.com, linux-lvm@redhat.com

Hello everyone,

as I mentioned before I started a project to extend existing fsadm
script to provide user friendly tool to build the storage all the way up
the stack from dm, md to file systems. Basically the tool with the ease
of use of btrfs-progs. This is my first attempt to merge my changes of
fsadm into upstream.

I am not going to (once again) describe all the changes I have made. The
best way to see the new fsadm feature is to look at updated manual
page (patch 31), fo your convenience I am going to put some parts into the
mail as well.

Not only I have made quite a lot of changes, but I have also added tests to
validate the new features so we will be able to catch regressions. One thing
might be a bit confusing though. It is the fact that there are so many
patches with some functionality scattered between more of them. The reason
is, that while I was adding more features the fsadm infrastructure needed
to change as well. It was not possible for me to simply add one functionality,
polish it and the go to the other. However I have tried to clean the commits
as much as I cold. If you have any troubles with that, please let me know!

Note that fsadm update is not quite complete yet. It is just the first
attempt to push the changes I have upstream to be able to continue to make
more changes without the painful rebase at the end and also to collect some
very much needed feedback. Note that features like support for mirrors,
snapshots and raids will follow.

So here is description of some features ripped of the manual page.

Comments are welcomed.

Thanks!

USAGE:

fsadm [ OPTIONS ] COMMAND [ COMMAND_OPTIONS ] [ ... ]

fsadm [ OPTIONS ] check [ --help ] device

fsadm  [  OPTIONS  ]  resize [ --help ] [ size=Size | size=+Size | size=-Size ] [ device...  ]
volume

fsadm [ OPTIONS ] create [ --help ] [ stripesize=StripeSize  ]  [  name=Name  ]  [  fs=Type  |
fstyp=Type ] [ size=Size ] [ stripesStripes ] [ device...  ] [ pool ]

fsadm [ OPTIONS ] list [ --help ] [ filesystems | fs ] [ device | dev ] [ pool ]

fsadm [ OPTIONS ] add [ --help ] device [ device...  ] [ pool ]

fsadm [ OPTIONS ] remove [ --help ] [ --all ] item [ item...  ]

COMMANDS:

*check*
Check the file system on device using fsck.

*resize*
Change the size of the logical volume and file system on it. You can specify  size=Size
to  resize  to  given  Size,  or  size=+Size to extend the volume by the given Size, or
size=-Size to shrink the volume by the given Size.  If no Size is provided  the  volume
will  be  resized to its maximum size.  You can also specify one or more devices to use
for extending the volume.  If the device is not in any pool, it will be added the  vol‐
ume's  pool  prior the resize. Note that some file system (namely xfs) does not support
shrinking. Also some file system does not support online resize, it means that it  will
be  unmounted  before  the resize and then mounted back afterwards. It will also happen
when you specify -e, --ext-offline for extN file systems, or if you're trying to shrink
the  file  system  since  none  of supported file system supports online shrinking. And
finally, some file systems (namely xfs) does not support offline resize, it means, that
the file system will be mounted prior to resize and then unmounted afterwards.

*create*
Create a new logical volume from the pool, optionally with the defined file system. You
can specify Type of the file system which will be automatically created on the new log‐
ical volume. Currently only ext3, ext4 and xfs file systems are supported. You can cre‐
ate striped volume by defining the  StripeSize.   In  that  case,  if  Stripes  is  not
defined, then number of provided devices will be used. Either devices or Stripes has to
be defined if StripeSize is provided, otherwise fsadm does not have enough  information
to  proceed  in  creating  new  logical  volume.  Note that if no pool is specified the
default pool will be used.

*list*
List devices, file systems and pools in your system. You can select to list all logical
volumes  by  specifying filesystems, or fs.  Or you can select to list all pools in the
system by specifying pool.  Or you can also select to list all devices in the system by
specifying  devices,  or  dev,  however  note  that  this  will not list any DM device.
Optionally you can specify any combination of the above options to  list  whatever  you
desire,  or  you can simply omit the option. In that case it will list everything as if
all options has been specified.

*add*
Add one, or more devices into the pool.  If no pool is specified, provided devices will
be  added  into the default pool. Note that, if any device is already part of the same,
or different pool, it will be skipped.

*remove*
Remove one, or more logical volumes, devices, or pools defined by items.  You can  also
specify --all to remove all pools corresponding volumes from your system.

EXAMPLES:

To add device /dev/sdb into the default pool run this command:

    fsadm add /dev/sdb

You can also add mode devices into another pool called mypool

    fsadm add /dev/sdc /dev/sdd /dev/sde mypool

To create a 300GB linear logical volume with ext4  file  system  using  devices  /dev/sda  and
/dev/sdb you can use the following command:

    fsadm create fs=ext4 size=300G /dev/sda /dev/sdb

Of  course,  we are assuming that /dev/sda and /dev/sdb does have at least 300GB of space when
combined, otherwise the volume creation would fail.

Now let's create 500GB striped volume with stripe size of 16KB and xfs file system using  four
devices.  It means that Stripes will be equal to 4, however note that we do not need to define
Stripes manually if we are listing devices as follows:

    fsadm create fs=xfs size=500G stripesize=16 /dev/sda /dev/sdb /dev/sdc /dev/sdd

Now, if we assume that we already have at least four devices  in  the  default  pool,  we  can
achieve the same result by calling:

    fsadm create fs=xfs size=500G stripesize=16 stripes=4

To shrink the default_pool/lvol001 logical volume by 10G we can simply call

    fsadm resize size=-10G default_pool/lvol001

Or we can extend it by 1T using more devices which are not in the pool just yet:

    fsadm resize size=+1T default_pool/lvol001 /dev/sde /dev/sdf

To remove the above logical volume we can use the following command:

    fsadm remove default_pool/lvol001

or we can simply remove the whole pool, wiping all logical volumes in it:

    fsadm remove default_pool

Alternatively we can remove all pools in the system by calling:

    fsadm remove --all


PATCHES:

[PATCH 01/35] fsadm: Add "create" command
[PATCH 02/35] fsadm: Add "destroy" command
[PATCH 03/35] fsadm: Add "list" command
[PATCH 04/35] fsadm: Make "create" command more vg aware
[PATCH 05/35] fsadm: Teach "destroy" command to take more arguments
[PATCH 06/35] fsadm: Simple cleanup and comment update
[PATCH 07/35] fsadm: Create "add" command
[PATCH 08/35] fsadm: Update "list" command for better alignment
[PATCH 09/35] fsadm: Specify number of stripes when no device is
[PATCH 10/35] fsadm: Print type of the volume in filesystem listing
[PATCH 11/35] fsadm: Add "remove" command
[PATCH 12/35] fsadm: Try to avoid calling LVM in the loops
[PATCH 13/35] fsadm: Merge "destroy" and "remove" into one command
[PATCH 14/35] fsadm: Allow to remove all volume groups
[PATCH 15/35] fsadm: Make all internal math in kilobytes
[PATCH 16/35] fsadm: Use warn for warnings in list command
[PATCH 17/35] fsadm: Handle resize if there is no file system
[PATCH 18/35] fsadm: Fsck extN before resize only if it is not
[PATCH 19/35] fsadm: Align numbers to the decimal point
[PATCH 20/35] fsadm: Add simple configuration file
[PATCH 21/35] fsadm: Use DEFAULT_POOL when creating volume group
[PATCH 22/35] fsadm: Add LVOL_PREFIX configuration option
[PATCH 23/35] fsadm: Only use readlink if link is provided
[PATCH 24/35] fsadm: Remove unnecessary modification of PATH
[PATCH 25/35] fsadm: Allow to specify size without "size=" prefix in
[PATCH 26/35] fsadm: Allow to specify lv in vg/lv format
[PATCH 27/35] fsadm: error out when no size is provided in resize
[PATCH 28/35] fsadm: Umount ext2 file system prior resize
[PATCH 29/35] lvresize: Specify --resize-fs-only when going to use
[PATCH 30/35] test: add helper to compute aligned lv size
[PATCH 31/35] fsadm: Add help for new commands and update man page
[PATCH 32/35] fsadm: Update authorship of the fsadm
[PATCH 33/35] test: Add test for fsadm add command
[PATCH 34/35] test: Add test for fsadm create command
[PATCH 35/35] test: Add test for fsadm resize command
