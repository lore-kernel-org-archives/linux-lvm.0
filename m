Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] kernel: invalidate: busy buffer
Message-Id: <CDF05CB9FCA0C845B9778F9E463C476101FBB1@cinshrexc01.shermfin.com>
From: "Rechenberg, Andrew" <ARechenberg@shermanfinancialgroup.com>
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
Date: Tue Apr 16 10:06:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Here is a lkml thread that may be of use:

http://marc.theaimsgroup.com/?t=3D101800839000002&r=3D1&w=3D2

Also check out:

http://www.uwsg.iu.edu/hypermail/linux/kernel/0110.1/0726.html

According to Alan Cox in the first thread listed above:

------------------------------------------------------------------------
> With 2.4.18 we recently get a lot of the following in the kernel log:
> invalidate: busy buffer
>=20
> Something to worry about?

Yes in some situations. Its fixed in 2.4.19pre5-ac2 and a bit before
------------------------------------------------------------------------

Hope this helps,
Andy.


>
> Hello,
>
> With 2.4.18 we recently get a lot of the following in the kernel log:
>
> invalidate: busy buffer
>
> Something to worry about?

-----Original Message-----
From: J=E9r=E9mie Banier [mailto:opposummerbeach@yahoo.com]
Sent: Tuesday, April 16, 2002 10:56 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] kernel: invalidate: busy buffer


Ok so were 3 ...=20
and none of us knows what a busy buffer is ...
: (=20

Jeremie.


On Tue, 16 Apr 2002 10:43:22 -0400
"Rechenberg, Andrew" <ARechenberg@shermanfinancialgroup.com>
wrote:

> I received your message via the list so you're not the
> only one :)  However I cannot give any assistance with
> your issue.  My apologies.
>=20
> Just letting you know you're not alone on the list,
> Andy.
>=20
>=20
> Andrew Rechenberg
> Network Team, Sherman Financial Group
>=20
> -----Original Message-----
> From: Rene @ Webscorpion.com
> [mailto:rene.madsen@webscorpion.com] Sent: Tuesday, April
> 16, 2002 10:29 AM To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] kernel: invalidate: busy buffer
>=20
>=20
> Uhm, 24 hours and my posts is the only one?
> Am I the only person on this list?
>=20
>=20
> > Dear LVM gurus
> >
> > I've installed LVM on several computers over the years,
> > generally without problem, but now I've hit a box where
> > I can't make it work: This is a P4 with two 60GB IDE
> > drives, hda and hdc.  The Kernel is a Redhat 2.4.17
> > (custom 0.6 fwiw) which I understand is an -ac flavor
> > kernel.  It would seem that because of compatibility
> > issues with aquote- unrelated to LVM - I need this -ac
> > hack present.
> >
> > I downloaded and installed the userland tools 1.0.3 and
> > had a beautiful patch created. Trying to apply the patch
> > with --dry-run gives a couple of errors though, so I
> > didn't dare applying it.
> >
> > Instead I just compiled the kernel with LVM support in
> > the kernel(whichever is present in the 2.4.17 kernel,
> > not as not module) and everything seems fine - at least
> > no complaints. This i've done several times before
> > without getting into trouble.
> >
> > Rebooted the kernel, everything still fine. ran vgscan
> > (tookforever but eventually came back)  followed by
> > vgchange -a y, which also was ok.
> >
> > pvcreate on both the partitions (one on each disk) goes
> > fine, and so does vgcreate (again, takes forever, but
> > finally...)
> >
> > Now the problem: lvcreate dumps core. Doesnt matter how
> > much or little space I create, what I call it, if I use
> > just one pv or if I try to slice it.
> >
> > I notice in my /var/log/messages that I get MILLIONS
> > (really) of errors: kernel: invalidate: busy buffer
> > last message repeated 12233432 times
> > last message repeated 534252times
> > last message repeated 545234242 times
> >
> > What am I doing wrong? Is this error related to the
> > missing kernel patching?
> >
> > How can I patch a standard kernel for both -ac and LVM ?
> > As I understand it they both require a "clean" kernel to
> > apply good?
> >
> > Sorry for the perhaps stupid quiestions, but I am not a
> > kernel guru - I only know just enough to get myself into
> > trouble :-)  I *did* read the FAQ and I *did* search
> > google (usenet) - didnt' find the answers tho...
> >
> > TIA!
> > Rene
> >
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at
> > http://www.sistina.com/lvm/Pages/howto.html
>=20
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
> http://www.sistina.com/lvm/Pages/howto.html
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
> http://www.sistina.com/lvm/Pages/howto.html

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
