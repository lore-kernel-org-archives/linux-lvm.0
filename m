From: Heming Zhao <heming.zhao@suse.com>
Date: Fri, 6 Sep 2019 08:46:52 +0000
Message-ID: <4552ae36-09fc-9145-d768-80b4ef572bca@suse.com>
References: <c88b7c49-1046-ae78-4352-fa51e1ef7873@suse.com>
	<20190829143759.GA22659@redhat.com>
	<9280276f-8601-cfbc-db46-1dcb28f92229@suse.com>
	<20190903151705.GA30692@redhat.com>
	<ff7a48ee-221d-d5a3-14ad-074806abf5b8@suse.com>
	<370ba3fa-53df-7213-8876-d37ef1a3b57e@suse.com>
	<20190905165519.GB30473@redhat.com>
	<faa66217-fc52-5785-1ca9-d73b13727c12@suse.com>
	<b3790725-7a60-6fd7-ab64-8dfd75ce6628@suse.com>
	<8b432efdabc3de82146ea6cb87b27c89556bf72e.camel@suse.de>
In-Reply-To: <8b432efdabc3de82146ea6cb87b27c89556bf72e.camel@suse.de>
Content-Language: en-US
Content-ID: <8E1A6A646F5E3A419F8A263BF8DFD73D@namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] system boot time regression when using lvm2-2.03.05
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
To: Martin Wilck <mwilck@suse.de>, LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>

the _online_pvscan_one cost too much time when booting.
It mainly job is to create file in /run/lvm/pvs_online, which role is to replace lvmetad.

when comment out _online_pvscan_one, below folders are blank
/run/lvm/pvs_online  & /run/lvm/vgs_online

I am not familiar with vg metadata layout. I GUESS the vg metadata is recorded on the first PV dev of PVs group devs. So the _online_pv_found job just use the vg metadata info to find/print whether or not this vg is ready. this part code cost time & less useful when system boot. Or in another word, this part code is not necessary for online vg/lv.
```c
_online_pv_found()
{
     _online_pvid_file_create // call open() to create "/run/lvm/pvs_online/xx"

     ... ...

     //zhm: below code just count the not online PV number.
     dm_list_iterate_items(pvl, &vg->pvs) {
         if (!_online_pvid_file_exists((const char *)&pvl->pv->id.uuid))
             pvids_not_online++;

         /* Check if one of the devs on the command line is in this VG. */
         if (dev_args && dev_in_device_list(pvl->pv->dev, dev_args))
             dev_args_in_vg = 1;
     }
}
```

the core/key code for online lvs is _pvscan_aa():
_pvscan_aa
  +-> _pvscan_aa_direct
  |    vgchange_activate
  |
  or
  |
  +-> process_each_vg   //this func can work without reading /run/lvm/pvs_online/xx
       _pvscan_aa_single
         vgchange_activate

So my first patch partly backout commit 25b58310e3d6. To use process_each_vg active lvs, this func can work without reading /run/lvm/pvs_online/xx.

For the _pvscan_aa_direct(), I don't totally understand it. I need some time to dig it.


On 9/6/19 2:51 PM, Martin Wilck wrote:
> On Fri, 2019-09-06 at 05:01 +0000, Heming Zhao wrote:
>> I just tried to only apply below patch (didn't partly backout commit
>> 25b58310e3).
>> The attrs of lvs output still have 'a' bit.
>>
>> ```patch
>> +#if 0
>>      			if (!_online_pvscan_one(cmd, dev, NULL,
>> complete_vgnames, saved_vgs, 0, &pvid_without_metadata))
>>      				add_errors++;
>> +#endif
> 
> 
> IIUC this would mean that you skip David's "pvs_online" file generation
> entirely. How did the auto-activation happen, then?
> 
>> ```
>>
>> the output of "systemd-analysis blame | head -n 10":
>> ```
>>            59.279s systemd-udev-settle.service
>>            39.979s dracut-initqueue.service
>>             1.676s lvm2-activation-net.service
> 
> Could it be that lvm2-activation-net.service activated the VGs? I can
> imagine that that would be efficient, because when this service runs
> late in the boot process, I'd expect all PVs to be online, so
> everything can be activated in a single big swoop. Unfortunately, this
> wouldn't work in general, as it would be too late for booting from LVM
> volumes.
> 
> However I thought all lvm2-acticvation... services were gone with LVM
> 2.03?
> 
> Regards
> Martin
> 
> 
