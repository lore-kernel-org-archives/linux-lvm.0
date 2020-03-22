Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE04FB17D8
	for <linux-lvm@redhat.com>; Sun, 22 Mar 2020 17:57:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FE168CC922
	for <linux-lvm@redhat.com>; Sun, 22 Mar 2020 17:57:49 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id z125so7220294vsb.13
	for <linux-lvm@redhat.com>; Sun, 22 Mar 2020 10:57:46 -0700 (PDT)
MIME-Version: 1.0
From: Scott Mcdermott <scott@smemsh.net>
Date: Sun, 22 Mar 2020 10:57:35 -0700
Message-ID: <CACRKOwz_fOJiTVhbUqJR_EaxrKbf2bk+wb6LYOy0yWDkvt+buw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] when bringing dm-cache online,
	consumes all memory and reboots
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
To: linux-lvm@redhat.com

have a 931.5 GibiByte SSD pair in raid1 (mdraid) as cache LV for a
data LV on 1.8 TebiByte raid1 (mdraid) pair of larger spinning disk.
these disks are hosted by a small 4GB big.little ARM system
running4.4.192-rk3399 (armbian 5.98 bionic).  parameters were set
with: lvconvert --type cache --cachemode writeback --cachepolicy smq
--cachesettings migration_threshold=10000000

the system lost power recently.  after coming back up from the crash
and resyncing the raid pair (no issues there), I get the disks online
and "lvchange -ay" the dm-cache device.  the system immediately starts
consuming all memory over the next few seconds, system used memory is
going up to 3500M (last I can see), cached is going down to 163M (last
I can see), the kernel kills all processes (they are faulting in
ext4_filemap_fault -> out_of_memory -> oom_kill_process)

so this happens every time I reboot and try it.  is 4G just not enough
system memory to run a dm-cache device? it was in perfect working
order before the crash and nicely optimizing my nightly rsyncs on top
of the cached device.  why's it going crazy when it goes online (third
second in below dstat 1), resulting in crashing system? how do I get
it online to remove my data from it?

usr sys idl wai stl| read  writ| int   csw | used  free  buff  cach
  2   3  95   0   0|   0     0 | 450   594 |93.9M  413M 10.3M 3184M
  0   0 100   0   0|   0     0 |  78   130 |93.4M  413M 10.3M 3184M
  2   6  91   1   0|8503k    0 |2447  4554 | 111M  393M 10.3M 3187M
  5   9  78   7   0|  11M   34k|7932    16k| 145M  358M 10.3M 3187M
  3  25  60  12   0| 277M 6818k|5385    10k| 602M 22.1M 10.4M 3068M
  9  64  21   5   0| 363M  124M|5509  9276 |1464M 39.9M 10.3M 2211M
  2  31  40  27   0| 342M  208M|5487  9495 |1671M 21.8M 10.3M 2027M
  1  10  63  26   0|  96M  128M|2197  4051 |1698M 23.9M 10.3M 1999M
  1  15  55  29   0| 138M  225M|2361  5007 |1730M 25.3M 10.3M 1966M
  3  16  54  28   0| 163M  234M|3118  5021 |1768M 23.8M 10.3M 1930M
  1   8  58  33   0|  85M  128M|1541  2860 |1795M 24.3M 10.3M 1904M
  2  10  53  35   0|  97M  161M|1949  3275 |1820M 24.1M 10.3M 1879M
  3  16  55  26   0| 148M  235M|2927  4733 |1865M 24.1M 10.3M 1835M
  1   9  65  25   0|  83M  137M|1764  3521 |1891M 23.9M 10.3M 1810M
  5  59  29   6   0| 340M   97M|4291  5530 |3569M 39.5M 10.3M  163M
  2  22  51  25   0| 339M  236M|5985  9526 |3500M  109M 10.3M  163M

note: tried adding some swap on unrelated slow disk, which seems to
delay it by some seconds, but ultimate result is always the same: OOM
every process killed and reboot...

here is paste from "lvs -a" just before "lvchange -ay
raidbak4/bakvol4" which brings the system down:

  LV                VG       Attr       LSize    Pool        Origin
  [bakcache4]       raidbak4 Cwi---C--- <931.38g
  [bakcache4_cdata] raidbak4 Cwi------- <931.38g
  [bakcache4_cmeta] raidbak4 ewi-------   48.00m
  bakvol4           raidbak4 Cwi---C---    1.75t [bakcache4] [bakvol4_corig]
  [bakvol4_corig]   raidbak4 owi---C---    1.75t
  [lvol0_pmspare]   raidbak4 ewi-------   48.00m

this lvchange then brings the system down with OOM death within 10 or
so seconds.  online access to the cached data seems to be
impossible...
