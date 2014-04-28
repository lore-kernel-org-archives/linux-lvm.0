Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3SJhTOK007810
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2014 15:43:30 -0400
Received: from nm44.bullet.mail.ne1.yahoo.com (nm44.bullet.mail.ne1.yahoo.com
	[98.138.120.51])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id s3SJhRXa004121
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2014 15:43:27 -0400
Message-ID: <1398714193.22411.YahooMailBasic@web165005.mail.bf1.yahoo.com>
Date: Mon, 28 Apr 2014 12:43:13 -0700 (PDT)
From: Nuzhna Pomoshch <nuzhna_pomoshch@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] possible bug in lvm
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

Hi,

I have definitely found a bug somewhere - I just don't
know which program is causing it. :)

I encrypted a (removable) hard drive with the intention
of putting zfs storage pools on it:

# cryptsetup -v luksFormat /dev/sdx
# cryptsetup open /dev/sdx disk

Then I created partitions for the hard drive using gdisk.

[...]
Command (? for help): p 
 Disk /dev/mapper/disk: 732566133 sectors, 2.7 TiB 
 Logical sector size: 4096 bytes 
 Disk identifier (GUID): xxxxxxxxxxxxx-xxxx-xxxx-xxxxxxxxxxxx 
 Partition table holds up to 128 entries 
 First usable sector is 6, last usable sector is 732566127 
 Partitions will be aligned on 256-sector boundaries 
 Total free space is 250 sectors (1000.0 KiB) 

 Number  Start (sector)    End (sector)  Size       Code  Name 
    1             256        16777471   64.0 GiB    8300  01 
    2        16777472        33554687   64.0 GiB    8300  02 
    3        33554688        50331903   64.0 GiB    8300  03 
    4        50331904        67109119   64.0 GiB    8300  04 
    5        67109120        83886335   64.0 GiB    8300  05 
    6        83886336       100663551   64.0 GiB    8300  06 
    7       100663552       117440767   64.0 GiB    8300  07 
    8       117440768       134217983   64.0 GiB    8300  08 
    9       134217984       150995199   64.0 GiB    8300  09 
   10       150995200       167772415   64.0 GiB    8300  10 
   11       167772416       184549631   64.0 GiB    8300  11 
   12       184549632       201326847   64.0 GiB    8300  12 
   13       201326848       218104063   64.0 GiB    8300  13 
   14       218104064       234881279   64.0 GiB    8300  14 
   15       234881280       251658495   64.0 GiB    8300  15 
   16       251658496       268435711   64.0 GiB    8300  16 
   17       268435712       285212927   64.0 GiB    8300  17 
   18       285212928       301990143   64.0 GiB    8300  18 
   19       301990144       318767359   64.0 GiB    8300  19 
   20       318767360       335544575   64.0 GiB    8300  20 
   21       335544576       352321791   64.0 GiB    8300  21 
   22       352321792       369099007   64.0 GiB    8300  22 
   23       369099008       385876223   64.0 GiB    8300  23 
   24       385876224       402653439   64.0 GiB    8300  24 
   25       402653440       419430655   64.0 GiB    8300  25 
   26       419430656       436207871   64.0 GiB    8300  26 
   27       436207872       452985087   64.0 GiB    8300  27 
   28       452985088       469762303   64.0 GiB    8300  28 
   29       469762304       486539519   64.0 GiB    8300  29 
   30       486539520       503316735   64.0 GiB    8300  30 
   31       503316736       520093951   64.0 GiB    8300  31 
   32       520093952       536871167   64.0 GiB    8300  32 
   33       536871168       553648383   64.0 GiB    8300  33 
   34       553648384       570425599   64.0 GiB    8300  34 
   35       570425600       587202815   64.0 GiB    8300  35 
   36       587202816       603980031   64.0 GiB    8300  36 
   37       603980032       620757247   64.0 GiB    8300  37 
   38       620757248       637534463   64.0 GiB    8300  38 
   39       637534464       654311679   64.0 GiB    8300  39 
   40       654311680       671088895   64.0 GiB    8300  40 
   41       671088896       687866111   64.0 GiB    8300  41 
   42       687866112       704643327   64.0 GiB    8300  42 
   43       704643328       721420543   64.0 GiB    8300  43 
   44       721420544       732566127   42.5 GiB    8300  44 

Removed (unplugged), reinserted, remounted, and unlocked the hard drive.
None of the partitions showed up initially.

# ls -al /dev/mapper/
total 0
drwxr-xr-x  2 root root      80 2014-04-27 05:24:20 ./
drwxr-xr-x 17 root root    5260 2014-04-27 05:24:20 ../
crw-------  1 root root 10, 236 2014-04-27 05:06:28 control
lrwxrwxrwx  1 root root       7 2014-04-27 05:24:20 disk -> ../dm-0

