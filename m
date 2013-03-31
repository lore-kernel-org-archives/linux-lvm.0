Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2VHFdNW005204
	for <linux-lvm@redhat.com>; Sun, 31 Mar 2013 13:15:39 -0400
Received: from Ishtar.hs.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2VHFb5l031746
	for <linux-lvm@redhat.com>; Sun, 31 Mar 2013 13:15:38 -0400
Received: from [192.168.4.12] (Athenae [192.168.4.12])
	by Ishtar.hs.tlinx.org (8.14.5/8.14.4/SuSE Linux 0.8) with ESMTP id
	r2VHFYMa032121
	for <linux-lvm@redhat.com>; Sun, 31 Mar 2013 10:15:36 -0700
Message-ID: <51586F35.2080606@tlinx.org>
Date: Sun, 31 Mar 2013 10:15:33 -0700
From: L A Walsh <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] benefit of lvmetad in simply daily snaps?
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
To: LVM general discussion and development <linux-lvm@redhat.com>



I was just noticing that there was an lvmetad available in the sources,
but that
my distro doesn't build/include it by default.  I'm wondering what it's
benefits
are.


Besides my system volumes, all my data & backup volumes are on lvm. 
Main thing
I've been using lvm for is to generate daily snapshots then using rsync to
create static snaps/day that I then mount and keep around for about a month.

I mount them in a dated directory under the root such that samba users
on windows
can see 'previous versions' of files that have changed over the past few
days-
month.  It's not designed to be a backup replacement, but more of a desktop
convenience.  With the pruning I end up with about 15 static snaps of my
main samba volume and, of course 1 active snap going, started daily.

So I'm not sure I have that much metadata to keep track of (my script reads
it in nightly in ms, to reconstruct it's view of things so it know what to
expire, where to try recovery from if it got interrupted in the middle of
making a snap copy, and whether or not the snaps need mounting after a
reboot.

So where would a lvmetad fit in or is my case too simple to really benefit?

Just sorta wondering why SuSE doesn't include/build it by default...

Thanks,
