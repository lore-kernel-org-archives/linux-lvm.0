From: "Mitch Miller" <mitch@mdmiller.com>
Message-ID: <000201c16088$c16c6610$0101a8c0@mdmiller.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011029084748.E4182@tykepenguin.com>
Subject: [linux-lvm] What is VFS
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
Date: Mon Oct 29 08:45:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Can somebody help me out?  On a Linux box (Redhat 7.1, Kernel 2.4.12) I've
started seeing VFS: Disk change detected on device sr(11,?) where ? is
either 0 or 1 (they're usually in pairs, once with a 0 and once with a 1).

I guess I'm not _for_sure_ what VFS is, and why it'd be detecting so many
(literally hundreds per hour) disk changes.  I do have a standard floppy,
and a SCSI attached (Adaptec 2940) Iomega Jazz drive.  The drive has a
single LVM partition on it, but it's not currently mounted (I've not fully
implemented LVM on this box yet).

THanks,
Mitch
