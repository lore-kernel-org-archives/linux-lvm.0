From: Greg Freemyer <freemyer@NorcrossGroup.com>
Mime-Version: 1.0
Message-Id: <20020930205951.QYHW19870.imf15bis.bellsouth.net@TAZ2>
Subject: [linux-lvm] Corrupted LVM, need help
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
Date: Mon Sep 30 15:59:12 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM Mailing list <linux-lvm@sistina.com>

All,

I have a LVM based data disk with 3 LVs.  My OS disks are _not_ LVM based.

We had a lightning storm over the weekend, and an old kernel (2.4.18) got 
booted when the machine was powered back on.  I have 2.4.19 running again now.

Now I get the following:

SuSEbox:~ # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sda1"  is associated to unknown VG "TruStore-Data" 
(run vgscan)
pvscan -- total: 1 [55.91 GB] / in use: 1 [55.91 GB] / in no VG: 0 [0]

SuSEbox:~ # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "lv_read_all_lv(): number of LV" can't get data of volume group 
"TruStore-Data" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

SuSEbox:~ # 

Any ideas on how to restore my LVM config tables (VGDAs ??).  I think LVM keeps 
backups somewhere.


Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
