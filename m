Return-Path: <harri@smilehouse.com>
Date: Sun, 17 Dec 2000 16:56:39 +0200 (EET)
From: Harri Haataja <harri@smilehouse.com>
Subject: Re: [linux-lvm] serializing fsck
In-Reply-To: <20001216161810.A1006@bar.nowhere>
Message-ID: <Pine.LNX.4.21.0012171655470.32257-100000@tolppa.kotisivupalvelu.fi>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, 16 Dec 2000 zoo1@corecomm.net wrote:

> it seems my fsck on bootup is having trouble figuring out on which
> physical devices various lvols reside, and so is starting up all the
> fsck's simultaneously. i'm working around this by fiddling with the fsck
> parameters in /etc/fstab, and i suspect that's probably the only really
> general solution (since striping would throw wrenches into the works
> anyway), but i'd like to know if i've overlooked some other possibility?

E2fsck seems to do that on any disk on me. I've ended up adjusting the
order in fstab by hand.
