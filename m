Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o05GD33p031420
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 11:13:03 -0500
Received: from smtp-auth.no-ip.com (smtp-auth.no-ip.com [204.16.252.95])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o05GCp2p020658
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 11:12:52 -0500
Received: from [127.0.0.1] (unknown [62.58.16.80])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: simonloewen.com@noip-smtp)
	by smtp-auth.no-ip.com (Postfix) with ESMTPSA id B359AB4848F
	for <linux-lvm@redhat.com>; Tue,  5 Jan 2010 08:12:50 -0800 (PST)
Message-ID: <4B4364F5.40209@tele2.com>
Date: Tue, 05 Jan 2010 17:12:37 +0100
From: Simon Loewenthal/NL/Tele2 <simon.loewenthal@tele2.com>
MIME-Version: 1.0
References: <4B3B28E5.5030208@tele2.com>	<4B3B2C05.1070902@tele2.com>	<29ae894c0912300352k29bbd06dha89b7dd0045c550@mail.gmail.com>	<1262609658.18517.3.camel@localhost>	<29ae894c1001040517sa6bb7f9v56915a22a820d2c4@mail.gmail.com>	<4B4319D1.2020301@tele2.com>
	<4B4321A4.1030005@tele2.com>
In-Reply-To: <4B4321A4.1030005@tele2.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM preference for multipath verses disk/by-id/scsi
Reply-To: simon.loewenthal@klunky.co.uk,
	LVM general discussion and development <linux-lvm@redhat.com>
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

More info:

I thought for a moment that LVM might cache the devices somewhere other
than in the cache but am unsure as per output from strace :-

# grep -i cach typescript.*
typescript.pvscan:open("/etc/ld.so.cache", O_RDONLY)      = 3
typescript.pvscan:open("/usr/lib64/gconv/gconv-modules.cache", O_RDONLY) = 3
typescript.pvscan:stat("/etc/lvm/.cache", 0x7fff2193b6d0) = -1 ENOENT
(No such file or directory)
typescript.vgscan:open("/etc/ld.so.cache", O_RDONLY)      = 3
typescript.vgscan:open("/usr/lib64/gconv/gconv-modules.cache", O_RDONLY) = 3
typescript.vgscan:stat("/etc/lvm/.cache", 0x7fff8d6ad440) = -1 ENOENT
(No such file or directory)



