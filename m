From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Automatic snapshot system?
Message-ID: <20011203152024.B10584@sistina.com>
References: <ufasnayrr4e.fsf@epithumia.math.uh.edu> <20011129004736.A14092@auctionwatch.com> <ufa667ts3zh.fsf@epithumia.math.uh.edu> <20011130082244.A379@btconnect.com> <ufa1yige1hm.fsf@epithumia.math.uh.edu>
Mime-Version: 1.0
In-Reply-To: <ufa1yige1hm.fsf@epithumia.math.uh.edu>; from tibbs@math.uh.edu on Fri, Nov 30, 2001 at 09:12:53AM -0600
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
Date: Mon Dec  3 08:18:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 30, 2001 at 09:12:53AM -0600, Jason L Tibbitts III wrote:
> >>>>> "JT" == Joe Thornber <thornber@btconnect.com> writes:
> 
> JT> It's a nice idea, but with the current implementation there's no
> JT> way I'd want 100 snapshots of the same origin hanging around.
> 
> They wouldn't all be of the same LV, fortunately; I split my VG up
> into lots of manageable chunks.  (Large users get a volume to
> themselves, small users get grouped into various user volumes.)  But
> still, I assume that you have some details of performance with the
> current snapshot implementation.  Is it that bad?

Well, it does

- copy on write (COW) synchronously *before* et allows the write to
  the original LV to proceed

- do multiple reads in case you`ve got multiple snapshots

- does the COWs for multiple snapshots sequentially

This leads to an unecessary read per additional snapshot on the original
LV and therefore to something around n-times delay in case you've got
n snapshots.

We will have an asynchrounous implementation which avoids multiple
reads with LVM2.

> 
>  - J<
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
