From: "Dale Gallagher" <foobar@mighty.co.za>
Subject: Re: [linux-lvm] Compile problem - Linux 2.6.1 + LVM2.2.00.08
Message-ID: <web-210831654@mail01.infosat.net>
In-Reply-To: <20040119115243.GD5542@percy.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Mon Jan 19 09:33:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> compile and install device mapper first

Tried that earlier and it failed too - after reading the
docs, wasn't certain if I had to do this, since 2.6.x has
device-mapper in the kernel....

Anyway, everything succeeded now - the problem was with my
kernel-headers.  I'd been a twit and symlinked
/usr/include/linux to
/usr/src/linux-2.6.1/usr/include/linux and found Linus'
post regarding this, before rectifying my mistake:

http://www.ussg.iu.edu/hypermail/linux/kernel/0007.3/0587.html

So I removed my symlink madness and re-installed the
original kernel-headers package as per my original post and
then successfully installed both device-mapper and LVM!

Thanks
Dale
