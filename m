Subject: Re: [linux-lvm] one PV crashed
References: <878zad8qrx.fsf@papadoc.bayour.com>
    <20020201111151.B15491@sistina.com>
From: Turbo Fredriksson <turbo@bayour.com>
In-Reply-To: <20020201111151.B15491@sistina.com>
Message-Id: <87wuxx1duy.fsf@papadoc.bayour.com>
MIME-Version: 1.0
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
Date: Fri Feb  1 08:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Quoting "Heinz J . Mauelshagen" <mauelshagen@sistina.com>:

> dd if=/dev/zero of=/tmp/my_sdg1.vgda bs=1k count=512
> losetup /dev/loop0 /tmp/my_sdg1.vgda
> pvcreate /dev/loop0
> vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 /devloop0
> vgscan

----- s n i p -----
[papadoc.root]# dd if=/dev/zero of=/var/my_sdg1.vgda bs=1k count=512
512+0 records in
512+0 records out
[papadoc.root]# losetup /dev/loop0 /var/my_sdg1.vgda
[papadoc.root]# pvcreate /dev/loop0
pvcreate -- physical volume "/dev/loop0" successfully created

[papadoc.root]# vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 /dev/loop0
vgcfgrestore -- physical volume "/dev/loop0" doesn't belong to volume group "vg1"

[papadoc.root]# vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 -o /dev/sdg1 /dev/loop0
vgcfgrestore -- ERROR "pv_read(): pv_create_name_from_kdev_t" reading physical volume "/dev/loop0"

[papadoc.root]# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

----- s n i p -----

> pvdisplay -v /dev/loop0

----- s n i p -----
[papadoc.root]# pvdisplay -v /dev/loop0 
pvdisplay -- getting physical volume size
pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no VALID physical volume "/dev/loop0"


----- s n i p -----


Panama Soviet Iran North Korea Kennedy smuggle Cocaine Ft. Meade 747
toluene 767 Qaddafi kibo cryptographic Clinton
[See http://www.aclu.org/echelonwatch/index.html for more about this]
