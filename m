Return-Path: <riel@conectiva.com.br>
Date: Tue, 13 Mar 2001 23:17:23 -0300 (BRST)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
In-Reply-To: <20010313232626.A31056@cistron.nl>
Message-ID: <Pine.LNX.4.21.0103132316220.2056-100000@imladris.rielhome.conectiva>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 13 Mar 2001, Wichert Akkerman wrote:
> Previously Andreas Dilger wrote:
> > Wichert writes:
> > > I figured that out by now. I think I'll add the LVM10 ioctls to 
> > > strace 4.4 actually :)
> > 
> > That would be nice.
> 
> Turns out this is impossible: LVM made the same mistake some of the
> OSS sound drivers did and used ioctl numbers that the kernel already
> uses for other purposes. This is not a problem for the kernel itself,
> but means a tool like strace can't decode syscalls.

Good thing this can be fixed with IOP-11 in 2.5 ;)

(at least, I can't really see a large base of user
programs becoming dependant on the LVM ABI...)

regards,

Rik
--
Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com.br/
