Return-Path: <james@fr.clara.net>
Date: Fri, 2 Feb 2001 17:09:27 +0100 (CET)
From: James <james@fr.clara.net>
Subject: Re: [linux-lvm] newbie question
In-Reply-To: <20010202094956.A28575@omnifarious.mn.org>
Message-ID: <Pine.LNX.4.21.0102021709090.355-100000@munster.noc.fr.clara.net>
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

This is a great help thanks :-)

On Fri, 2 Feb 2001, Eric M. Hopper wrote:

> On Fri, Feb 02, 2001 at 04:08:49PM +0100, JAmes wrote:
> > 
> > Another question I have is can anybody show me a good install plan, a
> > partition scheme for a machine where everything but the / is lvm'ed. I
> > haven't seen this discussed anywhere. At the moment I am just testing on a
> > box with a partition / a swap and a /home .
> > 
> > If I did a standard installation using say 5 partitions / /usr /var/ /home
> > swap, it would be a pain transferring this to an lvm system. So how do you
> > lot do it ? WHat sort of installation do you do?
> > 
> > my partitions at the moment
> > 
> >  Device Boot    Start       End    Blocks   Id  System
> > /dev/hda1   *         1       608   4883728+  83  Linux
> > /dev/hda2           609       627    152617+  82  Linux swap
> > /dev/hda3           628       749    979965   83  Linux
> > /dev/hda4           750      1601   6843690    5  Extended
> > /dev/hda5           750       871    979933+  8e  Linux LVM
> > /dev/hda6           872       993    979933+  8e  Linux LVM
> > /dev/hda7           994      1601   4883728+  8e  Linux LVM
> > 
> > Thanks again.
> 
> 	One thing I can say right now is that you _don't_ want more than
> one LVM partition on any given physical device.  Actually, it isn't that
> bad of a problem unless you try to use LVM to do striping.  Then LVM
> gets confused about what is and what isn't a seperate physical device.
> Striping across /dev/hda5 and /dev/hda6 in your partitioning scheme
> would be a performance disaster.
> 
> Here is my partitioning scheme:
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hda1             1      9859   4968904+   b  Win95 FAT32
> /dev/hda2         15457     59303  22098888   8e  Linux LVM
> /dev/hda4          9860     15456   2820888   83  Linux  (spare unused)
> 
> (That Win95 partition is actually completely unused, and left over from
> when I did used to run Win95.)
> 
> (The spare unsused partition is used for installing new versions of Linux
> from distributions that are neither LVM nor reiserfs aware.)
> 
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hdc1             1       102     51376+  83  Linux  (/boot)
> /dev/hdc2           103     59554  29963808    5  Extended
> /dev/hdc5         15708     59554  22098856+  8e  Linux LVM
> /dev/hdc6           103     14666   7340224+  83  Linux  (/)
> /dev/hdc7         14667     15707    524632+  82  Linux swap
> 
> 	Notice that there is only one LVM partition per device.  If I
> could do it again, I would put swap closer to the beginning of the
> device (right after /boot).  Hard-drives typically access data near
> their beginning faster.
> 
> Have fun (if at all possible),
> -- 
> The best we can hope for concerning the people at large is that they
> be properly armed.  -- Alexander Hamilton
> -- Eric Hopper (hopper@omnifarious.mn.org http://www.omnifarious.org/~hopper) --
> 
