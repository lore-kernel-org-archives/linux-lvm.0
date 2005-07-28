Subject: Re: [linux-lvm] How do you create large numbers of LVs? (In the
	1000s) Is it even possible?
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <511428deb4d089c0e0d213b7e81a9fe7@redhat.com>
References: <42E92D7E.5090900@levanta.com>
	<1122578286.9888.47.camel@localhost.localdomain>
	<511428deb4d089c0e0d213b7e81a9fe7@redhat.com>
Date: Thu, 28 Jul 2005 16:38:41 -0400
Message-Id: <1122583121.9888.57.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Jonathan E Brassow <jbrassow@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

i think this is strange that this guy can at least create 1500 lv but
fail to activate them all.

here what i found is i even can not create ~300 lv.


ming


On Thu, 2005-07-28 at 15:32 -0500, Jonathan E Brassow wrote:
> I think the problem you are seeing is similar to the one found in 
> bugzilla (164198).  Would you be willing to add some notes there?  It 
> will give you a place to track the progress...
> 
> https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=164198
> 
>   brassow
> 
> On Jul 28, 2005, at 2:18 PM, Ming Zhang wrote:
> 
> > On Thu, 2005-07-28 at 12:09 -0700, Nathaniel Stahl wrote:
> >> We'd like to be able to create a large number of LVs (potentially
> >> numbering in the low thousands).  I get failure after LV 226 or so,
> >> though - "VG VolGroup01 metadata writing failed".
> >>
> >> RedHat claims this should be possible with LVM2 on the following web 
> >> page:
> >>
> >> http://www.redhat.com/magazine/009jul05/features/lvm2/
> >>
> >> I admit to being a little suprised at the 2^32 max LV claim - I was
> >> figuring 2^20 as the theoretical max given 2.6's 32 bit device 
> >> numbering
> >> scheme (20 bits for minor, 12 bits for major).
> >>
> >> The LVM2 code, at least version 2.00.25 as distributed in FC3, appears
> >> to have a check that the minor number is strictly less than 256.
> >> Removing this check allows for the creation of working LVs using 
> >> minors
> >> greater than 256, but LV creation fails with the error "VG VolGroup01
> >> metadata writing failed" creating the 227th LV.  Even with the minor
> >> limit in place - I can't create more than 226 LVs.
> >
> > i asked this question before. there is a hard coded limitation in lvm
> > metadata, so the real number is like this, limited around 2xx. the
> > limitation will be removed in near future. how near? i do not know. :)
> >
> >
> >>
> >> Is there a patch that allows this limit to be broken?  Should I be 
> >> using
> >> a newer version of the tools?  If not currently possible, is this
> >> something that will be in the near future?
> >>
> >> Thanks for any help/advice you can give.
> >>
> >> -Nate Stahl
> >>
> >> _______________________________________________
> >> linux-lvm mailing list
> >> linux-lvm@redhat.com
> >> https://www.redhat.com/mailman/listinfo/linux-lvm
> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> 
