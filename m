Date: Tue, 13 Jul 1999 17:05:26 +0200
From: Adrien Farkas <freddy@redneck.sk.oracle.com>
Subject: Re: [linux-lvm] ERROR -6 activating volume group
Message-ID: <19990713170526.B8866@redneck.sk.oracle.com>
Reply-To: freddy@sk.oracle.com
References: <19990713132802.A7208@redneck.sk.oracle.com> <199907131455.AA30837@mailgate1b.telekom.de>
Mime-Version: 1.0
In-Reply-To: <199907131455.AA30837@mailgate1b.telekom.de>; from Heinz Mauelshagen on Tue, Jul 13, 1999 at 04:54:34PM +0000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: linux-lvm@msede.com

Heinz Mauelshagen (mauelsha@ez-darmstadt.telekom.de) wrote :

> vgscan -d
> vgchange -day
> vgdisplay -Dv
> ls -l /dev/lvm /etc/lvmt* /dev/vg1

here it is (it the attachments). just to note, vgchange -day gave

Trying to vfree() bad address (0804f030)
vgchange -- ERROR -6 activating volume group "vg1"

in addition to the attachment info.
-- 
                                             freddy

----==-- _                      Adrien "freddy" Farkas
---==---(_)__  __ ____  __       freddy@sk.oracle.com
--==---/ / _ \/ // /\ \/ /  We all know Linux is great... It
-=====/_/_//_/\_,_/ /_/\_\  does infinite loops in 5 seconds
