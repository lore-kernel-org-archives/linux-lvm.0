From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] libgcc_s.so.1 dependancy
Message-ID: <20030716072147.GC18961@percy.comedia.it>
References: <200307151853.56054.cousinmarc@free.fr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200307151853.56054.cousinmarc@free.fr>
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
Date: Wed Jul 16 02:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jul 15, 2003 at 06:53:55PM +0200, Marc Cousin wrote:
>Hi,
>I'm having trouble using LVM2 : lvm is linked with libgcc_c.so, which, of 
>course, is in a logical volume ...
>
>ldd tools/lvm
>        libdevmapper.so.1.00 => /lib/libdevmapper.so.1.00 (0x40029000)
>        libdl.so.2 => /lib/libdl.so.2 (0x40030000)
>        libc.so.6 => /lib/libc.so.6 (0x40033000)
>        libgcc_s.so.1 => 
>/usr/lib/gcc-lib/i686-pc-linux-gnu/3.2.3/libgcc_s.so.1 (0x40160000)
>        /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x40000000)
>
libgcc_s.so.1 really belogs to /lib go and fix your distro
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
