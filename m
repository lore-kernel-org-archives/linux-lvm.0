From: Holger Steinhaus <hsteinhaus@gmx.de>
Message-ID: <4966875.1042481300@[192.168.1.11]>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Help: unused PV overwritten, recovery of vg possible?
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
Date: Mon Jan 13 11:07:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Dear List,

I am in big trouble. I've added a PV to an existing volume group and then 
accidently overwritten the entire disk containing that newly added physical 
volume (not containing any lvs/data). Now vgscan refuses to accept the 
volume group anymore. Unfortunatly there are no cfg backups not containing 
this new and overwritten PV. Are there any chances to recover the data on 
the old (and physically intact) logical volumes?

My configuration before crash: one vg (vgmain) on one pv (hda5),
three lvs on volume group vgmain. Then added another pv (hdc5) to vgmain 
and overwritten whole harddisk hdc. The result:

vgscan outputs:
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
volume group "vgmain" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

and pvscan:
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hda5"  is associated to unknown VG "vgmain" 
(run vgscan)
pvscan -- total: 1 [44.13 GB] / in use: 1 [44.13 GB] / in no VG: 0 [0]

I tried to vcfgrestore my best cfg backup and got:
$ vgcfgrestore -f /etc/old/lvmconf/vgmain.conf.3.old  /dev/hdc5
vgcfgrestore -- this is a backup of volume group "vgmain"
vgcfgrestore -- ERROR "pv_read(): PV identifier invalid" reading physical 
volume "/dev/hdc5"

Are there any ideas to get the volumes mountable again?

Thanks!

Holger Steinhaus
hsteinhaus@gmx.de
