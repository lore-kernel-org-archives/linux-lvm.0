Message-Id: <2D0AFEFEE711D611923E009027D39F2B02F124@cdserv.meridian-data.com>
From: "Stephenson, Dale" <dstephenson@snapserver.com>
Subject: RE: [linux-lvm] kernel: invalidate: busy buffer
MIME-Version: 1.0
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
Date: Tue Apr 16 10:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

The invalidate: busy buffer message comes from fs/buffer.c, inside
invalidate_bdev().  It's just a warning message indicating the buffer has a
positive b_count -- presumably, somebody is still using it.  In this case,
the code *doesn't* destroy the buffer, so it should be harmless.  Don't know
why you're getting millions of them, though.  I remember seeing them before
(during vgscan), but never in that quantity.

I also don't know why your lvcreate dumps core.  How recent are your LVM
tools?  Try using the -d option to lvcreate to see how far it gets, or run
lvcreate from within gdb.

Dale J. Stephenson
steph@snapserver.com