# ls -al /dev/dm-0 
brw-rw---- 1 root disk 253, 0 2014-04-27 05:24:20 /dev/dm-0

So I ran partprobe to request that partition tables be re-read:

# partprobe

And only got the first sixteen partitions on the disk.

# ls -al /dev/mapper/
total 0
drwxr-xr-x  2 root root      400 2014-04-27 18:42:29 ./
drwxr-xr-x 17 root root     5580 2014-04-27 18:42:29 ../
crw-------  1 root root  10, 236 2014-04-27 05:06:28 control
lrwxrwxrwx  1 root root        7 2014-04-27 18:42:30 st3000 -> ../dm-0
brw-------  1 root root 253,   1 2014-04-27 18:42:29 st3000p1
brw-------  1 root root 253,  10 2014-04-27 18:42:29 st3000p10
brw-------  1 root root 253,  11 2014-04-27 18:42:29 st3000p11
brw-------  1 root root 253,  12 2014-04-27 18:42:29 st3000p12
brw-------  1 root root 253,  13 2014-04-27 18:42:29 st3000p13
brw-------  1 root root 253,  14 2014-04-27 18:42:29 st3000p14
brw-------  1 root root 253,  15 2014-04-27 18:42:29 st3000p15
brw-------  1 root root 253,  16 2014-04-27 18:42:29 st3000p16
brw-------  1 root root 253,   2 2014-04-27 18:42:29 st3000p2
brw-------  1 root root 253,   3 2014-04-27 18:42:29 st3000p3
brw-------  1 root root 253,   4 2014-04-27 18:42:29 st3000p4
brw-------  1 root root 253,   5 2014-04-27 18:42:29 st3000p5
brw-------  1 root root 253,   6 2014-04-27 18:42:29 st3000p6
brw-------  1 root root 253,   7 2014-04-27 18:42:29 st3000p7
brw-------  1 root root 253,   8 2014-04-27 18:42:29 st3000p8
brw-------  1 root root 253,   9 2014-04-27 18:42:29 st3000p9


# ls -al /dev/dm-*
brw-rw---- 1 root disk 253,  0 2014-04-27 18:42:30 /dev/dm-0
brw-rw---- 1 root disk 253,  1 2014-04-27 18:42:31 /dev/dm-1
brw-rw---- 1 root disk 253, 10 2014-04-27 18:42:30 /dev/dm-10
brw-rw---- 1 root disk 253, 11 2014-04-27 18:42:31 /dev/dm-11
brw-rw---- 1 root disk 253, 12 2014-04-27 18:42:30 /dev/dm-12
brw-rw---- 1 root disk 253, 13 2014-04-27 18:42:31 /dev/dm-13
brw-rw---- 1 root disk 253, 14 2014-04-27 18:42:31 /dev/dm-14
brw-rw---- 1 root disk 253, 15 2014-04-27 18:42:31 /dev/dm-15
brw-rw---- 1 root disk 253, 16 2014-04-27 18:42:31 /dev/dm-16
brw-rw---- 1 root disk 253,  2 2014-04-27 18:42:31 /dev/dm-2
brw-rw---- 1 root disk 253,  3 2014-04-27 18:42:31 /dev/dm-3
brw-rw---- 1 root disk 253,  4 2014-04-27 18:42:30 /dev/dm-4
brw-rw---- 1 root disk 253,  5 2014-04-27 18:42:30 /dev/dm-5
brw-rw---- 1 root disk 253,  6 2014-04-27 18:42:30 /dev/dm-6
brw-rw---- 1 root disk 253,  7 2014-04-27 18:42:31 /dev/dm-7
brw-rw---- 1 root disk 253,  8 2014-04-27 18:42:30 /dev/dm-8
brw-rw---- 1 root disk 253,  9 2014-04-27 18:42:30 /dev/dm-9

I am also wondering if the entries in /dev/mapper should just
be links to /dev/dm-nn (as the entry for the entire disk is), but
that is more of a secondary issue.

The first sixteen partitions are set up correctly, but the rest
of the partitions are not, and I need to figure out how to make
them visible so I can access them.

# dmsetup ls
st3000p2        (253:2)
st3000p1        (253:1)
st3000p16       (253:16)
st3000  (253:0)
st3000p9        (253:9)
st3000p15       (253:15)
st3000p8        (253:8)
st3000p14       (253:14)
st3000p7        (253:7)
st3000p13       (253:13)
st3000p6        (253:6)
st3000p12       (253:12)
st3000p5        (253:5)
st3000p11       (253:11)
st3000p4        (253:4)
st3000p10       (253:10)
st3000p3        (253:3)

Would appreciate your thoughts and help.

Thank you in advance.

Nuzhna
