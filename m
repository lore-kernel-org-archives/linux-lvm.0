Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9IHMDhW009118
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 13:22:13 -0400
Received: from svc.anykey.de (service.anykey.de [213.168.80.18])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9IHM88Q018687
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 13:22:08 -0400
Received: from eu.main.anykey (unknown [192.168.200.17])
	by svc.anykey.de (anykey GmbH) with ESMTP id 192835C6B5
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 19:21:41 +0200 (CEST)
Received: from [127.0.0.1] (service.anykey.de [213.168.80.18])
	by eu.main.anykey (Postfix) with ESMTP id 0647C127E8
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 19:21:57 +0200 (CEST)
Message-ID: <453662B3.6000603@anykey.de>
Date: Wed, 18 Oct 2006 19:21:55 +0200
From: Andreas Octav <andreas.octav@anykey.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] "System ID" entry missing in metadata (LVM2) ?!
References: <1591887.1161167319269.OPEN-XCHANGE.WebMail.wwwrun@eu.main.anykey>	<3673884.1161175340523.OPEN-XCHANGE.WebMail.wwwrun@eu.main.anykey>	<de2c187f9caa97b59d590fc079a61702@redhat.com>	<45365026.90006@anykey.de>
	<ef27ef6e007de550b667566332420b44@redhat.com>
In-Reply-To: <ef27ef6e007de550b667566332420b44@redhat.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Sorry, i did not express myself correct: I do not want to share the 
logical volumes for the use of a Cluster Filesystem (OCFS etc.). I just 
want to be able to switch the volume groups from one host to another, so 
only one host at a time has access to a specific volume group. But if I 
do an vgimport on a host, every host that sees the VG can use it...
I am going to install several Oracle/SAP instances in different Volume 
Groups and I want to be sure that only one host can access a specific VG 
at a time.
The Veritas Volume Manager for example automatically sets a host id of 
the system that imports a VG (DiskGroup in Veritas terms) during an 
import, so any other system has to "force" an import, resulting in a 
loss of access on the former owner.

Btw: In LVM1 the system ID is used:
..snip..

vgdisplay  VG Name               vg
vgdisplay  System ID             PV_IMPKnoppix1077635774
vgdisplay  Format                lvm1
..snap..

Is this obsolete in LVM2?


Jonathan E Brassow schrieb:
> I think it works in the reverse...
>
> vgexport adds a generic tag to the volume groups metadata, basically 
> saying "ignore me".  Doing a 'vgs' on an exported volume group shows 
> the 'x' attribute; and trying to activate that volume group results in 
> "Volume group "<vgname>" is exported".  So, after performing this 
> operation, no-one can use the volume group (until vgimport is run).
>
> vgimport removes the generic tag, allowing the VG to be activated and 
> used again.  One this command is run, anyone that can see the volume 
> group can use/alter the volume group.
>
> Think of it as "import/export from the set of usable volume groups".
>
> If you want to share the VGs, you have two options:
> 1) Use clustered LVM2.  This is really the best option.
> 2) Set up your logical volumes on one machine (you should only use 
> linear or stripe in this scenario - never mirror or snapshot).  Never 
> change the logical volume layout after creating it unless the other 
> hosts have deactivated the volume groups being  shared.  Run 'vgchange 
> -ay' on all machines that have access to the devices.
>
> Clustered LVM2 makes sure that all changes to a shared volume group 
> are serialized to prevent corruption and makes sure to 
> activate/deactivate volumes on a cluster-wide basis.   If you are 
> never going to change anything (no risk of corruption or 
> inconsistencies), you might be able to get away with using LVM2 as it is.
>
> If you need more specialized access, you can use tags.
>
> Note, if you are sharing a logical volume, the application (or file 
> system) sharing that volume must be cluster-aware.
>
>  brassow
>
> On Oct 18, 2006, at 11:02 AM, Andreas Octav wrote:
>
>> Hi,
>>
>> thanks for your response Jonathan, but I want to share the VGs 
>> between the hosts. So I hoped that there is something like this 
>> functionality:
>> -> "vgimport VG" writes some kind of hostid (system_id?) in the metadata
>> -> other hosts can�t access the VG
>> -> "vgdeport VG" removes the ID, so anyone else can import the VG
>>
>> My C knowledge isn�t very good, but the sources seem to include a 
>> functionality like the one mentioned above.
>>
>>
>> Kind regards,
>> Andreas
>>
>> Jonathan E Brassow schrieb:
>>>
>>>>> Hi,
>>>>>
>>>>> i�m new to LVM2 and wondering if it�s possible to restrict access 
>>>>> to a
>>>>> Volume Group to a single server (e.g. like under vxvm (vxdg
>>>>> import/deport)).
>>>>> If I import a VG by using vgimport it is still possible to access the
>>>>> VG
>>>>> on another node in a shared SAN environment. Can I prevent this
>>>>> somehow?
>>>>>
>>>>> I�m using lvm2-2.01.14-3.6 on servers running SuSE SLES9 SP3 x86_64.
>>>>>
>>>
>>> You can use tags to achieve this, or you can specify specific volume 
>>> groups and logical volumes in lvm.conf under "volume_list".
>>>
>>>  brassow
>>>
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
