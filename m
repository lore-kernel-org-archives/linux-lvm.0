Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] Re: [catch22] lvm vs reiserfs
Date: Fri, 23 Mar 2001 08:10:49 -0500
References: <416700000.985291855@tiny> <01032216065300.00692@oscar> <01032223332600.01178@oscar>
In-Reply-To: <01032223332600.01178@oscar>
MIME-Version: 1.0
Message-Id: <01032308104900.12752@oscar>
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

On Thursday 22 March 2001 23:33, Ed Tomlinson wrote:

Hi,

Looks like the generated lvm patch stomps all over the
VFS locking stuff...  Guess the correct procedure is
-R VFS, patch lvm, patch VFS.  Will test tonight

Ed

> On Thursday 22 March 2001 16:06, Ed Tomlinson wrote:
>
> Chris et all,
>
> Looks like reiserfs snapshots are broken with beta6 and ac22.
> I had to upgrade to beta6 because of other problems (vgextend
> caused vgscan to fail...).  Now the snapshots are dead again.
> Note the VFS patch is still applied...
>
> oscar# lvcreate -L 1G -s -n snap /dev/lv/root /dev/hda3
> lvcreate -- WARNING: the snapshot must be disabled if it gets full
> lvcreate -- INFO: using default snapshot chunk size of 64 KB for
> "/dev/lv/snap" lvcreate -- doing automatic backup of "lv"
> lvcreate -- logical volume "/dev/lv/snap" successfully created
>
> oscar# mount /dev/lv/snap /snap -treiserfs -oro
> reiserfs: checking transaction log (device 3a:04) ...
> clm-2076: device is readonly, unable to replay log
> Replay Failure, unable to mount
> reiserfs_read_super: unable to initialize journal space
> mount: wrong fs type, bad option, bad superblock on /dev/lv/snap,
>        or too many mounted file systems
>
> Ideas?
> Ed
>
> > On Thursday 22 March 2001 15:10, Chris Mason wrote:
> > > On Thursday, March 22, 2001 02:46:31 PM -0500 Ed Tomlinson
> > >
> > > <tomlins@cam.org> wrote:
> > > > Hi,
> > > >
> > > > I decided to really try out some of the features built into 2.4. 
> > > > Using a 2.4.2-ac20 kernel I my root on /dev/lv/root as a reiserfs
> > > > filesystem. So far so good.  Now I want to back it up.  So I created
> > > > a snapshot with lvcreate -L 50 -s -n snap /dev/lv/root.  This works
> > > > too.  Problem happens when I want to mount /dev/lv/snap to back it up
> > > > logically.  At this point reiserfs wants to replay its journal.... 
> > > > Of course it cannot
> > > > (snapshot=ro).
> > > >
> > > > How can this be resolved?  Is there a way to sync root just after the
> > > > lvm data gets updated in /etc but before the snapshot starts?  How
> > > > else might this be fixed (is it fixed already somewhere)?
> > >
> > > Go to ftp.sistina.com, and grab 0.9.1_beta6.  Apply
> > > linux-2.4.2-VFS-lock.patch that is included in PATCHES directory after
> > > untarring.  This provides the rest of the lockfs API I coded with the
> > > LVM guys.
> >
> > I updated to ac21 with the above patch.  I am using the lvm utilities
> > from:
> >
> > deb ftp://ftp.sistina.com/pub/LVM/0.9/binaries/debian unstable main
> >
> > Now I can mount the snapshot.  Thanks.
> >
> > One loose end, is the journal-1777 message below something to worry
> > about?
> >
> > oscar# lvcreate -L 50 -s -n snap /dev/lv/root
> > lvcreate -- rounding up size to physical extent boundary "52 MB"
> > lvcreate -- WARNING: the snapshot must be disabled if it gets full
> > lvcreate -- INFO: using default snapshot chunk size of 64 KB for
> > "/dev/lv/snap" journal-1777: buffer 16 bad state !PREPARED !LOCKED !DIRTY
> > !JDIRTY_WAIT lvcreate -- doing automatic backup of "lv"
> > lvcreate -- logical volume "/dev/lv/snap" successfully created
> >
> > TIA,
> > Ed Tomlinson
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
