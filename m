Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBDNsEr13354
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 18:54:14 -0500
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBDNs3SP005481
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 18:54:09 -0500
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <1102967092.3784.192.camel@tesuji.nac.uci.edu>
References: <1102967092.3784.192.camel@tesuji.nac.uci.edu>
Date: Mon, 13 Dec 2004 15:53:58 -0800
Message-Id: <1102982038.3784.224.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Fedora Core 3 system with lvm2 won't boot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com


Questions:

1) Anyone seen this before?  Redhat or otherwise?

2) Anyone know how I can boot from a rescue CD, and get to a point where
I can attempt to fsck the filesystem, or at least see where in bringing
up LVM2 the system is getting confused?

3) Should I just write off the data on that filesystem as a loss and
start over?  I had/have a bunch of financial records, an opensource app
I was developing, a pretty detailed html to palmdoc conversion setup,
and on in the filesystem.

Is this stuff is in a FAQ somewhere, please just tell me what to google
for.  I've google'd around already, and found essentially nothing.

Yes, I know, I should keep backups.

Thanks!

On Mon, 2004-12-13 at 11:44 -0800, Dan Stromberg wrote:
> 
> Copied from https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=142737
> 
> Description of problem:
> System won't boot
> 
> Version-Release number of selected component (if applicable):
> 
> 
> How reproducible:
> Probably difficult, but easy on my machine.  :)
> 
> Steps to Reproduce:
> 1. Shut down FC3 without sync'ing disks
> 2. Try to boot
> 3. It doesn't.
>   
> Actual results:
> System won't boot
> 
> Expected results:
> System should boot.
> 
> Additional info:
> I have an FC3 system, that was happy, but is now unhappy.  This may be
> related to someone, who shall remain nameless, having shut off the power
> on it without doing an orderly shutdown.  Then again, maybe it was
> because of a "yum -y update", because I put off rebooting for a while
> after that.
> 
> Anyway, now when it tries to boot, I see:
> 
> Red Hat nash version 4.1.18 starting
>   Reading all physical volumes.  This may take a while...
>   Found volume group "VolGroup00" using metadata type lvm2
>   2 logical volume(s) in volume group "VolGroup00" now active
> 
> 
> ...and that's it.  I've left it there for over and hour, and it never
> gets past that.
> 
> I booted off of an FC3 rescue cd, and found that I could mount the /boot
> partition, but I cannot mount the / partition.  I ran various lvm
> commands that identified two lvm volumes on the system.
> fsck'ing /dev/hda2 (which is /) is getting me no where though - it just
> says "invalid argument".
> 
> I tried firing up device mapper and udev in order to get
> a /dev/VolGroup00 directory, but it just wouldn't do it - at least, not
> with the things I tried.  I could mkdir the directory, but then "lvm
> vgmknodes" would remove it.
> 
> What do I need to do to get past this?  There's stuff in the filesystem
> I want quite a bit.  :-S
> 
> I tried all 3 FC3 kernels I have on the system, but none would come up,
> getting stuck at that same point.
> 
> When I boot up into
> the rescue CD and let it try to find my fedora install, it gets really
> confused.  More specifically, it says:
> 
> Searching for Fedora Core installations...
> 
>         0%              install exited abnormally -- received signal 15
>                                 kernel panic - not syncing: Out of
> memory and no killable processes
> 
> 
> If I remove "quiet" and add "single" to my boot options, I get:
> 
> EXT3-fs: INFO: recovery required on readonly filesystem.
> EXT3-fs: write access will be enabled during recovery.
> kjournald starting.  Commit interval 5 seconds
> EXT3-fs: dm-0: orphan cleanup on readonly fs
> 
> ...and there it hangs.
> 
> 
> Also, I ran memtest86 on the box for a while (a little over an hour),
> and found no errors.
> 
> 
> 
> 
