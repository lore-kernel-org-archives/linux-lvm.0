From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] Keep snapshots active for 24 hours?
Message-ID: <20011217040753.C4880@tiger.bigcats.invalid>
References: <20011214113804.I940@lynx.no> <NBBBKLKHMJHIJLHOGAOJKELIJCAA.steve.wray@the.net.nz> <20011216202511.D26924@tiger.bigcats.invalid> <3C1D1B23.2080805@birddog.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C1D1B23.2080805@birddog.com>; from kbohling@birddog.com on Sun, Dec 16, 2001 at 04:07:31PM -0600
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
Date: Sun Dec 16 21:12:09 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Kirby!

Kirby C. Bohling (kbohling@birddog.com) wrote 88 lines:

> 	While the concept of a writeable LVM is cool, I believe LVM operates a 
> low enough level that the migrations you speak of is impossible at the 
> LVM level (in the kernel).

Moving the *complete* snapshot onto the LVM should be easy:
lock the FS (or be very clever), replay the changes in the
snapshot and migrate them onto the parent (i.e. look up the
page mapping and write the used pages onto their respective
pages in the parent).

Moving just selective parts has to be done as a FS-level
tool, though, you are right there.

> It would be cool to have an filesystem diff, 
> but on a live filesystem that could be quite tricky.  Essentially, that 
> would be a differential backup utility.

Well, that's what a snapshot is, isn't it?  Just that it
operates on (usually) 4M pages...

> 	A writeable LVM would solve the problem of taking a snapshot of a 
> journalling filesystem.

Actually there is a patch to do that even while the journalled
FS is mounted.  You also have to allow that change by enabling
it in the LVM-kernel-sourcecode by changing a #define.

Cleanly umounted partitions should be no problem, they have
no log that needs a replay.

Anyway, there are more useful things you can do with
writable snapshots; just think of an error-resistant system.
Everything happens on the big-enough snapshots, but you can
reset the system in a snap; just drop all the snapshots and
recreate them.  This is far faster than copying or extracting
a .tar.gz, and the 'base system' is easier to upgrade, too.

-Wolfgang
