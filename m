Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] success!
Date: Thu, 26 Jul 2001 08:32:14 -0400
References: <Pine.LNX.4.33.0107261218290.1277-100000@greebo.foobarhouse.com>
In-Reply-To: <Pine.LNX.4.33.0107261218290.1277-100000@greebo.foobarhouse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010726123215.5AAFC17B28@oscar.casa.dyndns.org>
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
To: linux-lvm@sistina.com, James Pattinson <jamesp@foobarhouse.com>

On July 26, 2001 07:23 am, James Pattinson wrote:
> I've just upgraded my LVM-on-root system from beta7 to beta8 succesfuly. I
> only had two problems:
>
> 1.	The lvmcreate_initrd script failed when it tried to mount the
> image in /tmp as a loopback device. The error was ioctl: LOOP_SET_FD:
> Invalid argument. I believe this is due to my /tmp filesystem being tmpfs
> and could be a kernel bug. It worked OK when I used /root instead of /tmp.

I reported this to the tmpfs maintainer a while back.  Turns out that supporting
loop mounts on tmpfs is not easy.  From the messages exchanged between the Linus
and the maintainer I sort of doubt a fix will be forthcoming soon.  

Would it be possible to check for a tmpfs on /tmp and change 

DEVRAM=/tmp/initrd.$$
to 
DEVRAM=/var/initrd.$$

when encountered?

TIA,

Ed Tomlinson
