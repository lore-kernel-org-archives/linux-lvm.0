From: Harri Haataja <harri.haataja@smilehouse.com>
Subject: Re: [linux-lvm] extending a logical volume
Message-Id: <20020121233454.C10434@tolppa.smilehouse.com>
References: <20020121224817.B10434@tolppa.smilehouse.com>
    <Pine.LNX.4.33.0201211529020.7136-100000@lx1.daboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0201211529020.7136-100000@lx1.daboard.com>;
    from mitch@mdmiller.com on Mon, Jan 21, 2002 at 03:29:45PM -0600
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Jan 21 15:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 21, 2002 at 03:29:45PM -0600, mitch@mdmiller.com wrote:
> > > > I can't believe this.
> > > > > According to the doc, it would be impossible to
> > > > extend a logical volume
> > >
> > > um - i think i just did this...
> > >
> > > lvextend -L +10G /dev/vg1/data
> > > followed by
> > > resize-reiserfs
> > >
> > > no corruption (at least not that I've noticed)
> >
> > I do this all the time with XFS, Reiser and even ext3.
> > At least reiser also shrinks, I think.
> >
> Sorry to sound stupid, but using what tools?  resize-reiserfs for Reiser,
> but what to use for ext3?

Come to think of it, that may be false. I don't have certain memory of
extn resizing. Sorry. Might try, though. Then it would be resize2fs or
something like that.

resize_reiserfs and xfs_growfs I'm quite certain I have used (how else
have I grown those part^Wvolumes I have?

-- 
Lusers annoy you; Backups are crap;            | -- David P. Murphy
Morons employ you; And samba won't map.        |     in the S.D.M.
Printers need cable; Installs restart;         | (parodying Dorothy
Servers aren't stable; You might as well LART. | Parker's "Resume")
