Date: Tue, 13 Jul 1999 17:23:54 +0200
From: Adrien Farkas <freddy@redneck.sk.oracle.com>
Subject: Re: [linux-lvm] ERROR -6 activating volume group
Message-ID: <19990713172354.A9172@redneck.sk.oracle.com>
Reply-To: freddy@sk.oracle.com
References: <882567AD.0053E773.00@sv-gw1.stsv.seagate.com>
Mime-Version: 1.0
In-Reply-To: <882567AD.0053E773.00@sv-gw1.stsv.seagate.com>; from Steve_J_Brueggeman@notes.seagate.com on Tue, Jul 13, 1999 at 10:11:53AM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve_J_Brueggeman@notes.seagate.com
Cc: linux-lvm@msede.com

Steve_J_Brueggeman@notes.seagate.com (Steve_J_Brueggeman@notes.seagate.com) wrote :

> It looks like you may have compiled LVM as a module, but do not have it
> loaded, or else, your group char device file /dev/vg00/group has
> not been created correctly.

yes, it's compiled as a module, that's right. one more (huh) thing to mention, usage count for LVM modules is _decreased_ after _each_ vgchange, so it's -6 right now.

> I'd strongly suspect that you do not have your module loaded, as this is
> the most common problem.

I do, check ^^^

> If you want your lvm.o module loaded automatically by kerneld, add the
> following lines to your /etc/conf.modules file
> alias block-major-58 lvm
> alias char-major-109 lvm

that's done, that's okay with me.

-- 
                                             freddy

----==-- _                      Adrien "freddy" Farkas
---==---(_)__  __ ____  __       freddy@sk.oracle.com
--==---/ / _ \/ // /\ \/ /  We all know Linux is great... It
-=====/_/_//_/\_,_/ /_/\_\  does infinite loops in 5 seconds
