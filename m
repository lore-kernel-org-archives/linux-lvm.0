From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: GRUB + LVM + XFS?
Message-Id: <20020115151829.F11005@sistina.com>
References: <1010427293.29260.3.camel@UberGeek>
    <m3666ej5t2.fsf@shakti.rupa.com>
    <200201080927.g089QVJ00669@hammer.brocade.com>
MIME-Version: 1.0
In-Reply-To: <200201080927.g089QVJ00669@hammer.brocade.com>;
    from ahead@bigpond.net.au on Tue, Jan 08, 2002 at 10:48:11AM +1000
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
Date: Tue Jan 15 08:21:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 08, 2002 at 10:48:11AM +1000, Adrian Head wrote:
> On Tue, 8 Jan 2002 05:54, Rupa Schomaker wrote:
> > I'm having toubles with the current CVS version of the XFS kernel.  I
> > haven't had time to look at it completely, but... it could be:
> >
> > 1) mismatch between userspace and kernel (what LVM is in the XFS
> >    kernel?  I'm using the debian lvm10 userspace).
> >
> > 2) bad config
> >
> > 3) ???
> >
> > A quick "bt" at boot in kdb shows that devfs is in the call path.  No,
> > I haven't had time to write everything down. :(  Man, I wish there was
> > an easy to dump the kdb info or an OOPs to disk...
> 
> Well all I do is for getting kdb output is to use a serial console and 
> another computer - then cut and past then send  ;-).
> 
> It is very interesting that devfs is referenced - there was a LVM memory 
> corruption problem and a patch for LVM/devfs - it can be found here:
> http://marc.theaimsgroup.com/?l=linux-xfs&m=101031443221058&w=2
> 
> From my experience it seems that LVM 1.0.1rc4(ish) is way more robust than 
> the updated LVM 1.0.1 or even CVS LVM 1.0.1 yesterday.

Do you have some input which particular changes cause it?
Thanks.

> However, not 
> everything works as expected with either. You can find a results table for a 
> few tests I have conducted here: (of course YMMV)
> http://marc.theaimsgroup.com/?l=linux-lvm&m=100994364215110&w=2
> 
> I think you would be very interested in the discussions and activity that has 
> been occuring on the linux-xfs & linux-lvm lists at the moment regarding XFS 
> and LVM.  If you are seeing problems I would be very interested in finding 
> out how your problems differ from mine.
> 
> -- 
> Adrian Head
> 
> (Public Key available on request.)
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
