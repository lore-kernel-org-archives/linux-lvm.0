Date: Mon, 8 Oct 2001 12:03:38 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] More Segfaults with LVM 1.0.1rc3
Message-ID: <20011008120338.B18314@sistina.com>
References: <20011004223343.A868@balu.kawo2.rwth-aachen.de> <20011005090810.B1245@sistina.com> <3BBD6084.70106@st-peter.stw.uni-erlangen.de> <20011005095737.A1460@sistina.com> <3BBD6C17.8090405@st-peter.stw.uni-erlangen.de> <3BC04AD9.9080300@st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
In-Reply-To: <3BC04AD9.9080300@st-peter.stw.uni-erlangen.de>; from galia@st-peter.stw.uni-erlangen.de on Sun, Oct 07, 2001 at 02:30:17PM +0200
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

On Sun, Oct 07, 2001 at 02:30:17PM +0200, svetljo wrote:
> >
> > Heinz J . Mauelshagen wrote:
> >
> >> On Fri, Oct 05, 2001 at 09:25:56AM +0200, svetljo wrote:
> >>
> >>> is gcc-3.0.1 safe, or i should also use "-o0"
> >>>
> >>
> >> Don't have a report for this :-(
> >> Please try it.
> >>
> > it's seems to work

Well, our impression is that optimizing under gcc > 2.95.2 doesn't seem
to be a good idea.

Have switched optimization off in configure for now.
Change is in CVS and next release.


> >
> > xxscan xxdiplay lvcreate lvremove lvrename lvextend lvreduce work 
> > without pb
> > but i tried yesterday to install 2.4.11-pre2-xfs-cvs lvm-cvs
> > and vgscan from the initrd segfaults , i can not boot to my LV's with it
> > probbably it's some other trouble, i'll try with 2.4.11-pre3-xfs
> > i think it's not relevant but all my VG's are over softRAIDs
> >
> it works with 2.4.11-pre4-xfs-cvs and lvm-cvs from today
> i couldn't test vgcreate and vgremove .. ( because i have no spare PV's)
> but the other tools work without complaining
> 
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
