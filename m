From: Steve_J_Brueggeman@notes.seagate.com
Message-ID: <882567AD.0053E773.00@sv-gw1.stsv.seagate.com>
Date: Tue, 13 Jul 1999 10:11:53 -0500
Subject: Re: [linux-lvm] ERROR -6 activating volume group
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: freddy@oracle.sk
Cc: linux-lvm@msede.com

Hmmmm,
There's not too many paths in the code that return this error string.  This
looks like it's the value of errno, after a failed ioctl() call on
/dev/vg01/group.

It looks like it can open this file just fine, but fails sending the
ioctl() to it, with
#define ENXIO            6      /* No such device or address */

It looks like you may have compiled LVM as a module, but do not have it
loaded, or else, your group char device file /dev/vg00/group has
not been created correctly.

I'd strongly suspect that you do not have your module loaded, as this is
the most common problem.
If you want your lvm.o module loaded automatically by kerneld, add the
following lines to your /etc/conf.modules file
alias block-major-58 lvm
alias char-major-109 lvm

The other possibility is you do not have correct device files in /dev/vg01.
  Check their major/minor numbers.


Steve Brueggeman.





Adrien Farkas <freddy@redneck.sk.oracle.com> on 07/13/99 06:28:02 AM

Please respond to freddy@oracle.sk

To:   linux-lvm@msede.com
cc:    (bcc: Steve J Brueggeman)

Subject:  [linux-lvm] ERROR -6 activating volume group




Hi,

I'v got the following problem: I've created volume group, logical volume,
everything ran okay. vgscan and vgschange both ran with no problems. Then I
recompiled the kernel (2.2.10-ac) with LVM included and now the situation
is:

vgscan runs okay, gives

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found volume group "vg1"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created

but vgchange -a y gives

vgchange -- ERROR -6 activating volume group "vg1"

Anyone can guess what's wrong and how to avoid it?


Thanks in advance
--
                                             freddy

----==-- _                      Adrien "freddy" Farkas
---==---(_)__  __ ____  __       freddy@sk.oracle.com
--==---/ / _ \/ // /\ \/ /  We all know Linux is great... It
-=====/_/_//_/\_,_/ /_/\_\  does infinite loops in 5 seconds
