Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
References: <200006182251.QAA15919@lynx.turbolabs.com>
From: "Martin K. Petersen" <mkp@linuxcare.com>
Date: 21 Jun 2000 19:28:11 +0200
In-Reply-To: Andreas Dilger's message of "Sun, 18 Jun 2000 16:51:01 -0600 (MDT)"
Message-ID: <yq1aegfgd04.fsf@tyra.mkp.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolabs.com>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

>>>>> "Andreas" == Andreas Dilger <adilger@turbolabs.com> writes:

Andreas> Having used both the AIX LVM, the Linux LVM, and the good-old
Andreas> DOS partitions, I would have to disagree with your statement
Andreas> that logical extents are of very little benefit.  One of the
Andreas> worst things to do in a DOS-partitioned world is to resize
Andreas> the partitions themselves.  You always have to over-estimate
Andreas> the partition sizes in case you need more space in the
Andreas> future, or add a whole new partition if you run out of space
Andreas> in the existing partition.

Andreas, you are preaching to the choir.  Partitions don't belong in
an LVM architecture at all.  They are a legacy thing which needs to go
away.

Also, I don't tend to agree with most of the infrastructure proposed
in the IBM whitepaper.  If IBM's intention is that this will be a
cross-OS LVM architecture, well then fine -- lots of abstractions are
obviously needed.

If it is supposed to be Linux specific, however, I don't see why one
would waste engineering resources implementing plug-ins for reading
Macintosh partitions types etc.  We already have an adequate framework
for that in the kernel.


The scheme I've been toying with over the past months:

 - Logical Disk = Either partition or whole disk.

 - The Logical Disk provides allocation space for extents.

 - Extents are allocated on the available logical disks based upon
   heuristics in the feature set/system administrator preferences.

 - Logical Volume consists of one or more extents accessed through one
   or more feature sets (RAID0, RAID1, RAID5, encryption, whatever).

The extents can be of varying size depending on the application.  A 30
GB RAID5 LV could be constructed from 4 x 10 GB extents on 4 different
physical disks + a 10 GB hot spare extent on a fifth disk, for
instance.

-- 
Martin K. Petersen      Principal Linux Consultant, Storage
http://mkp.net/         Linuxcare, Inc.
