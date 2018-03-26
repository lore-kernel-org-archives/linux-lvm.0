References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
	<229d22d1217a7fa96874df0fb6d53e0c@xenhideout.nl>
	<5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5e060c21-7d38-bfd6-8908-a3fc65e8492f@redhat.com>
Date: Mon, 26 Mar 2018 12:46:01 +0200
MIME-Version: 1.0
In-Reply-To: <5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Can't work normally after attaching disk volumes
 originally in a VG on another machine
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <ghe@suse.com>

Dne 26.3.2018 v 08:04 Gang He napsal(a):
> Hi Xen,
> 
> 
>>>>
>> Gang He schreef op 23-03-2018 9:30:
>>
>>> 6) attach disk2 to VM2(tb0307-nd2), the vg on VM2 looks abnormal.
>>> tb0307-nd2:~ # pvs
>>>    WARNING: Device for PV JJOL4H-kc0j-jyTD-LDwl-71FZ-dHKM-YoFtNV not
>>> found or rejected by a filter.
>>>    PV         VG  Fmt  Attr PSize  PFree
>>>    /dev/vdc   vg2 lvm2 a--  20.00g 20.00g
>>>    /dev/vdd   vg1 lvm2 a--  20.00g 20.00g
>>>    [unknown]  vg1 lvm2 a-m  20.00g 20.00g
>>
>> This is normal because /dev/vdd contains metadata for vg1 which includes
>> now missing disk /dev/vdc      .... as the PV is no longer the same.
>>
>>
>>
>>
>>> tb0307-nd2:~ # vgs
>>>    WARNING: Device for PV JJOL4H-kc0j-jyTD-LDwl-71FZ-dHKM-YoFtNV not
>>> found or rejected by a filter.
>>>    VG  #PV #LV #SN Attr   VSize  VFree
>>>    vg1   2   0   0 wz-pn- 39.99g 39.99g
>>>    vg2   1   0   0 wz--n- 20.00g 20.00g
>>
>> This is normal because you haven't removed /dev/vdc from vg1 on
>> /dev/vdd, since it was detached while you operated on its vg.
>>
>>
>>> 7) reboot VM2, the result looks worse (vdc disk belongs to two vg).
>>> tb0307-nd2:/mnt/shared # pvs
>>>    PV         VG  Fmt  Attr PSize  PFree
>>>    /dev/vdc   vg1 lvm2 a--  20.00g     0
>>>    /dev/vdc   vg2 lvm2 a--  20.00g 10.00g
>>>    /dev/vdd   vg1 lvm2 a--  20.00g  9.99g
>>
>> When you removed vdd when it was not attached, the VG1 metadata on vdd
>> was not altered. The metadata resides on both disks, so you had
>> inconsistent metadata between both disks because you operated on the
>> shared volume group while one device was missing.
>>
>> You also did not recreate PV on /dev/vdc so it has the same UUID as when
>> it was part of VG1, this is why VG1 when VDD is booted will still try to
>> include /dev/vdc because it was never removed from the volume group on
>> VDD.
>>
>> So the state of affairs is:
>>
>> /dev/vdc contains volume group info for VG2 and includes only /dev/vdc
>>
>> /dev/vdd contains volume group info for VG1, and includes both /dev/vdc
>> and /dev/vdd by UUID for its PV, however, it is a bug that it should
>> include /dev/vdc even though the VG UUID is now different (and the name
>> as well).
> It looks like each PV includes a copy meta data for VG, but if some PV has changed (e.g. removed, or moved to another VG),
> the remained PV should have a method to check the integrity when each startup (activated?), to avoid such inconsistent problem automatically.
> 
>


Hi

I'm not really sure what are you trying to achieve - are you 'validating' that 
you cannot foolish lvm2 too easily or something else ?

Simple case is when you have a VG on 2 PV disks. Both PV hold full metadata 
for a VG. There are numerous other case - i.e. you can have 1000PVs in single 
VG then any update of metadata would require to update 1000 disks - for this 
case you can select lower number metadata copies - i.e. randomly or 
user-selected  PVs only hold VG metadata and rest of PV are without metadata.
The less metadata copies - the less secure it is, but update is faster...


There are no metadata for use stored in your filesystem - VG metadata are 
always recorded in PV metadata area.


1.) So when you 1st. remove device and then you run 'pvremove' on this missing 
disk, it's kind of pointless operation.

2.) lvm2 command will not let you 'easily' remove PV which is in use by some 
LV in your VG

3.) lvm2 supports 2 commands:
   'vgreduce --removemissing'    (try to make consistent VG when PV is lost)
   'vgextend --restoeremissing'  (restore missing PV back into VG)


Regards

Zdenek
