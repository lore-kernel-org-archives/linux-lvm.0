Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101130140.f0D1eRr19821@webber.adilger.net>
Subject: Re: [linux-lvm] LVM v0.9 on 2.4.0 kernel: raid5syncd halt
In-Reply-To: <B14BF8753E65D211ABCA00104B301EF501BD7B1E@cairn-gorm.cragtech.com>
 "from Scott Smyth at Jan 12, 2001 04:05:55 pm"
Date: Fri, 12 Jan 2001 18:40:27 -0700 (MST)
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Scott, you write:
> The 2.4.0 kernel (patched with XFS and the appropriate
> LVM patches from the 0.9-patches tree) produces a stop
> of any resync when issuing lvcreate (i.e., lvcreate
> -L 500M -n vol volgr0).

When you are talking about resync, is this the rebuilding of a RAID
array?  While I don't know much about how the RAID code works, there
doesn't appear to be anything in lvm_do_lv_create() which would do
anything bad.  It may be that elsewhere in lvcreate it calls something
to confuse/halt the RAID code (i.e. fsync_dev(), invalidate_buffers(),
etc).  Is there any way you can put debugging into the RAID resync code
to see why it stopped?

How often does a RAID resync happen?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
