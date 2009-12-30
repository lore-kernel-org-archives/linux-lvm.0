Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBUCbo8D032597
	for <linux-lvm@redhat.com>; Wed, 30 Dec 2009 07:37:50 -0500
Received: from smtp-auth.no-ip.com (smtp-auth.no-ip.com [204.16.252.95])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBUCbdMK014224
	for <linux-lvm@redhat.com>; Wed, 30 Dec 2009 07:37:39 -0500
Received: from [127.0.0.1] (unknown [62.58.16.80])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: simonloewen.com@noip-smtp)
	by smtp-auth.no-ip.com (Postfix) with ESMTPSA id 6700BB482B0
	for <linux-lvm@redhat.com>; Wed, 30 Dec 2009 04:37:38 -0800 (PST)
Message-ID: <4B3B4985.2000506@klunky.co.uk>
Date: Wed, 30 Dec 2009 13:37:25 +0100
From: Simon Loewenthal/NL/Tele2 <simon.loewenthal@klunky.co.uk>
MIME-Version: 1.0
References: <4B3B28E5.5030208@tele2.com> <4B3B2C05.1070902@tele2.com>
	<29ae894c0912300352k29bbd06dha89b7dd0045c550@mail.gmail.com>
In-Reply-To: <29ae894c0912300352k29bbd06dha89b7dd0045c550@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM preference for multipath verses disk/by-id/scsi
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

Thank-you Bren for the info., I am unsure how to specify the
preferred_devices using the muttipath:
 Should it be:

preferred_names = [ "^/dev/dm-*/" , "^/dev/cciss/" ]


so that it uses these discs :
/dev/cciss/c0d0p4  (internal disc)
dm-6_010F	(multipathd alias for EMC disc)
dm-17_0012	(multipathd alias for EMC disc)
dm-13_0103	(multipathd alias for EMC disc)
dm-10_0109	(multipathd alias for EMC disc)

The EMC discs are listed under /dev as :
 # ls -l /dev/dm-?
brw-r----- 1 root disk 253, 0 Oct 26 14:44 /dev/dm-0
brw-r----- 1 root disk 253, 1 Oct 26 14:44 /dev/dm-1
brw-r----- 1 root disk 253, 2 Oct 26 14:44 /dev/dm-2
brw-r----- 1 root disk 253, 3 Oct 30 10:16 /dev/dm-3
brw-r----- 1 root disk 253, 4 Dec  4 11:47 /dev/dm-4
brw-r----- 1 root disk 253, 5 Dec  4 11:47 /dev/dm-5
brw-r----- 1 root disk 253, 6 Dec  4 11:47 /dev/dm-6
brw-r----- 1 root disk 253, 7 Oct 26 14:44 /dev/dm-7
brw-r----- 1 root disk 253, 8 Dec  4 11:47 /dev/dm-8
brw-r----- 1 root disk 253, 9 Dec  4 11:47 /dev/dm-9

...but I do not see /dev/dm-6_010F. 


S.



