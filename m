From: Daniel J Hannum <dhannum@andrew.cmu.edu>
Message-ID: <Pine.GSO.4.44L-027.0212142036200.10732-100000@unix3.andrew.cmu.edu>
MIME-Version: 1.0
Subject: [linux-lvm] help: can't read name(s) of physical volumes (Debian kernel weirdness
 also involved)
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
Date: Sat Dec 14 19:53:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi. I feel dumb for subscribing to the list just so I can yell out my
problem and hopefully someone can help, but I'm at the end of my rope
here.

Here's the situation. I just installed Debian 3.0 testing and I set it up
so that I was using their lvm10 package (version 1.0.4-6) for /usr, /var
/home, etc. (NOT /) It works fine off the kernel that Debian uses in its
install (2.4.18-bf2.4). BUT, if I install a stock Debian kernel with
apt-get (kernel-image-2.4.18-k7), lvm cannot see my physical volumes at
boot-time.

vgscan works fine, it detects my volume group 'main'

but vgchange does this:

vgchange -- ERROR: can't get name(s) of physical volumes
vgchange -- please check, if /proc is mounted

Now, since it works with one kernel but not with the other, well, it must
that there's something wrong with the stock Debian kernel. Except that
this same kernel booted this volume group multiple times before. So the
problem is something aside from the kernel itself.

There is a message that Debian's lvm10 package gives you when you install
it. Apparently, IF you have devfs in the kernel (and the broken kernel
does) then devfs must be mounted (which I think it is... /dev/.devfs
exists) OR devfsd must be installed (which I also did, to be safe). If you
don't do this, the stock kernels won't read the lvm physical volumes.
Sounds familiar, no? But I think I did what the package script told me to
do, and it still can't find them.

Now, I'm no newbie, and so if I only knew what that error message meant,
maybe I could fix it. The /dev/main/* devices exist, but I can't mount
them. /proc/lvm exists, but /proc/lvm/VGs doesn't contain my VG's. What
would cause lvm to see my volume group and set up the devices right
(according to the names of the lv's), but not be able to find the physical
volumes.

I know this came up before on the list (like 18 months ago), but the
thread wasn't helpful.

I would be grateful for any assistance. I can post diagnostic info, if you
tell me what to type :)

thanks

dan
