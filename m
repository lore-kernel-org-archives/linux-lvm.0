From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] tools in the distros?
Message-ID: <20011205200737.B2145@dardhal.mired.net>
References: <200112051559.fB5Fxbn05258@lewis.abi.tconline.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200112051559.fB5Fxbn05258@lewis.abi.tconline.net>
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
Date: Wed Dec  5 13:06:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Wednesday, 05 December 2001, at 09:59:37 -0600,
Lewis Bergman wrote:

> Is there any effort to get the distro's to incorporate the tools available 
> for the kernel they are releasing? Now that LVM has been standard in the 
> kernel for a while are any of them looking at including it? Just curious.
> 
Don't remember about Debian, but as far as I remember, at least Potato
(kernel 2.2.1x) doesn't have kernel support for LVM at installation time.

On the other hand, it seems that Mandrake has full support for Linux LVM
at installation time, at least from and including 8.0 (maybe also 7.2).
On versions with such support, the screen where you can make traditional
partitions lets you configure whatever LVM setup you want, except LV for
the root filesystem. Additionally, MDK gives give the possibility of
setting up soft RAID and whatever filesystem supported under Linux you
could think of :).

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian Linux Woody (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
