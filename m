From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] using a read-only PV
Message-Id: <20020222124936.A16932@sistina.com>
References: <20020222102651.GA2134@zombie.inka.de>
MIME-Version: 1.0
In-Reply-To: <20020222102651.GA2134@zombie.inka.de>; from edi@gmx.de on
    Fri, Feb 22, 2002 at 11:26:51AM +0100
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
Date: Fri Feb 22 05:52:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Feb 22, 2002 at 11:26:51AM +0100, Eduard Bloch wrote:
> Hello,
> 
> is it possible to use a physical volume in read-only mode?

"hdparm -r 1 PhysicalVolumePath" would set the device used as a PV to
read-only mode (if supported), but that wouldn't allow LVM to work properly
because it needs to write to *all* PVs on updates.

> The idea is:
> put a snapshot of the PV on a CDROM. Later, build a volume group, with
> this read-only volume as the first volume in the snapshot mode, and an
> additional volume on the harddisk where the differences are stored.
> 
> Is a such scenario possible - or already useable?

No.

LVM needs to be enhanced to support what you want.

> 
> Gruss/Regards,
> Eduard.
> -- 
> The UNIX Guru's view of Sex:
> unzip ; strip ; touch ; finger ; mount ; fsck ; more ; yes ; umount ;
> sleep                                      [Hauke Heidtmann in dcoud]
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
