Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101231647.f0NGlrO30882@webber.adilger.net>
Subject: Re: [linux-lvm] New dumb question
In-Reply-To: <20010123155349.F556@tykepenguin.com> "from Patrick Caulfield at
 Jan 23, 2001 03:53:50 pm"
Date: Tue, 23 Jan 2001 09:47:53 -0700 (MST)
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

Benoit SERRA wrote:
> I build it into the kernel with the 2940 driver, reiserfs and the
> software raid (I don't like to have critical drivers as modules)
> 
> Stripped LV and NonStripped LVs reported the same bonnie++ result. Is it
> normal ?

It would be a help to LVM users if you could do some simple performance
testing with different LVM stipe sizes.  With larger stripe sizes (64kB
or so) you will likely get better sequential read/write performance, but I
don't think the stripe size will affect random read/write performance.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
