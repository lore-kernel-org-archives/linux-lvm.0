From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How to fix inconsistent LV structs?
Message-ID: <20021007104201.A17176@sistina.com>
References: <3D9F6C62.1040004@raffael.ch>
Mime-Version: 1.0
In-Reply-To: <3D9F6C62.1040004@raffael.ch>; from herzog@raffael.ch on Sun, Oct 06, 2002 at 12:49:06AM +0200
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
Date: Mon Oct  7 03:53:52 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Oct 06, 2002 at 12:49:06AM +0200, Raffael Herzog wrote:
> Hi,
> 
> After a normal reboot I lost my volumes. I don't know, what
> exatly happended, but it looks like there was some problem
> with AVFS that caused umount not to work properly. I turned
> AVFS off now, but this doesn't get me my LVs back.
> 
> pvdata shows me, that the logical volume structs 125 through
> 139 are inconsistent (there are no LVs there), at some later
> point, it segfaults. Debug output showed me, that there's
> some garbage in these logical volume structs.

Hmmm...
Sounds like a nasty overwrite but it is hard to tell because you
can't remmeber the exact details :(

> 
> My basic idea is to just clear these structs and then use
> vgcfgrestore and/or the other recovery tools (which current-
> ly all fail with "pv_read(): read") to restore my LVs.
> 
> But how do I clear these structs?

Presuming that the metadata backups are intact, you need to "pvcreate -ff"
the physical volumes and run vgcfgrestore on each of them.
"vgscan ; vgchange -ay" should get you back to business afterwards.

> 
> 
> TIA,
> 
>    Raffi
> 
> 
> 
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
