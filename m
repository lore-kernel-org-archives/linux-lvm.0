Date: Sat, 23 Sep 2000 00:58:01 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: [linux-lvm] e2fsadm and fstab
Message-ID: <20000923005801.A2164@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM mailing list <linux-lvm@msede.com>


Is the following behaviour wanted?

If a filesystem is listed in /etc/fstab, but currently not mounted, e2fsadm
checks for the availability of ext2online, and if it doesn't find it, it 
aborts with an error message. The check is in e2fsadm.c, lines 275ff.

IMHO it doesn't matter if a fs is mentioned in fstab. If it's not mounted,
we can resize it without ext2online.

Jan
