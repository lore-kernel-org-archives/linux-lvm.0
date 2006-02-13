Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1DMZw102559
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 17:35:58 -0500
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1DMZtWE025904
	for <linux-lvm@redhat.com>; Mon, 13 Feb 2006 17:35:55 -0500
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] removing bad PVs
Date: Mon, 13 Feb 2006 16:35:52 -0600
References: <NNEEKMEDALGMPDKHFPJHEELNDHAA.maplante@iol.unh.edu>
In-Reply-To: <NNEEKMEDALGMPDKHFPJHEELNDHAA.maplante@iol.unh.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602131635.52347.krakrjak@volumehost.net>
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
To: maplante@iol.unh.edu, LVM general discussion and development <linux-lvm@redhat.com>

On Monday 13 February 2006 08:36, Matthew Plante wrote:
> The solution I ended up with was actually to add a new disk and make new
> PVs with the same uuid, which wasn't exactly the solution I was going for,
> but it ended up working out.  I wasn't able to get the --removemissing
> option in vgreduce to work for the scenario I mentioned before.
> The test scenario I was going for was an unexpected removal of a disk,
> where I could remove the disk from the vg, and bring the vg back up in a
> semi-working state, minus one disk/some data.
I know this is sort of late in the game as you have found a solution that 
works, but did you ever try using vgreduce -A n vgname pvname? Or the same, 
but with a force option?  I know you said --removemissing didn't work, but 
that may have been due to not setting -A n.

-- 
Zac Slade
