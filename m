Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s77JN7wU005620
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2014 15:23:07 -0400
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s77JN6JE009868
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 7 Aug 2014 15:23:06 -0400
Received: by mail-oa0-f46.google.com with SMTP id m1so3281223oag.5
	for <linux-lvm@redhat.com>; Thu, 07 Aug 2014 12:23:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53E3CE1C.4050506@tlinx.org>
References: <53E3CE1C.4050506@tlinx.org>
Date: Thu, 7 Aug 2014 21:23:05 +0200
Message-ID: <CAE7pJ3BTkSuh9-DB=VR=kiW_ShMdhEO5T_vFWMuZMuEZjgo-RQ@mail.gmail.com>
From: emmanuel segura <emi2fast@gmail.com>
Subject: Re: [linux-lvm] pvmove: Physical Volume "/dev/sdc1" not found in
 Volume Group + minor bug
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

first merg the two vgs using vgmerge command

2014-08-07 21:06 GMT+02:00 Linda A. Walsh <lvm@tlinx.org>:
> I'm trying to move an LV from one VG on 1 PV to another VG on another PV,
> but it doesn't seem to like my syntax. Isn't it: " -n LV FROMPV TOPV"
>
>>  sudo pvmove -n Win /dev/sda1 /dev/sdc1
>
>  Physical Volume "/dev/sdc1" not found in Volume Group "HnS"
>
>
> Pertinent details:
>>
>>  lvs  #(From volume in HnS)
>
>  LV                       VG      Attr      LSize   Sys
> HnS     -wc-a----  96.00g
>
>>  pvs  #(from VG HnS on PV /dev/sda1, destination PV = /dev/sdc1
>
>  PV         VG      Fmt  Attr PSize  PFree
>  /dev/sda1  HnS     lvm2 a--  21.83t 10.20t
>  /dev/sdc1  Data    lvm2 a--  43.66t 39.46t
>
> ----
> Before I got to that point:
>>
>>  sudo pvmove -n Win /dev/sda1 /dev/sdc1
>
>  Required device-mapper target(s) not detected in your kernel
> (for some reason kernel module isn't auto-loaded???  (the minor bug..))
> So:
>>
>>  sudo modprobe dm-mirror
>
>
> -- Don't know if any other modules are needed?  I have:
>>
>>  ls -d  /sys/module/dm*
>
> /sys/module/dm_bufio/  /sys/module/dm_mirror/  /sys/module/dm_region_hash/
> /sys/module/dm_log/    /sys/module/dm_mod/     /sys/module/dm_snapshot/
> ---
> Available (not loaded):
>>
>>  sudo modprobe dm-<COMPLETE>
>
> dm-bio-prison       dm-raid             dm-zero
> dm-persistent-data  dm-thin-pool
>
> I'm assuming I only needed the dm-mirror so it could do the
> mirroring?  What syntax should I be using?
>
> Thanks!
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
esta es mi vida e me la vivo hasta que dios quiera
