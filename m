Message-Id: <3EDE1623.1000504@vsf.renault.fr>
From: Serge Rossi <Serge.Rossi@renault.com>
MIME-Version: 1.0
References: <20030602131232.GB9679@wh9155.stw.uni-rostock.de> <20030602170507.B6678@sistina.com> <20030603193935.GA16294@wh9155.stw.uni-rostock.de>
In-Reply-To: <20030603193935.GA16294@wh9155.stw.uni-rostock.de>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM + software Raid 5 : freeze when using snapshots.
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
Date: Wed Jun  4 10:53:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I'm using two IBM file servers (Samba, NFS...) running RH 7.2 (with 
latest updates) and LVM over software Raid 5.

RH Kernel 2.4.20-13.7 (Including LVM 1.0.3)
lvm tools and lib 1.0.5

Hardware : Dual Xeon MP (HT activated) + 1 GB Ram

Each server have 14 * 73 GB Disks for the datas.
md0 and md1 are RAID 5 units of 7 disks each, both included in a VG.

The VG is subdivded into several 100 GB LV and some free space for 
snapshots.

Without snapshots, everything runs perfectly : 2 months without problems 
with 1500 Windows PCs (SMB clients) and 500 SGI Workstations (NFS 
clients). Load on the servers is between 0.1 and 1.0.

We tried to snapshot 3 LV each night. After 2 or 3 days (6 or 9 
snapshots stored in the VG), the load on the servers was between 2.0 and 
3.0 but sometimes one of the servers stop responding.

The kernel is still responsive to ping or Sysrq but not on the command 
line, even on the console.

No activity at all on the disks.

Sysrq S only syncs the system disk (not in the VG) but did not sync the
LVs. Reboot is the only way out.

Nothing special in messages (no Oops).


We removed the snapshots and the servers are stable again.
I have not tried to test what is the number of snapshots required to 
freeze the servers (difficult on production servers !!!).


Did anybody have any idea on this problem ?

Are the servers too weak to handle the load caused by the snapshots ?

-- 
   ----------------------------------------------------------------------
    Serge Rossi - System & Network Architect  Tel : +33 (0)1 34 55 91 14
                 iDVU - Renault               Fax : +33 (0)1 34 55 92 25
   ----------------------------------------------------------------------
