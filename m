From: Andreas Dilger <adilger@home.com>
Message-Id: <200003081753.KAA04569@webber.adilger.net>
Subject: [linux-lvm] Who uses ext2online?
Date: Wed, 8 Mar 2000 10:53:21 -0700 (MST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux LVM mailing list <linux-lvm@msede.com>
Cc: Linux FS development list <linux-fsdevel@vger.rutgers.edu>

Hello all,
I'm wondering how many people community are using my ext2online program
to resize mounted partitions.  I ask because now that LVM is part of the
base 2.3 kernel, it finally makes sense for the required kernel patches
to also become part of the base kernel.  However, I would like to know
how wide-spread the usage has been to get a fell for how much testing my
patch has received.

I have made a 2.2 and a 2.3 kernel patch available (the 2.3 patch is only
a few lines different than the 2.2 patch because of the diff context).  
The newer patches fix a minor issue with sparse-super ext2 filesystems.
The functioning of the patch has been fundamentally unchanged from 2.0
through 2.3.34 (my last tested kernel), so it should be stable...

There is a new version (1.13) of the ext2resize package available which has
updated ext2online and ext2prepare which handle sparse superblocks correctly:

http://www.math.leidenuniv.nl/~buytenh/ext2resize/devel.html

PLEASE let me know about your usage of ext2online (private email is OK)
so that I can work at getting the kernel patch into the main kernel.  If
you have any issues/problems with the kernel patch or user-space programs
or how they are implemented, speak up now!

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
