From: Bradley M Alexander <storm@tux.org>
Subject: Re: [linux-lvm] LVM fails at bootup
Message-ID: <20011112162310.A9389@sonsofthunder.yi.org>
References: <20011112153013.Q715@sonsofthunder.yi.org> <Pine.LNX.4.33.0111121541140.13347-100000@dragon.inside.ntisys.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0111121541140.13347-100000@dragon.inside.ntisys.com>
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
Date: Mon Nov 12 15:22:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 12, 2001 at 03:42:10PM -0500, Benjamin Scott wrote:
> On Mon, 12 Nov 2001, Bradley M Alexander wrote:
> >> Don't know about this - looks like hardware problems.
> >
> > I thought so too, but the fact that it only happens when I try to enable
> > LVM at bootup makes me think its not.  I had a Debian mirror on this
> > drive prior to this, and it never gave me errors, and if I boot without
> > LVM and enable it after boot by hand, I don't get these errors.
> 
>   Is there anything in your bootscripts which adjusts the IDE driver to use
> more conservative settings (usually via "hdparm")?

Not that I can find. The only call to hdparm in the startup files turns off
write caching on all of the IDE hard drives at shutdown, and thats in
S40umountfs...No other calls to hdparm that I can find.

-- 
--Brad
============================================================================
Bradley M. Alexander, CISSP              |   Co-Chairman,
Beowulf System Admin/Security Specialist |    NoVALUG/DCLUG Security SIG
Debian/GNU Linux Developer		 |   storm@debian.org
                                         |   storm@tux.org
============================================================================
It's lonely at the top, but you eat better.
