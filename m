Date: Mon, 8 Oct 2001 12:02:07 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] More Segfaults with LVM 1.0.1rc3
Message-ID: <20011008120207.A18314@sistina.com>
References: <20011004223343.A868@balu.kawo2.rwth-aachen.de> <20011005090810.B1245@sistina.com> <3BBD6084.70106@st-peter.stw.uni-erlangen.de> <20011005095737.A1460@sistina.com> <3BBD6C17.8090405@st-peter.stw.uni-erlangen.de> <20011006231826.A739@guldukat.muon.local>
Mime-Version: 1.0
In-Reply-To: <20011006231826.A739@guldukat.muon.local>; from nils@muon.de on Sat, Oct 06, 2001 at 11:18:26PM +0000
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

Nile,
thanks for the info.

Does LVM compiled under gcc-3.0.1 *without* optimization work?

On Sat, Oct 06, 2001 at 11:18:26PM +0000, Nils Juergens wrote:
> On Fri, 05.10.01, svetljo <galia@st-peter.stw.uni-erlangen.de> wrote:
> > 
> > Heinz J . Mauelshagen wrote:
> > 
> > >On Fri, Oct 05, 2001 at 09:25:56AM +0200, svetljo wrote:
> > >
> > >>is gcc-3.0.1 safe, or i should also use "-o0"
> > >>
> > >
> > >Don't have a report for this :-(
> > >Please try it.
> > >
> > it's seems to work
> > 
> 
> I tried gcc-3.0.1 with LVM on linux-2.4.10 and had a lot of problems,
> but it was no problem in LVM, it works with 2.95.4.
> 
> What i was seeing was funny stuff happening to the stack after
> a function call causing (in my case) lvremove to segfault.
> I have seen this with gcc-3.0.1 before, on another program.
> 
> 
> Nils
> 
> -- 
>  >   Nils Juergens  | nils@muon.de | icq 7090774   <
>  >  If we all work hard, we can turn this company  <
>  >      around 360 degrees -- gruntbert(LOTD)      <
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
