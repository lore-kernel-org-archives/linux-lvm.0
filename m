Return-Path: <mason@suse.com>
Date: Mon, 11 Dec 2000 09:58:18 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] How do you mount a snapshot?
Message-ID: <1033740000.976546698@coffee>
In-Reply-To: <20001210224808.B3772@archimedes.oak.suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com


On Sunday, December 10, 2000 22:48:08 -0800 David Gould <dg@suse.com> wrote:

> On Fri, Dec 08, 2000 at 09:30:50PM +0100, Christian Limpach wrote:
>> > Ok, so we are agreeing, it does not work on ext2 either unless you sync
>> > and do not write between the sync and the snapshot. Doable, but not
>> exactly
>> > "safe".
>> 
>> hmm, I think it works for ext2 because you can always mount an ext2
>> filesystem even if it's in an inconsistent state.  This is what happens
>> everytime when your machine panics and you need to fsck your disks during
>> the reboot, the root filesystem is mounted read-only...  It's my
> 
> Ok, but then you have an inconsistant filesystem. Which is not exactly
> what I think of as "works" or "safe". My point was that snapshots are
> great, but don't make the problem of consistancy magically disappear.
> 

Yes.  With ext2, the admin can take steps to make his FS consistent during
the snapshot.  It would be a painful manual process, but it is at least
possible.

It would not be useful for snapshots to allow reiserfs disks to be mounted
without a journal replay though.  An inconsistent ext2 FS might have a few
directories screwed up, or a rename in progress, or some bad bitmaps  (or
much worse, but we are pretending things are normal here).  But, most of
the time it will be mostly valid.

reiserfs just has one btree for everything, so if the snapshot comes in the
middle of a given operation, it affects the btree for the whole FS.  This
means an inconsistent reiserfs disk has a much higher chance of having
serious problems, almost regardless of the type of operation that was going
on.  So, the snapshot API does two things.  It waits for all transaction
operations to finish, and then it blocks new ones until the snapshot is
setup.

Christian, just let me know if that doesn't answer your question.

-chris
