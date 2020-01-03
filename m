Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28AE02166B29
	for <linux-lvm@redhat.com>; Fri,  3 Jan 2020 03:17:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02DBB80300B
	for <linux-lvm@redhat.com>; Fri,  3 Jan 2020 03:17:17 +0000 (UTC)
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.146) BY
	m4a0072g.houston.softwaregrp.com WITH ESMTP FOR linux-lvm@redhat.com;
	Fri,  3 Jan 2020 03:16:08 +0000
From: Heming Zhao <heming.zhao@suse.com>
Date: Fri, 3 Jan 2020 03:10:45 +0000
Message-ID: <748e6903-abcc-a418-8a81-64519ac16aad@suse.com>
References: <ae5c61f5-8872-6923-cc28-d1ebfb075111@suse.com>
In-Reply-To: <ae5c61f5-8872-6923-cc28-d1ebfb075111@suse.com>
Content-Language: en-US
Content-ID: <130F008630F93243872912246F9979E9@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Question about vgreduce on raid lvm cache
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello list,

I found below question solution, executing removemissing with "--mirrorsonly" is mandatory.
```
vgreduce --removemissing --mirrorsonly --force VG
lvconvert -m0 VG/data_lv
```

But there raise another issue. the default error message is not clear.
When vgreduce on mirrored & cached LVs, user normally runs below command & get below failed messages:
```
# vgreduce --removemissing VG
   WARNING: Couldn't find device with uuid UQZkRE-P8X7-Pkgv-mE5b-q6CY-2DmX-ew2BCn.
   WARNING: VG VG is missing PV UQZkRE-P8X7-Pkgv-mE5b-q6CY-2DmX-ew2BCn.
   WARNING: Couldn't find all devices for LV VG/data_lv_corig_rimage_1 while checking used and assumed devices.
   WARNING: Couldn't find all devices for LV VG/data_lv_corig_rmeta_1 while checking used and assumed devices.
   WARNING: Couldn't find device with uuid UQZkRE-P8X7-Pkgv-mE5b-q6CY-2DmX-ew2BCn.
   WARNING: Partial LV data_lv needs to be repaired or removed.
   WARNING: Partial LV data_lv_corig_rimage_1 needs to be repaired or removed.
   WARNING: Partial LV data_lv_corig_rmeta_1 needs to be repaired or removed.
   WARNING: Partial LV data_lv_corig needs to be repaired or removed.
   There are still partial LVs in VG VG.
   To remove them unconditionally use: vgreduce --removemissing --force.   <===== this command is very dangerous for this mail's scenario
   WARNING: Proceeding to remove empty missing PVs.
   WARNING: Couldn't find device with uuid UQZkRE-P8X7-Pkgv-mE5b-q6CY-2DmX-ew2BCn.
```

Currently the error info are not clear. This very easy to guide user to execute "--removemissing --force", then the LVs will be destroied.

So I filed a patch for this little issue on next mail.

thanks you.

On 11/29/19 4:35 PM, Heming Zhao wrote:
> Hello list,
> 
> I met a lvm cache issue recently.
> 
> The machine had an LVM VG configured with:
>    dev1 + dev2 -> data_lv with raid 1 mirror
>    dev3 + dev4 -> data_cache_lv with raid 1 mirror and type cache
> 
> These were assembled to a cached volume with:
> "lvconvert --type cache --cachemode writeback --cachepool data/data_cache_lv data/data_lv"
> 
> The device dev4 then died and was removed from the system.
> 
> When attempting to remove the device using "vgreduce --removemissing", lvm removed both data_cache_lv and data_lv from the data vg.
> 
> This is unexpected behaviour, as dev1, dev2, dev3 were all still present.
> The expected behaviour should:
> ```
> vgreduce --removemissing
> lvconvert -m0 system/lv
> ```
> 
> When it's a non-cached type, and you performe vgreduce, lvs are NOT removed.
> 
> the (reproduced) command list:
> ```
> pvcreate /dev/mapper/dev1 /dev/mapper/dev2 /dev/mapper/dev3 /dev/mapper/dev4
> vgcreate VG /dev/mapper/dev1 /dev/mapper/dev2 /dev/mapper/dev3 /dev/mapper/dev4
> lvcreate --type raid1 -m 1 -L150 -n data_lv VG /dev/mapper/dev1 /dev/mapper/dev2
> lvcreate --type raid1 -m 1 -L150 -n data_cache_lv VG /dev/mapper/dev3 /dev/mapper/dev4
> lvconvert --type cache --cachemode writeback --cachepool VG/data_cache_lv VG/data_lv
> dmsetup remove -f dev4
> vgreduce --removemissing --force VG
> ```
> 
> Thanks.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
