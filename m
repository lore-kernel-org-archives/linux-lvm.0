From: "Robert Dyas" <rdyas@adelphia.net>
Date: Thu, 18 Oct 2001 16:35:06 -0400
Message-ID: <MGEFJOBFIEAIADIKAMEKCECCCDAA.rdyas@adelphia.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshots
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Snapshot questions:

1)Has anyone had any luck creating a snapshot (lvcreate -L100M -s -n backup
/dev/vg_master/lv_home) and then mounting it (mount -r /dev/vg_master/backup
/mnt)? If so, what version of the kernel, mount tools, filesystem, etc are
you using?

2) How can you use the snapshot feature to facilitate incremental or
differential backups? Wouldn't the dump or other backup program have to
twiddle the archive bit, but won't be able to since snapshots are readonly?
Any insight here would be appreciated.

Thanks!

Rob
