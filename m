Message-ID: <OF6E8EDB48.F77BF8AC-ON85256BF9.00510385@pok.ibm.com>
From: "Steve Pratt" <slpratt@us.ibm.com>
MIME-Version: 1.0
Subject: [linux-lvm] Locking error with LVM2
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
Date: Wed Jul 17 09:48:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I can't seem to create a snapshot volume using LVM2 with device mapper.
Here is the output.  Any idea what is wrong?
The original volume is active and mounted.

[root@slpratt share]$ lvm
lvm> vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "g1" using metadata type lvm1
lvm> vgdisplay g1
  --- Volume group ---
  VG Name               g1
  System ID             slpratt997724963
  VG Access             read/write
  VG Status             resizable
  MAX LV                256
  Cur LV                1
  Max PV                256
  Cur PV                2
  VG Size               3.22 GB
  PE Size               4.00 MB
  Total PE              825
  Alloc PE / Size       74 / 296.00 MB
  Free  PE / Size       751 / 2.93 GB
  VG UUID               RQl0zu-hGo8-IV5n-b6Mb-ljFL-LDDy-YPWiWo

lvm> lvdisplay
  --- Logical volume ---
  LV Name                /dev/g1/org
  VG Name                g1
  LV UUID                000000-0000-0000-0000-0000-0000-000000
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                296.00 MB
  Current LE             74
  Segments               1
  Allocation             next free
  Read ahead sectors     0
  Block device           254:0
lvm> lvcreate -L296M -c8k -n snap g1/org
  /var/lock/lvm/V_g1/org: open failed: No such file or directory
<--------
  Can't get lock for g1/org
lvm> lvscan
  ACTIVE            '/dev/g1/org' [296.00 MB]
lvm>







EVMS Development - http://www.sf.net/projects/evms
Linux Technology Center - IBM Corporation
(512) 838-9763  EMAIL: SLPratt@US.IBM.COM
