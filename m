From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] create vg with same name as exported vg
Message-ID: <20031010200150.K6588@uk.sistina.com>
References: <1065050019.1267.20.camel@rich> <1065126760.1280.0.camel@rich>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1065126760.1280.0.camel@rich>; from rich@storix.com on Thu, Oct 02, 2003 at 01:32:40PM -0700
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
Date: Fri Oct 10 14:03:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rich Turner <rich@storix.com>
Cc: linux-lvm@sistina.com

> i have run into a situation where lvm2 does not behave the same as lvm1.
> basically i want to be able to create a vg with the same name as an
> exported vg.

> is this a bug within lvm2, is it no longer possible with lvm2, or is
> there a different procedure to accomplish this?

The LVM2 tools get confused if they see 2 VGs (1 live, 1 exported) with 
the same name.  It is not trivial to change to tools to cope with this,
so for now, you should avoid getting into this situation.  [If
necessary, use lvm.conf filters to hide the exported PVs while you
rename the live VG to something else.]

Alasdair
-- 
agk@uk.sistina.com
