From: "Zameer M" <zameer@india.hp.com>
Message-ID: <00fa01c22327$0de25a70$6a754c0f@india.hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] kernel panicked when mounting XFS LVM volumes on kernel-2.4.17-ia64
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
Date: Thu Jul  4 01:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, linux-xfs@oss.sgi.com

Hi,

   Kernel panicked when mounting XFS LVM volumes.

The following is configuration used.
1)kernel-2.4.17
2)linux-2.4.17-ia64-011226.diff
3)linux-2.4.17-xfs-2002-02-07.cvs-patch
4)lvm-1.1-rc1


new# mount -t xfs /dev/volg00/lvol1 /xfs

Segmentation fault

Jul  4 11:09:49 new kernel: I/O error in filesystem ("lvm(58,0)") meta-data
dev 0x0 block 0x0
Jul  4 11:09:49 new kernel:        ("xfs_read_buf") error 1023875264 buf
count 0
Jul  4 11:09:49 new kernel: Unable to handle kernel NULL pointer
dereferencemount[715]: Oops 8804682956800
Jul  4 11:09:49 new kernel:
Jul  4 11:09:49 new kernel: Pid: 715, comm:                mount
Jul  4 11:09:49 new kernel: psr : 0000101008022018 ifs : 8000000000000004 ip
: [xfs_reclaim+1280/1344]    Not tainted
Jul  4 11:09:49 new kernel: psr : 0000101008022018 ifs : 8000000000000004 ip
: [<e000000004700620>]    Not tainted
Jul  4 11:09:49 new kernel: unat: 0000000000000000 pfs : 000000000000040c
rsc : 0000000000000003
Jul  4 11:09:49 new kernel: rnat: 3736353433323130 bsps: e00000003bef7870 pr
: 69566a668996a957
Jul  4 11:09:49 new kernel: ldrs: 0000000000000000 ccv : 0000000000000000
fpsr: 0009804c8a70033f
Jul  4 11:09:49 new kernel: b0  : e0000000046f8d90 b6  : e0000000049840c0 b7
: e000000004987820


LVM is working well with ext2 filesystem. Is it a XFS problem?

Regards
zameer
