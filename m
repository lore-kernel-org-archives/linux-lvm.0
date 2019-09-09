From: Heming Zhao <heming.zhao@suse.com>
Date: Mon, 9 Sep 2019 11:42:17 +0000
Message-ID: <c1e8a6d2-d180-03c6-38ab-a402e813e99d@suse.com>
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
	<20190906140351.GB652@redhat.com>
In-Reply-To: <20190906140351.GB652@redhat.com>
Content-Language: en-US
Content-ID: <EFA5CAA35A225D4EB6E4BC164BDBBF66@namprd18.prod.outlook.com>
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
To: David Teigland <teigland@redhat.com>, Martin Wilck <mwilck@suse.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hello David,

You are right.  Without calling _online_pvscan_one(), the pv/vg/lv won't be actived.
The activation jobs will be done by systemd calling lvm2-activation-*.services later.

Current code, the boot process is mainly blocked by:
```
_pvscan_aa
  vgchange_activate
   _activate_lvs_in_vg
    sync_local_dev_names
     fs_unlock
      dm_udev_wait <=== this point!
```

For fix this boot time regression, it looks lvm2 should have a config item in lvm2.conf
i.e.: large_PV_boot_speedup.
When this item is 1, pvcan won't call _online_pvscan_one, then let lvm2-activation*.service
do the active jobs.
Is it a workable solution?

Thanks

On 9/6/19 10:03 PM, David Teigland wrote:
> On Fri, Sep 06, 2019 at 08:51:47AM +0200, Martin Wilck wrote:
>> IIUC this would mean that you skip David's "pvs_online" file generation
>> entirely. How did the auto-activation happen, then?
> 
> I'd like to know which services/commands are activating the LVs.  In the
> slow case it was clearly done by the lvm2-pvscan services, but in the fast
> case it looked like it was not.
> 
>> Could it be that lvm2-activation-net.service activated the VGs?  I can
>> imagine that that would be efficient, because when this service runs
>> late in the boot process, I'd expect all PVs to be online, so
>> everything can be activated in a single big swoop. Unfortunately, this
>> wouldn't work in general, as it would be too late for booting from LVM
>> volumes.
>>
>> However I thought all lvm2-acticvation... services were gone with LVM
>> 2.03?
> 
> They still exist.  In lvm 2.03, the lvm.conf event_activation setting
> controls whether activation is event-based via lvm2-pvscan services, or
> done by lvm2-activation services at fixed points during startup.  LVM
> commands in initramfs could also be interfering and activating more than
> the root LV.
> 
> 
