Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102080133.f181XvH06009@webber.adilger.net>
Date: Wed, 7 Feb 2001 18:33:57 -0700 (MST)
Subject: [linux-lvm] Yay, my LVM is broken.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@sistina.com>

Good news for everyone having LVM problems.  I have now succeeded in
breaking my LVM setup on my development laptop (looks similar to what
Rik is having - segfault in vgscan), so it looks like I will have to fix.

I'm running latest CVS, but with lots of patches, so I don't rule out
that I have broken something.  All I had done was play with vgexport on
a test VG, and then when trying to import it and it was broken.  I ran
vgscan to detect it again, which went and deleted the entries for my
other active VG, and then it broke as well.  No rebooting until it works
I guess.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
