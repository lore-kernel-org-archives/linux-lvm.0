From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] create vg with same name as exported vg
Message-ID: <20031010204113.L6588@uk.sistina.com>
References: <1065050019.1267.20.camel@rich> <1065126760.1280.0.camel@rich> <20031010200150.K6588@uk.sistina.com> <1065813644.1286.16.camel@rich>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1065813644.1286.16.camel@rich>; from rich@storix.com on Fri, Oct 10, 2003 at 12:20:44PM -0700
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
Date: Fri Oct 10 14:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rich Turner <rich@storix.com>
Cc: linux-lvm@sistina.com

On Fri, Oct 10, 2003 at 12:20:44PM -0700, Rich Turner wrote:
> LVM1 actually handled this very well. With LVM1 it would rename the VG,
> appending "PV_EXP" to the VG name when exporting it.

LVM2 still does that for lvm1-format VGs of course.
And for lvm2-format VGs it simply sets a flag in the metadata
to say it's exported.

No, the issue is that LVM2 is using the not-guaranteed-to-be-unique 
VG name internally in places where it ought to be using the unique
VG uuid.

And vgimport should work by VG uuid (in case there are several
exported VGs present all with the same name) and require a new 
post-imported name to be specified if there's already a live VG
with the same name.

Alasdair
-- 
agk@uk.sistina.com
