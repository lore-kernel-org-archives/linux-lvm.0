From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] ERROR "pv_read(): PV identifier invalid" reading
    physical volumes
Message-Id: <20020115151222.D11005@sistina.com>
References: <1010527606.19493.46.camel@localhost.localdomain>
    <1010529428.19493.48.camel@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <1010529428.19493.48.camel@localhost.localdomain>;
    from mkennedy@opushealthcare.com on Tue, Jan 08, 2002 at 04:37:08PM -0600
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
Date: Tue Jan 15 08:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 08, 2002 at 04:37:08PM -0600, Matthew Kennedy wrote:
> 
> Never mind. A little more perseverance and I learned that it was my IDE
> cdrw drive. I needed to add "append="ide-scsi"" to the relevant
> /etc/lilo.conf stanza and then add ide-scsi to /etc/modules so that it
> loads at boot.
> 
> Shouldn't LVM check against such devices being present and then skip
> over them though?

We are adding config file support for inclusion and exclusion of arbitrary
devices to LVM2 which will give the user much more control as any hard coded
logic.

> 
> Matt
> 
> On Tue, 2002-01-08 at 16:06, Matthew Kennedy wrote:
> > Hello,
> > 
> > I'm having some trouble getting LVM to work on a Debian system. The
> > actions I performed are bellow (--verbose --debug versions are
> > attached). Bascically, I get "ERROR "pv_read(): PV identifier invalid"
> > reading physical volumes" when I run vgcreate even though the PV I
> > initialized succeeded.
> > 
> > My user tools are IOP10. Kernel is 2.4.17.
> > 
> > Thanks
> > 
> > Matt
> > 
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
