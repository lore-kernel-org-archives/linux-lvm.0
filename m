Message-ID: <36DC4FA0.490D8A25@msede.com>
Date: Tue, 02 Mar 1999 21:52:48 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: [linux-lvm] Announcement: LVM 0.6 available.
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com, "linux-kernel@vger.rutgers.edu" <linux-kernel@vger.rutgers.edu>

Hello all.

Since Heinz is currently enjoying his trip to California
i would like to annonce the new LVM version 0.6.

Changes:

- Support for Linux 2.2.2

- The fixed limit of 8 volume groups with up to 31 logical
  volumes each is gone: You can have 1 volume group with up 
  to 256 logical volumes or 99 volume groups with 2 or 3 
  logical volumes each or any combination in between.
  See vgchange(8).

- Sizes can be specified with units now; for example you are 
  able to provide the logical volume size in megabytes, gigabytes 
  and terabytes 8*)

- Read ahead sectors now can be chooseen on a per logical
  volume base with lvcreate(8)/lvchange(8);
  no global setting with lvmchange(8) any longer

- new options s and n for pvscan(8)

- /proc/partitions fully supported with kernel 2.2.1 now


Additional information on Linux LVM is available at
http://linux.msede.com/lvm/

LVM 0.6 is available for download at
ftp://linux.msede.com/lvm/v0.6/

Please note that LVM 0.6 is still considered alpha.


Michael

-- 
Michael Marxmeier           Marxmeier Software GmbH
E-Mail: mike@msede.com      Besenbruchstrasse 9
Voice : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
