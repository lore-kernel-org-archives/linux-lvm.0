Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9FLIEr22042
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 17:18:14 -0400
Received: from sphinx.mythic-beasts.com (sphinx.mythic-beasts.com
	[212.69.37.6])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9FLI8BL001618
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 17:18:08 -0400
Received: from pdw by sphinx.mythic-beasts.com with local (Exim 4.34)
	id 1CIZSh-0001lh-SG
	for linux-lvm@redhat.com; Fri, 15 Oct 2004 22:18:07 +0100
Date: Fri, 15 Oct 2004 22:18:07 +0100
From: Paul Warren <pdw@ex-parrot.com>
Subject: Re: [linux-lvm] Re: [OxLUG] LVM2 problems
Message-ID: <20041015221807.C27758@sphinx.mythic-beasts.com>
References: <20041015192848.O30562@sphinx.mythic-beasts.com>
	<20041015185452.GG565@scooby.ox.compsoc.net>
	<20041015201822.B29778@sphinx.mythic-beasts.com>
	<20041015215049.A27758@sphinx.mythic-beasts.com>
	<20041015210917.GD24242@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041015210917.GD24242@agk.surrey.redhat.com>;
	from agk@redhat.com on Fri, Oct 15, 2004 at 10:09:17PM +0100
Sender: Paul Warren <pdw@sphinx.mythic-beasts.com>
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

On Fri, Oct 15, 2004 at 10:09:17PM +0100, Alasdair G Kergon wrote:
> On Fri, Oct 15, 2004 at 09:50:49PM +0100, Paul Warren wrote:
> > ./lvm vgconvert -M1 -d -v mainvg
> >   Metadata would overwrite physical extents
> >   /dev/sda2: Format-specific setup of physical volume failed.
>  
> LVM1 needs more space for its metadata than LVM2 - this is saying
> it doesn't think the LVM1 metadata will fit into the available space.

Is there any way around this?  Would growing the partition help?

The machines in question are co-located, so whilst it may be possible to
dd data off, recreate the VG and then copy it back from within an
initrd, it's not my idea of good sport, I have to say :-)

cheers,

Paul
