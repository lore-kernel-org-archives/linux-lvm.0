From: George Karaolides <george.karaolides@planitis.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1049881311.8416.142.camel@ariel>
Mime-Version: 1.0
Subject: [linux-lvm] Swap on LVM - swapoff problem - more info
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
Date: Wed Apr  9 04:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, debian-user@lists.debian.org, patrick@debian.org

Re. the problem with swapoff returning "invalid argument" with LVM
devices on a Debian woody system, I now have some more info.

The problem is caused by running vgscan while swap is active on the LVM
device (not necessarily actually using swap space; just active).  If
after that a swapoff is attempted, swapoff returns "Invalid argument".

The lvm init script runs vgscan, and where LVM has already been
activated using initrd and an LVM swap device is already activated, this
breaks swapoff.

I modified the "start" case of the lvm init script to run swapoff before
running vgscan, and swapon after.  That solved the problem.  I don't
know if this will cause any other problems, but I don't think it will.

When swapping on LVM, swapoff must be run before running vgscan
manually, too, or swapoff will break again.

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
