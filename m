Message-ID: <00fe01bf403e$0524a1a0$0ebcfea9@brd>
From: "Nicolas Brouard" <brouard@ined.fr>
References: <Pine.LNX.4.10.9912051403290.22457-100000@aragorn.fra.suse.de>
Subject: [linux-lvm] Re: Why would I want to have an LVM under Linux?
Date: Tue, 7 Dec 1999 00:02:48 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Volker Wiegand <wiegand@suse.de>
Cc: Linux-LVM Mailing List <linux-lvm@msede.com>, Linus Torvalds <torvalds@transmeta.com>

> Having an LVM at your home PC is not the first priority, but it is really
> desirable for business, especially for data center operations.  And Linux
> is actually entering such environments, which I find is just great.

The big advantage of LVM is when you have different physical disks and want
to expand or even change a partition from one physical disk to another
without rebooting. I did  it on AIX and it was great.
But on small systems (and my original question concerned a laptop with only
one physical IDE disk) the advantage of LVM is not so important if a tool
like parted works well (Parted is similar on linux to Partition Magic on DOS
or Windows).

I really think that a FAQ on a product like LVM should at least discuss
other solutions like Parted and focus on the actual advantages or
disadvantages of putting LVM on your hard disk: for example can an LVM
partition be viewed from NT or Windows 9x? So long as Linux software won't
be as good as Windows the market for linux will still be for people looking
at both systems simultaneously (I hope that the Gnome project will be
successful).

Let us now talk on huge systems will plenty of people connected
simultaneously so that it is not possible to 'reboot' while changing a disk.
That kind of configuration hold when software and hard disk were expansive.
If the success of Linux comes from the Free sources, it means that people
can copy the softwares on their desktop on laptop for free. In statistic,
for example, S-plus (R on linux) and SPSS (PSPP on linux) are now free,
there is no more need for Linux mainframe with these costly softwares and
plenty of students connected.

So the real advantages is a real world are not obvious if the tendency is a
laptop with 10Gb which are now more powerful than any AIX station where LVM
was first implemented.

I don't want to be too polemic but I was a little desperate not to find
answers to my questions in the FAQ. I think that I got these answers on this
list. While thanking all the people having taken time to answer me, I know
that many people have used LVM on AIX at least but were like me hesitating
to implement it on laptop. So Wiegand's comments for example could be
inserted in the FAQ. Also a comparaison with Parted too.

Nicolas Brouard
http://sauvy.ined.fr/brouard/english
