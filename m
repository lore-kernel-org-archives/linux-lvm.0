From: Damir Dezeljin <programing@mbss.org>
Message-ID: <Pine.LNX.4.44.0310050117170.3619-100000@Server.mbss.org>
MIME-Version: 1.0
Subject: [linux-lvm] VFS lock patch for 2.4.22 ???
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
Date: Sat Oct  4 19:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM <linux-lvm@sistina.com>

Hi.

I have to use kernel 2.4.22 on my box (due to new drivers and fixes),
however I also have to use LVM10 snapshots (Debian Woody) on the same box
(I already have an volume group and logical volumes configured).

The problem is that I'm using ext3 on the logical volumes and when I try
to mount an snapshot I got an error.


Is there an VFS-lock patch for kernel 2.4.22?
If not ... is there any other way to get work mounting of ext3 snapshots
with kernel 2.4.22?

Regards,
Dezo
