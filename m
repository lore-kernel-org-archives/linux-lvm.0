From: bscott@ntisys.com
Subject: Re: [linux-lvm] Recovering from a disaster...
In-Reply-To: <41135624890.20021207104518@tnonline.net>
Message-ID: <Pine.LNX.4.44.0212071656001.29870-100000@dragon.inside.ntisys.com>
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
Date: Sat Dec  7 16:07:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, 7 Dec 2002, at 10:45am, andewid@tnonline.net wrote:
>>> Someday we'll even see PC-class machines without a BIOS.
> 
>> Perhaps I misunderstand, but how does one boot without a BIOS?
> 
> Well,  The only thing needed is firmware for various devices that have
> the  capability  to  load the OS from some form of media - either over
> LAN/Internet, disks, floppy, CD, ROM, etc etc..
> 
> Todays  BIOS  are  often around 256KB with lots of old legacy code for
> DOS based systems. Most of it is also 16 bit code.

  Ah.  So you're not really talking about no BIOS at all, just removing all
the old code that isn't used anymore anyway.

  I've often wondered how much of that stuff still works, anyway.  We've
occasionally had customers ask us to move some ancient, MS-DOS-based
application new hardware.  Sometimes it works, sometimes it doesn't.  It
wouldn't surprise me if software rot has caused whole sections of the old
BIOS code to stop working.

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
