Message-Id: <199910072242.AAA18522@e35.msede.com>
Subject: Re: [linux-lvm] Problems with e2fsadm
Date: Fri, 8 Oct 99 0:42:55 MESZ
In-Reply-To: <m11ZHs9-000D4UC@londo.rhein-main.de>; from "Torsten Neumann" at Oct 7, 99 8:02 pm
From: Michael Marxmeier <mike@msede.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

> I'm having some problems with e2fsadm when using 4096 as blocksize for my
> ext2 filesystem. e.g
>       lvcreate -L 100 -n /dev/vg00/lvoltest vg00
>       mke2fs -b 4096 /dev/vg00/lvoltest
>       e2fsadm -L 200 /dev/vg00/lvoltest
> gives something like
>       ...
>       lvextend -- logical volume "/dev/vg00/lvoltest" successfully extended
>
>       ext2_resize_fs: your container (i.e. the file or partition the
>                                       filesystem) is in is not big enough for
a filesystem of
>                                       204800 blocks (it's only 51200 blocks)

This is a bug in e2fsadm which will be fixed with LVM 0.8.
As a workaround you can perform the steps manually.

To extend the file system:

  e2fsck     - required by resize2fs
  lvextend   - resize the lvol
  resize2fs  - resize the fs

To reduce the file system:

  e2fsck     - required by resize2fs
  resize2fs  - resize the fs
  lvreduce   - resize the lvol


Hope this helps
Michael


--
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
