From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: [linux-lvm] System Suggestions
In-Reply-To: <20020307034009.GJ32504@auctionwatch.com>
Message-Id: <Pine.LNX.4.44.0203062250380.25357-100000@dragon.inside.ntisys.com>
MIME-Version: 1.0
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
Date: Wed Mar  6 21:52:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, 6 Mar 2002, at 7:40pm, Petro wrote:
> We have 10 of the 3ware cards, and while the drive is GPLd and in the
> kernel, we have not been satisfied with the stability of the system

  Can you elaborate?  We have a few 3Ware cards in production, and so far,
they have been rock solid.  <knock on wood>

> We haven't had a chance yet to qual the latest firmware, etc.

  We found upgrading the firmware on our 3Ware cards, and using the latest
driver, helped some.

> ... but we went with dumb IDE expansion cards (we're only using 4 ide
> drives per system) and we're getting better speed (RAID0 or 1+0 depending)
> than we were off the 3ware card.

  Which model?  I am told the 7000 series is significantly faster than the
6000 series.  We only have a few 6200's for simple RAID1, so we don't really
care, but it sounds like you might.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
