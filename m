Date: Sun, 26 Aug 2001 09:21:23 -0400 (EDT)
From: <gerry@dorfam.ca>
Subject: RE: [linux-lvm] Successful Upgrade to 1.0 with RH 7.1
In-Reply-To: <002501c12de3$0ebcb9c0$0300000a@pacbell.net>
Message-ID: <Pine.LNX.4.33.0108260910540.1071-100000@leopard.dorfam.ca>
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

On Sat, 25 Aug 2001, Erick Calder wrote:

> > started with a clean Redhat 2.4.3-12 kernel
>
> I'm running a stock 7.0 version and downloaded the above-named kernel...
> patch and compilation went ok but I can't seem to make modules... I get a
> ton of errors... I realised that I needed to install the kernel-headers for
> this version but even after that I can't make the modules... I've seen a lot
> of other guys out there suffering with this but no solutions... I even tried
> changing the HOSTCC to "kgcc" in the Makefile but no dice.... so I'm
> wondering what you did right... can you share?
>
> (sorry everyone else that isn't running RH)
>
Well, all I did was follow the install instructions that came with the LVM
tarball to create the patch.  I didn't do anything special.  I wasn't able
to successfully install the newly created patch until I replaced the
kernel source with a fresh "clean" rpm.

Are you running the 2.4 kernel or are you using 2.2?  That makes a big
difference as you need to add the raw.io patch to the 2.2 kernel.  Also, I
don't believe that the shipped RH kernel config enables LVM as a default.

I still have the patch for 2.4.3-12.  However, I doubt it would work for a
7.0 install since I'm using 7.1.


Gerry
-- 
"The lyfe so short, the craft so long to learne"  Geoffrey Chaucer
