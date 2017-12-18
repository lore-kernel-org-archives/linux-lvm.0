Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4141584D25
	for <linux-lvm@redhat.com>; Mon, 18 Dec 2017 16:48:42 +0000 (UTC)
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4607CC056827
	for <linux-lvm@redhat.com>; Mon, 18 Dec 2017 16:48:41 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id q14so6327695qke.7
	for <linux-lvm@redhat.com>; Mon, 18 Dec 2017 08:48:41 -0800 (PST)
MIME-Version: 1.0
From: Thanos Makatos <thanos.makatos@onapp.com>
Date: Mon, 18 Dec 2017 16:48:19 +0000
Message-ID: <CAM2wQBucairMqzmBb8+g4Lw06mvYKUwp0-x3aguwXpHQNPsNew@mail.gmail.com>
Subject: [linux-lvm] lvm filter not ignoring block device
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
To: linux-lvm@redhat.com

I'm trying to do a very simple test were a single block device should
be ignored by LVM as a result of setting the filter directive in
lvm.conf. However, it isn't. That block device happens to be a DM
target (mapped to the zero target):

# dmsetup create foo7 --table "0 $((1*1024*1024*1024/512)) zero"

The filter in lvm.conf is not honored, here's how it's set:

devices {
     ...
     filter = [ "r|/dev/mapper/foo7|" ]
     ...
}

I did run vgscan after editing lvm.conf. The relevant output of strace:

# strace -o strace lvs -vvvv -d > lvs 2>&1
...
stat("/dev/mapper/foo7", {st_mode=S_IFBLK|0660, st_rdev=makedev(253,
4), ...}) = 0
open("/dev/mapper/foo7", O_RDONLY|O_DIRECT|O_NOATIME) = 5
fstat(5, {st_mode=S_IFBLK|0660, st_rdev=makedev(253, 4), ...}) = 0
write(2, "#device/dev-io.c:533         ", 29) = 29
write(2, "Opened /dev/mapper/foo7 RO O_DIR"..., 35) = 35
write(2, "\n", 1)                       = 1
ioctl(5, BLKGETSIZE64, 1073741824)      = 0
write(2, "#device/dev-io.c:310       ", 27) = 27
write(2, "/dev/mapper/foo7: size is 209715"..., 41) = 41
write(2, "\n", 1)                       = 1
close(5)                                = 0
write(2, "#device/dev-io.c:587         ", 29) = 29
write(2, "Closed /dev/mapper/foo7", 23) = 23
write(2, "\n", 1)                       = 1
write(2, "#ioctl/libdm-iface.c:1795       "..., 34) = 34
write(2, "dm status   (253:4) OF   [16384]"..., 37) = 37
write(2, "\n", 1)                       = 1
ioctl(4, DM_TABLE_STATUS, 0x7fa013383190) = 0
stat("/dev/mapper/foo7", {st_mode=S_IFBLK|0660, st_rdev=makedev(253,
4), ...}) = 0
open("/dev/mapper/foo7", O_RDONLY|O_DIRECT|O_NOATIME) = 5
fstat(5, {st_mode=S_IFBLK|0660, st_rdev=makedev(253, 4), ...}) = 0
write(2, "#device/dev-io.c:533         ", 29) = 29
write(2, "Opened /dev/mapper/foo7 RO O_DIR"..., 35) = 35
write(2, "\n", 1)                       = 1
ioctl(5, BLKBSZGET, 4096)               = 0
write(2, "#device/dev-io.c:144         ", 29) = 29
write(2, "/dev/mapper/foo7: block size is "..., 42) = 42
write(2, "\n", 1)                       = 1
ioctl(5, BLKPBSZGET, 512)               = 0
write(2, "#device/dev-io.c:155         ", 29) = 29
write(2, "/dev/mapper/foo7: physical block"..., 50) = 50
write(2, "\n", 1)                       = 1
lseek(5, 0, SEEK_SET)                   = 0
read(5,

It's stuck forever in read(2). And the output of lvs -vvvv -d:

# grep -E "foo7|dm-4" lvs
#device/dev-cache.c:338         /dev/dm-4: Added to device cache
#device/dev-cache.c:335         /dev/mapper/foo7: Aliased to /dev/dm-4
in device cache (preferred name)
#device/dev-cache.c:335         /dev/disk/by-id/dm-name-foo7: Aliased
to /dev/mapper/foo7 in device cache
#device/dev-cache.c:335         /dev/block/253:4: Aliased to
/dev/mapper/foo7 in device cache
#device/dev-io.c:533         Opened /dev/mapper/foo7 RO O_DIRECT
#device/dev-io.c:310       /dev/mapper/foo7: size is 2097152 sectors
#device/dev-io.c:587         Closed /dev/mapper/foo7
#device/dev-io.c:533         Opened /dev/mapper/foo7 RO O_DIRECT
#device/dev-io.c:144         /dev/mapper/foo7: block size is 4096 bytes
#device/dev-io.c:155         /dev/mapper/foo7: physical block size is 512 bytes

The LVM version is:

# lvm version
  LVM version:     2.02.118(2)-RHEL6 (2015-09-08)
  Library version: 1.02.95-RHEL6 (2015-09-08)
  Driver version:  4.33.1

Is this how it's supposed to work? Am I missing something?

-- 
Thanos Makatos
