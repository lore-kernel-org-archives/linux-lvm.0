Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102072245.f17Mjqk25883@webber.adilger.net>
Subject: Re: [linux-lvm] Weird corruption of volume group configuration with
 LVM.
In-Reply-To: <Pine.LNX.4.20.0102072051410.604-100000@menswerk.cyclone.se> from
 Hans Engren at "Feb 7, 2001 09:01:26 pm"
Date: Wed, 7 Feb 2001 15:45:52 -0700 (MST)
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

Hans Engren writes:
> Doing a vgscan locates no volume groups what so ever.
> After doing a `vgcfgrestore -f /etc/lvmconf/mw1.conf -n mw1 /dev/<DISK>`,
> I am able to do a `vgchange -a y`, and actually mount /dev/mw1/ftpd.

I posted a patch to lvm-devel mailing list yesterday which will likely
fix this.  It will require another vgcfgrestore to be run.

> I hope you see what my problem is, otherwise, tell me what output that
> would be needed, and I'll provide it.

Try pvdata -U on your PVs and see if any of the UUIDs are missing.  If
this is the case, either use my patch, or you could also comment out
the lines in "pv_read_all_pv_of_vg" which check UUIDs.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
