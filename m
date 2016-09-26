Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8Q7sP47018693
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 26 Sep 2016 03:54:25 -0400
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F08703D972
	for <linux-lvm@redhat.com>; Mon, 26 Sep 2016 07:54:23 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id t7so155979594qkh.2
	for <linux-lvm@redhat.com>; Mon, 26 Sep 2016 00:54:23 -0700 (PDT)
MIME-Version: 1.0
From: Giuliano Procida <giuliano.procida@gmail.com>
Date: Mon, 26 Sep 2016 08:54:02 +0100
Message-ID: <CAE-HYsPY0yWvQKYwbm74+pVp2+rr9zard+myAPXzUi+TZ4w1qw@mail.gmail.com>
Subject: [linux-lvm] LVM RAID repair trouble
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
Cc: Giuliano Procida <giuliano.procida@gmail.com>

Original post possibly lost in moderation, this is a repost with more
details and updated information.

Linux hilfy 4.6.0-1-amd64 #1 SMP Debian 4.6.4-1a~test (2016-09-16)
x86_64 GNU/Linux
(essentially stock Debian kernel)

  LVM version:     2.02.164(2) (2016-08-15)
  Library version: 1.02.133 (2016-08-15)
  Driver version:  4.34.0

I have a 5 disk setup. There is one large PV per disk and a single VG.
LVs are mostly raid5 and raid6.

I needed to replace one disk so I researched and tested in a VM
(debian-8.6.0-amd64-netinst.iso) first. Web searching LVM RAID repair
was not too encouraging.

The following recipe worked in the VM:

Shutdown.
Remove one virtual disk.
Add new empty virtual disk.
Boot.
partition
pvcreate, vgextend
3x lvconvert --repair LV
vgreduce --removemissing

I tested this with raid1, raid5 and raid6 LVs spanning all the PVs. It
worked just fine.

I came to do the same with a physical disk change.
Take backups.
Shutdown
Remove one failing disk.
Add new empty disk.
Boot.
partition, pcreate, vgextend

I first repaired the root volume and this worked just fine.

Then I tried to repair the var volume.
I very unfortunately did not keep the error messages (but see below).
They included a complaint about "new device injected into existing
array without 'rebuild' parameter specified" and ended with a failure
to lock something. Based on later research the output was probably:

  WARNING: Failed to connect to lvmetad. Falling back to device scanning.
  Couldn't find device with uuid [UUID].
Attempt to replace failed RAID images (requires full device resync)?
[y/n]:     Accepted input: [y]
  device-mapper: reload ioctl on ([major:minor]) failed: Invalid argument
  Failed to lock logical volume vg0/[LV].
  Failed to replace faulty devices in vg0/[LV].

Various tests showed that /var was still functioning fine (and there
appeared to have been a resync, possibly after I re-ran the command
or touched the var FS).

It was a bit disturbing to see duplicate symlinks (-> ../dm-$n) in
/dev/mapper, but each duplicate was either a _missing or [inactive]
device. The duplicates are no longer there (at least two reboots after
repairing var and one after repairing home). I thought there might be
some odd state in-kernel after the first repair; this is what prompted
me to try repairing the next LV after a reboot.

The net effect is that I now have RAID volumes in an odd state with
extracted / missing images (I think just a cosmetic issue) and which
rebuild on every boot (or rather re-activation and use).
The volumes take a long time to resync, especially concurrently!

I've verified parity (and syndrome) manually - the rebuilds are good
(on to the replacement disk) and no data appear to have been lost or
corrupted. The problem appears to be with the metadata.

I've since tried to repair a fourth RAID volume and collected detailed
diagnostics.

The obvious symptoms are visible in lvs output and in /dev/mapper below.

I've included much relevant information here:
https://drive.google.com/drive/folders/0B8dHrWSoVcaDN0RHTjFjQjdQNW8

This includes kernel logs and full -vvvdddddd output and error of some
commands, plus kernel logs as well as rmeta subLVs and a few utilities
I wrote. Please let me know if any more information would be useful or
whether this all belongs in a bug tracker somewhere.

Thanks for any assistance. I really hope I can get this working properly again.

--gp

