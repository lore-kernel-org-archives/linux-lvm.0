Date: Thu, 22 Sep 2011 11:28:36 +0200 (CEST)
From: Lukas Czerner <lczerner@redhat.com>
In-Reply-To: <20110921185901.GB6760@yahoo.fr>
Message-ID: <alpine.LFD.2.00.1109221057550.4968@dhcp-27-109.brq.redhat.com>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
	<1316623554-28975-2-git-send-email-lczerner@redhat.com>
	<20110921185901.GB6760@yahoo.fr>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephane Chazelas <stephane_chazelas@yahoo.fr>
Cc: Lukas Czerner <lczerner@redhat.com>, zkabelac@redhat.com, rwheeler@redhat.com, dchinner@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 21 Sep 2011, Stephane Chazelas wrote:

> 2011-09-21 18:45:20 +0200, Lukas Czerner:
> > Create command provides the functionality of creating a new logical
> > volumes including defined file system.
> > 
> > This commit also changes the way how are commands recognised an
> > executed. The new approach is more suitable for bigger number of
> > commands.
> 
> There are so many shell scripting bad practices in there that I
> thought I had to reply.

Great, that's what I need, Thanks!

> 
> > 
> > Signed-off-by: Lukas Czerner <lczerner@redhat.com>
> > ---
> >  scripts/fsadm.sh |  140 ++++++++++++++++++++++++++++++++++++++++++++++++++----
> >  1 files changed, 131 insertions(+), 9 deletions(-)
> > 
> > diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
> > index c8cc5e0..42c7da4 100755
> > --- a/scripts/fsadm.sh
> > +++ b/scripts/fsadm.sh
> > @@ -29,7 +29,7 @@
> >  #   2 break detected
> >  #   3 unsupported online filesystem check for given mounted fs
> >  
> > -TOOL=fsadm
> > +TOOL=$(basename $0)
> 
> Leaving a variable unquoted has a very special meaning in shell.
> If we were looking to a perl equivalent of $var that would be:
> 
> map glob, split $IFS_regex, $var
> 
> With the default value of $IFS:
> 
> $ ls
> bar  foo
> $ perl -le '$var="a *"; print for map glob, split " ", $var'
> a
> bar
> foo
> $ sh -c 'var="a *"; printf "%s\n" $var'
> a
> bar
> foo
> 
> That is it is a special operator that triggers word splitting
> (split()) and filename generation (glob()).
> 
> Variables should alway be quoted unless you've got a very good
> reason not to.

Ok, good point.

> 
> Also,
> 
> It's either
> 
> cmd "$option_or_argument"
> or
> cmd -- "$argument"
> 
> So above:
> 
> TOOL=$(basename -- "$0")
> 
> >  
> >  _SAVEPATH=$PATH
> 
> Why would you need to save $PATH?

Yeah, that is something I would like to know as well :) I have actually
removed this in patch 24 since it does not make sense to change PATH in
this script.

> 
> >  PATH=/sbin:/usr/sbin:/bin:/usr/sbin:$PATH
> > @@ -76,6 +76,8 @@ REMOUNT=
> >  PROCMOUNTS="/proc/mounts"
> >  NULL="$DM_DEV_DIR/null"
> >  
> > +MAX_VGS=999
> > +
> >  IFS_OLD=$IFS
> 
> doing
> 
> IFS_OLD=$IFS
> ...
> IFS=$OLD_IFS
> 
> doesn't have the expected behavior if IFS was previously unset
> (allowed by LSB and POSIX).
> 
> Use subshells or local (LSB but not POSIX).
> 
> >  # without bash $'\n'
> >  NL='
> > @@ -122,6 +124,14 @@ dry() {
> >  	fi
> >  	verbose "Executing $@"
> >  	$@
> 
> $@ doesn't make sense. It should either be
> 
> IFS=" "
> eval "$*"
> (the concatenation of the positional parameters taken as a
> command line)
> 
> or more likely (without knowing the context)
> 
> "$@"
> 
> The position parameters are to be interpreted as the arguments
> to a simple command.
> 
> 
> > +	if [ $? -ne 0 ]; then
> > +		error "FAILED. Exitting!"
> > +	fi
> 
> "$@" || error ...

I guess it is just a matter of taste.

> 
> or
> 
> if ! "$@"; then
>   error ...
> fi

That is really not very readable.

> 
> > +}
> > +
> > +is_natural() {
> > +	test "$1" -ge 0 &> /dev/null && return 1
> 
> 
> &> is a bashism.

Probably (#!/bin/bash) :)

> 
> And depending on the shell, that is not guaranteed to do what
> you think it does. for instance, it could say that "1+1", "1 ",
> "1.2",  are natural numbers.
> 
> Also, you seem to have it backward.
> 
> It will return 1 (failure/false) if the number is natural.

It seems it's a bit weird, thanks!

> 
> is_natural()
>   case "$1" in
>     ("" | *[!0-9]*) return 1;;
>     (*) return 0;;
>   esac
> 
> >  }
> >  
> >  cleanup() {
> > @@ -365,12 +375,42 @@ resize_xfs() {
> >  	fi
> >  }
> >  
> > +make_ext() {
> > +	device=$1
> > +	fstyp=$2
> > +	stripe=$3
> > +	stripesize=$4
> > +	bsize=4
> > +
> > +	if [ "$YES" ]; then
> > +		force="-F"
> > +	fi
> > +	stride=$(($stripesize/$bsize))
> > +	stripewidth=$(($stride*$stripe))
> > +
> > +	dry mkfs.$fstyp $force -b$(($bsize*1024)) -E stride=${stride},stripe-width=${stripewidth} $device
> 
> Again, I think that should be either:
> 
> set --
> [ -n "$YES" ] &&
>   set -- -F
> dry "mkfs.$fstyp" "$@" -b "$(($bsize*1024))" -E stride="${stride},stripe-width=${stripewidth}" "$device"
> 
> or:
> 
> force=
> [ -n "$YES" ] &&
>   force=-F
> 
> eval 'dry "mkfs.$fstyp" '"$force"' -b "$(($bsize*1024))" -E stride="${stride},stripe-width=${stripewidth}" "$device"'

Ok, I do understand the that I should rather use 'eval', but I do not
understand why you're trying to get rid of the 'if', it is a bit longer,
so what ? But is is also more obvious.

> 
> [...]
> > +	is_natural $NEWSIZE
> > +	[ $? -ne 1 ] && error "$NEWSIZE is not valid number for file system size"
> 
> With a fixed is_natural,
> 
> is_natural "$NEWSIZE" || error ...
> 
> [...]
> > +	for i in $@; do
> 
> for i do

I am not sure what is wrong with that, it is more obvious and it works
just fine.

>  ...
> 
> 
> > +		if [ -b $i ]; then
> 
> ...and so on.
> 
> 

Thanks!
-Lukas
