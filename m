From: Brian Geisel <briang@microlite.com>
Subject: [linux-lvm] Filesystem Assumptions
Date: Thu, 29 Apr 1999 15:38:37 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <9904291537.aa20392@mlitedom.microlite.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Greetings,
	I've spent the better part of today gaining knowledge and information on
the linux logical volume manager and various filesystems.  I have come up
with a few questions which are possibly derived from incorrect assumptions.
 Corrections to any of which are appreciated as answers themselves. :)  So
here we go:

	I'm assuming (anyone want to break that word into its logical pieces?)
that for the logical volume manager to have any effect on filesystems that
they will need to auto-expand, or at least be able to expand on the fly. 
In other words, if I have a filesystem on an lvm partition, this does me no
good to change the size of the logical partition unless I can change the
filesystem on it.  AFAICT, ext3 has no intention of doing any such thing. 
Is this correct?  Are the above assumptions correct so far?
	
	My next question goes on to assume even more... Oh joy!  Ok, if the
filesystem must expand, and doesn't, what good is it?  That question is not
meant as an attack, it really is an inquiry... I've seen lvm's do some
great stuff when filesystems just grew with them, but what if they don't?

	Any elaboration on any of the preceding is quite welcome and appreciated.

Thanx

geisel
