Date: Fri, 27 Oct 2000 01:53:08 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] Re: LVM snapshotting broken?
Message-ID: <20001027015308.A5034@caldera.de>
References: <Pine.LNX.4.21.0010261632440.15696-100000@duckman.distro.conectiva> <20001026233707.A12201@srv.t-online.de>
Mime-Version: 1.0
In-Reply-To: <20001026233707.A12201@srv.t-online.de>; from Heinz.Mauelshagen@t-online.de on Thu, Oct 26, 2000 at 11:37:07PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauelshagen@sistina.com
Cc: Rik van Riel <riel@conectiva.com.br>, linux-kernel@vger.kernel.org, linux-lvm@msede.com, mge@sistina.com

On Thu, Oct 26, 2000 at 11:37:07PM +0000, Heinz J. Mauelshagen wrote:
> 
> Hi Rik,
> 
> I can't reproduce it on my box.
> 
> Could you provide a "lvcreate -d" output of what you did to help
> me to dig into that one.
> 
> Did somebody else out there face the same 0.8final snapshot weirdness?

Yes. I have the same problem Rik has. A debug printf just before the
ioctl in lv_create_remove gives the right ->lv_snapshot_minor.
A debug printk in lvm_do_lv_create just at the beginning has
->lv_snapshot_minor _always_ = 0.
This happens with the 0.8final utils, both with and without additional
patches. Andrea's lvm-tools-aa-20000119 are ok.

Look like a structure mis-match to me, although lv_v2_t is the same for
all tools.

	Christoph

-- 
Always remember that you are unique.  Just like everyone else.
