Return-Path: <root@srv.sistina.com>
Date: Mon, 16 Jul 2001 13:31:49 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Newbie question
Message-ID: <20010716133149.D11625@sistina.com>
References: <FDEJIMPDHJAAPNLFKBMGAECACEAA.tgs@iafrica.com> <20010712094638.B418@btconnect.com> <200107121612.MAA13656@burns.luca.2y.net> <20010713131200.C32198@sistina.com> <200107131652.MAA15766@burns.luca.2y.net> <20010713184153.C4738@lucas.loria>
Mime-Version: 1.0
In-Reply-To: <20010713184153.C4738@lucas.loria>; from bernat@free.fr on Fri, Jul 13, 2001 at 06:41:53PM +0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jul 13, 2001 at 06:41:53PM +0200, Vincent Bernat wrote:
> Le Fri Jul 13, 2001 at 12:33 -0300, 
> Leandro Lucarella <luca@lucarella.com.ar> disait :
> 
> > Now I have a question. I read the HOWTO migrate the old root partition to a
> > LV, and the method is to make a LV on another HD (or the same if it's
> > room), copy the root FS to this LV, delete the old partition and add it to
> > the new LV. My question is. It's possible to make a VG without striping
> > ('cause I have just 1 HD in the begining) and then, when I add the old
> > partition to the VG, make this VG to do striping????
> 
> The FAQ seems to say it is not possible. You cannot add a PV to a
> stripping LV. It may change in the future.

True.

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
