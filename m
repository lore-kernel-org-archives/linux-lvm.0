From: Kianusch Sayah Karadji <kianusch.sayah.karadji@sk-tech.net>
Message-ID: <Pine.LNX.4.40.0208051637060.13454-100000@arthur>
MIME-Version: 1.0
Subject: [linux-lvm] Is this a bug?
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
Date: Mon Aug  5 09:39:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@sistina.com

Hi!

My Kernel 2.4.19+LVM 1.0.5 (also 2.4.18+LVM 1.0.3) makes the following
kern.log entry:

 Aug 5 17:05:10 srfs01 kernel: lvm -- lvm_blk_ioctl: unknown command 0x24b

When executing:

 fsck -c /dev/datavg/ora_u02_lv

The File-System used is ext3.  The Distribution is debian 2.2 - with
kernel 2.4.x.

Regards
  Kianusch
