Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o422sa6w030702
	for <linux-lvm@redhat.com>; Sat, 1 May 2010 22:54:36 -0400
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o422sPa1014470
	for <linux-lvm@redhat.com>; Sat, 1 May 2010 22:54:26 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1O8PK5-0001J5-BS
	for linux-lvm@redhat.com; Sun, 02 May 2010 04:54:25 +0200
Received: from d67-193-197-208.home3.cgocable.net ([67.193.197.208])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 02 May 2010 04:54:25 +0200
Received: from brian by d67-193-197-208.home3.cgocable.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 02 May 2010 04:54:25 +0200
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
Date: Sun, 2 May 2010 02:54:16 +0000 (UTC)
Message-ID: <loom.20100502T044232-383@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove is blocking all other process until the system
	is wedged
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

After having successfully pvmoved two PVs to one larger PV, one LV at a time, 
unfortunately I need to evacuate it.  Easy peasy, just pvmove the data back to 
the PVs they came from, right?  I wish it were so easy.

The problem is that the pvmove starts and makes progress (~16% of ~200GB last 
time) and eventually it, and the rest of the system comes to a grinding halt 
with all processes blocked with similar stack traces to the following:

[ 8499.592155] cron          D 00000000     0 24508   1094 0x00000000
[ 8499.592155]  e6f77e48 00000086 e6f77e48 00000000 00000000 c0846740 d4f082ac 
c0846740
[ 8499.592155]  4b087af2 00000468 c0846740 c0846740 d4f082ac c0846740 c0846740 
e2b79c00
[ 8499.592155]  4a9175b6 00000468 d4f08000 c1a08740 d4f08000 e6f77e94 e6f77e58 
c058994a
[ 8499.592155] Call Trace:
[ 8499.592155]  [<c058994a>] io_schedule+0x3a/0x60
[ 8499.592155]  [<c01c9f2d>] sync_page+0x3d/0x50
[ 8499.592155]  [<c0589f97>] __wait_on_bit_lock+0x47/0x90
[ 8499.592155]  [<c01c9ef0>] ? sync_page+0x0/0x50
[ 8499.592155]  [<c01c9ebe>] __lock_page+0x7e/0x90
[ 8499.592155]  [<c0167790>] ? wake_bit_function+0x0/0x50
[ 8499.592155]  [<c01cc0ca>] filemap_fault+0x39a/0x410
[ 8499.592155]  [<c01e4650>] __do_fault+0x40/0x490
[ 8499.592155]  [<c01ea4fb>] ? mmap_region+0x1fb/0x480
[ 8499.592155]  [<c01e6259>] handle_mm_fault+0x139/0x390
[ 8499.592155]  [<c058da8d>] do_page_fault+0x10d/0x3a0
[ 8499.592155]  [<c01de9cb>] ? sys_mmap_pgoff+0x12b/0x240
[ 8499.592155]  [<c058d980>] ? do_page_fault+0x0/0x3a0
[ 8499.592155]  [<c058b983>] error_code+0x73/0x80

The full list of blocked tasks the last time this happened can be seen at:

http://pastebin.com/CNhDQhTh

Kernel is (Ubuntu's) 2.6.32-21-generic.

Included in this pvmove are the devices hosting the filesystems (i.e. /, /usr, 
/var, /home, etc.) the system is booted on when the pmove is done, if that's 
meaningful.  If I boot from a CD and pvmove this problem does not seem to
occur.

Don't forget though, moving all of these same devices onto the disk that I am 
currently trying to move them off of, worked just fine, even while the system 
was booted and running from the filesystems being moved.  Granted, I was moving 
them one at a time before, rather than just trying to evacuate a whole disk as
I am trying to do currently.

Thots?
