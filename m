Return-Path: <root@srv.sistina.com>
Date: Fri, 4 May 2001 10:38:27 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM Questions
Message-ID: <20010504103827.A10758@sistina.com>
References: <20010503004851.897.qmail@web10803.mail.yahoo.com> <3AF0B857.74F16371@home.com> <wv4rv26hvj.fsf@freeze.oslo.dnmi.no> <20010504093350.D4700@sistina.com> <wvlmod7e23.fsf@freeze.oslo.dnmi.no>
Mime-Version: 1.0
In-Reply-To: <wvlmod7e23.fsf@freeze.oslo.dnmi.no>; from a.phillips@dnmi.no on Fri, May 04, 2001 at 09:45:24AM +0200
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, May 04, 2001 at 09:45:24AM +0200, Adrian Phillips wrote:
> >>>>> "Heinz" == Heinz J Mauelshagen <Mauelshagen@sistina.com> writes:
> 
> <snip>
>     >>  I believe it is officially supported, ie. if it breaks then
>     >> its a bug, and have done it now several times, at least on
>     >> lightly loaded filesystems. Its not quite as convienient as
>     >> AIX's LVM, in that one resizes the filesystem and the logical
>     >> volume is automatically resized, but if I'm bothered I'll write
>     >> a wrapper script around lvextend/lvreduce for that.

True.

JAIOOTL (Just Another Item On Our Todo List ;-)

>     >> 
>     >> A question for the developers if they notice. Why lvextend and
>     >> lvreduce, as they do the same things. Is it just for clarity ?
>     >> A lvresize with + or - or a fixed size to could the same ?
> 
>     Heinz> The Linux LVM CLI is as close as possible to the HP/UX one
>     Heinz> which has those commands (and vgextend/vgreduce as well)
>     Heinz> seperate.  This makes at least me as a long term HP/UX LVM
>     Heinz> user happy ;-)
> 
> HP/UX, how unfortunate :-) Thanks for the info. though.

;-)

Actually the HP/UX LVM and its CLI has some major advantages over others:

 - it has a very simple layering (the PV, VG, LV thingies) and therefore
   is very easy to understand

 - the CLI follows the layers transparently

 - CLI is "self explaining" in regard of having native language
   postfixes in the command names like create, extend, reduce, change etc.

In production this boils down to shorter learning cycles for admin newbies
and easier handling in regular production -> less money spend!

BTW: what's unfortunate IYO with the HP/UX LVM? :-)

> 
>     Heinz> lvresize can easily be made as a convenence wrapper
>     Heinz> though...
> 
> Patches accepted I presume :-)

You can read between lines.
I like that ;-)

> 
> Sincerely,
> 
> Adrian Phillips
> 
> -- 
> Your mouse has moved.
> Windows NT must be restarted for the change to take effect.
> Reboot now?  [OK]
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
