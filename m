From: Craig Tierney <ctierney@hpti.com>
Message-ID: <20020510102555.C17216@hpti.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] More problems with lvm detection/activation
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
Date: Fri May 10 11:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I am still having problems with my volume groups.
Before I was having the problem I would try and
activate one group, but it would think it is another.
I gave some incorrect information last time when
I thought I figured out how to get the group active.

My problem is that after loading lvm-mod I have volume
groups with the same number.  Below is an example.  Note
that VG # shows the groups have the same number.  They
are on physically different devices.  All are interconnected
with Fiber channel.  I do have other nodes that use other
lvm groups off of the same hardware, but no two nodes use
the same group.

Running vgscan -f does not help the situation.  Maybe I volume
groups from different nodes.   I am willing to delete sdd2_vol5
as it isn't used yet, but I want to make sure that it doesn't delete
sdd_vol4.

Thanks,
Craig

[root@x05 /root]# vgdisplay -D sdd_vol4
--- Volume group ---
VG Name               sdd_vol4 
VG Access             read/write
VG Status             NOT available/resizable
VG #                  11
MAX LV                255
Cur LV                1
Open LV               0
MAX LV Size           511.98 GB
Max PV                255
Cur PV                2
Act PV                2
VG Size               488.27 GB
PE Size               8 MB
Total PE              62498
Alloc PE / Size       62498 / 488.27 GB
Free  PE / Size       0 / 0
VG UUID               cBSzp4-kauE-Tv0N-SC3r-6mAi-RGw0-zwTbDC


[root@x05 /root]# vgdisplay -D sdd2_vol5
--- Volume group ---
VG Name               sdd2_vol5 
VG Access             read/write
VG Status             NOT available/resizable
VG #                  11
MAX LV                255
Cur LV                0
Open LV               0
MAX LV Size           511.98 GB
Max PV                255
Cur PV                1
Act PV                1
VG Size               499.98 GB
PE Size               8 MB
Total PE              63998
Alloc PE / Size       0 / 0
Free  PE / Size       63998 / 499.98 GB
VG UUID               4vO7k1-U5Xi-H1rm-i3Uy-gIl9-MOgS-21zU0F



-- 
Craig Tierney (ctierney@hpti.com)
