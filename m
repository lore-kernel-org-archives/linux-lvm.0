Message-ID: <001801c3131b$2acd7ae0$0100a8c0@andre6xtbp6uza>
From: "=?iso-8859-1?B?QW5kcmXpIMVzdHL2bQ==?=" <andree.astrom@home.se>
References: <001401c31014$efdcc840$0100a8c0@andre6xtbp6uza> <20030503114458.GB541@guldukat>
Subject: Re: [linux-lvm] Trouble with pvmove
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Mon May  5 10:29:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

----- Original Message -----
From: "Nils Juergens" <nils@muon.de>
To: <linux-lvm@sistina.com>
Sent: Saturday, May 03, 2003 1:44 PM
Subject: Re: [linux-lvm] Trouble with pvmove


> On Thu, 01.05.03, Andre� �str�m <andree.astrom@home.se> wrote:
>
> > In one of my volume groups a disk have gone bad.
> > I extended the volumegroup with another disk to be able to pvmove it.
>
> Is the disk already producing read errors or are you using a SMART monitor
> that tells you it is bad?

Both, uncorrectable errors in dmesg, and smartctl reports it as failing.
>
> >
> > pvmove -i -v /dev/hdh
> >
> > It went fine until,
> > pvmove -- /dev/hdh [PE 259 [archive [LE 259]] -> /dev/hdj [PE 259]
> > [260/1831]
> >
> > The machine got total dead. The whole volumegroup consists of 1.1TB so i
> > couldn't backup it all up beforehand.
>
> Which version of LVM are you using? IIRC there has been trouble with
pvmove
> and lockups before, so try to upgrade to newest version.

We were using 1.0.4, so updated to 1.0.7 today. No luck tough. Computer
locks up completly at
certain PE's.
Any clues how i can recover any data from it ? As it complains now, of
missing inodes when i mount it and try to accesss it.
So i cant really do anything. I guess those was moved from the broken
harddisk to the new one, but never got updated
because the computer locked up.

Regards,
Adain
