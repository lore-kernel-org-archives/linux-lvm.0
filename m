From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Volume group not found on restart [resent]
Message-ID: <20020524103259.A15896@sistina.com>
References: <E631530D51ABD411B823009027855C5B0278C2@THOR>
Mime-Version: 1.0
In-Reply-To: <E631530D51ABD411B823009027855C5B0278C2@THOR>; from Murthy.Kambhampaty@goeci.com on Thu, May 23, 2002 at 03:09:12PM -0400
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
Date: Fri May 24 03:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 23, 2002 at 03:09:12PM -0400, Murthy Kambhampaty wrote:
> Heinz, thanks for the response.
> 
> > Strange.
> > If you were able to "lvremove /dev/db_vol/snap_db" it shouldn't be 
> > visible in the metadata I got from you.
> > 
> > But it still is in there and has extents allocated on the 
> > physical volume
> > you wanted to remove from the volumegroup "db_vol". Unless 
> > there was no
> > extents allocated on physical volume /dev/sda, running 
> > "vgreduce db_vol /dev/sda" was impossible.
> > 
> > The steps needed would have been:
> > 
> > - close /dev/db_vol/db_snap by unmounting it
> > - successfully removing the LV with "lvremove /dev/db_vol_snap"
> > - reducing the volume group successfully with "vgreduce 
> > db_vol /dev/sda"
> > 
> > To check it:
> > - vgdisplay -v db_vol # just showing 1 PV in VG "db_vol"
> > - pvscan              # showing /dev/sda to be an unused PV
> > 
> I'm pretty sure I went throught the sequence you describe above, and the
> pvscan at the end said /dev/sda was in "db_vol. I'll replicate the setup (I
> have two volumes that are now tmp volumes with filesystems on disk, which
> I'll convert to two different PVs and go through building up and tearing
> down the setup I had before) and let you know if I get the same behavior.

Ok.
In case you are able to replicate it, I'ld be very interested to find out
why it happens in order to come up with a fix.

> 
> > 
> > > 
> > > > > 
> > > > > So, the preferred course here is to "to change the metadata 
> > > > in order to get
> > > > > rid of the gone physical volume", and all will be well. 
> > > > 
> > > > So there's cons vs. (temporarly) trying 1.1-rc to quorum 
> > > > activate db_vol
> > > > in order to retrieve the data?
> > > > 
> > > Only to the extent that your message indicated that LVM 
> > 1.1-rc2 was unstable
> > > (BTW, do I only install the userspace tools and retain my 
> > LVM 1.0.1rc4
> > > kernel code (or do I have to patch the XFS cvs kernel with 
> > the LVM 1.1-rc2
> > > kernel code to implement this alternative?)
> > 
> > You can go with just the tools in a temporary location.
> I tried it (download 1.1-rc2, built the kernel and tools, installed the
> tools (about which time I got your message), then ran "vgscan; vgchange -qn
> -ay "db_vol") and got the error message "vgchange -- driver doesn't support
> volume group quorum!"

Sorry, my fault :(
Forgot to mention.

> 
> I'll install the patched kernel, and try it. Once I recover the data, I can
> go back to the stock 2.4.18-xfs kernel, installing the lvm-tools rpm
> supplied with RH 7.2.
> 
> I'll let you know how it goes ... ;)

Thanks.

> 	Murthy
> 
> 
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
