MIME-Version: 1.0
In-Reply-To: <CAANaKqd98zjbv2Mh60aeny=UL8oMGadGcLUXgOURbQmnFxojEA@mail.gmail.com>
References: <CAANaKqdnGfgxxHwQVA+L3uNDe5aMydssLius94wcp6LxA1-w+g@mail.gmail.com>
	<CAANaKqdPjq9sK=DvZjDDSm8Vd_28C1k2i2xLyTrkFzwVq69NZw@mail.gmail.com>
	<CAANaKqdRgfcZvUZXUgwSX-WXaQ0K=yg6ubDGwRkMk8mU+bDpUw@mail.gmail.com>
	<CAANaKqcv2bF1X1S3L5xi-7HOsV2J29a4BvhMjiqwigRm2SGbVw@mail.gmail.com>
	<CAANaKqd98zjbv2Mh60aeny=UL8oMGadGcLUXgOURbQmnFxojEA@mail.gmail.com>
From: Jim Haddad <jimhaddad46@gmail.com>
Date: Sun, 3 Jun 2018 19:47:35 -0700
Message-ID: <CAANaKqeKDaBcAHAh91ycm9SwB0gDD+cNHqsAVkW6y-RzNzgifg@mail.gmail.com>
Subject: Re: [linux-lvm] "write failed.. No space left", "Failed to write VG",
 and "Failed to write a MDA"
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
To: linux-lvm@redhat.com, teigland@redhat.com, agk@redhat.com, ejt@redhat.com

Writing past the end of the disk seems to be fixed in git master.

Looks like the culprit is lib/format_text/format-text.c::_vg_write_raw().

I think the past the end of the disk bug got added in the days before
2.02.177 was released by some of the Alasdair G Kergon commits to the
function regarding wrapping and rounding.  I am not 100% positive of
this.

I think this commit reverting those changes FIXES the bug:

commit 00f1b208a1bf44665ec97a791355b1fcf525a3a7
Author: Joe Thornber <ejt@redhat.com>
Date:   Fri Apr 20 10:43:50 2018 -0500

    [io paths] Unpick agk's aio stuff

It also might be fixed/helped by David Tiegland's commits regarding bcache.



Hoping I understood the situation well enough that it wouldn't cause
harm, using 2.02.177, I ran:

# lvcreate -ddddddvvvv -V200G lvm/disk3thin -n test3
...
#device/dev-io.c:654           Closed /dev/sdh3
#device/dev-io.c:599           Opened /dev/sdh3 RW O_DIRECT
#device/dev-io.c:168           /dev/sdh3: Block size is 512 bytes
#device/dev-io.c:179           /dev/sdh3: Physical block size is 4096 bytes
#device/dev-io.c:96            Read  /dev/sdh3:     512 bytes (sync)
at 4096 (for VG metadata header)
#device/dev-io.c:255           Widening request for 130 bytes at 81920
to 512 bytes at 81920 on /dev/sdh3 (for VG metadata content)
#device/dev-io.c:96            Read  /dev/sdh3:     512 bytes (sync)
at 81920 (for VG metadata content)
#format_text/format-text.c:799           Writing lvm metadata to
/dev/sdh3 at 106496 len 20934 (rounded to 24576) of 20934 aligned to
4096
#device/dev-io.c:96            Write /dev/sdh3:   24576 bytes (sync)
at 106496 (for VG metadata content)
#device/dev-io.c:96            Read  /dev/sdh3:     512 bytes (sync)
at 4993488781312 (for extra VG metadata header)
#device/dev-io.c:255           Widening request for 130 bytes at
4993488936960 to 512 bytes at 4993488936960 on /dev/sdh3 (for extra VG
metadata content)
#device/dev-io.c:96            Read  /dev/sdh3:     512 bytes (sync)
at 4993488936960 (for extra VG metadata content)
#format_text/format-text.c:799           Writing lvm metadata to
/dev/sdh3 at 4993488961536 len 20934 (rounded to 24576) of 20934
aligned to 4096
#device/dev-io.c:96            Write /dev/sdh3:   24576 bytes (sync)
at 4993488961536 (for extra VG metadata content)
#device/dev-io.c:129     /dev/sdh3: write failed after 24064 of 24576
at 4993488961536: No space left on device
#device/dev-io.c:288           <backtrace>
#format_text/format-text.c:806           <backtrace>
#metadata/metadata.c:3055          <backtrace>
#metadata/metadata.c:3064    Failed to write VG lvm.
#device/dev-io.c:96            Read  /dev/sdh3:     512 bytes (sync)
at 4096 (for VG metadata header)
#device/dev-io.c:255           Widening request for 130 bytes at 81920
to 512 bytes at 81920 on /dev/sdh3 (for VG metadata content)
#device/dev-io.c:96            Read  /dev/sdh3:     512 bytes (sync)
at 81920 (for VG metadata content)
#format_text/format-text.c:920           Wiping pre-committed lvm
metadata from /dev/sdh3 header at 4096
#device/dev-io.c:96            Write /dev/sdh3:     512 bytes (sync)
at 4096 (for VG metadata header)
#metadata/lv_manip.c:7802          <backtrace>
#metadata/lv_manip.c:8078          <backtrace>
#lvcreate.c:1652          <backtrace>
#toollib.c:1987          <backtrace>
...



With git master, I ran the same command.  It no longer says exactly
how much and where it's writing, just the header address.  But, it
doesn't give an error, so I'm hoping it's properly handling the
situation again:
...
#format_text/format-text.c:331           Reading mda header sector
from /dev/sdh3 at 4096
#format_text/format-text.c:790           Committing lvm metadata (550)
to /dev/sdh3 header at 4096
#format_text/format-text.c:331           Reading mda header sector
from /dev/sdh3 at 4993488781312
#format_text/format-text.c:790           Committing lvm metadata (550)
to /dev/sdh3 header at 4993488781312
#format_text/format-text.c:331           Reading mda header sector
from /dev/sdg3 at 4096
#format_text/format-text.c:790           Committing lvm metadata (550)
to /dev/sdg3 header at 4096
#format_text/format-text.c:331           Reading mda header sector
from /dev/sdg3 at 4993488781312
#format_text/format-text.c:790           Committing lvm metadata (550)
to /dev/sdg3 header at 4993488781312
#format_text/format-text.c:331           Reading mda header sector
from /dev/sdf3 at 4096
#format_text/format-text.c:790           Committing lvm metadata (550)
to /dev/sdf3 header at 4096
#format_text/format-text.c:331           Reading mda header sector
from /dev/sdf3 at 4993488781312
#format_text/format-text.c:790           Committing lvm metadata (550)
to /dev/sdf3 header at 4993488781312
#format_text/format-text.c:331           Reading mda header sector
from /dev/sde3 at 4096
#format_text/format-text.c:790           Committing lvm metadata (550)
to /dev/sde3 header at 4096
...



So, I'm thinking I can upgrade to git master, or at least 178-rc1, and
leave mda1 incredibly small.  While knowing that if my VG XML a bit
more than doubles beyond the 48,640 available in mda1 for it, I'd need
to run "vgconvert --pvmetadatacopies 1" or move the data off and back
on.
