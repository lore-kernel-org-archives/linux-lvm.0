From: Daniel J Hannum <dhannum@andrew.cmu.edu>
Subject: Re: [linux-lvm] help: can't read name(s) of physical volumes (Debian
 kernel weirdness also involved)
In-Reply-To: <20021215160028.GA7519@tykepenguin.com>
Message-ID: <Pine.GSO.4.44L-027.0212151823290.10369-100000@unix3.andrew.cmu.edu>
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
Date: Sun Dec 15 17:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thanks a ton. Debian needs to make their documentation more clear. When
you install lvm, they say to either mount devfs (they don't say how) OR
install devfsd. Turns out, that should be AND. I had to send the kernel
param like you said. And it doesn't work without devfsd, either.

I'm not sure about this weird devfs thing... I guess it's the big new
thing so I better get used to it :)

Anyway, thanks.

dan

On Sun, 15 Dec 2002, Patrick Caulfield wrote:

> On Sat, Dec 14, 2002 at 08:53:21PM -0500, Daniel J Hannum wrote:
> > Hi. I feel dumb for subscribing to the list just so I can yell out my
> > problem and hopefully someone can help, but I'm at the end of my rope
> > here.
> >
> > Here's the situation. I just installed Debian 3.0 testing and I set it up
> > so that I was using their lvm10 package (version 1.0.4-6) for /usr, /var
> > /home, etc. (NOT /) It works fine off the kernel that Debian uses in its
> > install (2.4.18-bf2.4). BUT, if I install a stock Debian kernel with
> > apt-get (kernel-image-2.4.18-k7), lvm cannot see my physical volumes at
> > boot-time.
>
> The stock debian kernel has devfs compiled into it. :(
> So if you look in /proc/partitions it will show devfs device names
> rather than the "traditional" ones, although the devfs names are not
> actually avaiable to you. This confuses LVM.
>
> What you will need to do is to mount devfs at boot time (devfs=mount on
> the kernel command-line) on /dev and run devfsd (apt-get install devfsd) and
> things should work.
>
> --
>
> patrick
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
