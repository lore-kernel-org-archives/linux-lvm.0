From: Rich Turner <rich@storix.com>
Message-Id: <1065050019.1267.20.camel@rich>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] create vg with same name as exported vg
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
Date: Wed Oct  1 18:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

i have run into a situation where lvm2 does not behave the same as lvm1.
basically i want to be able to create a vg with the same name as an
exported vg.

in lvm1 (v1.0.3) is was able to export the vg and create a vg with the
same name on a different pv. the original "vgturner4" was on /dev/hda6.
# vgchange -a n vgturner4
# vgexport vgturner4
# pvcreate -ff /dev/hda7
# vgcreate vgturner4 /dev/hda7

in lvm2 (v2.00.07) it complained that there was already a vg with that
name. the original vg was on /dev/sdc.
# vgchange -a n vg1
# vgexport vg1
# pvcreate -ff /dev/sda
# vgcreate vg1 /dev/sda
  A volume group called 'vg1' already exists.

a "vgscan" in lvm1 returns:
# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg0"
vgscan -- found active volume group "vgturner4"
vgscan -- found active volume group "vg0m"
vgscan -- found exported volume group "vgturner4PV_EXP"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
groups

a "vgscan" in lvm2 returns:
# vgscan
Reading all physical volumes.  This may take a while...
  Found exported volume group "vg1" using metadata type lvm2

i notice that the exported vg in lvm1 is actually renamed but in lvm2 it
retains its original name. any ideas on how to accomplish what i want to
do in lvm2?

rich turner
