Message-ID: <17b6cba6866a7d79f73a7fd6dc5e27f1.squirrel@webmail.harte-lyne.ca>
In-Reply-To: <4F26CD7D.7030400@redhat.com>
References: <c7cbb6bbd7b1bb221f1939dc180f29cd.squirrel@webmail.harte-lyne.ca>
	<4F26BE81.7040608@redhat.com>
	<0e76b29210b181e84d1c5762f9c8f07d.squirrel@webmail.harte-lyne.ca>
	<4F26C5A4.1080907@redhat.com>
	<cde64fbe9152535e0ec43a48c7316917.squirrel@webmail.harte-lyne.ca>
	<4F26CD7D.7030400@redhat.com>
Date: Mon, 30 Jan 2012 12:34:56 -0500
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


On Mon, January 30, 2012 12:03, Bryn M. Reeves wrote:

>
> The partition maps were apparently created with kpartx's
> "-p p" option
> to force a partition separator of 'p' (the default is to
> use a 'p' if
> the device name ends with a numeral but no separator
> otherwise).
>
> If the maps were created with -pp kpartx will refuse to
> remove them if
> the option is not given (but helpfully doesn't report any
> error.. :-/):
>
> # ls /dev/mapper/vg_mother-lv_base*
> /dev/mapper/vg_mother-lv_base
> /dev/mapper/vg_mother-lv_basep1
> # kpartx -d /dev/mapper/vg_mother-lv_base
> # ls /dev/mapper/vg_mother-lv_base*
> /dev/mapper/vg_mother-lv_base
> /dev/mapper/vg_mother-lv_basep1
> # kpartx -d -pp /dev/mapper/vg_mother-lv_base
> # ls /dev/mapper/vg_mother-lv_base*
> /dev/mapper/vg_mother-lv_base
>
> Just add the -pp to your kpartx command lines and it
> should remove the
> devices.
>

[root@vhost01 ~]# kpartx -d -pp
/dev/mapper/vg_vhost01-lv_vm_base
[root@vhost01 ~]# kpartx -d -pp
/dev/mapper/vg_vhost01-lv_vm_basep1
failed to stat() /dev/mapper/vg_vhost01-lv_vm_basep1
[root@vhost01 ~]# /sbin/lvremove -f
/dev/vg_vhost01/lv_vm_base
  Logical volume "lv_vm_base" successfully removed

And repeated as required.

Success!  Thank you so very much. I would never have
discovered this on my own. Never.

[root@vhost01 ~]# dmsetup ls --tree
vg_vhost01-lv_swap (253:1)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_root (253:0)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_centos_repos (253:8)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_tmp (253:2)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_vm_inet02.harte--lyne.ca_00 (253:21)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_vm_inet03.harte--lyne.ca_00 (253:23)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_log (253:4)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_vm_inet04.harte--lyne.ca_00 (253:25)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_spool (253:3)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_vm_inet08.harte--lyne.ca_00 (253:24)
 &#9492;&#9472; (8:2)
vg_vhost01-lv_vm_inet09.harte--lyne.ca_00 (253:22)
 &#9492;&#9472; (8:2)

Everything appears clean now and I have confirmed that the
disk space has been returned to the virt-manager storage
pool.

Again, thank you.

-- 
***          E-Mail is NOT a SECURE channel          ***
James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
Harte & Lyne Limited          http://www.harte-lyne.ca
9 Brockley Drive              vox: +1 905 561 1241
Hamilton, Ontario             fax: +1 905 561 0757
Canada  L8E 3C3
