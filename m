From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Error extending an lv
Message-ID: <20020916125745.A17122@sistina.com>
References: <20020823224424.GB6812@kluge.net> <Pine.LNX.4.31.0209142054090.4852-100000@kern.srcf.societies.cam.ac.uk>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.31.0209142054090.4852-100000@kern.srcf.societies.cam.ac.uk>; from mjj29@cam.ac.uk on Sat, Sep 14, 2002 at 08:59:07PM +0100
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
Date: Mon Sep 16 05:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Sep 14, 2002 at 08:59:07PM +0100, Matthew Johnson wrote:
> Hi, I've just had to resize one of the lv's on my lvm system (debian
> woody), so I ran lvextend -L +5G /dev/lvm1/music, then ran
> resize_reiserfs /dev/lvm1/music - and continued copying stuff on. This
> was done with the vg active, but I had to unmount the partition to
> resize the reiserfs (my mount is screwed up - I'm going to reinstall the
> system anyway in a couple of weeks, I'm just booting it in single user
> mode atm to put some data somewhere temporarily).
> 
> Anyway, when I next booted and ran vgchange -ay, I get the message
> "physical volume /dev/hde8 inconsistant", and the partition won't mount.
> 
> Any ideas?

Matthew,

so /dev/hde8 belonged to your VG "lvm1", was empty before (no extents allocated)
and extending /dev/lvm1/music changed that?
What does "vgck lvm1" tell you?

Before you change anything, make sure that you have backups of all files
in /etc/lvmconf/ !!!

> 
> (that pv might only now have data on it, but it created fine with the
> pvcreate command earlier)
> 
> Matt.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
