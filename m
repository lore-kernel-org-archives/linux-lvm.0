Return-Path: <russell@coker.com.au>
From: Russell Coker <russell@coker.com.au>
Subject: Re: [linux-lvm] Debian packaging
Date: Fri, 15 Dec 2000 07:51:10 +0100
References: <0012132115222N.00826@lyta> <20001214104641.A15193@sistina.com>
In-Reply-To: <20001214104641.A15193@sistina.com>
MIME-Version: 1.0
Message-Id: <0012150751103E.00826@lyta>
Content-Transfer-Encoding: quoted-printable
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
To: linux-lvm@sistina.com, lewis@sistina.com
Cc: tal26@cam.ac.uk

On 2000-12-14 17:46, lewis@sistina.com wrote:
>>On Wed, Dec 13, 2000 at 09:15:22PM +0100, Russell Coker wrote:
>> I plan to take over the Debian package of lvm because the current
>> maintainer hasn't fixed serious bugs for quite a while.
>
>A couple of questions.  Have you tried contacting Tom Lees
> <tal26@cam.ac.uk>?  I have talked to him and he is working on LVM 0.9
> packages for sure.  Has this transfer of maintainers been approved by t=
he
> powers that be at Debian yet?

I have sent him email at his tom@debian.org address.

If you don't reply to email sent to the package maintainer address and do=
n't=20
fix high-priority bugs in your packages then your packages can be NMU'd=20
without any issue.  After an NMU if there is still no response then they =
are=20
up for grabs.

If he doesn't want me to take over the package then he will have to reply=
 to=20
my email.

>> I have created packages for lvm 0.8.1 and lvm 0.9.  One change I think
>> should be done is an option for ./configure to specify whether a share=
d
>> library should be used or whether the programs should be statically
>> linked.  If this is desired then someone please tell me which version =
I
>> should create a patch against and I'll send it in.
>
>Since the configure.in scripts are essentially the same, you can just su=
bmit
> a patch to one or the other to the lvm-devel list and we'll get it in o=
n
> the next release.  I am the one responsible for the conversion of LKM t=
o
> the autoconf system, so I'd be interested to see how you intend to
> accomplish this.

LKM?

>Are you saying you want this patch applied to the upstream source?  That
>really doesn't make much sense to me.  The Makefile.in patch is complete=
ly
>unnecessary because the subdirectories Makefile.in files handle those

Right.  At the time I wrote it I obviously hadn't looked at the code enou=
gh. =20
It had seemed not to do what I wanted so I patched it.

>cleanups.  And it doesn't make any sense to me to put the ${PREFIX} stuf=
f in
>the upstream version, as it is not necessary.  That is what the

You're right.  It's better to set prefix=3D`pwd`/debian/tmp/ at install t=
ime.

>> Also I would prefer to have the Debian packaging files in the upstream
>> source.  They are about 5K of data in 11 files in a separate
>> sub-directory. Please let me know if this would be desired/accepted as
>> part of the LVM upstream source and I will send the relevant patch to =
you.
>
>One question.  Why?  Seems completely unnecessary to me.

It makes things easier for people doing other distributions amoung other=20
things.  If you had a Red Hat spec file in there then it would have made=20
things a bit easier for me (I could probably find one on the net somewher=
e=20
but then there's issues of whether it matches the source I've got etc).
Also if someone submits a patch for lvm then they would (hopefully) also=20
patch the Debian setup in a matching fashion thus saving duplication of=20
effort.
Debian packaging files in the CVS works well for KDE...

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
