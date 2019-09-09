Date: Mon, 9 Sep 2019 09:09:56 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20190909140956.GA31823@redhat.com>
References: <9280276f-8601-cfbc-db46-1dcb28f92229@suse.com>
	<20190903151705.GA30692@redhat.com>
	<ff7a48ee-221d-d5a3-14ad-074806abf5b8@suse.com>
	<370ba3fa-53df-7213-8876-d37ef1a3b57e@suse.com>
	<20190905165519.GB30473@redhat.com>
	<faa66217-fc52-5785-1ca9-d73b13727c12@suse.com>
	<b3790725-7a60-6fd7-ab64-8dfd75ce6628@suse.com>
	<8b432efdabc3de82146ea6cb87b27c89556bf72e.camel@suse.de>
	<20190906140351.GB652@redhat.com>
	<c1e8a6d2-d180-03c6-38ab-a402e813e99d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1e8a6d2-d180-03c6-38ab-a402e813e99d@suse.com>
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
Content-Transfer-Encoding: 7bit
To: Heming Zhao <heming.zhao@suse.com>
Cc: Martin Wilck <mwilck@suse.de>, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Sep 09, 2019 at 11:42:17AM +0000, Heming Zhao wrote:
> Hello David,
> 
> You are right.  Without calling _online_pvscan_one(), the pv/vg/lv won't be actived.
> The activation jobs will be done by systemd calling lvm2-activation-*.services later.
> 
> Current code, the boot process is mainly blocked by:
> ```
> _pvscan_aa
>   vgchange_activate
>    _activate_lvs_in_vg
>     sync_local_dev_names
>      fs_unlock
>       dm_udev_wait <=== this point!
> ```

Thanks for debugging that.  With so many devices, one possibility that
comes to mind is this error you would probably have seen:
"Limit for the maximum number of semaphores reached"

> For fix this boot time regression, it looks lvm2 should have a config item in lvm2.conf
> i.e.: large_PV_boot_speedup.
> When this item is 1, pvcan won't call _online_pvscan_one, then let lvm2-activation*.service
> do the active jobs.
> Is it a workable solution?

We should look into fixing the udev problems.  I don't mind working around
udev when it won't do what we need; I'm not sure what the options are in
this case.
