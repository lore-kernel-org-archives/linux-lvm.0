Return-Path: <thornber@btconnect.com>
Date: Mon, 30 Jul 2001 10:47:12 +0100
Subject: Re: [linux-lvm] Some ideas regarding snapshots (was: Reiserfs, 2. 4.7, snapshots w/ 0.9)
Message-ID: <20010730104712.C562@btconnect.com>
References: <B14BF8753E65D211ABCA00104B301EF501C02C87@cairn-gorm.cragtech.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B14BF8753E65D211ABCA00104B301EF501C02C87@cairn-gorm.cragtech.com>; from Steph@Connex.com on Fri, Jul 27, 2001 at 10:22:06AM -0700
From: Joe Thornber <thornber@btconnect.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jul 27, 2001 at 10:22:06AM -0700, Dale Stephenson wrote:
> Joe Thornber wrote:
> > Writeable snapshot's are easy to implement, I believe someone has
> > already made a patch for the current LVM series (search the list).  I
> > certainly intend putting it into the experimental LVM branch soon.
> > 
> > - Joe
> 
> I haven't tried to apply it with beta8, but this is the writeable snapshot
> patch I used for beta7:
> (All I've used it for is replays and UUID changes, so YMMV.) 

Thanks for posting this Dale, a short patch that adds a lot of
functionality!  The reason I'm holding off applying this patch is that
I have a new asnyc. snapshot driver that is waiting to drop into
experimental soon.  For the moment I've removed snapshots and pvmove
from the experimental branch.

- Joe
