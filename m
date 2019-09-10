Date: Tue, 10 Sep 2019 10:20:10 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20190910152010.GA6789@redhat.com>
References: <ff7a48ee-221d-d5a3-14ad-074806abf5b8@suse.com>
	<370ba3fa-53df-7213-8876-d37ef1a3b57e@suse.com>
	<20190905165519.GB30473@redhat.com>
	<faa66217-fc52-5785-1ca9-d73b13727c12@suse.com>
	<b3790725-7a60-6fd7-ab64-8dfd75ce6628@suse.com>
	<8b432efdabc3de82146ea6cb87b27c89556bf72e.camel@suse.de>
	<20190906140351.GB652@redhat.com>
	<c1e8a6d2-d180-03c6-38ab-a402e813e99d@suse.com>
	<20190909140956.GA31823@redhat.com>
	<b17fd5db54c852869c7ad8440f3492c367ced33d.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b17fd5db54c852869c7ad8440f3492c367ced33d.camel@suse.de>
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
To: Martin Wilck <mwilck@suse.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Heming Zhao <heming.zhao@suse.com>

> > > _pvscan_aa
> > >   vgchange_activate
> > >    _activate_lvs_in_vg
> > >     sync_local_dev_names
> > >      fs_unlock
> > >       dm_udev_wait <=== this point!
> > > ```

> Could you explain to us what's happening in this code? IIUC, an
> incoming uevent triggers pvscan, which then possibly triggers VG
> activation. That in turn would create more uevents. The pvscan process
> then waits for uevents for the tree "root" of the activated LVs to be
> processed.
> 
> Can't we move this waiting logic out of the uevent handling? It seems
> weird to me that a process that acts on a uevent waits for the
> completion of another, later uevent. This is almost guaranteed to cause
> delays during "uevent storms". Is it really necessary?
> 
> Maybe we could create a separate service that would be responsible for
> waiting for all these outstanding udev cookies?

Peter Rajnoha walked me through the details of this, and explained that a
timeout as you describe looks quite possible given default timeouts, and
that lvm doesn't really require that udev wait.

So, I pushed out this patch to allow pvscan with --noudevsync:
https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=3e5e7fd6c93517278b2451a08f47e16d052babbb

You'll want to add that option to lvm2-pvscan.service; we can hopefully
update the service to use that if things look good from testing.
