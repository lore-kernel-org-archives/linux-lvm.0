Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104251626.f3PGQf2M031290@webber.adilger.int>
Subject: Re: [linux-lvm] Problem with UUID, vgscan, vgcfgrestore
In-Reply-To: <3AE6D919.1B3F4A3@in.tum.de> "from David Vidal Rodriguez at Apr
 25, 2001 04:03:05 pm"
Date: Wed, 25 Apr 2001 10:26:41 -0600 (MDT)
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

David Vidal writes:
> I'll send them tomorrow. You say that there are problems with VGs created
> with <beta4. My kernel is has beta2-lvm, and because of compiling errors
> in the newer beta6+-versions, I couldn't update the driver (tools are
> actually working). Is there a way to [sozusagen] update the on-disc
> structures in order to avoid conflicts with the new tools?

It doesn't matter what version the kernel code is, as long as the tools
are newer than beta2 you are OK.  If the on-disk UUIDs are bad, then
all you need to do is some sort of simple change (add a 1 PE LV and
remove it), and the on-disk VGDA should be re-written with the correct
UUIDs.

You can check the on-disk UUIDs with "pvdata -U" for each PV.  They
should all match.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
