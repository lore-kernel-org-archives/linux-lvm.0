From: Andrew Schaefer <andrew@schaefer.nu>
Message-Id: <Pine.LNX.4.33.0201062011010.681-100000@Prometheus.schaefer.nu>
MIME-Version: 1.0
Subject: [linux-lvm] vgscan problem
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
Date: Sun Jan  6 19:29:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I just setup LVM with two disks in the volume group big_space.  I started
out with one disk and then extended it across the other.  It
formatted, fs extended, and mounted up fine.  I then rebooted, and now I
get this error from vgscan:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "big_space"
vgscan -- ERROR "pv_read_pe(): read" can't get data of volume group
"big_space"
from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

Any ideas or suggestions?  Unfortunately I threw data onto the volume and
don't want to loose it.

Andrew Schaefer
andrew@schaefer.nu
http://www.schaefer.nu
