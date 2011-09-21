Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8LJ0mtF013193
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2011 15:00:48 -0400
Received: from nm15-vm0.bullet.mail.ukl.yahoo.com
	(nm15-vm0.bullet.mail.ukl.yahoo.com [217.146.183.252])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p8LJ0lgI030543
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2011 15:00:47 -0400
Date: Wed, 21 Sep 2011 20:00:43 +0100
From: Stephane Chazelas <stephane_chazelas@yahoo.fr>
Message-ID: <20110921185901.GB6760@yahoo.fr>
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
	<1316623554-28975-2-git-send-email-lczerner@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1316623554-28975-2-git-send-email-lczerner@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Lukas Czerner <lczerner@redhat.com>, dchinner@redhat.com, rwheeler@redhat.com, zkabelac@redhat.com

2011-09-21 18:45:20 +0200, Lukas Czerner:
> Create command provides the functionality of creating a new logical
> volumes including defined file system.
> 
> This commit also changes the way how are commands recognised an
> executed. The new approach is more suitable for bigger number of
> commands.

There are so many shell scripting bad practices in there that I
thought I had to reply.

> 
> Signed-off-by: Lukas Czerner <lczerner@redhat.com>
> ---
>  scripts/fsadm.sh |  140 ++++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 files changed, 131 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
> index c8cc5e0..42c7da4 100755
> --- a/scripts/fsadm.sh
> +++ b/scripts/fsadm.sh
> @@ -29,7 +29,7 @@
>  #   2 break detected
>  #   3 unsupported online filesystem check for given mounted fs
>  
> -TOOL=fsadm
> +TOOL=$(basename $0)

Leaving a variable unquoted has a very special meaning in shell.
If we were looking to a perl equivalent of $var that would be:

map glob, split $IFS_regex, $var

With the default value of $IFS:

$ ls
bar  foo
$ perl -le '$var="a *"; print for map glob, split " ", $var'
a
bar
foo
$ sh -c 'var="a *"; printf "%s\n" $var'
a
bar
foo

That is it is a special operator that triggers word splitting
(split()) and filename generation (glob()).

Variables should alway be quoted unless you've got a very good
reason not to.

Also,

It's either

cmd "$option_or_argument"
or
cmd -- "$argument"

So above:

TOOL=$(basename -- "$0")

>  
>  _SAVEPATH=$PATH

Why would you need to save $PATH?

>  PATH=/sbin:/usr/sbin:/bin:/usr/sbin:$PATH
> @@ -76,6 +76,8 @@ REMOUNT=
>  PROCMOUNTS="/proc/mounts"
>  NULL="$DM_DEV_DIR/null"
>  
> +MAX_VGS=999
> +
>  IFS_OLD=$IFS

doing

IFS_OLD=$IFS
...
IFS=$OLD_IFS

doesn't have the expected behavior if IFS was previously unset
(allowed by LSB and POSIX).

Use subshells or local (LSB but not POSIX).

>  # without bash $'\n'
>  NL='
> @@ -122,6 +124,14 @@ dry() {
>  	fi
>  	verbose "Executing $@"
>  	$@

$@ doesn't make sense. It should either be

IFS=" "
eval "$*"
(the concatenation of the positional parameters taken as a
command line)

or more likely (without knowing the context)

"$@"

The position parameters are to be interpreted as the arguments
to a simple command.


> +	if [ $? -ne 0 ]; then
> +		error "FAILED. Exitting!"
> +	fi

"$@" || error ...

or

if ! "$@"; then
  error ...
fi

> +}
> +
> +is_natural() {
> +	test "$1" -ge 0 &> /dev/null && return 1


&> is a bashism.

And depending on the shell, that is not guaranteed to do what
you think it does. for instance, it could say that "1+1", "1 ",
"1.2",  are natural numbers.

Also, you seem to have it backward.

It will return 1 (failure/false) if the number is natural.

is_natural()
  case "$1" in
    ("" | *[!0-9]*) return 1;;
    (*) return 0;;
  esac

>  }
>  
>  cleanup() {
> @@ -365,12 +375,42 @@ resize_xfs() {
>  	fi
>  }
>  
> +make_ext() {
> +	device=$1
> +	fstyp=$2
> +	stripe=$3
> +	stripesize=$4
> +	bsize=4
> +
> +	if [ "$YES" ]; then
> +		force="-F"
> +	fi
> +	stride=$(($stripesize/$bsize))
> +	stripewidth=$(($stride*$stripe))
> +
> +	dry mkfs.$fstyp $force -b$(($bsize*1024)) -E stride=${stride},stripe-width=${stripewidth} $device

Again, I think that should be either:

set --
[ -n "$YES" ] &&
  set -- -F
dry "mkfs.$fstyp" "$@" -b "$(($bsize*1024))" -E stride="${stride},stripe-width=${stripewidth}" "$device"

or:

force=
[ -n "$YES" ] &&
  force=-F

eval 'dry "mkfs.$fstyp" '"$force"' -b "$(($bsize*1024))" -E stride="${stride},stripe-width=${stripewidth}" "$device"'

[...]
> +	is_natural $NEWSIZE
> +	[ $? -ne 1 ] && error "$NEWSIZE is not valid number for file system size"

With a fixed is_natural,

is_natural "$NEWSIZE" || error ...

[...]
> +	for i in $@; do

for i do
 ...


> +		if [ -b $i ]; then

...and so on.

-- 
Stephane
