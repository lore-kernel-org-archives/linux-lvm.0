Message-ID: <cde64fbe9152535e0ec43a48c7316917.squirrel@webmail.harte-lyne.ca>
In-Reply-To: <4F26C5A4.1080907@redhat.com>
References: <c7cbb6bbd7b1bb221f1939dc180f29cd.squirrel@webmail.harte-lyne.ca>
	<4F26BE81.7040608@redhat.com>
	<0e76b29210b181e84d1c5762f9c8f07d.squirrel@webmail.harte-lyne.ca>
	<4F26C5A4.1080907@redhat.com>
Date: Mon, 30 Jan 2012 11:50:09 -0500
From: "James B. Byrne" <byrnejb@harte-lyne.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Cannot delete lv
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>


On Mon, January 30, 2012 11:30, Bryn M. Reeves wrote:
)
>
> These LVs all have active kpartx mappings (the names with
> pN
> suffixes). Remove them with kpartx -d:
>
> # kpartx -d /dev/mapper/vg_vhost01-lv_vm_base
> # kpartx -d
> /dev/mapper/vg_vhost01-lv_vm_pas.harte--lyne.ca
> # kpartx -d
> /dev/mapper/vg_vhost01-lv_vm_pas.harte--lyne.ca_01
> # kpartx -d
> /dev/mapper/vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00
> # kpartx -d
> /dev/mapper/vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_01
>
> Regards,
> Bryn.


I tried this with no change in the result.

[root@vhost01 ~]# kpartx -d /dev/mapper/vg_vhost01-lv_vm_base
[root@vhost01 ~]# kpartx -d
/dev/mapper/vg_vhost01-lv_vm_basep1
[root@vhost01 ~]# kpartx -d
/dev/mapper/vg_vhost01-lv_vm_basep2
[root@vhost01 ~]# /sbin/lvremove -f
/dev/vg_vhost01/lv_vm_base
  Can't remove open logical volume "lv_vm_base"

[root@vhost01 ~]# dmsetup info -c vg_vhost01-lv_vm_base
Name                  Maj Min Stat Open Targ Event  UUID
vg_vhost01-lv_vm_base 253   5 L--w    2    1      0
LVM-gXMt00E1RDjpSX3INLZ35Prtg66aX36BeAOlKIkmfSNQRNol3Hni920R4YVaZr52

[root@vhost01 ~]# lsblk
NAME                                 MAJ:MIN RM   SIZE RO
TYPE MOUNTPOINT
.  .  .
  &#9500;&#9472;vg_vhost01-lv_vm_base (dm-5)              
                253:5    0   7.8G  0 lvm
  &#9474; &#9500;&#9472;vg_vhost01-lv_vm_basep1 (dm-17)   
                      253:17   0   500M  0 dm
  &#9474; &#9492;&#9472;vg_vhost01-lv_vm_basep2 (dm-18)   
                      253:18   0   7.3G  0 dm

.  .  .

Am I misunderstanding your instructions?


-- 
***          E-Mail is NOT a SECURE channel          ***
James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
Harte & Lyne Limited          http://www.harte-lyne.ca
9 Brockley Drive              vox: +1 905 561 1241
Hamilton, Ontario             fax: +1 905 561 0757
Canada  L8E 3C3
