Return-Path: <dg@suse.com>
Date: Sat, 3 Feb 2001 20:29:36 -0800
From: David Gould <dg@suse.com>
Subject: Re: [linux-lvm] newbie question
Message-ID: <20010203202936.C5820@archimedes.oak.suse.com>
References: <Pine.LNX.4.21.0102012054480.1092-100000@munster.noc.fr.clara.net> <20010202094956.A28575@omnifarious.mn.org>
Mime-Version: 1.0
In-Reply-To: <20010202094956.A28575@omnifarious.mn.org>; from hopper@omnifarious.mn.org on Fri, Feb 02, 2001 at 09:49:56AM -0600
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

On Fri, Feb 02, 2001 at 09:49:56AM -0600, Eric M. Hopper wrote:
... 
> Here is my partitioning scheme:
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hda1             1      9859   4968904+   b  Win95 FAT32
> /dev/hda2         15457     59303  22098888   8e  Linux LVM
> /dev/hda4          9860     15456   2820888   83  Linux  (spare unused)
> 
> (That Win95 partition is actually completely unused, and left over from
> when I did used to run Win95.)

Well, it would make a fine swap partition ;-)

-dg
 
-- 
David Gould                                                 dg@suse.com
SuSE, Inc.,  580 2cd St. #210,  Oakland, CA 94607          510.628.3380
You left them alone in a room with a penguin?!  Mr Gates, your men are
already dead.
