Date: Wed, 22 Mar 2000 14:51:24 +0100
From: Jan Niehusmann <list039@gondor.com>
Subject: [linux-lvm] snapshots not stable with 2.3.99pre2
Message-ID: <20000322145124.A6838@gondor.com>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

While testing lvm with linux 2.3.99pre2 I had 2 crashes while trying out snapshots.
Without snapshots lvm seems to be stable.

Another problem is (probably) a missing check in lvextend: I tried to extend a
striped lv, and while I had enough space available, nearly all this space was on
one pv, so it was not possible to create a correctly striped volume with the 
extended size. But I didn't get the error message I expected: lvextend told me
everything is ok, but when I tried to ext2resize the filesystem, I got a 
segmentation fault.
