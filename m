Message-ID: <2902.64.34.222.41.1006072992.squirrel@webmail.tekmd.com>
From: <gdurand@tekmd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] badiane:  ERROR: can't remove volume
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
Date: Sun Nov 18 02:40:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

group "Usrlocal" with 1 logical volume.

I was mounting this device on a mount point and it froze.  There was no way
for me to kill it. When I rebooted the system I recieve this error and there
was also an interminable column of invalidate: busy buffer.

Here is the vgdisplay for that group:
[03:34:13] damballah:~# vgdisplay -D Usrlocal
--- Volume group ---
VG Name               Usrlocal
VG Access             read/write
VG Status             NOT available/resizable
VG #                  8
MAX LV                255
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                1
Act PV                1
VG Size               1.11 GB
PE Size               4.00 MB
Total PE              285
Alloc PE / Size       150 / 600.00 MB
Free  PE / Size       135 / 540.00 MB
VG UUID               Lrp1LZ-tEqX-IoUu-Eysp-N7GR-A8ZL-rKf37v

I'm using 1.0.1-rc4.  There were not problems with compilation or anything.

So any and all help would be appreciated.

Badiane
