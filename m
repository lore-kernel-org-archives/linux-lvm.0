Message-ID: <3FE4DE2E.2030705@hasw.net>
From: Sebastian Witt <se.witt@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Endless loop running vgscan
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
Date: Sat Dec 20 17:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hello,

I try to get my LVM1 array (hd[e,f,g,h]1) working with kernel 2.6.0
and LVM2. After installing LVM2.2.00.08 I try to run vgscan, it scans 
the devices and founds the LVM1 labels. But then it runs in a endless
loop:
...........
Ignoring duplicate PV  on /dev/hdg1
Found /dev/hdf1 in VG raid_vg
Ignoring duplicate PV  on /dev/hdf1
Found /dev/hdh1 in VG raid_vg
Ignoring duplicate PV  on /dev/hdh1
Found /dev/hde1 in VG raid_vg
Ignoring duplicate PV  on /dev/hde1
Found /dev/hdg1 in VG raid_vg
Ignoring duplicate PV  on /dev/hdg1
Found /dev/hdf1 in VG raid_vg
Ignoring duplicate PV  on /dev/hdf1
...........

until it get killed by the kernel (Out of Memory).

The VG was created with LVM 1.0.5.

Thanks for any help,
Sebastian
