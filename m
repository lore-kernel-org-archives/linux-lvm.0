Message-ID: <39D14B6C.4C9F6C26@us.oracle.com>
Date: Tue, 26 Sep 2000 18:20:44 -0700
From: David Brower <dbrower@us.oracle.com>
MIME-Version: 1.0
Subject: [linux-lvm] current lvm function questions
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi, sorry to ask what might be FAQs, but I couldn't find
the answers on the list archive or the HOWTO.  There may
be overlap in my interests between lvm and md, so please
straighten me out.

Area 1:  Stable device naming.

Is there a way in Linux to get a stable name for a
disk that survive reconfiguration and discovery 
randomization?

One of the things linux has problems with is
stable device naming.  If you pull a disk out of a chain,
the following devices will move up in the /dev entries, 
and not have the same name they had before.  This can
be a real problem with massive storage subsystems.

I know of two ways of handling this.  (1) is to slap
a label on the disk, and make sure it shows up as the
device in the label when the disk is discovered.  (2)
is to keep a separate database mapping devices to fixed
locations.  I think the label is the best idea.

It seems to me that lvm already slaps a label on the 
disk when it does pvcreate.  What i'm not sure of is
whether the label used is (a) globally unique and suitable
for stable device naming, or (b) tied to the device it
happened to be on at the time the pvcreate was issued.

Specifically, if a pv/vg/lv is created on /dev/sda6, and 
a subsequent reconfig has that partition show up as 
/dev/sdb3, does it still show up as /dev/lvname?


2.  Raw device access

Can lvm volumes be accessed as raw devices?  If so, how?
Is there /dev/rlvname?

I'm sure /dev/fs falls in here somewhere...

thanks!

-dB
