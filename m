Message-Id: <3CC8EDEC.40ECECAC@mc-lindinger.de>
From: Markus Bartl <m.bartl@mc-lindinger.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Segmetation fault (core dumped)
References: <1019761975.3860.39.camel@c213-100-153-47.swipnet.se>
Content-Transfer-Encoding: 7bit
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
Date: Fri Apr 26 01:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Fredrik Nordstrand wrote:
> 
> Hi I'v run in to a problem, I tryed to install LVM-1.0.3 on a RedHat
> 7.0  system with the 2.2.16 kernel, I pathced the kernel but I didn't
> get the option  "Multi-device support" in the setup. So I dnl'd the
> latest stable at the time 2.4.18 patched and compiled it with the option
> activated. Installed LVM again, but when I tryed to do ./vgscan,
> pvcreate or vgcreate I get "Segmetation fault (core dumped)"
> 
> Has anyone else experienced this?? Or know how to fix it?
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
Hi.
Did you try to compile the LVM-tools on your machine?
Greetings, Markus
-- 
MC-Lindinger GmbH
Markus Bartl
Wiesenweg 1
D-94099 Ruhstorf
