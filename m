Date: Tue, 31 Oct 2000 08:36:26 +0100
From: Luca Berra <bluca@comedia.it>
Subject: [linux-lvm] Re: more LVM 0.8 patches
Message-ID: <20001031083626.C12775@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <20001022162253.C24630@colombina.comedia.it> <200010231800.e9NI01U21435@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200010231800.e9NI01U21435@webber.adilger.net>; from adilger@turbolinux.com on Mon, Oct 23, 2000 at 12:00:01PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

On Mon, Oct 23, 2000 at 12:00:01PM -0600, Andreas Dilger wrote:
> If you are interested to do a bit of work, it would be good to take my 2.2
> lvm.h and add the few missing "#if kernel 2.2 use this, #else use that"
> checks and I will add it into my lvm.h so it can be used by everyone.

I will check into this eventually,
the problem is i don't work on linux full-time
so i hack into lvm whenever i have some spare time, or i am forced to do it.

> > I am still missing something on the vgchange front, the binary version i
> > saved before trashing my whole system this summer works, the one built from
> > these sources doesn't.
> 
> What sort of symptoms are you having (sorry if you already posted them)?

just does not work, at the moment i have a single vg, and the machine
boots from it, so it is very difficult to debug. I should put gdb into my
initrd :)

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
