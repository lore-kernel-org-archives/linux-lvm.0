Date: Tue, 4 Jan 2000 21:24:56 +0100 (CET)
From: Holger Rauch <hrauch@datech.heitec.de>
Reply-To: Holger.Rauch@datech.heitec.de
Subject: [linux-lvm] Re: Preserving LVs
Message-ID: <Pine.LNX.4.10.10001042124220.25733-100000@prag.datech2.er.heitec.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi!

On Sat, 1 Jan 2000, Heinz Mauelshagen wrote:

> 
> Hapy new year Holger.
> 
> > Hi!
> > 
> > How can I preserve existing LVs (such as the ones used for the
> > "/usr/local" and "/home" fs) over new installations?
> 
> 
> If you don't touch the disks/partitions where the physical volumes forming
> the volume group containing your logical volumes reside, just do
> a vgscan after upgrading/reinstalling Linux (including LVM).


Well, in the beginning (immediately after an update or a new
installation) commands like "vgscan" are not available to me, since
they were delteted during the installation (probably they live under
/bin, /sbin, /usr/bin, /usr/sbin), and the file system(s) containing
these directories usually get lost during
repartitioning/reformatting. As long as I don't have that command
however, I can most likely not access any file systems that were
created on a LV (such as /usr/local or /home). Maybe I have to create
an initrd image in order to ensure that the commands as well as the
patched kernel is ALWAYS there and to preserve the /boot file system?

Thanks in advance for any help!

Bye,

	Holger


=========================================
Holger Rauch
HEITEC GmbH
Schuhstrasse 30
91052 Erlangen
Germany

Tel.: 09131 / 877 - 273
Fax: 09131 / 877 - 222
Email: Holger.Rauch@datech.heitec.de
=========================================
