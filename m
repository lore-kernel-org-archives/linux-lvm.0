Return-Path: <toon@vdpas.hobby.nl>
Date: Sun, 12 Aug 2001 22:21:26 +0200
From: toon@vdpas.hobby.nl
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010812222126.A2247@vdpas.hobby.nl>
References: <20010811235718.A20414@linux.com> <20010812135402.A452@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010812135402.A452@dardhal.mired.net>; from jdomingo@internautas.org on Sun, Aug 12, 2001 at 01:54:02PM +0000
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Sun, Aug 12, 2001 at 01:54:02PM +0000, Jos� Luis Domingo L�pez wrote:
> On Saturday, 11 August 2001, at 23:57:18 -0400, Jason Tackaberry wrote:
> 
> > [...]
> > I am curious if it's a silly idea to write an application that relies on
> > the data in /proc?  Do the kernel developers attempt to keep the data
> > and format provided in /proc as stable as possible?  Or is it fair game
> > for trivial changes that could break applications that parse it?  Should
> > I use ioctl instead?
> > 
> As far as I know, there are plans to remove much of the thingss that
> currently appear under /proc. It seems that only information about
> processes currently running will remain under /proc.
> 
> Kernel parameters, system information, kernel variables and kernel
> tunables will probably disappear and will be replaced by some sort of
> user-space application that will allow query and modfication of kernel
> values and tunables. Something similar to Solaris' ndd, AFAIK.

Are you sure about the /proc filesystem disappearing?
Linus Torvalds likes it much more than ioctl's, as far as I know.
Besides, the story about the user-space application doesn't sound
very realistically to me.

I advise you to ask the question about the future of the /proc
filesystem on the linux-kernel mailing list.

Regards,
Toon.
