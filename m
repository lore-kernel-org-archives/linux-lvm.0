Return-Path: <mjt@tls.msk.ru>
Message-ID: <3B38F9ED.29BA245A@tls.msk.ru>
Date: Wed, 27 Jun 2001 01:09:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problems with gcc 3.0 & lvm tools
References: <Pine.LNX.4.33.0106262221410.7216-100000@moon.dice.hu>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Gergely Tamas wrote:
> 
> Hi!
> 
> GCC 3.0 implements ``printf'' as a macro.

Why *gcc* *implements* printf at all???  It is in
C library, not in compiler, or always was that.

[]
> --- LVM-orig/tools/lvchange.c   Tue Apr 24 16:29:20 2001
> +++ LVM/tools/lvchange.c        Tue Jun 26 21:51:17 2001
> @@ -168,9 +168,11 @@
>                       "\t[-A/--autobackup y/n]\n"
>                       "\t[-a/--available y/n]\n"
>                       "\t[-C/--contiguous y/n]\n"
> -#ifdef DEBUG
> -                     "\t[-d/--debug]\n"
> -#endif
> +/*
> + * #ifdef DEBUG
> + *                   "\t[-d/--debug]\n"
> + * #endif
> + */
>                       "\t[-h/-?/--help]\n"
>                       "\t[-p/--permission r/rw]\n"
>                       "\t[-r/--readahead ReadAheadSectors]\n"

Better fix for this issue, if it *is* an issue, will be

in main header:
 #ifdef DEBUG
 # define DEBUG_OPT "\t[-d/--debug]\n"
 #else
 # define DEBUG_OPT
 #endif

And in every place:

                       "\t[-A/--autobackup y/n]\n"
                       "\t[-a/--available y/n]\n"
                       "\t[-C/--contiguous y/n]\n"
 -#ifdef DEBUG
 -                     "\t[-d/--debug]\n"
 -#endif
 +                     DEBUG_OPT
                       "\t[-h/-?/--help]\n"
                       "\t[-p/--permission r/rw]\n"
                       "\t[-r/--readahead ReadAheadSectors]\n"

Or, another variant, that may look better (in other places too):


in main header:
 #ifdef DEBUG
 # define IFDEBUG(arg) arg
 #else
 # define IFDEBUG(arg)
 #endif

And in every place:

                       "\t[-A/--autobackup y/n]\n"
                       "\t[-a/--available y/n]\n"
                       "\t[-C/--contiguous y/n]\n"
 -#ifdef DEBUG
 -                     "\t[-d/--debug]\n"
 -#endif
 +                     IFDEBUG("\t[-d/--debug]\n")
                       "\t[-h/-?/--help]\n"
                       "\t[-p/--permission r/rw]\n"
                       "\t[-r/--readahead ReadAheadSectors]\n"


But wait: *if* this *is* an issue, then TONS of other programs
will break the same way.  And gcc people should just not do so,
is is a bug (serious) in gcc in this case and should be fixed
in a first place.

Regards,
 Michael.
