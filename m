Message-ID: <2558.213.191.82.129.1000287790.squirrel@hactar.dnsalias.net>
Date: Wed, 12 Sep 2001 11:43:10 +0200 (CEST)
From: "Julian Glashoff" <helldog@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Problem: "only found 768 of 769 LEs for LV /dev/vg00/lvol1"
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: helldog@gmx.net

Hello,

I have a problem with my volume group:
I was using kernel 2.4.7 with LVM 1.0.1-rc1.
I tried to extend a logical volume (/dev/vg00/lvol2) by 4Gig and got the
error message "No such device or address in kernel".
Then I tried to extend /dev/vg00/lvol1 by 1 extent just to test if I was
able to change volumes at all whereupon the system completely crashed.
On the next reboot I got the following message from vgscan:
-------------------------------------------------------------------
# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "vg00"
vgscan -- only found 768 of 769 LEs for LV /dev/vg00/lvol1 (1)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "vg00" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
"/etc/lvmtab" and "/etc/lvmtab.d"
-------------------------------------------------------------------
And now I am unable to access the volume group.
Then I tried to restore the backups with the following result:
-------------------------------------------------------------------
# vgcfgrestore -n vg00 -l
vgcfgrestore -- ERROR: different structure size stored in
"/etc/lvmconf/vg00.conf" than expected in file vg_cfgrestore.c [line 120]
vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group "vg00"
-------------------------------------------------------------------
The documentation says this would be caused by an incorrect LVM version.
I was using 1.0.1-rc1 and have tried to restore the backups with every
version from 0.9.1-beta1 up to 1.0.1-rc2 and all versions give me the same
error.

Is there anything I can do to restore my volume group?

The output of "pvdata -a" can be found here:

http://hactar.dnsalias.net/lvm/pvdata.hda5
http://hactar.dnsalias.net/lvm/pvdata.hda7
http://hactar.dnsalias.net/lvm/pvdata.hdc2

--
Julian Glashoff
<helldog@gmx.net>
