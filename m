Return-Path: <hackbyte@gmx.de>
From: Daniel Mitzlaff <hackbyte@gmx.de>
Date: Fri, 05 Jan 2001 23:10:20 GMT
Message-ID: <20010105.23102087@dmitzlaff2.botschendv.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Release practice - was: Another strange setup by a newbie, but
 strange oops resulted while trying vgextend/vgmerge!
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
To: linux-lvm@sistina.com

Hello AJ Lewis...


I wrote
>> BUT, all my drives are filled up with data, there's NO BACKUP(!), and=
 no
>> way to take more than a single drive free for reformatting.

From AJ comes:

>If this is a production system, you should really should have some=20
backup.

Hey, i'm a little bit nerd/geek, really far away from things declared to=
=20
be "normal", *but* *not* *stupid* ;)

>There are plenty of things that can go wrong without even putting layer=
s=20
like
>LVM into the picture. I agree that upgrading LVM should not mess up=20=

you're
>data, but if you have no backup, you are taking a lot of risks no
>matter what. I do understand that for home systems backup is a difficul=
t=20
issue,
>but bad things do happen even with the most finely tuned systems.

Yes, i just got a - i really can't see from where it comes - crash, lost=
=20
my complete /home/hackbyte, /home/ftp and /home/lost+found, all other=20=

files still remaining to be there, 'debugfs lsdel' reports a regular=20=

delete on all these files (34000 files in 7gig!). This harddrive is just=
=20
taked into my bed,  waiting for some day when i can get my files back,=20=

INCLUDING the filenames, 99% of the files are still there and recoverabl=
e=20
;).  Do you now believe me if i say i know what i do?;)

>CD burners are a cheap and effective way to backup user data, and hard =

drives are cheap
>enough now that you could buy a cheap external drive with large capacit=
y=20
todo
>backups to. That said, it is very unlikely that you will loose data to =

LVM.
>ven the issues that have come up on the list don't cause data=20
corruption.

;) - i just have to smile a little bit. Please tell me how i can backup =

my data on CD if i had a filesystem, splitted in 5 partitions, 90% of th=
e=20
space filled with data? If you know a way to backup all these data like =
a=20
streamer does, on CD, please tell me *soon*! Even if i try tar -m, i=20=

can't get all the data. And i don't see a reason how i should implement =

another structure, only to backup all the files. (Hhhm, only installing =

lvm eventually, ok sorry, just joking;)

Hhhmm, about data loss or data corruption, while testing lvm0.9 on=20
vanilla 2.2.18, i got more than once errors unmounting /, once of these =

followed by a lost vg. I can't reproduce this, but i've seen another use=
r=20
with a lost vg on the ml. Ok i'm sure that's a worst case condition. But=
=20
if it can happen while i test it, so it can happen if i run it! About th=
e=20
vg lost, just i think, at the time vgchange -a n updates the lvmtab,=20=

there's no sync between rewriting lvmtab and shutting down the system,=20=

because / is still in use and can't unmounted at a point where no shell =

is left on the system. (please take this issue for your changes in the=20=

next time! vcfgrecover even doesn't worked - what the hell ;)) .. as i=20=

said, i can't reproduce this ;( )

Next issue, on buying a cheap drive for backups. Hhhhmm, i just got a ne=
w=20
45Gig drive to expand my space. That's the reason why i think about usin=
g=20
lvm/raid or other things, don't wanting to split again my nirvana for=20=

another partition;) (ehm, yes i call my network and especially my fs my =

private nirvana so i hoped to got a vg called nirvana;)
If i had enought money to buy a new drive for mirroring, so i can go and=
=20
let someone repair my dat-drive, nor?;)
Not that i think DAT is really easy to recover from, but it's the=20
cheapest backup-solution i get (from old machines even;).

>Which patches are you talking about here?

Oh, i can tell you which patches i mean, look at the ML, a mail from=20=

Heinz ->

http://lists.sistina.com/pipermail/linux-lvm/2000-November/003698.html

[linux-lvm] Re: Some brokenness in LVM 0.9 (on 2.2.18pre23) [long mail w=
/=20
oopses and patch]=20

..........


>First of all, if you are using the stock redhat packages, and they don'=
t=20
work
>with the new LVM stuff, please complain to RedHat. They are the ones=20=

that
>should deal with that.

