Received: from homer.msp.redhat.com (homer2.msp.redhat.com [172.16.30.25])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i77GsWa04033
	for <linux-lvm@redhat.com>; Sat, 7 Aug 2004 12:54:32 -0400
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i77GsVj18307
	for linux-lvm@redhat.com; Sat, 7 Aug 2004 11:54:31 -0500
Date: Sat, 7 Aug 2004 11:54:31 -0500
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove problem
Message-ID: <20040807115431.A17768@homer.msp.redhat.com>
References: <115936e9040807092135ccc2be@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <115936e9040807092135ccc2be@mail.gmail.com>;
	from gondoi@gmail.com on Sat, Aug 07, 2004 at 11:21:12AM -0500
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Aug 07, 2004 at 11:21:12AM -0500, BK Box wrote:
> I have a pretty lengthy explanation.. so i'll just post the link to it.
> http://forums.gentoo.org/viewtopic.php?t=206391

Summary: How do I pvmove data with LVM2 if contiguous runs of
PEs in the source LVs will have to be split up to make them fit?
 
Quick answer:
LVM2 doesn't support this directly yet: it's being worked on.
Until it's done you need to edit the metadata [using vgcfg*]
to split the segments into smaller ones before running pvmove.
[Might also need to recompile disabling section merging code
which would undo your splitting.]

Alasdair
-- 
agk@redhat.com
