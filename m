Return-Path: <root@srv.sistina.com>
Date: Thu, 19 Jul 2001 16:03:04 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] I/O error: dev 08:11, sector 0
Message-ID: <20010719160304.A29325@sistina.com>
References: <20010718231729.A791@digit-safe.dyndns.org> <20010719111351.A28183@sistina.com> <20010719134847.E752@tykepenguin.com>
Mime-Version: 1.0
In-Reply-To: <20010719134847.E752@tykepenguin.com>; from caulfield@sistina.com on Thu, Jul 19, 2001 at 01:48:47PM +0100
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

On Thu, Jul 19, 2001 at 01:48:47PM +0100, Patrick Caulfield wrote:
> On Thu, Jul 19, 2001 at 11:13:51AM +0200, Heinz J. Mauelshagen wrote:
> > 
> > Allan,
> > 
> > 08:11 (/dev/sda11) shows that I/O error, you use /dev/sdb, which is 08:16
> > for your VG -> no problem for LVM.
> > 
> > Because /dev/sda11 seems to be configured, LVM reads it on its search for
> > physical volumes.
> > 
> > If you are not using /dev/sda11 for anything you are fine for the moment.
> 
> If the minor number is in hex that makes it /dev/sdb1 - which seems slightly
> more sensible to me :-)

Yes, you are right. Got that base wrong :)

> 
> patrick
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
