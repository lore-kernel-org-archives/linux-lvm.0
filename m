Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] LILO configuration for LVM "boot" filesystem
Date: Fri, 8 Jun 2001 10:38:40 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJGECEIPAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010608102936.A9167@mail.wave.co.nz>
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
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Mark van Walraven
> 
> On Thu, Jun 07, 2001 at 10:43:02AM -0500, Jack McKinney wrote:
> > cd / ; mv tmp tmp.old ; ln -s /var/tmp .
> > reboot
> > rm -rf /tmp.old
> > 
> >     Now you don't have to worry about root filling up at all...
> 
> /tmp is commonly emptied on boot, unlike /var/tmp.  Vi, for example,
> stores it's recovery files in /var/tmp.
> 
> I prefer a separate partition for /tmp, to reduce the need to write to
> the root fs and thereby lower the risk of damage to it in a crash.

Yeah, I've been wondering about this whole discussion since
I thought it was "the done thing" to have /var and /tmp
on their own partitions (for precisely that reason).
I've been doing it that way since 1994 (when I moved up from
having my Linux on a 120 meg hard drive...)
