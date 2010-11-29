Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oATFTUZs012467
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 10:29:30 -0500
Received: from www2.open-std.org (www.open-std.org [83.133.64.141])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oATFTHEI008300
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 10:29:18 -0500
Date: Mon, 29 Nov 2010 16:29:16 +0100
From: Keld =?iso-8859-1?Q?J=F8rn?= Simonsen <keld@keldix.com>
Message-ID: <20101129152916.GB13310@www2.open-std.org>
References: <AANLkTimTYse7vnqZydc1Z5z60vNuQw3juj7J_W7+bQEm@mail.gmail.com>
	<2D.98.07087.690A2FC4@cdptpa-omtalb.mail.rr.com>
	<AANLkTinUmZoqSWNZ7NK+tg5DTpc5JFbbPPZV6YONq+ox@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTinUmZoqSWNZ7NK+tg5DTpc5JFbbPPZV6YONq+ox@mail.gmail.com>
Subject: Re: [linux-lvm] LVM over RAID,
	or plain disks? A:"Yes" = best of both worlds?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: hansbkk@gmail.com
Cc: Leslie Rhorer <lrhorer@satx.rr.com>, linux-raid@vger.kernel.org, linux-lvm@redhat.com

On Mon, Nov 29, 2010 at 06:01:11PM +0700, hansbkk@gmail.com wrote:
> On Mon, Nov 29, 2010 at 1:34 AM, Leslie Rhorer <lrhorer@satx.rr.com> wrote:
> >> - I am not at this point overly concerned about performance issues -
> >> reliability/redundancy and ease of recovery are my main priorities.
> >
> > � � � �In that case, I'm not sure about your desire for the additional
> > complexity. �Someone else suggested RAID6, which from an operational
> > standpoint is much simpler. �The main reason, it seems to me, for the more
> > complex topologies would be enhancing perfromance.
> 
> I can see how RAID6 is simpler than RAID10, but compared to RAID1?

Hmm, does not compute by me. RAID1 and RAID10 are the same in complexity,
RAID10 is just a modern RAID1, and should actually have been called
RAID1.

best regards
keld
