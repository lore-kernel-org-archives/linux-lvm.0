Return-Path: <root@srv.sistina.com>
Date: Fri, 4 May 2001 09:33:50 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM Questions
Message-ID: <20010504093350.D4700@sistina.com>
References: <20010503004851.897.qmail@web10803.mail.yahoo.com> <3AF0B857.74F16371@home.com> <wv4rv26hvj.fsf@freeze.oslo.dnmi.no>
Mime-Version: 1.0
In-Reply-To: <wv4rv26hvj.fsf@freeze.oslo.dnmi.no>; from a.phillips@dnmi.no on Thu, May 03, 2001 at 08:56:00AM +0200
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

On Thu, May 03, 2001 at 08:56:00AM +0200, Adrian Phillips wrote:
> >>>>> "Evan" == Evan Day <banal@home.com> writes:
> 
> <snip>
> 
>     >> What ext2 resize utility is the ideal choice for LVM to
>     >> use. parted seems to be quite functional, but having to down
>     >> the machine to single is a but annoying. Has anyone
>     >> successfully used the ext2online utility on RedHat? It seems as
>     >> though the version of e2fsprogs that includes this code is part
>     >> of RH 7.1 anyways. At least from what I can tell. The online
>     >> resizing would definitely be required for a highly available
>     >> system as well.
> 
>     Evan> I don't have much experience with ext2 resizing, but the
> 
> I haven't either.
> 
>     Evan> reiserfs can easily be extended.  I'm not sure if it is
>     Evan> supported or not, but I've actually extended filesystems
>     Evan> while mounted with no ill effects.
> 
> I believe it is officially supported, ie. if it breaks then its a bug,
> and have done it now several times, at least on lightly loaded
> filesystems. Its not quite as convienient as AIX's LVM, in that one
> resizes the filesystem and the logical volume is automatically
> resized, but if I'm bothered I'll write a wrapper script around
> lvextend/lvreduce for that.
> 
> A question for the developers if they notice. Why lvextend and
> lvreduce, as they do the same things. Is it just for clarity ? A
> lvresize with + or - or a fixed size to could the same ?

The Linux LVM CLI is as close as possible to the HP/UX one which has
those commands (and vgextend/vgreduce as well) seperate.
This makes at least me as a long term HP/UX LVM user happy ;-)

lvresize can easily be made as a convenence wrapper though...

> 
> <snip>
> 
>     >> I also read an older thread on an X11 GUI as well as some
>     >> replies to it. The GUI that comes with Veritas is completely
>     >> useless and the command line tools are completely
>     >> over-engineered. While it would be nice for a small company
>     >> trying to save money not to call in a specialist to create
>     >> VG's, it certainly wouldn't be a requirement. Get everything
>     >> stable, reliable and consistent than someone will probably have
>     >> the time to create the GUI. I'd dedicate time to that type of
>     >> project, but why bother when the code isn't quite there
>     >> yet. There's no reason.
> 
>     Evan> LVM is so simple that, IMHO, a GUI shouldn't be an
>     Evan> overriding concern.  Then again, I've been working with LVM
>     Evan> on HP-UX for many years, and I find the CLI utilities to be
>     Evan> much more efficient than waiting for SAM (the HP-UX sysadmin
>     Evan> GUI) to poll everything, build displays, etc.  The current
>     Evan> CLI tools are lean and aligned with the LVM model in a way
>     Evan> that is both logical and easy to understand.
> 
> On the web page there is a BETA lva, written in perl-tk which works
> nicely although somewhat limited currently. I like the pie chart look,
> not for me personally, CLI type myself, but for some of the others at
> work who must have a GUI for everything, yukk :-)
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
