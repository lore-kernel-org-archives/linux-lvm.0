From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvmcreate_initrd
Message-Id: <20020306110902.E21935@sistina.com>
References: <16iI7N-0CNkY4C@fwd06.sul.t-online.com>
MIME-Version: 1.0
In-Reply-To: <16iI7N-0CNkY4C@fwd06.sul.t-online.com>; from
    Marc.Neitzner@t-online.de on Tue, Mar 05, 2002 at 05:44:03PM +0100
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
Date: Wed Mar  6 04:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Marc,

have integrated your System.map option support into lvmcreate_initrd.

Please send further mail to this list in English.
Direct mail to me (mge@sistina.com) can be in German of course ;-)

Regards,
Heinz    -- The LVM Guy --

On Tue, Mar 05, 2002 at 05:44:03PM +0100, Marc Neitzner wrote:
> Hallo,
> 
> ich nutze LVM seit kurzem mit grosser Begeisterung. Da es bei der Migration
> auf einen neuen Kernel zu Problemen bei den Modulabh"angigkeiten kommen
> kann, sollte man lvmcreate_initrd meiner Meinung nach die System.map 
> dediziert "ubergeben k"onnen:
> 
> 47a48
> > #   03/0572002 - Added support for using a given System.map
> 50d50
> <
> 63a64
> >       echo "      -F|--smap     specify the System.map to use"
> 128a130
> >    -F|--smap) SMAP=$2; shift;;
> 342c344,349
> <    depmod -a $VERSION
> ---
> >    if [ -n "$SMAP" ]; then
> >       depmod -a $VERSION -F $SMAP
> >    else
> >       depmod -a $VERSION
> >    fi
> >
> 
> mfg
> 
> 	Marc Neitzner
> 
> -- 
> _______________________________________________________
> 
> Marc Neitzner
> 
> Phone: +49 (0)5101/586540
> Fax: +49 (0)5101/586542
> 
> mailto:Marc.Neitzner@highwire.de
> 
> PGP: http://www.highwire.de/pgp/marc_neitzner_pub.asc
> _______________________________________________________
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
