Date: Sat, 8 May 1999 23:03:05 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: A question about LVM 0.6 kernel patch.
Message-ID: <19990508230305.A26812@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <772717755DF.AAA4EE4@mismail.micron.net> <199905081805.AA10214@mailgate1b.telekom.de>
Mime-Version: 1.0
In-Reply-To: <199905081805.AA10214@mailgate1b.telekom.de>; from Heinz Mauelshagen on Sat, May 08, 1999 at 08:02:48PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Sat, May 08, 1999 at 08:02:48PM +0000, Heinz Mauelshagen wrote:
> > I downloaded all the bits from your site and attempted to get things going
> > but I am unable to get the patch be fully successful.  It keeps
> > saying stuff like hunk #4 failed at xxx etc.  And then it asks if I want to
> > apply the patch anyway.  I have kernel 2.2.5 (RedHat 6.0) and I see that
> > the latest patch you have is 2.2.2...but I was under the impression that
> > this was just for 2.2.x kernels.  Perhaps I am mistaken and, in fact, there
> > is no way to use the LVM stuff with kernel 2.2.5?
> > 
> 
> Astonished about that, because patching the stock 2.2.5 kernel works here.
> 
unluckily the kernel shipped with the redhat distribution is not a stock
kernel but a (heavily) patched one, start with a clean kernel

L.

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.
