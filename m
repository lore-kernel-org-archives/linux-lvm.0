Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q2673pHC013293
	for <linux-lvm@redhat.com>; Tue, 6 Mar 2012 02:03:51 -0500
Received: from mail-pw0-f46.google.com (mail-pw0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2673o8v008060
	for <linux-lvm@redhat.com>; Tue, 6 Mar 2012 02:03:50 -0500
Received: by pbcun15 with SMTP id un15so5055162pbc.33
	for <linux-lvm@redhat.com>; Mon, 05 Mar 2012 23:03:50 -0800 (PST)
Date: Mon, 5 Mar 2012 23:03:48 -0800
From: Kent Overstreet <koverstreet@google.com>
Message-ID: <20120306070348.GA2601@dhcp-172-18-216-138.mtv.corp.google.com>
References: <CAOzFzEjKapphA5NKCWbEyx4nvjWw+e_dxr+fOLr8f5j586jiyA@mail.gmail.com>
	<CAOzFzEjffLGjYhOznTo1F3moHLq+nvKYZFoy7mkU-q8RPDd9oQ@mail.gmail.com>
	<CAC7rs0vpQAaF9uNhhy2ziLa+3EB6udJVRjGwf=RVoSk0TxuDcw@mail.gmail.com>
	<CAC7rs0us5Xqag_AWq=wsFYqn3Fub3qt59a9=vDeS5cLh2oOg0Q@mail.gmail.com>
	<CAOzFzEifqyFz2G=0OEPA9BN8-kU3MabUhGmU7-jSQCxwPcHrpw@mail.gmail.com>
	<CAH+dOx+eWJKvKz=HEGHaPu8tqqz2CqVjUC1+0GJqta0GE4aYNw@mail.gmail.com>
	<CAOzFzEj=gBXL9UaVytrebU3gr2p1rJaMVPkz1X0oZOALQKbcNA@mail.gmail.com>
	<CAH+dOxKznm_mhe_TkN5eOY8tz6snyAC0TF6bsZpi4P1KtDd9kA@mail.gmail.com>
	<CAOzFzEiSR1izXGuS+djSpCJOTnaPU6KetR=wB8tXmPopUk4Jrg@mail.gmail.com>
	<20120304142139.GA10510@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20120304142139.GA10510@redhat.com>
Subject: Re: [linux-lvm] bcache and dm targets (specifically lvm)
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: Joseph Glanville <joseph.glanville@orionvm.com.au>, linux-bcache@vger.kernel.org, Kent Overstreet <kent.overstreet@gmail.com>, linux-lvm@redhat.com

On Sun, Mar 04, 2012 at 09:21:40AM -0500, Mike Snitzer wrote:
> On Fri, Mar 02 2012 at  9:28pm -0500,
> Joseph Glanville <joseph.glanville@orionvm.com.au> wrote:
> 
> > Ahh!
> > 
> > I didn't know LVM had a device type lookup table. You can see if you
> > look further that it also reads new types from the lvm.conf file.
> > Adding this line to lvm.conf fixes the problem:
> > 
> > types = [ "bcache", 16 ]
> >
> > I would imagine if merged it would be added to the internal compiled in table.
> 
> Assuming bcache devices are partitionable 16 would be used (like patch
> below), if they aren't then 1 would be used.

Thanks... any insight into what that table is for?

> Kent,
> 
> I know you were frustrated with DM in the past and that is why you
> created your own device type.

That'd be accurate :)

> I'll be looking much closer at bcache in the next week or so.  I'm
> starting to work on a DM-based caching target... it will re-use the
> drivers/md/persistent-data/ infrastructure we've established as part of
> the DM Thin Provisioning target.

Interesting... I'm also working on thin provisioning in bcache. It's
functional now but not production ready, pending the copying garbage
collector which I'm working on now.

For now it'll only be suitable for flash though, as it uses the same
allocation code as the caching code and assumes efficient random reads.

> Anyway, even if bcache remains to be a standalone (non-DM) block device
> in the future I'll have a look at it with an eye toward code sharing
> that might allow other caching layers to build on a common layer.  Even
> if the common code is a policy engine I think it'd be cool to allow
> sharing of policy across caching targets.

I've been working on making bcache's b+tree and other code more modular
for building other things around it. It's gotten quite fast, capable of
somewhere north of a million lookups per second.

> That said I'm also open to porting bcache to DM... but time will tell.
> I'll grab the latest bcache code and jump on the linux-bcache list and
> we can take it one step at a time.

I'm not averse to a dm interface for bcache (though I don't really see
the usefulness myself)... I could definitely spend some time walking you
through code and improving documentation, if you're interested. 
