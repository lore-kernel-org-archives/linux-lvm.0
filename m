Message-ID: <3D495F05.EA6A374F@blarg.net>
From: ronr <ronr@blarg.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Driver vs. Not Active Groups
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
Date: Thu Aug  1 11:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I am attempting to implement lvm (Linux kernel 2.4.5 Slackware 8.0)
using 2 drives for linux (lilo uses MBR on a 3rd).  After partitioning
the drive, which will become (via copy from current drive) the new home
for the system under lvm (/, /usr, /var, /opt, /tmp, /home ext2fs), I
pvcreated all ok.  When attempting to vgcreate, the volume groups
were not activated with vgcreate and vgchange -a y has no effect either.

When querying alt.os.linux.slackware all I got was suggestions to
install
2.4.18 plus 1.0 lvm.  I would like not to do this, especially since lvm2

is coming out soon, if I can so as not to introduce further
idiosyncrasies (this is a test box).  You would aid my decisioning if
you can tell me:
is it ok to have an lvm driver (per /proc/lvm/global) at 0.9.1_beta2
when
the lvm tools appear to be (per pvcreate -V) 0.9.1_beta6?  Could this
the
cause of inactivity with vgcreate?
Appreciatively,
Ron Riese
