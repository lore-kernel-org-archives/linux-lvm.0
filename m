Return-Path: <root@srv.sistina.com>
Date: Sat, 17 Feb 2001 19:04:56 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Newbie question: ERROR "pv_move_pe(): PE lock" pv_move_pe
Message-ID: <20010217190456.D10095@srv.sistina.com>
References: <20010217111625.B32060@colombina.comedia.it> <E14U4vX-0006ka-00@whittlesey.cl.cam.ac.uk> <20010217154855.B337@66bassett.freeserve.co.uk>
Mime-Version: 1.0
In-Reply-To: <20010217154855.B337@66bassett.freeserve.co.uk>; from joe@66bassett.freeserve.co.uk on Sat, Feb 17, 2001 at 03:48:56PM +0000
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

On Sat, Feb 17, 2001 at 03:48:56PM +0000, Joe Thornber wrote:
> On Sat, Feb 17, 2001 at 10:49:19AM +0000, Piete Brooks wrote:
> > >> # pvmove /dev/hda9 
> > >> pvmove -- moving physical extents in inactive volume group "vg01"
> > >> pvmove -- WARNING: moving of active logical volumes may cause data loss!
> > >> pvmove -- do you want to continue? [y/n] y
> > >> pvmove -- ERROR "pv_move_pe(): PE lock" pv_move_pe
> > >> 
> > >> pvmove -- ERROR "pv_move_pe(): PE lock" moving physical extents 
> > > i believe the vg should be active....
> > 
> > Sigh -- it warns that data loss can occur if they are active, so I assumed 
> > that they should be inactive.  If it has to be active, why does it quietly say 
> > `extents in inactive volume' and not warn that they should be active ?
> 
> I think the warning is just telling you that if you loose power whilst
> the move is in progress bad things could happen.  Heinz can you
> clarify please.

Yes, that warning exactly means that.
There's an aproach to work around that already but it's not yet implemented :-(

OTOH the ERROR displayed shouldn't happen.
Is probably related to the MD assumption further down in this thread.

As Andreas Dilger pointed out: we need to fix pv_read() and friends in order
to stop dealing with MDs through error codes.


> 
> - Joe
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
