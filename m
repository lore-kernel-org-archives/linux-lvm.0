Return-Path: <mason@suse.com>
Date: Fri, 08 Dec 2000 09:09:57 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] How do you mount a snapshot?
Message-ID: <323270000.976284597@coffee>
In-Reply-To: <20001207223300.D25533@archimedes.oak.suse.com>
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


On Thursday, December 07, 2000 22:33:00 -0800 David Gould <dg@suse.com>
wrote:

> On Thu, Dec 07, 2000 at 03:56:11PM -0500, Chris Mason wrote:

[ snapshots ]

>> It should work with ext2.
> 
> Really? I wonder. Maybe right after a sync before anything gets dirtied,
> but otherwise, how could the disk image be consistantly, er, consistant?
> And would not e2fsck have the same issues about writing?
> 
> Or did I just wake up pessimistic today?
> 

The reason it will not work on reiserfs without the extra API is that on
reiserfs, sync == commit to log, not commit to disk.  So, there is no way
over the command line (or in the kernel) to ask the FS to sync to disk,
even when there is no traffic at all on the FS.

With ext2, if nothing is going on, you can type sync and have all the
buffers on disk.  It is at least possible ;-)  It would be better if ext2
could provide the write suspension hooks as well, but I'm guessing that
will be done in ext3 first (where the journal already does most of the
work).

In my mind, the people that need snapshots the most are the database
programs, where disk traffic can be carefully controlled. So the current
ext2 method is still useful.

-chris
