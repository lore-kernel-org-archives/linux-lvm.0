Date: Mon, 10 Sep 2001 15:43:09 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Message-ID: <20010910154309.A15329@sistina.com>
References: <E15f13v-0003bs-00@hermes.sistina.com> <20010910103952.B31660@vestdata.no> <20010910132709.G31313@sistina.com> <E15gPU0-0000f3-00@hermes.sistina.com>
Mime-Version: 1.0
In-Reply-To: <E15gPU0-0000f3-00@hermes.sistina.com>; from fejf@gmx.de on Mon, Sep 10, 2001 at 01:45:02PM +0200
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

On Mon, Sep 10, 2001 at 01:45:02PM +0200, FEJF wrote:
> Heinz J . Mauelshagen, on Montag, 10. September 2001 13:27 wrote:
> > Ragnar,
> >
> > typically a dying source device will cause read to fail (~line 520
> > in pv_move_pe.c). This could be easily addressed by an 'ignore read errors'
> > option and a fallback to BLOCK_SIZEed I/O in order to avoid as much data
> > losses as possible.
> >
> > But I wonder, why in your case the locking of the PE failed. Are you able
> > to reporduce your case and provide the error code?
> 
> as the harddisc makes scary noise and i "loose" it after some hours without 
> and reboot. and have to wait a day or so to get it back. i think it's a 
> serious harddisc problem combined with some heat problem or so...

Maybe switching to operator beer cooling might help ;-)

> reproduce... hmm... prehaps try to throw your harddisc several times on the 
> ground ? ;)

;)

> fejf
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
