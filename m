From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm 1.0.3 (redhat rpm shipped with redhat 7.3)
Message-ID: <20020529105058.A31380@sistina.com>
References: <3CF27A7E.3906.1A017A6@localhost>
Mime-Version: 1.0
In-Reply-To: <3CF27A7E.3906.1A017A6@localhost>; from ByrneJB@Harte-Lyne.ca on Mon, May 27, 2002 at 06:27:10PM -0400
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
Date: Wed May 29 03:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> Running "vgchange -a y" gives a syntax error.  Running "vgchange -
> ay" produces desired result.  I am not sure if this is a bug or a 
> documentation error.---     e-mail is NOT a secure channel 

Works perfectly fine here with both cases.
Could that be a getopt() flaw in certain cersions of glibc?

> James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
> Harte & Lyne Limited          http://www.harte-lyne.ca
> 9 Brockley Drive              vox: +1 905 561 1241
> Hamilton, Ontario             fax: +1 905 561 0757
> Canada  L8E 3C3
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
