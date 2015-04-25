Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3PEMYAF004533
	for <linux-lvm@redhat.com>; Sat, 25 Apr 2015 10:22:34 -0400
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t3PEMV5I017055
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 25 Apr 2015 10:22:32 -0400
Received: from cpc3-hari13-2-0-cust210.hari.cable.virginm.net
	([94.174.120.211] helo=stax.localdomain)
	by jazz.pogo.org.uk with esmtps (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
	(Exim 4.85 (FreeBSD)) (envelope-from <mark@xwax.org>)
	id 1Ym0yR-0007sJ-EY
	for linux-lvm@redhat.com; Sat, 25 Apr 2015 15:22:27 +0100
Received: from mark (helo=localhost)
	by stax.localdomain with local-esmtp (Exim 4.84)
	(envelope-from <mark@xwax.org>) id 1Ym0yQ-0002xD-OJ
	for linux-lvm@redhat.com; Sat, 25 Apr 2015 15:22:26 +0100
Date: Sat, 25 Apr 2015 15:22:26 +0100 (BST)
From: Mark Hills <mark@xwax.org>
Message-ID: <1504251520400.3553@stax.localdomain>
MIME-Version: 1.0
Subject: [linux-lvm] Corruption on reattaching cache; reproducible
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

I decided to deploy dm-cache with LVM on my workstation, but soon after 
found myself nursing data corruption.

Once I narrowed it down I found it is easy to re-create: detach a 
writeback cache during file copying, and re-attach it.

The commands I used are below. The summary is:

  1) setup logical volume of writeback cachepool (SSD) plus spinning disk

  2) rsync data to the volume

  3) during rsync, detach the cache

  4) stop rsync and fsck -- volume is OK at this point

  5) re-attach the cache

  6) run fsck -- volume is now bad

I think I hit this when, during deployment, I detached the cache to 
enlarge volume.

According to cache_check the coherency of the cache is valid.

Is it just there is no protection at all to prevent attaching an 
out-of-sync cache to a backing device?

I'd assume the user tools to bring the cache in sync on "lvconvert --type 
cache" (probably by emptying it)

If the observed behaviour is intended, it should probably be warned of 
loudly in the lvmcache(7) man page.

Or is this a sign of actual data corruption by dm-cache?

Many thanks

-- 
Mark


System info:

  $ uname -a
  Linux stax 3.19.5-mh #79 SMP PREEMPT Tue Apr 21 23:27:45 BST 2015 i686 Intel(R) Xeon(R) CPU           E5410  @ 2.33GHz GenuineIntel GNU/Linux

  $ lvm version
  LVM version:     2.02.118(2) (2015-03-24)
    Library version: 1.02.95 (2015-03-24)
    Driver version:  4.29.0

  $ cache_check --version
  0.4.1

# Summary of steps to setup the cache device

  $ lvcreate -n cache-meta -L 512M vg1 /dev/sda10
  $ lvcreate -n cache -L 64G vg1 /dev/sda10
  $ lvconvert --type cache-pool --poolmetadata vg1/cache-meta vg1/cache
  $ lvconvert --type cache --cachepool vg1/cache vg1/origin
  # mkfs.ext4 /dev/vg1/origin
  $ mount /dev/vg1/origin /mnt/test

# Populate with data and check device

  $ rsync /path/to/sources /mnt/test/test-data
  $ umount [...]
  $ fsck /dev/vg1/origin
  <pass>

# Start an rsync

  $ mount [...]
  $ rsync /path/to/sources /mnt/test/test-data

# With rsync RUNNING, detach the cache

  $ lvconvert --splitcache vg1/cache
    Flushing cache for origin.
    Logical volume vg1/origin is not cached and cache pool vg1/cache is unused.

# Shortly after, stop the rsync and fsck

  $ fsck -f /dev/vg1/origin
  <pass>

# Attach the cache and fsck again, it is now corrupt

  $ lvconvert --type cache --cachepool vg1/cache vg1/origin
  $ fsck -f /dev/vg1/origin
  fsck from util-linux 2.21.2
  e2fsck 1.42.8 (20-Jun-2013)
  /dev/mapper/vg1-origin: recovering journal
  Pass 1: Checking inodes, blocks, and sizes
  Pass 2: Checking directory structure
  Pass 3: Checking directory connectivity
  Pass 4: Checking reference counts
  Pass 5: Checking group summary information
  Free blocks count wrong (455389520, counted=448177147).
  Fix<y>? no
  Free inodes count wrong (120759015, counted=120758982).
  Fix<y>? no
  /dev/mapper/vg1-origin: 40217/120799232 files (30.4% non-contiguous), 27795120/483184640 blocks

  $ cache_check /dev/mapper/vg1-cache_cmeta 
  examining superblock
  examining mapping array
  examining hint array
  examining discard bitset

  $ cache_dump /dev/mapper/vg1-cache_cmeta | head
  <superblock uuid="" block_size="128" nr_cache_blocks="524288" policy="cleaner" hint_width="4">
    <mappings>
      <mapping cache_block="484520" origin_block="1802240" dirty="false"/>
      <mapping cache_block="484521" origin_block="1769472" dirty="false"/>
      <mapping cache_block="484522" origin_block="1736704" dirty="false"/>
      <mapping cache_block="484523" origin_block="1703936" dirty="false"/>
      <mapping cache_block="484524" origin_block="1671168" dirty="false"/>
      <mapping cache_block="484525" origin_block="1638400" dirty="false"/>
      <mapping cache_block="484526" origin_block="1605632" dirty="false"/>
      <mapping cache_block="484527" origin_block="1540096" dirty="false"/>

# Detach the cache and the backing volume on spinning disk is now corrupt

  $ lvconvert --splitcache vg1/cache
    Flushing cache for origin.
    Logical volume vg1/origin is not cached and cache pool vg1/cache is unused.

  $ fsck -f /dev/vg1/origin 
  fsck from util-linux 2.21.2
  e2fsck 1.42.8 (20-Jun-2013)
  Pass 1: Checking inodes, blocks, and sizes
  Pass 2: Checking directory structure
  Pass 3: Checking directory connectivity
  Pass 4: Checking reference counts
  Pass 5: Checking group summary information
  Free blocks count wrong (455389520, counted=448177147).
  Fix<y>? no
  Free inodes count wrong (120759015, counted=120758982).
  Fix<y>? no
  /dev/mapper/vg1-origin: 40250/120799232 files (30.4% non-contiguous), 27795120/483184640 blocks

# END