That's NOT a redhat problem, lvm seems to work, only a few issues=20
don't..... ;)

>Secondly, what are you talking about? --> "version that does not work" =
<--
>What is this? Are you using the RPMs off the sistina site? Did you=20
compile
>the packages yourself? If you used the sistina packages, make sure the =

lib>lvm*
>files are removed from /lib. My initial packages installed into /usr/=20=

instead

Eh? ... no comment............. see below

>of root. I will get new packages out shortly that correct this problem.=
=20
I
>was hoping the transition issue would be resolved before I did this, bu=
t=20
it
>looks like I need to get new packages out first and then deal with that=
.
>You can also look at >http://distro.conectiva.com.br/experimental/lvm/=

>for a version of the LVM packages that supports both the old (0.8.x) an=
d=20
the
>new (0.9.x) interfaces.

Hey, cool. Very cool. Just imagine, i give you a light about which=20
kernels i use, i just described the difference between a tarball and a=20=

rpm-paket, what the heck did you think what i do eh? ;) I explain..

First, it comes to me that i found myself in the happily position to buy=
=20
a new drive. Thinking about reorganizing my files. I see, it wasn't good=
=20
to split up again my files, so i decided to take some knowledge about=20=

optimizing this point. Just opened my favorite web-browser, going to=20=

www.linuxdoc.org, taking some howto's and beginning to read them. All=20=

these howto's tell me that raid wil not fit into my setup, because i=20=

can't reformat all my drives in one strike, so i see clearly that LVM is=
=20
the choice.

Ok, then, i just looked a little bit around to understand what LVM want'=
s=20
to do with my data and drives, and it seems to be ok for me. I just=20
wanted a linear append on all drives, if i can get striping, hey cool,=20=

but not really important. Only one thing is important - i have to resize=
=20
the entire fs after freeing another drive to take it into the VG and the=
=20
into the LV.

So i go to kernel.org, downloaded an actual linux, go to sistina.com,=20=

downloading an lvm - going to home, sit on my network - reading again=20=

install and readme files! - and began to work.

I've used a vanilla LVM0.9 from ftp.sistina.com, together with a vanilla=
=20
2.2.17/18 tarball from ftp.kernel.org. Compiled all tools myself. Used=20=

vanilla "make install"  to bring it right now into my system. I even it =

is a vanilla RH6.2 installation. What do you think can be wrong on this?=
=20
And, if there are something, don't you mean that this has to be explaine=
d=20
in the README or INSTALL file? For what reason are these files written b=
y=20
-who want to know this now- eh? Oh, i forgot to tell that i asked SOME=20=

people on ircnet about my problems with lvm, most of the users tell me t=
o=20
DON'T even use it. - At this time i know why, and that it probably takes=
=20
only to LVM0.9 - ***i hope***.

>Define stable. I don't know of any software package that is 100% stable=
.
>There are always issues to track down. Point releases, such as LVM 0.9 =

are
>especially prone to that. You should know that. If you are concerned=20=

about
>it, don't upgrade immediately. Monitor the linux-lvm and lvm-devel=20
mailing
>lists and see what problems people have. That's why we archive the=20
mailing
>lists.