Earlier excerpt from lvs -a (I've since lvremove'd the extracted LVs
and tried repairing photos):

  root                     vg0 rwi-aor---  25.00g
              100.00
  [root_rimage_0]          vg0 iwi-aor---   6.25g
  [root_rimage_1]          vg0 iwi-aor---   6.25g
  [root_rimage_2]          vg0 iwi-aor---   6.25g
  [root_rimage_3]          vg0 iwi-aor---   6.25g
  [root_rimage_4]          vg0 iwi-aor---   6.25g
  [root_rmeta_0]           vg0 ewi-aor---   4.00m
  [root_rmeta_1]           vg0 ewi-aor---   4.00m
  [root_rmeta_2]           vg0 ewi-aor---   4.00m
  [root_rmeta_3]           vg0 ewi-aor---   4.00m
  [root_rmeta_4]           vg0 ewi-aor---   4.00m
  var                      vg0 rwi-a-r---  25.00g
              100.00
  var_rimage_0__extracted  vg0 -wi-----p-   6.25g
  [var_rimage_1]           vg0 iwi-aor---   6.25g
  [var_rimage_2]           vg0 iwi-aor---   6.25g
  [var_rimage_3]           vg0 iwi-aor---   6.25g
  [var_rimage_4]           vg0 iwi-aor---   6.25g
  [var_rimage_5]           vg0 iwi-aor---   6.25g
  var_rmeta_0__extracted   vg0 -wi-----p-   4.00m
  [var_rmeta_1]            vg0 ewi-aor---   4.00m
  [var_rmeta_2]            vg0 ewi-aor---   4.00m
  [var_rmeta_3]            vg0 ewi-aor---   4.00m
  [var_rmeta_4]            vg0 ewi-aor---   4.00m
  [var_rmeta_5]            vg0 ewi-aor---   4.00m
  home                     vg0 rwi-aor--- 400.01g
              100.00
  home_rimage_0__extracted vg0 -wi-----p- 133.34g
  [home_rimage_1]          vg0 iwi-aor--- 133.34g
  [home_rimage_2]          vg0 iwi-aor--- 133.34g
  [home_rimage_3]          vg0 iwi-aor--- 133.34g
  [home_rimage_4]          vg0 iwi-aor--- 133.34g
  [home_rimage_5]          vg0 iwi-aor--- 133.34g
  home_rmeta_0__extracted  vg0 -wi-----p-   4.00m
  [home_rmeta_1]           vg0 ewi-aor---   4.00m
  [home_rmeta_2]           vg0 ewi-aor---   4.00m
  [home_rmeta_3]           vg0 ewi-aor---   4.00m
  [home_rmeta_4]           vg0 ewi-aor---   4.00m
  [home_rmeta_5]           vg0 ewi-aor---   4.00m
  photos                   vg0 rwi-aor-p- 600.00g
              100.00
  [photos_rimage_0]        vg0 iwi-a-r-p- 200.00g
  [photos_rimage_1]        vg0 iwi-aor--- 200.00g
  [photos_rimage_2]        vg0 iwi-aor--- 200.00g
  [photos_rimage_3]        vg0 iwi-aor--- 200.00g
  [photos_rimage_4]        vg0 iwi-aor--- 200.00g
  [photos_rmeta_0]         vg0 ewi-a-r-p-   4.00m
  [photos_rmeta_1]         vg0 ewi-aor---   4.00m
  [photos_rmeta_2]         vg0 ewi-aor---   4.00m
  [photos_rmeta_3]         vg0 ewi-aor---   4.00m
  [photos_rmeta_4]         vg0 ewi-aor---   4.00m

Earlier excerpt from ls -l /dev/mapper:

lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-root -> ../dm-10
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rimage_0 -> ../dm-1
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rimage_1 -> ../dm-3
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rimage_2 -> ../dm-5
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rimage_3 -> ../dm-7
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rimage_4 -> ../dm-9
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rmeta_0 -> ../dm-0
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rmeta_1 -> ../dm-2
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rmeta_2 -> ../dm-4
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rmeta_3 -> ../dm-6
lrwxrwxrwx 1 root root       7 Sep 24 01:27 vg0-root_rmeta_4 -> ../dm-8

lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var -> ../dm-21
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rimage_1 -> ../dm-14
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rimage_2 -> ../dm-16
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rimage_3 -> ../dm-18
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rimage_4 -> ../dm-20
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rimage_5 -> ../dm-12
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rmeta_1 -> ../dm-13
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rmeta_2 -> ../dm-15
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rmeta_3 -> ../dm-17
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rmeta_4 -> ../dm-19
lrwxrwxrwx 1 root root       8 Sep 24 02:19 vg0-var_rmeta_5 -> ../dm-11

lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home -> ../dm-32
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rimage_1 -> ../dm-25
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rimage_2 -> ../dm-27
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rimage_3 -> ../dm-29
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rimage_4 -> ../dm-31
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rimage_5 -> ../dm-23
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rmeta_1 -> ../dm-24
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rmeta_2 -> ../dm-26
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rmeta_3 -> ../dm-28
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rmeta_4 -> ../dm-30
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-home_rmeta_5 -> ../dm-22

lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos -> ../dm-45
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rimage_0 -> ../dm-36
lrwxrwxrwx 1 root root       8 Sep 24 01:27
vg0-photos_rimage_0-missing_0_0 -> ../dm-35
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rimage_1 -> ../dm-38
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rimage_2 -> ../dm-40
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rimage_3 -> ../dm-42
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rimage_4 -> ../dm-44
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rmeta_0 -> ../dm-34
lrwxrwxrwx 1 root root       8 Sep 24 01:27
vg0-photos_rmeta_0-missing_0_0 -> ../dm-33
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rmeta_1 -> ../dm-37
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rmeta_2 -> ../dm-39
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rmeta_3 -> ../dm-41
lrwxrwxrwx 1 root root       8 Sep 24 01:27 vg0-photos_rmeta_4 -> ../dm-43
