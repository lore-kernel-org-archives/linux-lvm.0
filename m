From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] multiple volumes..
Message-Id: <20020410002847.GE17367@auctionwatch.com>
References: <18044083656.20020409231800@tnonline.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18044083656.20020409231800@tnonline.net>
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
Date: Tue Apr  9 19:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Apr 09, 2002 at 11:18:00PM +0200, Anders Widman wrote:
> I have a problem which I want to solve as efficiently as possible.
> The problem is that I have 13 drives os various sizes (30-120GB) which
> I want to combine into one (or a few) logical volumes with redundancy
> if one drive would fail.
> How would the smartest layout be? I was thinking about multiple
> partiontions and then combine them into several RAID 5 chains, and
> then use LVM to manage the logical volumes.

    The problem (off the top of my head) is that (1) this will give
    utter crap performance, and (2) If you're not *really* careful with
    your layout you could wind up losing a lot of data in a crash and
    (3) even if you don't loose data in a crash, a single drive fault
    will still drag performance into the toilet.  

> There is an expamle of my ideas at http://www.tnonline.net/raid-lvm.png
> As you can see there are 8 chains and about 50 GB unallocated data in
> this example. Can I minimize the loss even better?

    Using MD to make some meta-devices on the raw drive do:
    
    Stripe:
    2x60 = 120
    2x60 = 120
    2x60 = 120

    Raw: 
    120x1=120 

    Then layer these devices to become your initial RAID5 volume. 
    
    That leaves 2x75, 2x80, 1x30, and 1x40:

    Linear mode the 30 and 40 to get 70, raid5 across these to get:
    80
    80
    75
    75
    70 (30+40). 

    This loses you about 30 gig. (10+10+5+5). If you really wanted you
    could recover that by working off partitions, but IMO it's just not
    worth it. 

-- 
Share and Enjoy. 
