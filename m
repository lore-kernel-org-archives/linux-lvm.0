Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBC0B2037E45
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 15:58:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C2B48001EA
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 15:58:46 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id r24so15230243ljd.4
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 08:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAHRMh5Wkp79vCyjczL7JuLqg15Hq2YoQUQjEc1-BgddCY3HEEw@mail.gmail.com>
	<AM6PR03MB4389713EAF839D54B4A6D95CFFF00@AM6PR03MB4389.eurprd03.prod.outlook.com>
In-Reply-To: <AM6PR03MB4389713EAF839D54B4A6D95CFFF00@AM6PR03MB4389.eurprd03.prod.outlook.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Mon, 23 Mar 2020 10:58:29 -0500
Message-ID: <CAAMCDecUdS4DNrJR=qB+DDnz-8jWVTVjOCsJYbmyNQQnVhGBuQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm raid5 : drives all present but vg/lvm will not
	assemble
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
To: LVM general discussion and development <linux-lvm@redhat.com>

cat /proc/mdstat, the 253,19 is likely an /dev/mdX device and to get
an io error like that it has to be in a wrong state.

On Mon, Mar 23, 2020 at 5:14 AM Bernd Eckenfels <ecki@zusammenkunft.net> wrote:
>
> Do you see any dmesg kernel errors when you try to activate the LVs?
>
> Gruss
> Bernd
>
>
> --
> http://bernd.eckenfels.net
> ________________________________
> Von: linux-lvm-bounces@redhat.com <linux-lvm-bounces@redhat.com> im Auftrag von Andrew Falgout <digitalw00t@gmail.com>
> Gesendet: Saturday, March 21, 2020 4:22:04 AM
> An: linux-lvm@redhat.com <linux-lvm@redhat.com>
> Betreff: [linux-lvm] lvm raid5 : drives all present but vg/lvm will not assemble
>
>
> This started on a Raspberry PI 4 running raspbian.  I moved the disks to my Fedora 31 system, that is running the latest updates and kernel.  When I had the same issues there I knew it wasn't raspbian.
>
> I've reached the end of my rope on this. The disks are there, all three are accounted for, and the LVM data on them can be seen.  But it refuses to activate stating I/O errors.
>
> [root@hypervisor01 ~]# pvs
>   PV         VG                Fmt  Attr PSize    PFree
>   /dev/sda1  local_storage01   lvm2 a--  <931.51g       0
>   /dev/sdb1  local_storage01   lvm2 a--  <931.51g       0
>   /dev/sdc1  local_storage01   lvm2 a--  <931.51g       0
>   /dev/sdd1  local_storage01   lvm2 a--  <931.51g       0
>   /dev/sde1  local_storage01   lvm2 a--  <931.51g       0
>   /dev/sdf1  local_storage01   lvm2 a--  <931.51g <931.51g
>   /dev/sdg1  local_storage01   lvm2 a--  <931.51g <931.51g
>   /dev/sdh1  local_storage01   lvm2 a--  <931.51g <931.51g
>   /dev/sdi3  fedora_hypervisor lvm2 a--    27.33g   <9.44g
>   /dev/sdk1  vg1               lvm2 a--    <7.28t       0
>   /dev/sdl1  vg1               lvm2 a--    <7.28t       0
>   /dev/sdm1  vg1               lvm2 a--    <7.28t       0
> [root@hypervisor01 ~]# vgs
>   VG                #PV #LV #SN Attr   VSize  VFree
>   fedora_hypervisor   1   2   0 wz--n- 27.33g <9.44g
>   local_storage01     8   1   0 wz--n- <7.28t <2.73t
>   vg1                 3   1   0 wz--n- 21.83t     0
> [root@hypervisor01 ~]# lvs
>   LV        VG                Attr       LSize  Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
>   root      fedora_hypervisor -wi-ao---- 15.00g
>   swap      fedora_hypervisor -wi-ao----  2.89g
>   libvirt   local_storage01   rwi-aor--- <2.73t                                    100.00
>   gluster02 vg1               Rwi---r--- 14.55t
>
> The one in question is the vg1/gluster02 lvm group.
>
> I try to activate the VG:
> [root@hypervisor01 ~]# vgchange -ay vg1
>   device-mapper: reload ioctl on  (253:19) failed: Input/output error
>   0 logical volume(s) in volume group "vg1" now active
>
> I've got the debugging output from :
> vgchange -ay vg1 -vvvv -dddd
> lvchange -ay --partial vg1/gluster02 -vvvv -dddd
>
> Just not sure where I should dump the data for people to look at.  Is there a way to tell the md system to ignore the metadata since there wasn't an actual disk failure, and rebuild the metadata off what is in the lvm?  Or can I even get the LV to mount, so I can pull the data off.
>
> Any help is appreciated.  If I can save the data great.  I'm tossing this to the community to see if anyone else has an idea of what I can do.
> ./digitalw00t
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
