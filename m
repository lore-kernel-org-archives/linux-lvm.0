From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] mounting reiserfs snaphost fails
Message-ID: <20021004105211.C8575@sistina.com>
References: <3D6DD029.1010905@dotcom.pl> <20020829130219.A32269@sistina.com> <3D9D4C5B.F4352F4E@silicide.dk> <3D9D4F63.75700F39@silicide.dk>
Mime-Version: 1.0
In-Reply-To: <3D9D4F63.75700F39@silicide.dk>; from jon+lvm@silicide.dk on Fri, Oct 04, 2002 at 10:20:51AM +0200
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
Date: Fri Oct  4 03:58:58 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 04, 2002 at 10:20:51AM +0200, Jon Bendtsen wrote:
> Jon Bendtsen wrote:
> > 
> > "Heinz J . Mauelshagen" wrote:
> > >
> > > Did you put the VFS lock patch in?
> > > You need that to be able to mount snapshots of *journaled* filesystems.
> > 
> > Where do i find that patch ?
> > Does 2.4.19 contain it ? does the latest kernel, if 2.4.19 isnt the
> > latest ?
> 
> never mind, i did a cvs checkout, and made a patch for the linux kernel.
> i believe it included the VFS-LOCK.patch (did a make in the PATCHES
> subdir)
> 
> Do i need to update the LVM tools, or can i use default debian woody
> tools
> and still get this effect ?

No, they should run fine because the VFS lock patch is just a kernel thing
transparent to user space.

> 
> 
> 
> JonB
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
