Return-Path: <piete.brooks@cl.cam.ac.uk>
Subject: Re: [linux-lvm] Newbie question: ERROR "pv_move_pe(): PE lock"
In-reply-to: Your message of Sat, 17 Feb 2001 09:18:00 -0700.
             <200102171618.f1HGI0L12286@webber.adilger.net> 
Mime-Version: 1.0
Date: Sat, 17 Feb 2001 16:42:46 +0000
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E14UARa-00078r-00@whittlesey.cl.cam.ac.uk>
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
Cc: Piete.Brooks@cl.cam.ac.uk

> In any case, try the below patch, and it should fix this problem.

# pvmove /dev/md7
pvmove -- moving physical extents in active volume group "vg01"
pvmove -- WARNING: moving of active logical volumes may cause data loss!
pvmove -- do you want to continue? [y/n] y
pvmove -- doing automatic backup of volume group "vg01"
pvmove -- 76 extents of physical volume "/dev/md7" successfully moved

#

Many thanks -- seems to work a treat !
