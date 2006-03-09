Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k29Ham130982
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 12:36:48 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k29HamhO030215
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 12:36:48 -0500
Received: by xproxy.gmail.com with SMTP id s12so337863wxc
	for <linux-lvm@redhat.com>; Thu, 09 Mar 2006 09:36:48 -0800 (PST)
Message-ID: <6c3e3c670603090936j58ec03b0ke7e37d8b622d4ddd@mail.gmail.com>
Date: Thu, 9 Mar 2006 12:36:48 -0500
From: "Chad Rebuck" <chadrebuck@gmail.com>
Subject: Re: [linux-lvm] pvmove didn't work - now system won't boot
In-Reply-To: <20060309165329.GC25789@percy.comedia.it>
MIME-Version: 1.0
Content-Disposition: inline
References: <6c3e3c670603090729ue151783w37c1c5ac412f7bd1@mail.gmail.com>
	<20060309165329.GC25789@percy.comedia.it>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks

Seems like some commands like the --ignorelockingfailure and some don't

pvscan shows /dev/hdc2 as [2g / 2g free]

and it my other drive now has 2g less free space so do I assume the
transfer of data worked correctly?

Now I need to run vgreduce I suppose to remove that drive from the
group.  However, the ignorelockingfailure option doesn't work.  Do I
just boot from a recovery cd and delete the lock file in /var/log/lvm
to proceed?

Chad

On 3/9/06, Luca Berra <bluca@comedia.it> wrote:
> On Thu, Mar 09, 2006 at 10:29:41AM -0500, Chad Rebuck wrote:
> >I ran "pvmove -v /dev/hdc2" to move the data off the drive but it
> >stopped before any real drive activity happened.  The system was stuck
> >for about 30 minutes not doing anything so I powered off/on.  Now it
> >boots into a bash prompt but suggests I run fsck manually.  I noticed
> >that lvm only reported that 2 of the 3 physical volumes were found.  I
> >can't run any lvm commands from here as I get a 'Locking type 1
> >initialization failed'.
> >
> run lvm commands with --ignorelockingfailure option
>
> >What steps do I take to get the system to boot again?  The root dir is
> >part of the lvm volume.  The /boot is separate from the lvm volume but
> >maybe this is required anyway for lvm to work.
> >
> >Thanks,
> >Chad
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@redhat.com
> >https://www.redhat.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> --
> Luca Berra -- bluca@comedia.it
>        Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>  X        AGAINST HTML MAIL
>  / \
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
