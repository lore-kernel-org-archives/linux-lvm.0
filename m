Date: Wed, 22 Aug 2001 09:04:31 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Snapshot on xfs filesystem
Message-ID: <20010822090431.C7109@sistina.com>
References: <3B83566E.F335F1ED@tronicplanet.de>
Mime-Version: 1.0
In-Reply-To: <3B83566E.F335F1ED@tronicplanet.de>; from stefan.knollmueller@tronicplanet.de on Wed, Aug 22, 2001 at 08:51:26AM +0200
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

On Wed, Aug 22, 2001 at 08:51:26AM +0200, Knollmueller Stefan wrote:
> hello,
> we have got a serious problem doing snapshots on an xfs filesystem
> (exported via nfs) while there is access to it via nfs or the fs being
> only mounted by another machine via nfs.
> in that case the machine hangs totally and the only possibilty left is
> the kdb...

Could you provide a kdb backtrace in that case, please?

> the problem does not occur if the fs is not mounted by another machine
> in this case everything works just fine.
> does anybody know what to do, is there a patch?

Not known so far -> no patch so far ;-)

> 
> stefan
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
