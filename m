Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i9FL9HuA025641
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 22:09:17 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CIZK9-0001Vi-Rb
	for linux-lvm@redhat.com; Fri, 15 Oct 2004 22:09:17 +0100
Date: Fri, 15 Oct 2004 22:09:17 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: [OxLUG] LVM2 problems
Message-ID: <20041015210917.GD24242@agk.surrey.redhat.com>
References: <20041015192848.O30562@sphinx.mythic-beasts.com>
	<20041015185452.GG565@scooby.ox.compsoc.net>
	<20041015201822.B29778@sphinx.mythic-beasts.com>
	<20041015215049.A27758@sphinx.mythic-beasts.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041015215049.A27758@sphinx.mythic-beasts.com>
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

On Fri, Oct 15, 2004 at 09:50:49PM +0100, Paul Warren wrote:
> ./lvm vgconvert -M1 -d -v mainvg
>   Metadata would overwrite physical extents
>   /dev/sda2: Format-specific setup of physical volume failed.
 
LVM1 needs more space for its metadata than LVM2 - this is saying
it doesn't think the LVM1 metadata will fit into the available space.

Alasdair
-- 
agk@redhat.com
