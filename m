From: "Erick Calder" <e@arix.com>
Subject: RE: [linux-lvm] rh kernel patches
Date: Tue, 4 Sep 2001 13:14:26 -0700
Message-ID: <001b01c1357e$3228a340$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010904175605.40186.qmail@web13402.mail.yahoo.com>
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

Pierre,

I'd like to pass on some very useful advice I received from this list.

the LVM patches are made against Linus' kernel (which you can find at
kernel.org).  RedHat makes modifications to the kernel (to add device
drivers and god knows what else) and so the LVM patches may or may not work
against the RH-modified kernel, depending on whether RH modified some piece
that LVM patches.

The simplest thing to do is to just get the latest Linus kernel.  I
struggled with the RH 2.4.7 kernel until I decided it was not worth the time
and went and got the Linus kernel.  Make sure to get the LVM rc1 (at least)
since the 1.0 release had some problems with changes that Linus made.

I'm now happily running RH 7.0 with the 2.4.9 kernel.

- e

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of Pierre Lamb
Sent: Tuesday, September 04, 2001 10:56 AM
To: linux-lvm@sistina.com
Subject: [linux-lvm] rh kernel patches


Is there a correct way to patch RH kernels. I have
tried using the "final path" to update 2.4.7 rh kernel
but just get errors. Is there a work around for this
problem.
