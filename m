Return-Path: <root@srv.sistina.com>
Date: Tue, 8 May 2001 09:49:48 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Removing a disk from the system
Message-ID: <20010508094948.D31443@sistina.com>
References: <20010430160732.I19810@sistina.com> <20010507140256.B1469@pclab.ifg.uni-kiel.de>
Mime-Version: 1.0
In-Reply-To: <20010507140256.B1469@pclab.ifg.uni-kiel.de>; from torsten@pclab.ifg.uni-kiel.de on Mon, May 07, 2001 at 02:02:56PM +0200
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

On Mon, May 07, 2001 at 02:02:56PM +0200, Torsten Landschoff wrote:
> On Mon, Apr 30, 2001 at 04:07:32PM +0000, Heinz J. Mauelshagen wrote:
> > > Seems like I should have used vgexport/import in the first time.
> > 
> > Actually not.
> > vgscan *should* have cut it.
> 
> Thanks, so I did not do anything wrong. Of course given that the data is
> still there it seems I was at least careful enough ;)
> 
> > It would be rather helpful, if you could provide the VGDA of the problematic
> > configuration and the vgscan output with option "-d" in order to investigate
> > searching for any bugs better.
> > 
> > In case you are able to reproduce the situation, where vgscan just finds
> > one but not both of the VGs, please send that data to me.
> 
> Of course that system is again running production and I guess to reproduce
> the problem I had to switch disks once again. I guess the real problem
> was that /dev/hdb1 became /dev/hda1 after removing the old disk. 

Configuration changes in io pathes is a major thing vgscan addresses.
I'm very much interested in every bug in this area.

> 
> I'll try to reproduce the problem at my home machine but I can't promise 
> anything.

Ok.
Thank you.

> 
> Greetings
> 
> 	Torsten
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
