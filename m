From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] reiserfs oops at init
Message-Id: <415570000.1011021807@tiny>
In-Reply-To: <3C42FB04.5060301@liberate.com>
References: <3C42FB04.5060301@liberate.com>
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
Date: Mon Jan 14 09:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


On Monday, January 14, 2002 08:36:36 AM -0700 Chris Worley
<cworley@liberate.com> wrote:

> 
> I installed SuSE 7.3 on a new disk at the end of December, using LVM and a
> reiserfs as a root partition.
> 
> I've been having problems with the ide controller and this disk, causing
> many lock-ups.
> 
> I put the new disk on the secondary controller (which, lvm shouldn't care
> that the disk has changed from hdb to hdd), and the DMA/interrupt problems
> seem to end... and a new problem begins: I can't boot this partition as
> root.  The kernel still boots off /dev/hda1, and the initrd runs, and finds
> the moved volume without any errors, but "init" immediately oopses (after
> reporting it's version number) with "invalid operand: 0000"...  I'm
> guessing this is coming from the reiserfs (sorry for asking this question
> to the lvm group, I don't know a good reiserfs list server).

reiserfs-list@namesys.com ;-)

> 
> I can boot with "init=/bin/sh".  I've run "reiserfsck" with the "--check"
> and "--fix*" options... and there are a lot of errors, and it ends saying
> there are ten errors that can be fixed with "--rebuild-tree" (which I can't
> run with the disk mounted). the "--rebuild-sb" option trys to run, but
> immediately aborts.

Ok, first grab the latest reiserfsck 3.x.1a from
ftp.namesys.com/pub/reiserfsprogs.  What you probably need to do is boot off
the suse CD, and then you'll be able to run reiserfsck --rebuild-tree on your
unmounted root drive.

I'd put the new fsck on a floppy, and run it from there.

If you want to send the errors from reiserfsck --check, I can confirm things
a little better.

-chris
