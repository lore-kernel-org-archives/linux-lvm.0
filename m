Date: Sun, 10 Sep 2000 16:44:37 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: [linux-lvm] Re: 2.4.0-test8 LVM(vgscan) on SCSI problems (report)
Message-ID: <20000910164437.A3499@gondor.com>
References: <Pine.LNX.4.21.0009101525490.1920-100000@sjoerd.sjoerdnet>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0009101525490.1920-100000@sjoerd.sjoerdnet>; from iafilius@xs4all.nl on Sun, Sep 10, 2000 at 03:55:46PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iafilius@xs4all.nl
Cc: linux-kernel@vger.kernel.org, linux-lvm@msede.com

On Sun, Sep 10, 2000 at 03:55:46PM +0200, iafilius@xs4all.nl wrote:
> With 2.4.0-test8 (test8-pre6 seems to be OK) vgscan (at
> boottime) "sees" al my volumegroups which are on IDE disk, but not those
> on SCSI disk.
> I had no problems mounting a "plain" ext2 scsi partition on same disk.

Yes, if you look at /proc/partitions, you'll find that all scsi disks are
duplicated. This confuses LVM and it doesn't activate any VG that contains
partitons on SCSI drives. 

If you comment out the last two lines of sd.c (module_init....) LVM works
again. I don't know if this may cause other problems, but I'm just running
such a patched -test8 kernel.

Jan
