From: <mitch@mdmiller.com>
Subject: Re: [linux-lvm] extending a logical volume
In-Reply-To: <20020121224817.B10434@tolppa.smilehouse.com>
Message-Id: <Pine.LNX.4.33.0201211529020.7136-100000@lx1.daboard.com>
MIME-Version: 1.0
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
Date: Mon Jan 21 15:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> > > I can't believe this.
> > > > According to the doc, it would be impossible to
> > > extend a logical volume
> >
> > um - i think i just did this...
> >
> > lvextend -L +10G /dev/vg1/data
> > followed by
> > resize-reiserfs
> >
> > no corruption (at least not that I've noticed)
>
> I do this all the time with XFS, Reiser and even ext3.
> At least reiser also shrinks, I think.
>
>
Sorry to sound stupid, but using what tools?  resize-reiserfs for Reiser,
but what to use for ext3?

--Mitch
