Date: Fri, 6 Sep 2019 09:15:31 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20190906141531.GC652@redhat.com>
References: <20190829143759.GA22659@redhat.com>
	<9280276f-8601-cfbc-db46-1dcb28f92229@suse.com>
	<20190903151705.GA30692@redhat.com>
	<ff7a48ee-221d-d5a3-14ad-074806abf5b8@suse.com>
	<370ba3fa-53df-7213-8876-d37ef1a3b57e@suse.com>
	<20190905165519.GB30473@redhat.com>
	<faa66217-fc52-5785-1ca9-d73b13727c12@suse.com>
	<b3790725-7a60-6fd7-ab64-8dfd75ce6628@suse.com>
	<8b432efdabc3de82146ea6cb87b27c89556bf72e.camel@suse.de>
	<4552ae36-09fc-9145-d768-80b4ef572bca@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4552ae36-09fc-9145-d768-80b4ef572bca@suse.com>
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

On Fri, Sep 06, 2019 at 08:46:52AM +0000, Heming Zhao wrote:
> the core/key code for online lvs is _pvscan_aa():
> _pvscan_aa
>   +-> _pvscan_aa_direct
>   |    vgchange_activate
>   |
>   or
>   |
>   +-> process_each_vg   //this func can work without reading /run/lvm/pvs_online/xx
>        _pvscan_aa_single
>          vgchange_activate
> 
> So my first patch partly backout commit 25b58310e3d6. To use process_each_vg active lvs, this func can work without reading /run/lvm/pvs_online/xx.

That commit is a couple days old, so there could still be a bug in there,
but I think it's a distraction.  You reported this slowness prior to that
commit existing.  You could revert it if it's causing questions.

I don't see much use in testing modified code until we've determined that
a given command is indeed slower when doing the same thing as before.  If
you can do that, then collect the debug output from both old and new for
me to compare (-vvvv or lvm.conf file and verbose settings).
