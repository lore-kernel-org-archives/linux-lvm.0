Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6VFnBwM026987
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 31 Jul 2015 11:49:12 -0400
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mx1.redhat.com (Postfix) with ESMTPS id BD37043EB0
	for <linux-lvm@redhat.com>; Fri, 31 Jul 2015 15:49:10 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so63225335wic.0
	for <linux-lvm@redhat.com>; Fri, 31 Jul 2015 08:49:09 -0700 (PDT)
MIME-Version: 1.0
Sender: gsstark@gmail.com
From: Greg Stark <stark@mit.edu>
Date: Fri, 31 Jul 2015 16:48:30 +0100
Message-ID: <CAM-w4HOxhKjDTfSC4qmdi+JnSqifiKmi6OetXE73CdFT2ciSYg@mail.gmail.com>
Subject: [linux-lvm] Basic failures in lvconvert --replace and lvconvert -m
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

I tried to replace move one of the sides of my raid1 mirrors off a
failing drive onto one of my other drives. And immediately ran into
problems where it seems like lvm failed in really basic ways. I must
be missing something because these seem like basic operations that
should have been working for years.

# lvs --version
  LVM version:     2.02.111(2) (2014-09-01)
  Library version: 1.02.90 (2014-09-01)
  Driver version:  4.30.0
# uname -a
Linux zzz 4.0.0-2-amd64 #1 SMP Debian 4.0.8-1 (2015-07-11) x86_64 GNU/Linux


First I tried:

# lvconvert --replace /dev/sda bits/tmp  /dev/sdc
  device-mapper: reload ioctl on  failed: Invalid argument
  Failed to suspend bits/tmp before committing changes
  Device '/dev/sdc' has been left open (1 remaining references).
  Device '/dev/sda' has been left open (1 remaining references).
  Device '/dev/sdb' has been left open (1 remaining references).
  Internal error: 3 device(s) were left open and have been closed.

I don't know what these errors indicate but it looks like the
operation completed fine except that it left behind the old
"_extracted" volumes that I had to remove manually. I would have hoped
it wouldn't remove the old mirror legs before the new mirror legs were
actually synced since that left me with a degraded mirror with no
redundant copies of the data but I guess that's a feature request.

But then the new raid volumes were 0% synced. And they weren't
resyncing. I tried lvchange --poll y and several other commands and
nothing made them start syncing. It was only when I did lvchange
--raidsyncaction=repair that they finally started syncing.

Later I tried the same operation by manually adding a third raid leg
so I could drop the old one when it was finished syncing. It did that
with lvconvert -m2. It didn't generate the errors above but it caused
the same behaviour. The new legs didn't sync at all. It was only when
I ran lvchange --raidsyncaction=repair that they finally noticed and
started syncing.

Along the way I had to reduce a volume and was met with this frustration:

# lvresize -r -L -50G bits/bits
Do you want to unmount "/bits"? [Y|n] y
y
fsck from util-linux 2.26.2
/dev/mapper/bits-bits: 15/6553600 files (6.7% non-contiguous),
5373198/26214400 blocks
resize2fs 1.42.13 (17-May-2015)
Resizing the filesystem on /dev/mapper/bits-bits to 13107200 (4k) blocks.
The filesystem on /dev/mapper/bits-bits is now 13107200 (4k) blocks long.

  Unable to reduce RAID LV - operation not implemented.



Later I did another --replace with -d and -v later and got a similar error:

# lvconvert -v  -d  --replace /dev/sda bits/music  /dev/sdc
    DEGRADED MODE. Incomplete RAID LVs will be processed.
    Archiving volume group "bits" metadata (seqno 228).
    Creating logical volume music_rmeta_2
    Creating logical volume music_rimage_2
    Extracting 1 image from bits/music
    activation/volume_list configuration setting not defined: Checking
only host tags for bits/music_rmeta_0
    activation/volume_list configuration setting not defined: Checking
only host tags for bits/music_rimage_0
    Loading bits-music_rimage_1 table (253:8)
    Suppressed bits-music_rimage_1 (253:8) identical table reload.
    Loading bits-music_rmeta_1 table (253:7)
    Suppressed bits-music_rmeta_1 (253:7) identical table reload.
    Creating bits-music_rmeta_2
    Loading bits-music_rmeta_2 table (253:39)
    Resuming bits-music_rmeta_2 (253:39)
    Creating bits-music_rimage_2
    Loading bits-music_rimage_2 table (253:40)
    Resuming bits-music_rimage_2 (253:40)
    Loading bits-music table (253:9)
    Not monitoring bits/music
    Suspending bits-music (253:9) with device flush
    Suspending bits-music_rimage_1 (253:8) with device flush
    Suspending bits-music_rmeta_1 (253:7) with device flush
    Suspending bits-music_rimage_0 (253:6) with device flush
    Suspending bits-music_rmeta_0 (253:5) with device flush
    Loading bits-music_rimage_1 table (253:8)
    Suppressed bits-music_rimage_1 (253:8) identical table reload.
    Loading bits-music_rmeta_1 table (253:7)
    Suppressed bits-music_rmeta_1 (253:7) identical table reload.
    Loading bits-music_rmeta_2 table (253:39)
    Suppressed bits-music_rmeta_2 (253:39) identical table reload.
    Loading bits-music_rimage_2 table (253:40)
    Suppressed bits-music_rimage_2 (253:40) identical table reload.
    Resuming bits-music_rimage_1 (253:8)
    Resuming bits-music_rmeta_1 (253:7)
    Resuming bits-music_rimage_0 (253:6)
    Resuming bits-music_rmeta_0 (253:5)
    Resuming bits-music (253:9)
    Monitoring bits/music
    Removing bits-music_rmeta_0 (253:5)
    Removing bits-music_rimage_0 (253:6)
    Loading bits-music_rimage_1 table (253:8)
    Suppressed bits-music_rimage_1 (253:8) identical table reload.
    Loading bits-music_rmeta_1 table (253:7)
    Suppressed bits-music_rmeta_1 (253:7) identical table reload.
    Loading bits-music_rimage_2 table (253:40)
    Suppressed bits-music_rimage_2 (253:40) identical table reload.
    Loading bits-music_rmeta_2 table (253:39)
    Suppressed bits-music_rmeta_2 (253:39) identical table reload.
    Loading bits-music table (253:9)
  device-mapper: reload ioctl on  failed: Invalid argument
  Failed to suspend bits/music before committing changes
  Device '/dev/sdc' has been left open (1 remaining references).
  Device '/dev/sda' has been left open (1 remaining references).
  Device '/dev/sdb' has been left open (1 remaining references).
  Internal error: 3 device(s) were left open and have been closed.



-- 
greg
