From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Message-Id: <20020124170128.A9429@sistina.com>
MIME-Version: 1.0
Subject: [linux-lvm] *** ANNOUNCEMENT *** LVM 1.0.2 available at www.sistina.com
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
Date: Thu Jan 24 10:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

*** ANNOUNCEMENT *** LVM 1.0.2 available at www.sistina.com

Hi all,

LVM 1.0.2 supports both version 1 and 2 of the metadata.

There's *no* need to run any metadata update tools.

A tarball is available now at

   <http://www.sistina.com/>

for download (Follow the "LVM 1.0" link).


This release contains minor changes to LVM 1.0.1 including:

o Linux 2.4.17 support
o sparc 64 fixes (tests needed!)
o persistent LV device minors to support client recovery after
  a NFS server reboot/failover
o ataraid device support
o support loop devices (they do not show up in /proc/partitions) 


See the CHANGELOG file contained in the tarball for further information.

Feed back LVM related information to <linux-lvm@sistina.com>.

Thanks a lot for your support of LVM.
