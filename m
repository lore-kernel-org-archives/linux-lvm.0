From: Sebastian Beneke <sebastian@beneke-it.de>
Message-Id: <20031101142538.34423cb0.sebastian@beneke-it.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] One PV destroyed - now the whole VG isn't working anymore
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
Date: Sat Nov  1 07:27:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi there,

i've got a really big problem. My VG "storage" consists of two PVs:
/dev/hdc (120GB full) and /dev/hde (160GB, 40 GB free). Now /dev/hde
was destroyed by"dd if=/dev/zero of=/dev/diskname bs=1k count=1"

I did these steps until now:

1.) copy back my old files: /etc/lvmconf/ /etc/lvmtab
/etc/lvmtab.d/

2.) take a new hdd (same type and size as my old /dev/hde)

3.) pvcreate /dev/hde

4.) vgcfgrestore -f /etc/lvmconf/storage.conf -n storage /dev/hde

===> This gave me following error: vgcfgrestore -- ERROR
"vg_cfgrestore(): pv_check_consistency" restoring volume group
"storage"

So just replacing the old disk doesn't work for me. I gave it up. But
there are still 120GB of data on /dev/hdc, is there any way I can
rescue this data? It hurts enough to lose 100GB, but I couldn't take
it to lose another 120GB!

I hope anybody can help me out here!


Best Regards
Sebastian
