Message-ID: <8b432efdabc3de82146ea6cb87b27c89556bf72e.camel@suse.de>
From: Martin Wilck <mwilck@suse.de>
Date: Fri, 06 Sep 2019 08:51:47 +0200
In-Reply-To: <b3790725-7a60-6fd7-ab64-8dfd75ce6628@suse.com>
References: <c88b7c49-1046-ae78-4352-fa51e1ef7873@suse.com>
	<20190829143759.GA22659@redhat.com>
	<9280276f-8601-cfbc-db46-1dcb28f92229@suse.com>
	<20190903151705.GA30692@redhat.com>
	<ff7a48ee-221d-d5a3-14ad-074806abf5b8@suse.com>
	<370ba3fa-53df-7213-8876-d37ef1a3b57e@suse.com>
	<20190905165519.GB30473@redhat.com>
	<faa66217-fc52-5785-1ca9-d73b13727c12@suse.com>
	<b3790725-7a60-6fd7-ab64-8dfd75ce6628@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>, Heming Zhao <heming.zhao@suse.com>

On Fri, 2019-09-06 at 05:01 +0000, Heming Zhao wrote:
> I just tried to only apply below patch (didn't partly backout commit
> 25b58310e3).
> The attrs of lvs output still have 'a' bit.
> 
> ```patch
> +#if 0
>     			if (!_online_pvscan_one(cmd, dev, NULL,
> complete_vgnames, saved_vgs, 0, &pvid_without_metadata))
>     				add_errors++;
> +#endif


IIUC this would mean that you skip David's "pvs_online" file generation
entirely. How did the auto-activation happen, then?

> ```
> 
> the output of "systemd-analysis blame | head -n 10":
> ```
>           59.279s systemd-udev-settle.service
>           39.979s dracut-initqueue.service
>            1.676s lvm2-activation-net.service

Could it be that lvm2-activation-net.service activated the VGs? I can
imagine that that would be efficient, because when this service runs
late in the boot process, I'd expect all PVs to be online, so
everything can be activated in a single big swoop. Unfortunately, this
wouldn't work in general, as it would be too late for booting from LVM
volumes.

However I thought all lvm2-acticvation... services were gone with LVM
2.03?

Regards
Martin
