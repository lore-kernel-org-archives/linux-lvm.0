From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] booting a dm+lvm2 kernel
Message-ID: <20040102180547.GG26275@percy.comedia.it>
References: <OF2BAA1563.F6E03716-ON00256E0F.005FE18B-00256E0F.005FE196@svunta.os.is>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF2BAA1563.F6E03716-ON00256E0F.005FE18B-00256E0F.005FE196@svunta.os.is>
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
Date: Fri Jan  2 12:07:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 02, 2004 at 05:27:16PM +0000, Kjartan Reynir Hauksson wrote:
>mknod: relocation error: mknod: symbol gnu_dev_makedev, version GLIBC_2.3.3
>not defined in file lib
>c.so.6 with link time reference

reinstall coreutils-5.0-6.1.92mdk
software on my home page is usually for the development version of
mandrake and does not work with mandrake 9.2 (with the exception of the
stuff in the lvm2 subdirectory, which i try to backport to 9.2)

L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
