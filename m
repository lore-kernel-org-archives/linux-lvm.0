Return-Path: <root@srv.sistina.com>
Date: Tue, 26 Jun 2001 15:49:47 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvmove error
Message-ID: <20010626154947.A27637@sistina.com>
References: <000301c0fe45$9d865940$7d80a8c0@dyndns.org>
Mime-Version: 1.0
In-Reply-To: <000301c0fe45$9d865940$7d80a8c0@dyndns.org>; from smdenton@bellsouth.net on Tue, Jun 26, 2001 at 09:40:50AM -0400
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

On Tue, Jun 26, 2001 at 09:40:50AM -0400, S. Michael Denton wrote:
>  
> Heinz:
> 
> Good news, I was lucky enough that the pe in question was near the
> end of the lv, so i could reduce the fs, reduce the lv, then create
> another lv of 1 pe to put there so nothing actually uses the
> offset-affected pe, and bring the volume/fs back to original size...
> and i checked the other pv's i have and this disk seems the only one
> affected by this offset problem, so i can live with losing 4MB on
> this drive :)

Great!
Please check 1.0 once it is available (which is hopefully soon ;-)

Regards,
Heinz    -- The LVM Guy --

> 
> Thanks again!
> 
> Scott Denton
> smdenton@bellsouth.net 
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
