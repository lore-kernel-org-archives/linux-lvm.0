Subject: Re: [linux-lvm] create vg with same name as exported vg
From: Rich Turner <rich@storix.com>
In-Reply-To: <20031010200150.K6588@uk.sistina.com>
References: <1065050019.1267.20.camel@rich> <1065126760.1280.0.camel@rich>
	 <20031010200150.K6588@uk.sistina.com>
Message-Id: <1065813644.1286.16.camel@rich>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Fri Oct 10 14:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Alasdair G Kergon <agk@uk.sistina.com>
Cc: linux-lvm@sistina.com

LVM1 actually handled this very well. With LVM1 it would rename the VG,
appending "PV_EXP" to the VG name when exporting it. This essentially
would allow creating a new VG with the same original name. I am kind of
surprised this did not carry over to LVM2.

I understand that the easiest solution would be to not be in this
situation. Unfortunately, my company develops disaster recovery software
that allows users to create/re-create/migrate LVM disk configuration. We
need to be very careful about how we detect and create PV's/VG's.

On Fri, 2003-10-10 at 12:01, Alasdair G Kergon wrote:
> > i have run into a situation where lvm2 does not behave the same as lvm1.
> > basically i want to be able to create a vg with the same name as an
> > exported vg.
> 
> > is this a bug within lvm2, is it no longer possible with lvm2, or is
> > there a different procedure to accomplish this?
> 
> The LVM2 tools get confused if they see 2 VGs (1 live, 1 exported) with 
> the same name.  It is not trivial to change to tools to cope with this,
> so for now, you should avoid getting into this situation.  [If
> necessary, use lvm.conf filters to hide the exported PVs while you
> rename the live VG to something else.]
> 
> Alasdair
