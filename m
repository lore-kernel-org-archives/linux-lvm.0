Return-Path: <dice@mfa.kfki.hu>
Date: Thu, 8 Feb 2001 19:16:27 +0100 (CET)
From: Gergely Tamas <dice@mfa.kfki.hu>
Subject: Re: [linux-lvm] debianized lvm 0.9.1b3 package
In-Reply-To: <20010208110044.C5273@wookimus.net>
Message-ID: <Pine.LNX.4.32.0102081909470.16584-100000@falka.mfa.kfki.hu>
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
To: "Chad C. Walstrom" <chewie@wookimus.net>
Cc: linux-lvm@sistina.com

Hi!

> > Hi!
> >
> > I've debianized the lvm 0.9.1b3 sources based on your 0.9 packages.
> >
> > http://dice.mfa.kfki.hu/download/lvm/
>
> There's been a lot of work going on this lately.  You should really
> try to download Tom Lees' <tom@debian.org> packages[1] and upgrade
> from there.  AJ's packages install the binaries and libraries under
> the /usr directories, which is a Bad Thing(TM).
Yes, I know. I was an active poster too, to this thread. :)
As I wrote, this packages are >>based<< uppon AJ's packages. Maybe I
didn't emphasize it too much, that my packages are a bit modified (both,
in init.d script and in file locations).

I use my packages on a server wich has /usr on an lvm, as you pointed.
They work well.

But thanks for mention this. I will have a look@Tom's packages too.

Thanks,
Gergely