Simon Loewenthal/NL/Tele2 wrote:
> Update:
>
> I modified the filter to read:
> filter = [ "r|/dev/.*/by-path/.*|", "r|/dev/.*/by-id/.*|",
> "r|/dev/dm-*|" , "a|/dev/mapper/EMC*|", "a|/dev/cciss/*|" , "r/.*/" ]
>
> and this made no difference.
>
> What did work was to turn off the cache and delete the .cache file:
>  write_cache_state = 0
>
> Then the discs were brought in as so:
>  PV Name               /dev/mapper/EMC_00FD    
>   PV UUID               ctz8rd-ew58-0pU8-FssR-x9pR-KSA9-mI4flw
>   PV Status             allocatable
>   Total PE / Free PE    539 / 0
>
>
> Howevr, as soon as I activated the cache:
> write_cache_state = 1
> then the discs in the volume group magically reverted to
>
>  PV Name               /dev/dm-16    
>   PV UUID               ctz8rd-ew58-0pU8-FssR-x9pR-KSA9-mI4flw
>   PV Status             allocatable
>   Total PE / Free PE    539 / 0
>
>
> Any clues?
>
> Simon Loewenthal/NL/Tele2 wrote:
>   
>> I just  this on a system with these in the lvm.conf:
>>     preferred_names = [ "^/dev/mapper/EMC_", "^/dev/[hs]d", "^/dev/cciss" ]
>>     filter = [ "r|/dev/.*/by-path/.*|", "r|/dev/.*/by-id/.*|",
>> "a|/dev/mapper/EMC_*|", "a|/dev/cciss/*|" , "r/.*/" ]
>>
>>
>> After a pvscan and vgscan I did a vgimport. Guess what: A vgimport of
>> the volume group ignored the filters and preferred devices and imported
>> the vg with these PVs (only one PV shown for brevity, but the rest are
>> similar ):
>>
>>  PV Name               /dev/dm-16    
>>   PV UUID               ctz8rd-ew58-0pU8-FssR-x9pR-KSA9-mI4flw
>>   PV Status             allocatable
>>   Total PE / Free PE    539 / 0
>>
>> Unless, /dev/dm-16 is really some abstracted link back to a multipathed
>> device but I cannot work out this bit:
>> # ls -l /dev/mapper/
>> total 0
>> brw------- 1 root root 253, 17 Dec 30 15:11 EMC_0012
>> [SNIP]
>>
>> # dmsetup ls
>> EMC_0103    (253, 13)
>> EMC_00FF    (253, 15)
>> EMC_0101    (253, 14)
>> EMC_00FD    (253, 16)
>> vg00-app052    (253, 3)
>> vg00-xen    (253, 2)
>> vg00-usr    (253, 0)
>> EMC_0113    (253, 4)
>> vg00-var    (253, 1)
>> EMC_0012    (253, 17)
>> EMC_010F    (253, 6)
>> EMC_0109    (253, 10)
>> EMC_0111    (253, 5)
>> EMC_010D    (253, 8)
>> EMC_0107    (253, 11)
>> EMC_010B    (253, 9)
>> EMC_0105    (253, 12)
>>
>>
>> The output of pvscan and vgscan follow:
>>
>> *PVSCAN*
>> # pvscan -vv
>>       Setting global/locking_type to 1
>>       File-based locking selected.
>>       Setting global/locking_dir to /var/lock/lvm
>>     Wiping cache of LVM-capable devices
>>     Wiping internal VG cache
>>     Walking through all physical volumes
>>       /dev/cciss/c0d0: size is 286677120 sectors
>>       /dev/cciss/c0d0p1: size is 208782 sectors
>>       /dev/cciss/c0d0p1: size is 208782 sectors
>>       /dev/cciss/c0d0p1: No label detected
>>       /dev/cciss/c0d0p2: size is 4209030 sectors
>>       /dev/cciss/c0d0p2: size is 4209030 sectors
>>       /dev/cciss/c0d0p2: No label detected
>>       /dev/cciss/c0d0p3: size is 10490445 sectors
>>       /dev/cciss/c0d0p3: size is 10490445 sectors
>>       /dev/cciss/c0d0p3: No label detected
>>       /dev/cciss/c0d0p4: size is 271755540 sectors
>>       /dev/cciss/c0d0p4: size is 271755540 sectors
>>       /dev/cciss/c0d0p4: lvm2 label detected
>>       /dev/mapper/EMC_0113: size is 35358720 sectors
>>       /dev/mapper/EMC_0113: size is 35358720 sectors
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: size is 35358720 sectors
>>       /dev/mapper/EMC_0111: size is 35358720 sectors
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: size is 35358720 sectors
>>       /dev/mapper/EMC_010F: size is 35358720 sectors
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: size is 35358720 sectors
>>       /dev/mapper/EMC_010D: size is 35358720 sectors
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: size is 35358720 sectors
>>       /dev/mapper/EMC_010B: size is 35358720 sectors
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: size is 35358720 sectors
>>       /dev/mapper/EMC_0109: size is 35358720 sectors
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: size is 35358720 sectors
>>       /dev/mapper/EMC_0107: size is 35358720 sectors
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: size is 35358720 sectors
>>       /dev/mapper/EMC_0105: size is 35358720 sectors
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: size is 35358720 sectors
>>       /dev/mapper/EMC_0103: size is 35358720 sectors
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: size is 35358720 sectors
>>       /dev/mapper/EMC_0101: size is 35358720 sectors
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: size is 35358720 sectors
>>       /dev/mapper/EMC_00FF: size is 35358720 sectors
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: size is 35358720 sectors
>>       /dev/mapper/EMC_00FD: size is 35358720 sectors
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0012: size is 9600 sectors
>>       /dev/mapper/EMC_0012: size is 9600 sectors
>>       /dev/mapper/EMC_0012: No label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/cciss/c0d0p4: lvm2 label detected
>>       /dev/cciss/c0d0p4: lvm2 label detected
>>   PV /dev/mapper/EMC_0113    is in exported VG vg_mds [16.84 GB / 0    free]
>>   PV /dev/mapper/EMC_0111    is in exported VG vg_mds [16.84 GB / 0    free]
>>   PV /dev/mapper/EMC_010F    is in exported VG vg_mds [16.84 GB / 0    free]
>>   PV /dev/mapper/EMC_010D    is in exported VG vg_mds [16.84 GB / 0    free]
>>   PV /dev/mapper/EMC_010B    is in exported VG vg_mds [16.84 GB / 0    free]
>>   PV /dev/mapper/EMC_0109    is in exported VG vg_mds [16.84 GB / 0    free]
>>   PV /dev/mapper/EMC_0107    is in exported VG vg_mds [16.84 GB / 0    free]
>>   PV /dev/mapper/EMC_0105    is in exported VG vg_mds [16.84 GB / 0    free]
>>   PV /dev/mapper/EMC_0103    is in exported VG vg_mds [16.84 GB / 0    free]
>>   PV /dev/mapper/EMC_0101    is in exported VG vg_mds [16.84 GB / 0    free]
>>   PV /dev/mapper/EMC_00FF    is in exported VG vg_mds [16.84 GB / 0    free]
>>   PV /dev/mapper/EMC_00FD    is in exported VG vg_mds [16.84 GB / 0    free]
>>   PV /dev/cciss/c0d0p4      VG vg00     lvm2 [129.58 GB / 44.00 MB free]
>>   Total: 13 [331.71 GB] / in use: 13 [331.71 GB] / in no VG: 0 [0   ]
>>
>> *VGSCAN
>> *# vgscan -vv
>>       Setting global/locking_type to 1
>>       File-based locking selected.
>>       Setting global/locking_dir to /var/lock/lvm
>>     Wiping cache of LVM-capable devices
>>     Wiping internal VG cache
>>   Reading all physical volumes.  This may take a while...
>>     Finding all volume groups
>>       /dev/cciss/c0d0: size is 286677120 sectors
>>       /dev/cciss/c0d0p1: size is 208782 sectors
>>       /dev/cciss/c0d0p1: size is 208782 sectors
>>       /dev/cciss/c0d0p1: No label detected
>>       /dev/cciss/c0d0p2: size is 4209030 sectors
>>       /dev/cciss/c0d0p2: size is 4209030 sectors
>>       /dev/cciss/c0d0p2: No label detected
>>       /dev/cciss/c0d0p3: size is 10490445 sectors
>>       /dev/cciss/c0d0p3: size is 10490445 sectors
>>       /dev/cciss/c0d0p3: No label detected
>>       /dev/cciss/c0d0p4: size is 271755540 sectors
>>       /dev/cciss/c0d0p4: size is 271755540 sectors
>>       /dev/cciss/c0d0p4: lvm2 label detected
>>       /dev/mapper/EMC_0113: size is 35358720 sectors
>>       /dev/mapper/EMC_0113: size is 35358720 sectors
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: size is 35358720 sectors
>>       /dev/mapper/EMC_0111: size is 35358720 sectors
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: size is 35358720 sectors
>>       /dev/mapper/EMC_010F: size is 35358720 sectors
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: size is 35358720 sectors
>>       /dev/mapper/EMC_010D: size is 35358720 sectors
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: size is 35358720 sectors
>>       /dev/mapper/EMC_010B: size is 35358720 sectors
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: size is 35358720 sectors
>>       /dev/mapper/EMC_0109: size is 35358720 sectors
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: size is 35358720 sectors
>>       /dev/mapper/EMC_0107: size is 35358720 sectors
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: size is 35358720 sectors
>>       /dev/mapper/EMC_0105: size is 35358720 sectors
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: size is 35358720 sectors
>>       /dev/mapper/EMC_0103: size is 35358720 sectors
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: size is 35358720 sectors
>>       /dev/mapper/EMC_0101: size is 35358720 sectors
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: size is 35358720 sectors
>>       /dev/mapper/EMC_00FF: size is 35358720 sectors
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: size is 35358720 sectors
>>       /dev/mapper/EMC_00FD: size is 35358720 sectors
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0012: size is 9600 sectors
>>       /dev/mapper/EMC_0012: size is 9600 sectors
>>       /dev/mapper/EMC_0012: No label detected
>>       Locking /var/lock/lvm/V_vg_mds RB
>>     Finding volume group "vg_mds"
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>       /dev/mapper/EMC_0113: lvm2 label detected
>>       /dev/mapper/EMC_0111: lvm2 label detected
>>       /dev/mapper/EMC_010F: lvm2 label detected
>>       /dev/mapper/EMC_010D: lvm2 label detected
>>       /dev/mapper/EMC_010B: lvm2 label detected
>>       /dev/mapper/EMC_0109: lvm2 label detected
>>       /dev/mapper/EMC_0107: lvm2 label detected
>>       /dev/mapper/EMC_0105: lvm2 label detected
>>       /dev/mapper/EMC_0103: lvm2 label detected
>>       /dev/mapper/EMC_0101: lvm2 label detected
>>       /dev/mapper/EMC_00FF: lvm2 label detected
>>       /dev/mapper/EMC_00FD: lvm2 label detected
>>   Found exported volume group "vg_mds" using metadata type lvm2
>>       Unlocking /var/lock/lvm/V_vg_mds
>>       Locking /var/lock/lvm/V_vg00 RB
>>     Finding volume group "vg00"
>>       /dev/cciss/c0d0p4: lvm2 label detected
>>       /dev/cciss/c0d0p4: lvm2 label detected
>>   Found volume group "vg00" using metadata type lvm2
>>       Unlocking /var/lock/lvm/V_vg00
>>
>> brem belguebli wrote:
>>   
>>     
>>> Hi,
>>>
>>> Never had no problem with it.
>>>
>>> The only problem I've hit was due to the binding file being, by
>>> default, located in /var/lib/multipath, which is in my setup on a
>>> separate LV than /, during boot time the devices were not correctly
>>> created.
>>>
>>> Just had to switch the binding file to /etc and now no more problem.
>>>
>>> extract of my /etc/multipath.conf :
>>>
>>>
>>> defaults {
>>> ...
>>>         flush_on_last_del       yes
>>>         user_friendly_names     yes
>>>         bindings_file "/etc/multipath_bindings"
>>> }
>>>
>>> 2010/1/4 Bryn M. Reeves <bmr@redhat.com>:
>>>   
>>>     
>>>       
>>>> On Wed, 2009-12-30 at 12:52 +0100, brem belguebli wrote:
>>>>     
>>>>       
>>>>         
>>>>> Hi,
>>>>>
>>>>> see man 5 lvm.conf there is an option called preferred_names which is
>>>>> well explained
>>>>>
>>>>> It'll instruct lvm to use the preferred_names you configured in the
>>>>> lvm.conf file if they exist
>>>>>
>>>>> ie : preferred_names = "/dev/mpath/" will use /dev/mpath/XXX instead
>>>>> of /dev/mapper/XXX
>>>>>       
>>>>>         
>>>>>           
>>>> It's best not to use the symlinks in /dev/mpath - they are not always
>>>> reliable. Use the device nodes created in /dev/mapper instead.
>>>>
>>>> Regards,
>>>> Bryn.
>>>>
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>>
>>>>     
>>>>       
>>>>         
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>   
>>>     
>>>       
>>   
>>     
>
>   

-- 
Simon Loewenthal/Tele2
GSM: +31 6 2000 5427

******** IMPORTANT NOTICE ********
Please repect the X-Reply to klunky.co.uk. PGP available 0xD86A5A17. 
S/MIME PKCS12 key available for Lotus Notes: Please ask me for it.
This e-mail (including any attachments) may contain information that is confidential or otherwise protected from disclosure and it is intended only for the addressees. If you are not the intended recipient, please note that any copying, distribution or other use of information contained in this e-mail (and its attachments) is not allowed. If you have received this e-mail in error, kindly notify us immediately by telephone or e-mail and delete the message (including any attachments) from your system.
Please note that e-mail messages may contain computer viruses or other defects, may not be accurately replicated on other systems, or may be subject of unauthorized interception or other interference without the knowledge of sender or recipient. Tele2 only send and receive e-mails on the basis that Tele2 is not responsible for any such computer viruses, corruption or other interference or any consequences thereof.  It ought to be obvious that my views do not represent my employer's views.
