Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j9SJRqvl001853
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 20:27:52 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EVZtI-0005hJ-JU
	for linux-lvm@redhat.com; Fri, 28 Oct 2005 20:27:52 +0100
Date: Fri, 28 Oct 2005 20:27:52 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvresize patch pending
Message-ID: <20051028192752.GJ11086@agk.surrey.redhat.com>
References: <1130518796.4362590c75cf0@webmail.volumehost.com>
	<20051028170130.GH11086@agk.surrey.redhat.com>
	<1130519874.43625d4253324@webmail.volumehost.com>
	<1130522152.436266287429e@webmail.volumehost.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1130522152.436266287429e@webmail.volumehost.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Oct 28, 2005 at 12:55:52PM -0500, Zac Slade wrote:
> +    pv->size = size;

If the PV belongs to a VG (the only case that matters - pvcreate
is quite adequate otherwise), after the pv_write (equivalent
to 'pvcreate'), more fields need updating I think - see 
add_pv_to_vg() - incl. the various extent counters and
the segment lists.  

[If you only allow 'pvresize' with format_text this might be easier -
compatibility with LVM1 size calculations and restrictions is always 
tricky and needs careful testing - is it really worth the effort?]

> +       log_error("Currently limited to only One physical volume");

Try process_each_pv(), which also handles the locking for you.

For shrinking, you need to ensure that all the extents that are
about to be removed are unallocated - if they aren't, then the
metadata should be considered corrupt and it's best to refuse to change it.
[Separate recovery options needed.]

Alasdair
-- 
agk@redhat.com
