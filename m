Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102121955.f1CJt0208596@webber.adilger.net>
Subject: Re: [linux-lvm] lv nodes in /dev ??
In-Reply-To: <20010212114306.8793.qmail@web10901.mail.yahoo.com> from "Mr. Penguin"
 at "Feb 12, 2001 03:43:06 am"
Date: Mon, 12 Feb 2001 12:55:00 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

James (Mr. Penguin) writes:
> Just noticed that all my LVs have nodes not only in
> /dev/vg00/ but also /dev !
> 
> So I have /dev/vg00/lvol1 and also /dev/lvol1 with the
> same major and minor numbers. I don't like to think
> what will happen if I create a new VG called vg01 also
> with an lvol1...
> 
> This seems to be occuring in beta3 and beta4. I'm
> using 2.4.1 / reiserfs (root on LVM)
> 
> Forgot to mention - I am using devfs

Yes, this is a bug.  I fixed it in my local patches, which I will submit
to the list today.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
