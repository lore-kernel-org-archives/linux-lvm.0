Subject: Re: [linux-lvm] Can someone _please_ tell me whats going on?
From: Bradley Alexander <storm@tux.org>
In-Reply-To: <1008560587.831.6.camel@defiant>
References: <Pine.LNX.4.33.0112170410450.12782-100000@www.scotty.co.at> 
	<1008560587.831.6.camel@defiant>
Content-Transfer-Encoding: 7bit
Message-Id: <1008573872.790.10.camel@defiant>
Mime-Version: 1.0
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
Date: Mon Dec 17 01:22:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sun, 2001-12-16 at 22:43, Bradley Alexander wrote:
> 
> Its a standard IDE cable. I have a 40-pin/40-wire cable and a
> 40-pin/80-wire (I'm assuming this is an ATA66/100 cable). Originally, i
> had both drives on the ATA cable, but since I split them to different
> channels, I had to use a standard IDE cable on the second channel.
> However, I was getting the same errors when both were on the ATA cable
> as well.

I have noticed a couple more symptoms I thought I would forward.

1. The drive light stays illuminated when the machine is up, whether the
lv is mounted or not. Could this also be an indication of what killed
the first drive?

2. Doing normal actions on the volume group, in this case, vg01, causes
a segmentation fault. This includes vgchange, doing an fdisk on the
drive or anything else.

Anyone have any pointers?

thanks,
-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm [at] debian.org
                                         |   storm [at] tux.org
============================================================================
Ever notice when you blow in a dog's face he gets mad at you, but
when you take him in a car he sticks his head out the window?
						--George Carlin
