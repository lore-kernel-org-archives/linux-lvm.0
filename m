Return-Path: <holbe@rz.tu-ilmenau.de>
Date: Thu, 7 Jun 2001 18:39:58 +0200
From: "Mario 'BitKoenig' Holbe" <Mario.Holbe@rz.tu-ilmenau.de>
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Message-ID: <20010607183958.D440@rz.tu-ilmenau.de>
References: <20010605210727.C1870@pc.ilinx> <3B1F9E1C.1984FAF8@wrkhors.com> <20010607104301.A29848@stocks.pillory.com> <20010607182636.H3232@jensbenecke.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010607182636.H3232@jensbenecke.de>
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

On Thu, Jun 07, 2001 at 06:26:36PM +0200, Jens Benecke wrote:
> On Thu, Jun 07, 2001 at 10:43:02AM -0500, Jack McKinney wrote:
> > Big Brother tells me that Steven Lembark wrote:
> > > Use separate mount points for /var, /usr & /home.  This keeps root down
> > cd / ; mv tmp tmp.old ; ln -s /var/tmp .  reboot rm -rf /tmp.old

Windows user, eh? :)

> er... I wouldn't do that (at least not on a Debian system). 
> Usually /var/tmp is _assumed_ to be only root-writeable, so all sorts of

At least on a Debian system, /var/tmp is 1777 - just like /tmp.

But this 'solution' can cause some other problems in the boot
stage - /var isn't mounted there already, but maybe something
tries to write tmp files.

So - better create a /tmp filesystem as well - this doesnt harm,
because the /tmp mount point is a directory where processes can
write to, even when there's nothing mounted on.


regards,
-- 
Mario 'BitKoenig' Holbe <Mario.Holbe@RZ.TU-Ilmenau.DE>

So long and thanks for all the books.
