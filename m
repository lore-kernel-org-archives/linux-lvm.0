Message-ID: <005301c21088$4131bad0$3b00a8c0@aplabwp0368359>
From: "Bas" <weblists@gmx.net>
References: <F47B5C16711BEC4BBB0651C75F724809D5C6@qntsv14.quant.com>
Subject: Re: [linux-lvm] URgent - please Help - our main system is corrupt, no one can work!
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
Date: Mon Jun 10 09:05:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Hi,

You probably already tried this, but just to make sure.
# vgscan
# vgchange -a y

Try to mount the filesystems.

Good luck,
Bas.

----- Original Message -----
From: "Gesine Sch�fer-Reimers" <G.SchaeferReimers@quant-forum.de>
To: <linux-lvm@sistina.com>
Sent: Monday, June 10, 2002 3:16 PM
Subject: [linux-lvm] URgent - please Help - our main system is corrupt, no
one can work!


Dear Sirs,

this is the second mail. I tried it this noon but got no answer so far, but
our whole
production is down and I really have to fix it.

We use SUSE 7.3 with LVM. I have got /var and /tmp and /opt  an /home and
many
Partitions without a filesystem for our database on a logical volume group
named quant.

The system was up and running. I added (with YAST2) one more logical volume
to the
volume group, applied an restarted. The restart ist "strange", since only
parts of the
systems come up.

For instance the /var directory claims to be mounted but is empty and cannot
be
mounted, for they are not mounted !! In /procs/ not filesystem is shown as
mountet.
The / filesystem, which is out of the VM is in a read only state, some files
are there
others are gone.
When I do vgdisplay the VM is shown as available, when I do vgdisplay -D it
is shown
as unavailable.

I cannot afford any tests, since I do not have a backup of the database data
>from today.

It looks for me as if the addition of the new logical volume wrote some
information in a
place where it does not belong. Can I recover the old state without loosing
information?

With best regards
Gesine Sch�fer-Reimers
quant GmbH
++49/40/254078-70

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
