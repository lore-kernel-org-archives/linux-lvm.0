Return-Path: <dave@galilean.d2g.com>
Date: Sun, 18 Mar 2001 12:56:00 +0100
From: Dave Wapstra <dave@xs4all.nl>
Message-ID: <20010318125600.A24084@mercury.mercury.multiweb.nl>
Mime-Version: 1.0
Subject: [linux-lvm] Kernel 2.4.x with LVM beta 6 on Sun E450?
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

Hello all,

I am trying to setup a Sun E450 with Linux kernel 2.4.x and LVM beta 6,
but there are a number of difficulties.

With kernel 2.4.2 "make menuconfig" doesn't work.  No problem,
now I'm using v2.4.3-pre3 and this is running fine.

LVM 0.9.1 beta 6 patches cleanly agains -pre3.  So far so good.

The problem is that I'm trying to apply Patrick Caulfield's ioctl32.c
patch, which doesn't apply cleanly to -pre3 (at least on my box).
Applying the patch by hand results in a failed compile.

This might be caused by the fact that I pulled the patch of the web,
since I wasn't subscribed to linux-lvm at the time.


Any success stories on Ultrasparc with 2.4.x and LVM are welcome...


-Dave

-- 
Dave Wapstra
dave@xs4all.nl
