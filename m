Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Thu, 25 Jan 2001 15:23:16 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] Newbie questions
Message-ID: <20010125152316.B4536@srv.sistina.com>
References: <20010124232733.A2053@srv.sistina.com> <OGEIIBECLDEKAJGFBOGCKEDDCAAA.mvasa@confluencenetworks.com>
Mime-Version: 1.0
In-Reply-To: <OGEIIBECLDEKAJGFBOGCKEDDCAAA.mvasa@confluencenetworks.com>; from mvasa@confluencenetworks.com on Wed, Jan 24, 2001 at 05:31:37PM -0800
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

On Wed, Jan 24, 2001 at 05:31:37PM -0800, Mayank Vasa wrote:
> Michael/Heinz
> 
> Thanks for the answers.
> 
> Read a lil' more and have one more question. From a application point of
> view, would the resize utility (extonline) take care of application flushing
> or not?

If you are talking about the flushing of dirty data which exists in
the applications address space --> NO, there's no interface defined
to address this.

> 
> If it does, how? If not, wouldn't you need to take care of that?

The filesystem extension itself doesn't need to have flushed application data.
Buffers which are already dirty before the extension begins can be flushed
at any arbitray point in time because they will be stored on device blocks
which are accessable before, during and after the extension anyway.

> 
> Thanks.
> -mayank.
> 
> 
> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Heinz J. Mauelshagen
> Sent: Wednesday, January 24, 2001 3:28 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Newbie questions
> 
> 
> On Wed, Jan 24, 2001 at 02:21:20PM -0800, Mayank Vasa wrote:
> > Hi,
> >
> > I am new to LVM and have some basic questions:
> >
> > 1) From the documentation I have read, I think once you extend/reduce a LV
> > or VG you don't need to reboot the system. Correct?
> 
> Correct.
> 
> >
> > 2) Assuming 1 is correct, how is the filesystem made aware of the changes?
> > I'd like to understand the flow of this too.
> 
> Its size needs to be changed in a seperate step.
> With ext2 there's Ted Tso's offline resizer and for eg. Andreas Dilger's
> online resizer.
> With reiserfs there's an online extender and offline shrinker available.
> 
> >
> > 3) What are LVM snapshots?
> 
> Another LV exposing a "frozen" image of a preexisting LV.
> 
> IOW: you create another LV (the snapshot LV) which is "connected" to an
>      already exiting one (called original LV in this context).
>      The snapshot LV doesn't change its content while the original LV can
>      still be updated (changed).
> 
> >
> > TIA.
> > -mayank.
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> --
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> =-
> 
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> =-
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> 
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
