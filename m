From: Tony Likhite <tony@likhite.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200210171053.03775.tony@likhite.net>
Subject: [linux-lvm] vgimport says "ERROR: wrong number of physical volumes"
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
Date: Thu Oct 17 10:04:53 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

The boot drive in my dual-drive system was dying, so I pvmoved all its PEs 
to the other drive and vgreduced it from its VG (rootvg).  During a reboot 
after completing the vgreduce, the boot drive died.

However, when I connected the remaining (good) drive to another system, 
vgscan reported a duplicate volume group ID (as I recall), and made a VG 
on the new machine (vg00) inaccessible.  rootvg was fine, and I was able 
to mount LVs from it, though.

To get back vg00, I vgexported rootvg.  However, now when I try to import 
it again, vgimport fails with "wrong number of physical volumes".

How can I fix this?  Is it possible to edit the definition of rootvg and 
reduce the PV count?  I'm reasonably sure that all the PEs are intact on 
the remaining drive, and the VG definition is the only thing that's off.

Thanks.

Tony