(smile), ok another piece of background. I'm not really a good=20
programmer, but for a long time i maintained a bbs here in germany,=20
writing and releasing my own tools to give my (and other sysop's) users =
a=20
lot of experience which no other bbs has. Do you think i can see=20
differences between stable and unstable software? Not? Ok i explain. If =
i=20
can leave all my data right on the lvm, the lv still filling up - just=20=

for example with an audio-stream from my dsl line, and go to bed, w/o=20=

thinking any jota about how i can guard my data - knowing that all is ok=
=20
in the morning (even if my fs with its 100Gig is filled up to 95% in the=
=20
morning, from - in example - 70% in the evening before) - THAT is stable=
!=20
At this point, i can't build a LVM - because resize don't work.....(And =
i=20
don't want to imagine what can happen if i - for some cool reasons -=20=

implemented an automatically resizing over spare disks if the system=20=

grows to much w/o my presence... ok i just can't do it so because all=20=

drives are already filled - but this can be a worst case condition where=
=20
lvm has to run w/o any problem!)

>Good, I'm glad you are reading the ML. We are working on the issues.=20=

Heinz
>has been out of contact for a few weeks due to a move and other issues,=
=20
which
>is delaying feedback. Sorry about that. :(

Hey i said - i know what i do. And i really know how busy a programmer=20=

can be WITHOUT answering to questions how to use some - still documented=
=20
- features or setups. Feedback is not really important, if all is=20
described or self-describing *AND* working...

>I understand your frustration, but know that we are working on this.

Ooh, i really hope and can exclude all possibility of doubt - since 2.4.=
0=20
is released;) - that someone urgently hacks around to fix these problems=
,=20
oups, forgot that i read, the fixes are still there, but not released...=
=20
(again -> no comment about this!)

>As I said earlier, most point releases have issues that need to be=20
worked out,
>and LVM 0.9 is no exception. If you want a "stable" release, you
>should probably use LVM 0.8.1 for now. LVM 0.9.1 should be out soon,=20=

which
>should have all the *known* bugs fixed.

Hhhhmmm... hey guy, i think, it's not cool to be forced to test the=20
software you just write.
I think there's NO REASON TO DON'T TEST IT YOURSELF!

So there is - in my eyes - NO WAY to take out a release that - as you ca=
n=20
see - in vanilla don't run WITHOUT ANY COMMENT ABOUT THIS. Hey ok, LVM=20=

still works, but not in all pieces!

At this time, i don't know any frustration about your software, it's not=
=20
fine that i have to wait - but that's life.
The only thing is, i liked to know it BEFORE I TAKE ANY EXPERIMENTS with=
=20
this software!
And, even to say that LVM is for free, is no ticket to do it this way!

Just, think about the time i spend installing and testing a software=20=

which documentation never said anything about "absolutely beta for this =

release" or "possible bugs making it unusable in some cases". As i said,=
=20
im not really a programmer, but i have to sit at the office for a big=20=

part of the day, just going home, late in the evening, working on my=20=

private network. Didn't you believe that there are other things to do fo=
r=20
me, except to learn that LVM0.9 has bugs which makes it unusable for me =

and (i'm sure) a lot of other private users?

All over these issues, i think it's a shame that it happened as it did. =

Ok, there are several reasons how can things go that way wrong. BUT we=20=

all, especially people who works on software, had to do all what is=20
possible to prevent us from such ..............(again, i don't say what =
i=20
think - you know it already)

Cool ideas are very nice, and if it takes place on some mind - to be=20=

worked out in a usable state, then we all only got a benefit if the=20
persons who are working on this idea right know what they do........ I=20=

just imagine what happens to the earlier linux kernels, if linus itself =

takes this way to release new kernels.

So, i go now into my weekend, still fiddling around with my partitions -=
=20
giving you and all persons who work on LVM a lot of hints ;).

-->**NEVER** and not only i say, **NEVER** take out any untested release=
=20
w/o issuing it in the manual.
-->**EVERY TIME** if you get patches, give it to the people who need it =
-=20
and give a documentation where to find (again, cvs is not a thing who=20=

everyone can deal with)!
-->And in the future, do all what you can do that NO EVETUALLY KNOWN BUG=
S=20
go to the kernel! - this is the most important thing for all=20
OpenSource/GPL supporters!!!
-->Just, if you can, please urge as many betatesters as you can reach to=
=20
test your release BEFORE it goes out to the world.

And, please try to make me happy with your next release, and with the=20=

following releases. I can only say that i - at this point - don't give=20=

any commets about lvm if i'm asked about this - except that it is smart =

to wait for the next release. In the other way, i see it to come, that=20=

every user or customer which ask's me about handling a big fs will hear =

from me that lvm can't be a choice...... (hey, that is not a thing who=20=

bothers you at this time, but image is image - and the image of LVM is=20=

not really good in the IRCNet)


Cya, and don't be angry about my mail, just take it, think a lot about=20=

it, and take some changes in the future ;)
(again, this goes to all lvm maintainers...)

Greeting - hackbyte aka hackbyte@gmx.de / hackbyte@hackbyte.de - IRCNet =

#linux.de, +linux.de
P.s.: Hhhmm sometimes, i'm wondering about my english, it seems to be=20=

readable, but if you think i really learned it @school - you're wrong;)=

Und nochmal ein paar gr=FCsse an unsere deutschen mitleser, ich bin echt=
=20
ver=E4gert, aber so kanns ja nu wirklich nicht gehen ... ;)
