From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: LVM Woes
Message-Id: <20020430153659.A4879@sistina.com>
References: <E1727MA-0007Nd-00@hermes.sistina.com>
    <Pine.LNX.4.33.0204300048050.24127-100000@x.firesites.com>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0204300048050.24127-100000@x.firesites.com>;
    from theman@chaj.com on Tue, Apr 30, 2002 at 12:52:25AM -0400
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
Date: Tue Apr 30 08:39:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Apr 30, 2002 at 12:52:25AM -0400, Jims wrote:
> 
> Still doesn't work. Getting the same error. Will send you the debug
> output. Any ideas?

See my direct email to you.

> 
> On Fri, Apr 26, 2002 at 12:24:16PM -0400, Jims wrote:
> >
> > Thanks for the suggestion. When I try it, here is what I get...
> >
> > /sbin/vgcfgrestore -n world -o /dev/sdd1 /dev/hda2
> > vgcfgrestore -- ERROR "vg_write(): open" storing VGDA of "world" on
> disks
> >
> > Am I supposed to do something to the new disk other than creating an LVM
> > partition on it ?
> 
> You need to run pvcreate on it before vgcfgrestore.
> 
> Regards,
> Heinz    -- The LVM Guy --
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
