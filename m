Return-Path: <e@arix.com>
From: "Erick Calder" <e@arix.com>
Subject: RE: [linux-lvm] RedHat 7.0?
Date: Wed, 4 Jul 2001 17:32:32 -0700
Message-ID: <003601c104e9$fb47c3c0$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010702142939.A14730@omnifarious.org>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I recently read that applying the LVM patches to the RH kernel doesn't
work... so I downloaded Linus' kernel (2.2.19) and seem unable to patch it
on account of not having a rawid patch available... I've looked in the
directory specified in the HOWTO but there is no patch for 2.2.19... when I
type "make" in the PATCHES directory I get:

You haven't applied the rawio patch, please see the README
make: *** [check_rawio] Error 1

can anyone suggest what I need to do?

1k thx - e r i c k

-----Original Message-----
From:	linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of Eric M. Hopper
Sent:	Monday, July 02, 2001 12:30 PM
To:	linux-lvm@sistina.com
Subject:	Re: [linux-lvm] RedHat 7.0?

On Mon, Jul 02, 2001 at 12:15:06PM -0700, Erick Calder wrote:
> I've searched through the archives but have not found anyone else
> using Redhat 7.0 (Guiness) with LVM.  I've found a thread about 7.1
> (Seawolf) but that uses the 2.4.2 kernel and I'm running the 2.2.19
> kernel.
>
> I found the RPMs on the site but they are for 6.2 (Zoot)... does
> anyone know whether I can use the 6.2 RPMs on 7.0?  if not, are there
> RPMs for 7.0 that I could use?
>
> alternatively, has anyone compiled from the tarball and successfully
> used LVM on my platform?

	I'm using RH Linux 7.0.  I got it compiled into the kernel,
though it was a bit of a chore as I recall.  I had to disable the
software RAID subsystem completely to make it work.

	When the 2.4 kernel came out, I eventually switched to it, and
just compiled a raw kernel, not an RH patched one.  It worked fine, and
I'm still running it.

Have fun (if at all possible),
--
"It does me no injury for my neighbor to say there are twenty gods or no
God.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org
 http://www.omnifarious.org/~hopper) --
