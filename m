From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Problems mounting LVM volume as root
Message-Id: <20020226173337.GF20233@colombina.comedia.it>
References: <wxxzo1yecqu.fsf@nommo.uio.no>
    <5.0.0.25.2.20020225083201.00b36cf0@frodriguez.mail.wesleyan.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5.0.0.25.2.20020225083201.00b36cf0@frodriguez.mail.wesleyan.edu>
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
Date: Tue Feb 26 11:33:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 25, 2002 at 08:39:20AM -0500, Felix Rodriguez wrote:
> fine /lib/modules/2.4.17lvm/net/unix.o module. I think it's because the 
put Unix domain sockets (CONFIG_UNIX)
statically in the kernel, if you need it (ie it is not an embedded
system) you just need it so it is nonsense to build as a module

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
