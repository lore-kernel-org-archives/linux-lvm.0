Date: Mon, 15 Oct 2001 10:52:30 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Tools compile problem, 1.0.1-rc4 on RH6.2 w/kernel 2.4.12
Message-ID: <20011015105230.C609@tykepenguin.com>
References: <m3d73rino6.fsf@tigger.plaindog.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m3d73rino6.fsf@tigger.plaindog.no>; from warnckew@online.no on Sat, Oct 13, 2001 at 05:07:21PM +0200
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

On Sat, Oct 13, 2001 at 05:07:21PM +0200, Morten Wang wrote:
> Greetings all,
> 
> gcc -c -pipe -g -O2 -Wall -pg -DDEBUG -I../tools/lib -I../tools -I/usr/local/src/LVM/1.0.1-rc4/tools/lib -o e2fsadm.o e2fsadm.c
> In file included from ../tools/lvm_user.h:41,
>                  from e2fsadm.c:53:
> ../tools/lib/liblvm.h:81: malloc.h: Device not configured
> In file included from e2fsadm.c:53:
> ../tools/lvm_user.h:48: malloc.h: Device not configured

That's a wierd error. I doubt it's directly related to LVM, it looks to me like 
the files in /usr/include are not available for some reason. It might be
something odd like just not having the development packages installed or it
could be something much stranger.

See what /usr/include looks like, it may be a symlink to somewhere else or it
may contain symlinks to other files that cannot be resolved.

It might be worth seeing if you can compile anything else - I would doubt it
looking at that error.

patrick
