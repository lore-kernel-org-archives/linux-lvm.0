Date: Tue, 5 Sep 2000 14:29:18 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: [linux-lvm] [ANNOUNCE] lvmadm tool
Message-ID: <20000905142918.A31869@ns.lst.de>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

The program lvmadm is intended to replace e2fsadm and
do other tasks in the future.
The major advantage is it's support for generic resize
tools. You simply put your resize tool to /sbin/resizefs.fstype
(or /sbin/oresizefs.fstype for online resizing) and lvmadm will
use it. For some tools (e.g. the reiserfs resize tool) you
will need a wrapper script in this place to use the right 
calling convention.

The code can be found at ftp.openlinux.org/pub/people/hch/lvm

	Christoph

-- 
Always remember that you are unique.  Just like everyone else.
