Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9FIsxr11447
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 14:54:59 -0400
Received: from scooby.ox.compsoc.net (scooby-compsoc.trinity.ox.ac.uk
	[163.1.162.99])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9FIsq6u022390
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 14:54:57 -0400
Date: Fri, 15 Oct 2004 19:54:52 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20041015185452.GG565@scooby.ox.compsoc.net>
References: <20041015192848.O30562@sphinx.mythic-beasts.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041015192848.O30562@sphinx.mythic-beasts.com>
Subject: [linux-lvm] Re: [OxLUG] LVM2 problems
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
To: oxlug@lists.oxlug.org
Cc: linux-lvm@redhat.com

On Fri, Oct 15, 2004 at 07:28:48PM +0100, Paul Warren wrote:
> This should probably go on the linux-lvm mailing list, but the server
> seems to be down, 

Not as far as I know.

  http://sources.redhat.com/lvm2 -> linux-lvm@redhat.com

> Our primary problem is that creating snapshots occassionally hangs the
> machine.

Known issue now - unfortunately the fix involves a lot of coding and
other things have a higher priority at the moment.
 
> /lib/lvm-200/lvm vgconvert -d -v  -M1 mainvg
>     Using volume group(s) on command line
>     Finding volume group "mainvg"
>     Archiving volume group "mainvg" metadata.
> Segmentation fault
 
If it does it with the latest (2.00.25) version,
configure --enable-debug and send me the binary + core file
to investigate.

Alasdair
