From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgchange -a y /dev/System fails
Message-Id: <20020130131530.B3769@sistina.com>
References: <20020125233533.GK26045@merlins.org>
    <E16ViXz-0001vP-00@hermes.sistina.com>
MIME-Version: 1.0
In-Reply-To: <E16ViXz-0001vP-00@hermes.sistina.com>; from
    ahead@bigpond.net.au on Wed, Jan 30, 2002 at 10:24:35AM +1000
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
Date: Wed Jan 30 06:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 30, 2002 at 10:24:35AM +1000, Adrian Head wrote:
> A little while ago I had the same problems - the only way i could get around 
> it  was using 2.4.16-xfs.  I was using 2.4.17-xfs+lvm (1.0.1) and when a 
> snapshot failed I couldn't remove it and when I rebooted the system would 
> hang.  By having a 2.4.16-xfs kernel with lvm-1.0.1rc4(ish) it would fix the 
> problems on the fly during bootup and all was happy.  YMMV  At the time I did 
> ask the mailling list why 2.4.16-xfs was more robust than 2.4.17-xfs+lvm; 
> however, I never recieved an answer.

Well, as linux-kernel reports there's still problems with 2.4 up to .17 in
the vm subsystem which show up on heavier load or on long running systems.
Andrea Arcangeli has some fixes but I don't know if they already have been
ported to 2.4.18-pre jet.

> 
> Heady
> 
> On Sat, 26 Jan 2002 09:35, you wrote:
> > It fails and says:
> > parameter error setting up snapshot copy on write exception
> >
> > So yes, I have  snapshots in there, but I can't delete  the snapshots if
> > the volume isn't active, and I can't activate the volume because of a
> > snapshot.
> >
> > To make things worse, /dev/System contains /usr and /var.
> >
> > The snapshots were created with 1.0.1rc4 on 2.4.14 and I now run 2.4.17
> > with 1.0.1rc4-ish
> >
> > What's the magic override I need to use to make the volume active again?
> >
> > Thanks
> > Marc
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
