Return-Path: <root@srv.sistina.com>
Date: Wed, 25 Apr 2001 21:12:14 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan does not found my VG, but pvscan does...
Message-ID: <20010425211214.A7135@sistina.com>
References: <000901c0cd36$a80064a0$7d80a8c0@dyndns.org> <01042510065800.15131@workstation> <20010425114759.A4514@sistina.com> <3AE6C0AB.CA50ACD8@suse.de>
Mime-Version: 1.0
In-Reply-To: <3AE6C0AB.CA50ACD8@suse.de>; from Fabian.Herschel@suse.de on Wed, Apr 25, 2001 at 02:18:51PM +0200
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

On Wed, Apr 25, 2001 at 02:18:51PM +0200, Fabian.Herschel@suse.de wrote:
> "Heinz J. Mauelshagen" wrote:
> 
> > > I'm hopeful we will find a solution.
> > 
> > These "vgscan can't find my..." errors still show up on a too regular base :-(
> > They absolutely need to be fixed before the 1.0 release.
> > 
> > Could you please send your two VGDAs compressed email attached to mee in order
> > to be able to investigate more.
> > 
> > Add the "vgscan -d" output for the fail case as well, please.
> 
> Are the first 5000 blocks of each PV enought? 

That's ok.

> Is the complete VGDA stored in this area?

Typically yes, because the VGDA is smaller than a PE which is 4MB in size
by default.

> 
> Fabian
> 
> 
> 
> -- 
> Fabian Herschel                                 SuSE Linux Solutions AG
> Tel:    +49-6196-50951-23                       Mergenthalerallee 45-47
> Fax:    +49-6196-409-607                        D-65760 Eschborn
> mailto: Fabian.Herschel@suse.de                 http://www.suse.de
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
