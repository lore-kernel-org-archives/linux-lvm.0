From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] boot problems with lvm
Message-ID: <20020624225934.C20183@zealot.blacknet.de>
References: <000a01c21c09$b8991a00$020aa8c0@bart>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000a01c21c09$b8991a00$020aa8c0@bart>; from flo@geeksrus.de on Mon, Jun 24, 2002 at 10:32:38PM -0700
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
Date: Mon Jun 24 15:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jun 24 '02 at 22:32, geeksrus wrote:
> vscan -- LVM driver/module not load?
> 
> and so on. I've the kernel 2.4.18 with the lvm 0.9_beta08 version.
first of all you should get a more recent lvm patch (from sistina.com)
than you must load the module (or compile it into the kernel). it's
there if you have /proc/lvm/global. you might want to lsmod to look if
it's loaded, if not try insmod lvm-module.

Cu,
    Goetz.
