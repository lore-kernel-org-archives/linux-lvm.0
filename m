Message-Id: <6.0.0.22.2.20031112134346.024a5268@quake.swe.net>
From: Hjalmar =?iso-8859-1?Q?W=E5hlander?= <grazzy@quake.swe.net>
Subject: Re: [linux-lvm] pvscan cant find my volume..
In-Reply-To: <6.0.0.22.2.20031111225828.0249dda8@quake.swe.net>
References: <6.0.0.22.2.20031111224443.02452ef0@quake.swe.net>
 <6.0.0.22.2.20031111225828.0249dda8@quake.swe.net>
Mime-Version: 1.0
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
Date: Wed Nov 12 06:47:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

You guys got me nervous there for a while. 280gb of data down the drain? Nope.
I solved my problem with cfdisk ( fdisk would probably have done aswell ), 
I took my chances and rewrote the partition table ( an empty 
one            ), then pvcreate -ff and vgcfgrestore .. phew. Back online.


I hope someone can be helped with this solution.


At 22:59 2003-11-11, you wrote:
>As stated in a eariler message, I also tried this:
>
>[root@mircosoft /mnt]# cp /etc/lvmconf/the_data.conf /etc/lvmtab.d/the_data
>[root@mircosoft /mnt]# echo -ne "the_data\0" > /etc/lvmtab
>[root@mircosoft /mnt]# vgchange -ay the_data
>vgchange -- ERROR: physical volume "/dev/hdc" of volume group "the_data" 
>is offline
>vgchange -- run vgscan
>
>
>
>
>At 22:49 2003-11-11, you wrote:
>>Hi,
>>
>>This started out when I rebooted my machine. Prior to the reboot I ran 
>>fsck on the lvm-filesystem and got quite alot of errors.
>>
>>My vg contains three hdds:
>>hdc, hde and hdf.
>>
>>----------------
>>[root@mircosoft /mnt]# vgscan
>>vgscan -- reading all physical volumes (this may take a while...)
>>vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of 
>>volume group "the_data" from physical volume(s)
>>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>>vgscan -- WARNING: This program does not do a VGDA backup of your volume 
>>group
>>-----------------
>>
>>This error I've seen quite a few times in this list, however, as many 
>>replies are suggesting - running "pvcreate -ff" - does not help.
>>Why?
>>
>>--------------
>>[root@mircosoft /mnt]# pvcreate -ff /dev/hdc
>>pvcreate -- device "/dev/hdc" has a partition table
>>---------------
>>
>>And, to my surprise, dmesg, reports that hdc has a hdc1 (not that I can 
>>remember ever creating one... ), but anyway, how can I bypass this?
>>
>>Some extras:
>>
>>[root@mircosoft /mnt]# pvdisplay /dev/hdc
>>pvdisplay -- no physical volume identifier on "/dev/hdc"
>>
>>
>>(But it works fine on hde and hdf).
>>
>>
>>Im very grateful for any help!
>>
>>--grazzy.
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
