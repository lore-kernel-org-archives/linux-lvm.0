Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0BBK5s5006861
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 06:20:06 -0500
Received: from mta06.sannet.ne.jp (mta06.sannet.ne.jp [134.180.49.76])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0BBK4lh022968
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 06:20:05 -0500
Received: from [192.168.0.77] (eaa1-ppp746.west.sannet.ne.jp [211.133.178.238])
	by mta06.sannet.ne.jp (Postfix) with ESMTP id 2E2AB23F1
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 20:20:03 +0900 (JST)
Mime-Version: 1.0 (Apple Message framework v752.2)
In-Reply-To: <aec22fc50701091026i3b66ec18jbd18760e59164622@mail.gmail.com>
References: <aec22fc50701091026i3b66ec18jbd18760e59164622@mail.gmail.com>
Message-Id: <7682E579-E6B5-41E0-BC72-659301959512@sannet.ne.jp>
Content-Transfer-Encoding: 7bit
From: Joel Rees <joel_rees@sannet.ne.jp>
Subject: Re: [linux-lvm] vgscan -- ERROR "vg_read_with_pv_and_lv(): current
	PV" can't get data of volume group
Date: Thu, 11 Jan 2007 20:20:01 +0900
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-2022-jp"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Theis looks a little like something I just went through.

Check

     http://tldp.org/HOWTO/LVM-HOWTO/  for general stuff.

also

     man pvcreate
     man vgcfgrestore

and if you want to look at my descriptions of what I did,

      https://www.redhat.com/archives/linux-lvm/2007-January/ 
msg00003.html
      https://www.redhat.com/archives/fedora-list/2007-January/ 
msg00770.html

I can't say whether that will be more confusion than help. Good luck.

On 平成 19/01/10, at 3:26, `VL wrote:

> Dear ALL,
>
> I have a problem with LVM volume(details below) probably after bad  
> shutdown:
>
> There are 2 volumes: lvm2 and lvm1 (just names, type is lvm-1).  
> lvm2 is fine and mounted,
> and lvm1 has problems:
>
> # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sda1" of VG "lvm2" [372.56 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sdb1" of VG "lvm2" [ 372.56 GB / 0 free]
> pvscan -- inactive PV "/dev/hdg1"  is associated to unknown VG  
> "lvm1" (run vgscan)
> pvscan -- inactive PV "/dev/hdf1"  is associated to unknown VG  
> "lvm1" (run vgscan)
> pvscan -- inactive PV "/dev/hdb1"  is associated to unknown VG  
> "lvm1" (run vgscan)
> pvscan -- total: 5 [1.36 TB] / in use: 5 [1.36 TB] / in no VG: 0 [0]
>
> # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "lvm2"
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get  
> data of volume group "lvm1" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your  
> volume groups
>
>  ls -l /dev/lvm*
> crw-r-----  1 root root 109, 0 2005-03-27 17:11 /dev/lvm
>
> /dev/lvm1:
> total 0
> crw-r-----  1 root disk 109, 0 2007-01-05 17:14 group
>
> /dev/lvm2:
> total 0
> crw-r-----  1 root disk 109, 1 2007-01-09 21:22 group
> brw-rw----  1 root disk  58, 1 2007-01-09 21:22 lv2
>
>
> System description:
>
> kernel 2.4.31 vanilla
> slackware-10.2.0
> lvm-1.0.8-i486-1
>
> any help will be greatly appreciated.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
