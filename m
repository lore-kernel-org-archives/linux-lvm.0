Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mB52O4F1029632
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 21:24:04 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1L8QMN-0004Hh-V8
	for linux-lvm@redhat.com; Fri, 05 Dec 2008 02:24:04 +0000
Date: Fri, 5 Dec 2008 02:24:03 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Limiting i/o bandwith for pvmove?
Message-ID: <20081205022403.GU26097@agk.fab.redhat.com>
References: <20081204212123.GV2700@ppc.in-berlin.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20081204212123.GV2700@ppc.in-berlin.de>
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

On Thu, Dec 04, 2008 at 10:21:23PM +0100, Philipp Schmidt wrote:
> Is there a way to limit the bandwidth usage of pvmove, like it is
> possible when reconstructing software raid mirris sets?
 
I wish there was!  This problem annoys me too but nobody's been bothered 
enough about it to come up with a workaround yet...

(Maybe something could even be hacked together using ioband.)

Alasdair
-- 
agk@redhat.com
