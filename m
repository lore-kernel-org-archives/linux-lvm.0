Date: Wed, 20 Oct 1999 17:57:29 +0200
From: Adrien Farkas <freddy@redneck.sk.oracle.com>
Subject: Re: [linux-lvm] how to remove PV from a VG?
Message-ID: <19991020175729.A1301@redneck.sk.oracle.com>
Reply-To: freddy@sk.oracle.com
References: <199910201149.AA09133@mailgate1b.telekom.de> <E11dvS2-000687-00@chatteris.cl.cam.ac.uk>
Mime-Version: 1.0
In-Reply-To: <E11dvS2-000687-00@chatteris.cl.cam.ac.uk>; from Piete.Brooks@cl.cam.ac.uk on Wed, Oct 20, 1999 at 02:06:41PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Cc: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>, linux-lvm@msede.com

Piete Brooks (Piete.Brooks@cl.cam.ac.uk) wrote :

> >> How do I really, physically remove the devices from the PV list?
> > Set the partition type identifier to something different than 0xfe.
> 
> What if the disks were to not have a `partition type', e.g. /dev/sdb or
> /dev/md33 ?
dd if=/dev/zero of=/dev/sdb count=8 bs=1024 does the trick

thanks to all who responded (and subsequently helped).

regards,

-- 
                                             freddy

----==-- _                      Adrien "freddy" Farkas
---==---(_)__  __ ____  __       freddy@sk.oracle.com
--==---/ / _ \/ // /\ \/ /  We all know Linux is great... It
-=====/_/_//_/\___/ /_/\_\  does infinite loops in 5 seconds
