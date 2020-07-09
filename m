Date: Thu, 9 Jul 2020 12:01:28 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200709170128.GB9029@redhat.com>
References: <HE1PR0402MB3514D6153AB2978268A015BDCF670@HE1PR0402MB3514.eurprd04.prod.outlook.com>
	<20200708160519.GA23533@redhat.com>
	<f699b25f-4962-4b47-b0ab-9ab5c944a032@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f699b25f-4962-4b47-b0ab-9ab5c944a032@suse.com>
Subject: Re: [linux-lvm] About online pvmove/lvresize on shared VG
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
To: Gang He <ghe@suse.com>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Thu, Jul 09, 2020 at 08:44:23AM +0800, Gang He wrote:
> > pvmove is implemented with mirroring, so that mirroring would need to be
> > replaced with something that works with concurrent access, e.g. cluster md
> > raid1.  I suspect there are better approaches than pvmove to solve the
> > broader problem.
> Sorry, I am a little confused.
> In the future, we can do online pvmove when VG is activated in shared mode?

I think it's unlikely, but possible if someone has interest.  I'd first
encourage them to think about new ways to solve the problem.

> from man page, I feel these limitations are temporary (or Not Yet Complete).

wording should probably change

> By the way, --lockopt option can help this situation? I cannot find the
> detailed description for this option in manpage.

No, lockopt is for some one-off special cases where we might need to work
around ordinary behaviors (like --nolocking.)  There's no workaround to
the problem that dm-mirror doesn't work under a shared LV.

Dave
