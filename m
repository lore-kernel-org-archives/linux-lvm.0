From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] errors compiling on redhat 7.3
Message-ID: <20020528125712.GB21161@colombina.comedia.it>
References: <200205280843.AA111477202@mail.one.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200205280843.AA111477202@mail.one.it>
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
Date: Tue May 28 10:26:50 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@sistina.com

On Tue, May 28, 2002 at 08:43:55AM +0200, Pierluigi Godi wrote:
> gcc -c -pipe -g -O0 -Wall -DDEBUG -I../tools/lib -I../tools -I/opt/LVM/LVM/1.0.4/tools/lib -o e2fsadm.o e2fsadm.c
> In file included from ../tools/lib/liblvm.h:59,
>                  from ../tools/lvm_user.h:43,
>                  from e2fsadm.c:55:
> /usr/include/linux/autoconf.h:1:2: #error Invalid kernel header included in userspace

mkdir tools/lib/linux
vi tools/lib/linux
#define THIS_IS_A_DUMMY_AUTOCONF_H
:wq

	L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
