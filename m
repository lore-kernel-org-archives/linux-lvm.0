Subject: Re: [linux-lvm] Swap on LVM - swapoff problem
From: George Karaolides <george.karaolides@planitis.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1049724626.3743.30.camel@ariel>
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
Date: Mon Apr  7 09:10:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi Patrick,

> Actually, I'm more interested in the kernel LVM version. The tools 
> have no impact on how swappping works. Sorry I should have said. The 
> first line of /proc/lvm/global should tell you that.

2.4.18 machines:

# cat /proc/lvm/global
LVM module LVM version 1.0.1-rc4(ish)(03/10/2001)

2.4.20 machines:

# cat /proc/lvm/global
LVM module LVM version 1.0.5+(22/07/2002)

> You should check that that when you do swapoff that the
> device actually exists: and that the major/minor matches that of the 
> device when it was swapped on. I think /proc/swaps should tell you
> this.

I can't see anything about device major/minor nos. in /proc/swaps:

# cat /proc/swaps
Filename                        Type            Size    Used    Priority
/dev/vg1/swap                   partition       1048568 0       -1

Of course I can see the major/minor nos. if I list the device:

# ls -l /dev/vg1/swap
brw-rw----    1 root     disk      58,   1 Apr  5 22:28 /dev/vg1/swap

So now I need to check if these are the same as when the device was
swapped on.  But no info in /proc/swaps...

-- 
Best regards,

|   George Karaolides                      Planitis Communications Ltd.,
|
|   tel:   +357 22 45 65 00              Office 102, 11 Florinis Street,
|
|   web:   www.planitis.net                             Nicosia CY 1065,
|
|   email: george.karaolides@planitis.net           Republic  of Cyprus.
|
