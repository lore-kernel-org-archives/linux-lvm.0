From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] VFS lock patch - should it go to Marcelo?
Message-ID: <20020813160644.A30898@sistina.com>
References: <FED7EB450413D511ABC100B0D021173246E1A7@hal9000.hermes.si>
Mime-Version: 1.0
In-Reply-To: <FED7EB450413D511ABC100B0D021173246E1A7@hal9000.hermes.si>; from luka.renko@hermes.si on Tue, Aug 13, 2002 at 09:27:28AM +0200
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
Date: Tue Aug 13 09:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Aug 13, 2002 at 09:27:28AM +0200, Luka Renko wrote:
> > First things first - make sure you've added the VFS lock 
> > patch to your 
> > kernel. It is available in the "kernel" directory in the EVMS 
> > package. You 
> > will need this patch in your kernel anytime you are going to 
> > use snapshots 
> > with journaled filesystems.
> 
> I have one question for EVMS and LVM developers: what is the reason that VFS
> lock patch does not go to Marcelo in order to be included in next 2.4
> release?
> This patch is out and being sucessfully used for ages. Is there any good
> reasno not to merge it into 2.4.20?

No.
Chris Mason as the maintainer of the VFS lock patch
was trying to get it in a while ago TTBOMK anyways.

Have send him a mail...

> 
> Regards,
> Luka
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
