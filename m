Date: Sat, 1 Jul 2000 01:05:23 +0200
From: Jens Benecke <jens@pinguin.conetix.de>
Subject: Re: [linux-lvm] Re: IBM to release LVM Technology to the Linux
Message-ID: <20000701010523.I28201@pinguin.conetix.de>
References: <8525690E.006AEE2B.00@d54mta02.raleigh.ibm.com> <395D1159.634DF7EB@inet.net.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="MGu/vTNewDGZ7tmp"
In-Reply-To: <395D1159.634DF7EB@inet.net.nz>; from dale@inet.net.nz on Sat, Jul 01, 2000 at 09:30:01AM +1200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Dale Kemp <dale@inet.net.nz>
Cc: linux-lvm@msede.com


--MGu/vTNewDGZ7tmp
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

this is going to be a tad longer. I have read this discussion for some time
now and I thought I'd just throw in some of my thoughts.


On Sat, Jul 01, 2000 at 09:30:01AM +1200, Dale Kemp wrote:
=20
> I'm beginning to wonder why IBM is even on this list every suggestion is
> for a pure LVMS solution. You say you care about LMS but everything shows
> that IBM only wants there LVMS solution. I understand that LVMS has extra
> functionality, I suspect it has many more years of development put into

I think the reason why IBMs developers always point to their solution is
partly

	* because they know their solution works and has certain features,
	  and they do NOT (yet) know about LVM/md/...

	* because they have a (complete?) platform-independant API that
	  works with their current machines, and they see that it works,
	  and they want to introduce it to Linux,

	* because they have customers that rely on them and their LVMS, and
	  have neither nerves nor chances nor time to do any kind of
	  experimentation. It would therefore be much easier for IBM just
	  to port and clean up their LVMS than to integrate it with current
	  implementations.  They do offer the merge though.


I for one find it somewhat flattering that IBM donates the result of years
of development into the gigantic mind share pool that created Linux.  The
big boys are beginning to understand how the free software principle works:
You can harvest all you want, but you will benefit most if you donate
yourself.

At the same time, though, IBM needs to understand that even in the free
software community, development is partly politics, and there are several
reasons why the IBM LVMS will problably not be accepted into the kernel, no
matter how good it is:


	* There is already a LVM that does "most of the important things".
	  Of course, "important" is stretchable into infinity, but remember
	  that most developers don't have multibillion dollar customers
	  that need <special_feature> or have terabytes of storage. So they
	  develop something that fits the needs of most people. Linux-LVM
	  does this "well enough" (again, stretchable).

	* Some people seem to be afraid that we are falling into some kind
	  of dependance upon IBM when we accept their LVMS. This is a
	  perfectly legitimate claim UP TO AND UNTIL IBM starts releasing
	  complete compilable code, and does it under GPL or BSD licence.
	  They have promised to do so, they haven't DONE anything to that
	  effect already (or have I missed something?).

	* It is completely understandable that now that IBM has entered the
	  game, developers feel "overrun". They have devoted energy to
	  their own LVM implementation and now comes the "big guy" and
	  builds a big stone castle around their cosy cottage. (just a
	  comparison)=20
	 =20
	  Of course, being "swallowed" this way works up emotions. We must
	  find an agreement (e.g. the cottage takes care of providing food
	  and meals to all the castle inhabitants. :)


> Maybe IBM still doesn't get the working with the community idea here,

I think they do, but only partly. Developers tend to be more easily
convinced by working code, than by arguments. If IBM releases their code
(GPL'ed, of course) and it is really easy to write plug-ins and there is
good documentation, and it is cross-platform and so on, it will most
probably be adopted.=20

If they want the Linux community to accept it before they get the code out,
however, IBM will probably have a hard time.

Just for comparison: "Easy code" is partly why the KDE project exploded so
quickly out of nowhere - they found a library (Qt) which was well
documented and stable, and really easy (you could program a text editor in
20 lines of code) -- and it was FUN.=20

Programming must be FUN. That is one of the most important things in the
free software community. And it is not at all childish: If you do something
for free, you'll want to enjoy doing it.

> See if you can answer without saying LVMS does this... And we can tell
> users in the future "integration occurs in the LVMS instead of the user
> interface".

This could be hard, because they do have a working solution (at least, on
other OS). But, until they actually release code, we cannot really argue
what will integrate into what.

So, IBM, please release the code and let the hackers digest it. Then, we
can really determine if your LVMS is worth converting Linux-LVM into
plug-in modules (or vice versa). From what you told us, it is.=20

But without code, who knows?


--=20
"The PROPER way to handle HTML postings is to cancel the article, then hire
a killer to kill the poster, his wife and kids, and fuck his dog and smash
his computer into little bits. Anything more is just extremism." - ptomblin

--MGu/vTNewDGZ7tmp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iQEXAwUBOV0nsrhrARHySzvPFAH0QQP/TevDMn2uaKhc26gM7GLcZnKf/6h/WlVW
KrccjzG52Z3yIhqbVR+GXQGCy6KI2ta2kRjXlLzV0oNXlje0uq7gDM7ZrHHa+lMi
lFJZtD8Wun7O4qDXTP8nnyYg5uFlDd1yn4uY+0ER2WqdZ27rXaE2+shwQGtohkwr
624PFvqKDeoEALhijYuVPYMywY0kmNgDnf8lVDhPjXg0wHNSU0l53FK+W+9Hlk+g
yNTpu7rCRl38drrXeDM6UQkKFjygvnnsgrLKEtp9GIb0ys+1a6+wnIS0SwcCkA9b
KTcuxp2B9iNg4OUAAR4GgoMVXfSIyj7kXbw3rwOAiBR6VCppO0h6T7is
=puTv
-----END PGP SIGNATURE-----

--MGu/vTNewDGZ7tmp--
