Message-ID: <388E615E.308E3B68@msede.com>
Date: Wed, 26 Jan 2000 03:52:14 +0100
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM seems to break tar and cp "stay-local" option s
References: <88256871.006FAB7E.00@sv-gw1.stsv.seagate.com> <20000126015911.A2968@gruyere.muc.suse.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Andi Kleen <ak@suse.de>
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

Andi Kleen wrote:
> This could explain some NFS failures too. dev_t is part of the nfs
> filehandle given out by knfsd, when two LVs with different file systems
> have the same dev_t it may chose another file with the same inode number.
> Normally it does not matter because knfsd maintains a fh cache that has the
> right file, but when the cache overflows or the nfs server is rebooted
> it could access the file with the same ino on the wrong LV afterwards :/

st_dev looks fine to me (st_rdev looks inconsistent with libc5 for
non dev files).

SuSE 6.3 (glibc 2.1.2), LVM 0.8i:

$ df /usr /var
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/vg00/usr          2031360    783652   1142852  41% /usr
/dev/vg00/var           253920     30048    210768  12% /var

$ ./stat /usr/bin/host /var/tmp/vi.recover
dev=3a00 ino=33505 mode=100755 rdev=0 /usr/bin/host
dev=3a02 ino=32809 mode=41777 rdev=0 /var/tmp/vi.recover

$ ls -l /dev/vg00
...
brw-r-----   1 root     root      58,   0 Dec 23 01:39 usr
brw-r-----   1 root     root      58,   2 Dec 23 01:39 var


SuSE 5.x (libc5), LVM 0.7:

$ df /mnt3
Filesystem         1024-blocks  Used Available Capacity Mounted on
/dev/vg00/lvol1      4098376 3605796   281024     93%   /mnt3

$ ./stat /mnt3/db/db01.vol 
dev=3a00 ino=384770 mode=100600 rdev=84b /mnt3/db/db01.vol

$ ls -l /dev/vg00
...
brw-r-----   1 root     root      58,   0 Nov 19 08:26 lvol1


Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