brem belguebli wrote:
> Hi,
>
> see man 5 lvm.conf there is an option called preferred_names which is
> well explained
>
> It'll instruct lvm to use the preferred_names you configured in the
> lvm.conf file if they exist
>
> ie : preferred_names = "/dev/mpath/" will use /dev/mpath/XXX instead
> of /dev/mapper/XXX
>
>
> 2009/12/30 Simon Loewenthal/NL/Tele2 <simon.loewenthal@tele2.com>:
>   
>> I don't think this original Email made it through to the list, but I
>> think I have found an solution:
>>
>> In lvm.conf there is this line,
>> filter = [ "r|/dev/.*/by-path/.*|", "r|/dev/.*/by-id/.*|", "a/.*/" ]
>>
>> If I remove the portion "r|/dev/.*/by-id/.*|", so it is rewritten as,
>> filter = [ "r|/dev/.*/by-path/.*|", "a/.*/" ]
>> ...then it ought to ignore the device,
>> /dev/disk/by-id/scsi-360060480000290300618533030313133
>>
>> Is this correct?
>>
>> S.
>>
>> --
>> Simon Loewenthal/Tele2
>>
>>
>> Simon Loewenthal/NL/Tele2 wrote:
>>     
>>> Dear all,
>>>
>>>     I have a volume group that is currently using discs directly
>>> presented from EMC e.g
>>> /dev/disk/by-id/scsi-360060480000290300618533030313042 .
>>>
>>> An lvdisplay -v shows these PVs:
>>> # vgdisplay -v vg_mds
>>>     Using volume group(s) on command line
>>>     Finding volume group "vg_mds"
>>>   --- Volume group ---
>>>   VG Name               vg_mds
>>>   System ID
>>>   Format                lvm2
>>>   Metadata Areas        12
>>>   Metadata Sequence No  4
>>>   VG Access             read/write
>>>   VG Status             resizable
>>>   MAX LV                0
>>>   Cur LV                1
>>>   Open LV               1
>>>   Max PV                0
>>>   Cur PV                12
>>>   Act PV                12
>>>   VG Size               202.12 GB
>>>   PE Size               32.00 MB
>>>   Total PE              6468
>>>   Alloc PE / Size       6468 / 202.12 GB
>>>   Free  PE / Size       0 / 0
>>>   VG UUID               Wnk1a8-xdVf-RorP-ZxPE-Z3D9-5fp1-2o4hHs
>>>
>>>   --- Logical volume ---
>>>   LV Name                /dev/vg_mds/lvol_mds
>>>   VG Name                vg_mds
>>>   LV UUID                TErCZW-senu-YR3k-I25n-Tqk9-BK2k-3mQY3S
>>>   LV Write Access        read/write
>>>   LV Status              available
>>>   # open                 1
>>>   LV Size                202.12 GB
>>>   Current LE             6468
>>>   Segments               12
>>>   Allocation             inherit
>>>   Read ahead sectors     0
>>>   Block device           253:7
>>>
>>>   --- Physical volumes ---
>>>   PV Name
>>> /dev/disk/by-id/scsi-360060480000290300618533030313133
>>>   PV UUID               255V1X-uMZp-Lod1-3jsa-cCGd-JaNZ-v0dEXn
>>>   PV Status             allocatable
>>>   Total PE / Free PE    539 / 0
>>>
>>>   PV Name
>>> /dev/disk/by-id/scsi-360060480000290300618533030313131
>>>   PV UUID               RU5WZK-G3hY-lXCD-F6Kj-PcJA-DcbE-iV17P7
>>>   PV Status             allocatable
>>>   Total PE / Free PE    539 / 0
>>>
>>>   PV Name
>>> /dev/disk/by-id/scsi-360060480000290300618533030313046
>>>   PV UUID               c3DVym-lzdw-MgS6-acQI-BcUD-UOGq-iG6hSe
>>>   PV Status             allocatable
>>>   Total PE / Free PE    539 / 0
>>>
>>>   PV Name
>>> /dev/disk/by-id/scsi-360060480000290300618533030313044
>>>   PV UUID               d7VD54-KmXZ-t8eX-dvph-9lSp-ym03-Lc62sI
>>>   PV Status             allocatable
>>>   Total PE / Free PE    539 / 0
>>>
>>>   PV Name
>>> /dev/disk/by-id/scsi-360060480000290300618533030313042
>>>   PV UUID               n32oAY-soe3-odYI-SAFQ-yM7v-FRaw-e9hS63
>>>   PV Status             allocatable
>>>   Total PE / Free PE    539 / 0
>>>
>>>   PV Name
>>> /dev/disk/by-id/scsi-360060480000290300618533030313039
>>>   PV UUID               hT2hZ7-XAZr-ZUte-rzLV-kwFX-Jtih-K3OgZe
>>>   PV Status             allocatable
>>>   Total PE / Free PE    539 / 0
>>>
>>>   PV Name
>>> /dev/disk/by-id/scsi-360060480000290300618533030313037
>>>   PV UUID               ut4fEx-R0c2-lA4y-qS3F-SYfp-Chuz-2SrvTo
>>>   PV Status             allocatable
>>>   Total PE / Free PE    539 / 0
>>>
>>>   PV Name
>>> /dev/disk/by-id/scsi-360060480000290300618533030313035
>>>   PV UUID               BMJ8LA-b0L7-aAoK-4WqG-MLdU-s8Y8-xGib2s
>>>   PV Status             allocatable
>>>   Total PE / Free PE    539 / 0
>>>
>>>   PV Name
>>> /dev/disk/by-id/scsi-360060480000290300618533030313033
>>>   PV UUID               uSasZ1-96rT-ngGN-Wfcr-fBNg-ceM0-GaccVU
>>>   PV Status             allocatable
>>>   Total PE / Free PE    539 / 0
>>>
>>>   PV Name
>>> /dev/disk/by-id/scsi-360060480000290300618533030313031
>>>   PV UUID               R15yAf-t1YO-Z0Dx-4n2G-oTyD-Secp-2igMJc
>>>   PV Status             allocatable
>>>   Total PE / Free PE    539 / 0
>>>
>>>   PV Name
>>> /dev/disk/by-id/scsi-360060480000290300618533030304646
>>>   PV UUID               nrhhx1-7AxM-VmVv-sRY5-TLR7-UAEE-wBUIMB
>>>   PV Status             allocatable
>>>   Total PE / Free PE    539 / 0
>>>
>>>   PV Name
>>> /dev/disk/by-id/scsi-360060480000290300618533030304644
>>>   PV UUID               ctz8rd-ew58-0pU8-FssR-x9pR-KSA9-mI4flw
>>>   PV Status             allocatable
>>>   Total PE / Free PE    539 / 0
>>>
>>>
>>> I want to export this volume group and inport it again using
>>> multipathing.  I have configured the multipathing thus,
>>>  # multipath -ll
>>> dm-6_010F (360060480000290300618533030313046) dm-6 EMC,SYMMETRIX
>>> [size=17G][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:31 sdx        65:112 [active][ready]
>>>  \_ 1:0:0:31 sdk        8:160  [active][ready]
>>> dm-17_0012 (360060480000290300618533030303132) dm-17 EMC,SYMMETRIX
>>> [size=4.7M][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:0  sdn        8:208  [active][ready]
>>>  \_ 1:0:0:0  sda        8:0    [active][ready]
>>> dm-13_0103 (360060480000290300618533030313033) dm-13 EMC,SYMMETRIX
>>> [size=17G][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:25 sdr        65:16  [active][ready]
>>>  \_ 1:0:0:25 sde        8:64   [active][ready]
>>> dm-10_0109 (360060480000290300618533030313039) dm-10 EMC,SYMMETRIX
>>> [size=17G][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:28 sdu        65:64  [active][ready]
>>>  \_ 1:0:0:28 sdh        8:112  [active][ready]
>>> dm-14_0101 (360060480000290300618533030313031) dm-14 EMC,SYMMETRIX
>>> [size=17G][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:24 sdq        65:0   [active][ready]
>>>  \_ 1:0:0:24 sdd        8:48   [active][ready]
>>> dm-8_010D (360060480000290300618533030313044) dm-8 EMC,SYMMETRIX
>>> [size=17G][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:30 sdw        65:96  [active][ready]
>>>  \_ 1:0:0:30 sdj        8:144  [active][ready]
>>> dm-15_00FF (360060480000290300618533030304646) dm-15 EMC,SYMMETRIX
>>> [size=17G][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:23 sdp        8:240  [active][ready]
>>>  \_ 1:0:0:23 sdc        8:32   [active][ready]
>>> dm-11_0107 (360060480000290300618533030313037) dm-11 EMC,SYMMETRIX
>>> [size=17G][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:27 sdt        65:48  [active][ready]
>>>  \_ 1:0:0:27 sdg        8:96   [active][ready]
>>> dm-4_0113 (360060480000290300618533030313133) dm-4 EMC,SYMMETRIX
>>> [size=17G][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:33 sdz        65:144 [active][ready]
>>>  \_ 1:0:0:33 sdm        8:192  [active][ready]
>>> dm-9_010B (360060480000290300618533030313042) dm-9 EMC,SYMMETRIX
>>> [size=17G][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:29 sdv        65:80  [active][ready]
>>>  \_ 1:0:0:29 sdi        8:128  [active][ready]
>>> dm-16_00FD (360060480000290300618533030304644) dm-16 EMC,SYMMETRIX
>>> [size=17G][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:22 sdo        8:224  [active][ready]
>>>  \_ 1:0:0:22 sdb        8:16   [active][ready]
>>> dm-12_0105 (360060480000290300618533030313035) dm-12 EMC,SYMMETRIX
>>> [size=17G][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:26 sds        65:32  [active][ready]
>>>  \_ 1:0:0:26 sdf        8:80   [active][ready]
>>> dm-5_0111 (360060480000290300618533030313131) dm-5 EMC,SYMMETRIX
>>> [size=17G][features=0][hwhandler=0]
>>> \_ round-robin 0 [prio=2][active]
>>>  \_ 0:0:0:32 sdy        65:128 [active][ready]
>>>  \_ 1:0:0:32 sdl        8:176  [active][ready]
>>>
>>> Device mapper reports this:
>>> # dmsetup ls
>>> dm-6_010F    (253, 6)
>>> dm-17_0012    (253, 17)
>>> dm-13_0103    (253, 13)
>>> dm-10_0109    (253, 10)
>>> vg00-app052    (253, 3)
>>> vg00-xen    (253, 2)
>>> vg00-usr    (253, 0)
>>> vg00-var    (253, 1)
>>> dm-14_0101    (253, 14)
>>> dm-8_010D    (253, 8)
>>> dm-15_00FF    (253, 15)
>>> dm-11_0107    (253, 11)
>>> dm-4_0113    (253, 4)
>>> vg_mds-lvol_mds    (253, 7)
>>> dm-9_010B    (253, 9)
>>> dm-16_00FD    (253, 16)
>>> dm-12_0105    (253, 12)
>>> dm-5_0111    (253, 5)
>>>
>>>
>>> What I do not understand is that surly when I perform a vgscan how will
>>> it decide to query only the devices presented from the multipathd, and
>>> ignore those presented via the dev/disk/by-id/scsi-nnnnnnnnnn?  Won't it
>>> see two vg_mds volumes instead of only those volumes that lie on the
>>> multipathed discs, which are the same pshycial discs as the disk/by-id?
>>>
>>> My plan of action is currently:
>>>     vgchange -a n vg_mds
>>>     vgexport -m /tmp/vg_mds.map mds
>>>     vgexport -f /tmp/vg_mds.pv mds
>>>     vgscan
>>>     vgchange -y a vg_mds
>>>     vgimport vg_mds /*OR instead do it the long way on the next line*  /
>>>         vgscan
>>>         mkdir /dev/vg_mds
>>>         mknod /dev/vg_mds/group c 64 0xNN0000
>>>         vgimport -v -s -m /tmp/vg_mds.map /dev/vg_mds
>>>
>>> I do not see how to tell it to ignore the non-multipathed disc, or has
>>> multipathd or LVM have some preference for mutlipath discs over
>>> non-multipathed discs, and if so then what is the logic behind the decision?
>>>
>>> Any help to further my understanding would be gratefully appreciated.
>>>
>>> Best wishes, S.
>>>
>>> PS. I am using SLES, but this was the only mailinglist I found for LVM
>>> so I subscribed to it.  I think that LVM and multipathd implementations
>>> are reasonably similar across Linux distos. Ergo concepts here are
>>> applicable to Suse.  The kernel I am using is a xen enabled host (not a
>>> guest): 2.6.16.60-0.27-xen #1 SMP.
>>>
>>>
>>>       
>> --
>> Simon Loewenthal/Tele2
>>
>> ******** IMPORTANT NOTICE ********
>> Please repect the X-Reply to klunky.co.uk. PGP available 0xD86A5A17.
>> S/MIME PKCS12 key available for Lotus Notes: Please ask me for it.
>> This e-mail (including any attachments) may contain information that is confidential or otherwise protected from disclosure and it is intended only for the addressees. If you are not the intended recipient, please note that any copying, distribution or other use of information contained in this e-mail (and its attachments) is not allowed. If you have received this e-mail in error, kindly notify us immediately by telephone or e-mail and delete the message (including any attachments) from your system.
>> Please note that e-mail messages may contain computer viruses or other defects, may not be accurately replicated on other systems, or may be subject of unauthorized interception or other interference without the knowledge of sender or recipient. Tele2 only send and receive e-mails on the basis that Tele2 is not responsible for any such computer viruses, corruption or other interference or any consequences thereof.  It ought to be obvious that my views do not represent my employer's views.
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>     
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>   
