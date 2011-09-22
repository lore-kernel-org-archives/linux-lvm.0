Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8MAusvs004595
	for <linux-lvm@redhat.com>; Thu, 22 Sep 2011 06:56:54 -0400
Received: from nm17.bullet.mail.ukl.yahoo.com (nm17.bullet.mail.ukl.yahoo.com
	[217.146.183.191])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p8MAurUU021739
	for <linux-lvm@redhat.com>; Thu, 22 Sep 2011 06:56:53 -0400
Date: Thu, 22 Sep 2011 11:56:49 +0100
From: Stephane Chazelas <stephane_chazelas@yahoo.fr>
Message-ID: <20110922105649.GC4407@yahoo.fr>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
	<1316623554-28975-2-git-send-email-lczerner@redhat.com>
	<20110921185901.GB6760@yahoo.fr>
	<alpine.LFD.2.00.1109221057550.4968@dhcp-27-109.brq.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.1109221057550.4968@dhcp-27-109.brq.redhat.com>
Subject: Re: [linux-lvm] [PATCH 01/35] fsadm: Add "create" command
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
To: Lukas Czerner <lczerner@redhat.com>
Cc: zkabelac@redhat.com, rwheeler@redhat.com, dchinner@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

2011-09-22 11:28:36 +0200, Lukas Czerner:
[...]
> > > +	if [ $? -ne 0 ]; then
> > > +		error "FAILED. Exitting!"
> > > +	fi
> > 
> > "$@" || error ...
> 
> I guess it is just a matter of taste.
> 
> > 
> > or
> > 
> > if ! "$@"; then
> >   error ...
> > fi
> 
> That is really not very readable.
[...]

That is how shell works. The syntax is

if
  list-of-commands
then
  other-list-of-commands
else
  yet-another-list-of-commands
fi

I find [ "$?" -ne 0 ] above very confusion and illegible myself.

Why would you run another command that fails if the last one
succeeded? 

> > > +}
> > > +
> > > +is_natural() {
> > > +	test "$1" -ge 0 &> /dev/null && return 1
> > 
> > 
> > &> is a bashism.
> 
> Probably (#!/bin/bash) :)

But it is called "fsadm.sh", that's misleading.

[...]
> > Again, I think that should be either:
> > 
> > set --
> > [ -n "$YES" ] &&
> >   set -- -F
> > dry "mkfs.$fstyp" "$@" -b "$(($bsize*1024))" -E stride="${stride},stripe-width=${stripewidth}" "$device"
> > 
> > or:
> > 
> > force=
> > [ -n "$YES" ] &&
> >   force=-F
> > 
> > eval 'dry "mkfs.$fstyp" '"$force"' -b "$(($bsize*1024))" -E stride="${stride},stripe-width=${stripewidth}" "$device"'
> 
> Ok, I do understand the that I should rather use 'eval', but I do not
> understand why you're trying to get rid of the 'if', it is a bit longer,
> so what ? But is is also more obvious.

"if" is fine, it was just to save me some typing.

> > 
> > [...]
> > > +	is_natural $NEWSIZE
> > > +	[ $? -ne 1 ] && error "$NEWSIZE is not valid number for file system size"
> > 
> > With a fixed is_natural,
> > 
> > is_natural "$NEWSIZE" || error ...
> > 
> > [...]
> > > +	for i in $@; do
> > 
> > for i do
> 
> I am not sure what is wrong with that, it is more obvious and it works
> just fine.

for i in "$@"; do

would have been fine. Again, I can't think of any circumstance
where leaving $@ unquoted would make sense.

-- 
Stephane
