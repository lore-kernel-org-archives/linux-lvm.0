Return-Path: <hackbyte@gmx.de>
From: Daniel Mitzlaff <hackbyte@gmx.de>
Date: Wed, 03 Jan 2001 17:44:13 GMT
Message-ID: <20010103.17441399@dmitzlaff2.botschendv.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Another strange setup by a newbie, but strange oops resulted while
 trying vgextend/vgmerge!
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
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@sistina.com
Cc: hackbyte@gmx.de

Hello there..
Joe Thornber wrote something like:

>Grab the latest code from the LVM_0-9-patches branch of cvs.  You will=

>need to repatch/build the kernel module as well as the userland tools.=

Hmm, sorry but =96 as i sayd in my last mail =96 CVS snapshots for a mac=
hine=20
which is imho _very mission critical_
is the last thing that i can add to the "i have no backups" line .. ;)
If i had to wait for the next release of lvm, it's ok. If i had to use a=
n=20
old version of LVM, ok ......
But =96 please can someone add this to the INSTALL file? ;)
>The lvm-2.2.17 and 2.2.18 patches apply cleanly to the vanilla
>kernel + rawio.  The redhat kernel is almost certainly not a vanilla
>kernel.
(smile) i wrote
----
I use a native RH6.2 installation w/o any updates/fixes (except for=20
network security), using 2.2.17 and 2.2.18=20
kernel-tarballs
----
There's a little difference between "tarballs" (mostly downloaded from=20=

ftp.kernel.org) and RPM's which came in most cases from redhat or rpmfin=
d=20
and are "adapted" versions to run easilyon RH boxes. I took the vanilla =

tarballs from kernel.org;)
And, i can't find any 2.2.18 patches on the ftp servers (again, cvs is n=
o=20
choice;)
ok .... but:
>I don't think 0.9 is quite ready for production systems.  Maybe you
>should play with 0.8.
Yessa, that's what i want to hear =96 why it is not documented in the=20=

install or readme file?
How can users, which thinks after reading your doc's, that all seems to =

be ok, bug-less and right stable, how can these user see which version i=
s=20
stable?;)
I'm such a user, but (remember) i know what i do, and i'm wondering abou=
t=20
these (initially) cool piece of software;(
Hhhm, i think i'll try a little bit around with 0.8, giving cvs a try=20=

(but not for real usage!), and really hope that the administrative=20
persons learn to declare stable and unstable versions. (smile)
Other question, what is the reason to swap on lvm? ;) Because, as in=20=

swapon manual described, the kernel already can swap on several devices =

and can handle paralel-swapping on more than one partition .. ;)

Greetings hackbyte -> hackbyte@gmx.de IRCNet hackbyte @ #linux.de,+linux=
.de
P.s.: Sorry, i just use actually Staroffice on windows for my mails, it'=
s=20
not really good (smile) - i'll fix it soon;)
