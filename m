Return-Path: <h.jettingstad@wineasy.se>
Message-ID: <61DA682E8A5CD4119CD80050DA4E318BCAC39E@josef.wineasy.se>
From: =?iso-8859-1?Q?H=E5kan_Jettingstad?= <h.jettingstad@wineasy.se>
Date: Wed, 7 Feb 2001 10:41:25 +0100 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Re: with 2.4.1, should I use beta2 or beta3 lvm-tools?
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
Content-Type: text/plain; charset="iso-8859-1"
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hello!

When I try to apply the patch that LVM 0.9.1beta3 creates with:=20

./configure --with-kernel_dir=3D/usr/src/linux-2.4.1 creates, on my
/usr/src/linux-2.4.1 directory like this:

hostname:/usr/src/linux-2.4.1# cat
/usr/src/LVM/0.9.1_beta3/PATCHES/lvm-0.9.1_beta3-2.4.1.patch | patch =
-p1
patching file include/linux/lvm.h
patching file drivers/md/lvm.c
patching file drivers/md/lvm-snap.c
patching file drivers/md/Config.in
Reversed (or previously applied) patch detected!  Assume -R? [n]=20
Apply anyway? [n] n

I get the above error, should it apply cleanly or can I just ignore =
this and
answer y to apply anyway?

Thank you a lot in advance,

H=E5kan Jettingstad


-----Original Message-----
From: Joe Thornber [mailto:joe@66bassett.freeserve.co.uk]
Sent: den 2 februari 2001 11:31
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] with 2.4.1, should I use beta2 or beta3
lvm-tools?


On Fri, Feb 02, 2001 at 11:15:25AM +0100, H=E5kan Jettingstad wrote:
> Hello!
>=20
> Just a quick question, kernel 2.4.1 contains lvm 0.9.1beta2, so I'm
> wondering do I have to use the beta2 lvm-tools or can I use the beta3
> lvm-tools with that kernel, or do I have to wait for a beta3 patch =
for the
> 2.4.1 kernel?

Please use the latest code if you can.  The LVM tar balls will build a
patch for your kernel.  If you don't want to patch your kernel
yourself then use the latest tools with 2.4.1, but you should probably
refrain from using snapshots.  We hope to make another release at the
beginning of next week (probably beta4).

- Joe
_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
