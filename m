Return-Path: <root@srv.sistina.com>
Date: Wed, 16 May 2001 10:53:58 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
Message-ID: <20010516105358.D11984@sistina.com>
References: <200105160032.f4G0WPIP022333@webber.adilger.int> <28230000.989975826@tiny> <20010516093929.B482@66bassett.freeserve.co.uk>
Mime-Version: 1.0
In-Reply-To: <20010516093929.B482@66bassett.freeserve.co.uk>; from thornber@btconnect.com on Wed, May 16, 2001 at 09:39:29AM +0100
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

On Wed, May 16, 2001 at 09:39:29AM +0100, Joe Thornber wrote:
> On Tue, May 15, 2001 at 09:17:06PM -0400, Chris Mason wrote:
> > You're right though, pv_flush certainly doesn't look like it could cause
> > any deadlocks.
> 
> I must admit I'm struggling to understand why PV_FLUSH even exists.
> It does *exactly* the same thing as a BLKFLSBUF ioctl to the pv device
> itself.

Joe is right.
It is a few lines of unneccesary code in the LVM driver ;-)
We can remove it > 1.0 and call the ioctl of the underlying driver directly.

> As such I agree that it's unlikely to be the culprit.

Correct.

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
