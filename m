Message-ID: <3A0F7DFA.90DE9FF0@gnu.org>
Date: Mon, 13 Nov 2000 16:36:58 +1100
From: Andrew Clausen <clausen@gnu.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Removing a PV
References: <Pine.BSO.4.21.0011131308530.14526-100000@loonybin.loonybin.net> <20001113195854.D23680@colombina.comedia.it>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bluca@comedia.it
Cc: linux-lvm@msede.com

Luca Berra wrote:

> ext2resize/resize2fs

or Parted ;-)

	www.gnu.org/software/parted

ext2resize is basically unmaintained, separately from Parted.
(ext2resize and fsresize merged to make Parted, about 1.5 years ago)

So, most people will want to use Parted instead of ext2resize.
The stable new version (1.4.0, out yesterday, hehe) is much more
convienient for RAID and LVM.  I haven't tried it out on LVM
and RAID (it just goes through the raw devices), but it should
be straight-forward.

Actually, could someone check if the procedures in the documentation
are correct?

BTW: the LVM page suggests that we're still making Parted, and it
isn't ready for use.  This is incorrect.  Parted is very stable :-)
It has gone through 3 devel/stable cycles.

Andrew Clausen
