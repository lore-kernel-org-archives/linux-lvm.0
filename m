From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Long-term snapshots possible?
Message-ID: <20030312132546.B1259@sistina.com>
References: <200303112228.39201.jhs@openenterprise.biz> <BD3FEC2C-5409-11D7-959E-0003937830E4@mac.com>
Mime-Version: 1.0
In-Reply-To: <BD3FEC2C-5409-11D7-959E-0003937830E4@mac.com>; from dalestephenson@mac.com on Tue, Mar 11, 2003 at 04:38:03PM -0500
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
Date: Wed Mar 12 06:27:00 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Mar 11, 2003 at 04:38:03PM -0500, Dale J. Stephenson wrote:
> 
> On Tuesday, March 11, 2003, at 10:28  AM, Jason Smith wrote:
> >
> > My problem is, this does not currently look possible without a severe
> > performance hit.  If a volume has, for example, five active snapshots,
> > then the deltas seem to get written five times, once per snapshot 
> > volume.
> >
> I posted a patch (in January?) to implement chained snapshots with 
> LVM1, ensuring that a delta is only copied once, at most.  The downside 
> is that the snapshots are no longer independent, and you can't remove a 
> recent snapshot without invalidating all the older snapshots.  But it 
> is more efficient.
> 
> I didn't keep the message, but I believe chained snapshots will be 
> implemented in LVM2 sometime this year.

Yes they will show up in LVM2 later.

FYI: LVM1 is in feature freeze since last year.

> 
> Dale J. Stephenson
> dalestephenson@mac.com
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
