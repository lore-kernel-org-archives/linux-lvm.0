Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] [catch22] lvm vs reiserfs
Date: Thu, 22 Mar 2001 16:06:53 -0500
References: <416700000.985291855@tiny>
In-Reply-To: <416700000.985291855@tiny>
MIME-Version: 1.0
Message-Id: <01032216065300.00692@oscar>
Content-Transfer-Encoding: 8bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: linux-lvm@sistina.com, reiserfs-list@namesys.com

On Thursday 22 March 2001 15:10, Chris Mason wrote:
> On Thursday, March 22, 2001 02:46:31 PM -0500 Ed Tomlinson
>
> <tomlins@cam.org> wrote:
> > Hi,
> >
> > I decided to really try out some of the features built into 2.4.  Using a
> > 2.4.2-ac20 kernel I my root on /dev/lv/root as a reiserfs filesystem.  So
> > far so good.  Now I want to back it up.  So I created a snapshot with
> > lvcreate -L 50 -s -n snap /dev/lv/root.  This works too.  Problem happens
> > when I want to mount /dev/lv/snap to back it up logically.  At this point
> > reiserfs wants to replay its journal....  Of course it cannot
> > (snapshot=ro).
> >
> > How can this be resolved?  Is there a way to sync root just after the lvm
> > data gets updated in /etc but before the snapshot starts?  How else might
> > this be fixed (is it fixed already somewhere)?
>
> Go to ftp.sistina.com, and grab 0.9.1_beta6.  Apply
> linux-2.4.2-VFS-lock.patch that is included in PATCHES directory after
> untarring.  This provides the rest of the lockfs API I coded with the LVM
> guys.

I updated to ac21 with the above patch.  I am using the lvm utilities from:

deb ftp://ftp.sistina.com/pub/LVM/0.9/binaries/debian unstable main

Now I can mount the snapshot.  Thanks.

One loose end, is the journal-1777 message below something to worry about?  

oscar# lvcreate -L 50 -s -n snap /dev/lv/root
lvcreate -- rounding up size to physical extent boundary "52 MB"
lvcreate -- WARNING: the snapshot must be disabled if it gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for "/dev/lv/snap"
journal-1777: buffer 16 bad state !PREPARED !LOCKED !DIRTY !JDIRTY_WAIT
lvcreate -- doing automatic backup of "lv"
lvcreate -- logical volume "/dev/lv/snap" successfully created

TIA,
Ed Tomlinson
