From: Andreas Dilger <adilger@turbolabs.com>
Message-Id: <200006290510.e5T5AJx22109@webber.adilger.net>
Subject: [linux-lvm] What IOP version for 0.8final?
Date: Wed, 28 Jun 2000 23:10:19 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>

I was looking in linux-2.4.0-test1 and I see that the IOP version is 6
(and no changes in test2 AFAICS).  However, in 0.8final/tools/lib/lvm.h
the IOP version is 7 and the lvm.h is slightly different there than with
the kernel (e.g. the lv_block_exception version is different).

Which one is correct?  Is one of these two lvm.h files ignored (likely
tools/lib/lvm.h)?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
