Message-ID: <23233866A70C32479532C8D0B8AE7B96025D72DC@i2km07-ukbr.domain1.systemhost.net>
From: narsimha.kulkarni@bt.com
MIME-Version: 1.0
Subject: [linux-lvm] VG and PV
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
Date: Wed May 28 10:18:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

i had created a volume group and physical volume some time back.
I want to delete it and recreate it. the conf file is also not there.

when I do a pvscan, i get

pvscan -- inactive PV "/dev/hda3"  is associated to an unknown VG (run
vgscan)

and when i do a vgscan, i get

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "helena_vg"
vgscan -- ERROR "lv_read_all_lv(): number of LV" can't get data of volume
group)
vgscan -- found active volume group "volg"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
groups


i want to delete the vg helena_vg and /dev/hda3 (pv).
can anyone help me please

thanks in advance 
narsimha
