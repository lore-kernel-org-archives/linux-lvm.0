Date: Wed, 26 Jan 2000 01:59:11 +0100
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] LVM seems to break tar and cp "stay-local" option s
Message-ID: <20000126015911.A2968@gruyere.muc.suse.de>
References: <88256871.006FAB7E.00@sv-gw1.stsv.seagate.com>
Mime-Version: 1.0
In-Reply-To: <88256871.006FAB7E.00@sv-gw1.stsv.seagate.com>; from Steve_J_Brueggeman@notes.seagate.com on Tue, Jan 25, 2000 at 02:19:21PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve_J_Brueggeman@notes.seagate.com
Cc: "Jakma, Paul" <Paul.Jakma@compaq.com>, "'linux-lvm@msede.com'" <linux-lvm@msede.com>

On Tue, Jan 25, 2000 at 02:19:21PM -0600, Steve_J_Brueggeman@notes.seagate.com wrote:
> Well, a quick of the tar source code reveals that they're using a stat(2) and
> checking
> parent_device != current_stat.st_dev
> 
> to determine if the filesystem has changed.
> 
> I just did a stat(1) on some files, (using LVM 0.7), and it always returns a
> minor number of 0, no matter what Logical Volume the file I checked lives on.
> 
> Then again, I got the same result on files that reside on plain SCSI partitions
> (I have root and /usr on /dev/sda1 and /dev/sda3 respectively)
> 
> System is RedHat 5.2, running linux-2.2.14 with LVM patches.
> 
> On a RedHat 6.0 system running linux-2.3.40 W/O LVM patches, /usr/bin/stat
> returned expected device numbers.
> 
> I need to look into this a bit further.  More to come....

This could explain some NFS failures too. dev_t is part of the nfs
filehandle given out by knfsd, when two LVs with different file systems
have the same dev_t it may chose another file with the same inode number.
Normally it does not matter because knfsd maintains a fh cache that has the
right file, but when the cache overflows or the nfs server is rebooted
it could access the file with the same ino on the wrong LV afterwards :/

-Andi
