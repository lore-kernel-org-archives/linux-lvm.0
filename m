From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200008011842.e71IgcS27484@webber.adilger.net>
Subject: [linux-lvm] Generic resize tool
Date: Tue, 1 Aug 2000 12:42:38 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

Hello,
I'm wondering if people are interested in having a more generic resize tool
than the current e2fsadm.  I've updated e2fsadm to have support for the
GNU ext2resize tools (ext2resize and ext2online) in addition to resize2fs,
but I was wondering about adding support for reiserfs resizing as well.
At this point e2fsadm isn't a very good name for it anymore.

I was thinking if renaming it to "chfs" the same as AIX LVM tool which
handles both LV and FS resizing, among other things, and does not sound
fs-specific.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
