From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] 2  LVM questions -  LVM and 2.4.19, and extent based striping.
Message-ID: <20021127150941.A1701@sistina.com>
References: <OFB3E6E776.74CCEE3A-ON85256C7D.0055BB76@LocalDomain>
Mime-Version: 1.0
In-Reply-To: <OFB3E6E776.74CCEE3A-ON85256C7D.0055BB76@LocalDomain>; from GBanschbach@sandata.com on Tue, Nov 26, 2002 at 02:14:29PM -0500
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
Date: Wed Nov 27 11:28:00 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 26, 2002 at 02:14:29PM -0500, GBanschbach@sandata.com wrote:
> 
> Dear All,
> 
>       I want to say first that I am very impressed with how well LVM is
> working.  Although this is our first LINUX LVM install,  it is so close to
> the HP-UX version!   I have a couple of questions.   I have probably missed
> the obvious,  but will one of you kind souls give a review of this:
> Question 1:
> I have set up LVM on a SUSE Enterprise Server, after an upgrade to 2.4.18.
> All is well.    Now,   I need to know what the best combination of LVM
> version 1.0.5  or 1.0.6  and 2.4.19 or higher.   Or can I just build a
> 2.4.19 kernel, and do the same things I did to get 2.4.18 working - and use
> the same version of LVM I have been using all along?    I may have to get
> to at least 2.4.19, so I can use the most stable [ most debugged ] LARGE
> memory and SMP version of the kernel I can....   REASON:  I have 16GB of
> ram, and 2 CPUs.   I want to make good use of all of it.

Greg,

you can use 1.0.5 or 1.0.6 on 2.4.19 but 1.0.6 fixes some (minor) bugs
so we recommend 1.0.6. There seems to be a problem in the 2.4.19 VM subsystem
on high memory systems eventually causing LVM snapshots to fail :(
In case you don't run those LVM 1.0.6 on Linux 2.4.19 is fine.

> 
> I also am curious about something else.     I have read one other posting
> about this.   LVM on Linux is nearly identical to LVM on HP-UX.     I saw a
> posting concerning what amounts to "extent based striping", as opposed to
> striping on Linux which seems to be stripes within extents.     We HP-UX
> people tend to want to do "extent based stripes."   This is because we can
> take 3 disks, and say to LVM  "When there is a requirement for extents in a
> logical volume, draw each new extent in a "round robin" fashion ONE at a
> time from each disk."     The performance is very nice.   And we like the
> control it gives us.    To illustrate:
> 
> 3 disk model
> Logical Ext.                   Phys  Ext.
> 0000              0000 on disk1
> 0001                                       0000 on disk2
> 0002                                       0000 on disk3
> 
> 0003                                       0001 on disk1
> 0004                                       0001 on disk2
> 0005                                       0001 on disk3
> 
> In the linux LVM world, we can't seem to do this......      We get stripes
> WITHIN extents, but the extents are still visited serially:

Well, the round-roubin allocation scheme (as Alasdair already showed in his
response) is equal to the HP-UX LVM one AFAIU. The stripes defined by the "-I"
option of lvcreate give the io unit size to round-robin the io to the extents.
No striping onto a set of extents as you assume below.

Striping in Linux LVM does it the same way HP-UX LVM does (i.e. 2k stripe size,
4 stripes, 8k avarage io size would be optimal).

BTW: gained performance on striped LVs _largely_ depends on the (average)
     application io size. I.e. a strip size of 2k won't buy you a lot in case
     the application does an average io of 2k :) The bigger the average gets
     compared to the stripe size the bigger the performance gain is.

Regards,
Heinz    -- The LVM Guy --

> 
> The answer in the posting went kind of like this:   assuming  we will write
> 64k stripes....and 6 extents total......
> Logical Ext.                   Phys  Ext.
> 0000              0000 on disk1
> 0001                                       0001 on disk1
> 0002                                       0002 on disk1
> 0003                                       0003 on disk1
> 0004                                       0004 on disk1
> 0005                                       0005 on disk1
> 1st  64k on Log. Ext Zero which is Physical Zero on disk1.  The 2nd is on
> LE 1 on disk 1.  There is still alot of room on Logical Ext. Zero on disk
> 1,  because we only used 64k out of 4096k.   Stripe number 4 will go on
> Logical Ext. Zero, after the very first one we wrote.... and so on, until
> you hit a high enough number of writes to fill the 6 extents (?)   The
> question which remains to be answered in my mind is .....what happened to
> the multiple disks aspect?   Striping ( as I have been taught and
> understand ) works BETTER when it is across MORE spindles round robin.
> What benefit do you get by striping within a set of serial extents ?
> Since the default allocation [  without stripes ] is to take extents
> serially from disk1 until there are no more there and then continue on
> disk2,  it should not be a huge code change to tell it:  Take the next
> serial extent from disk1,   increment to point to the next available disk
> in the group,  take the NEXT serial extent from disk2, etc.     Or is the
> code organised in such a way that it is prohibitive to try this ???      If
> anyone wants to give me some background and coaching.....  I might be able
> to take a tentative stab at it......maybe.     I think it would be better
> if the people most familiar with it make the change. But I get the feeling
> alot of people would like the option.     The performance gain should be
> pretty high.    In the HP-UX world, we set up a file with a list of disks,
> then tell lvcreate to use this list to do the distribution.
> 
> By the way -  I suspect that striping within extents happens in the HP-UX
> example,  but I don't really worry about it due to the way I can map the
> extents.
> 
> Thanks very much,
> 
> Greg
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
