Message-ID: <15AD5D7936F8D21198240000F831776E3E8165@dboexc1.dbo.cpqcorp.net>
From: "Jakma, Paul" <Paul.Jakma@compaq.com>
Subject: RE: [linux-lvm] 0.8i pvcreate doesn't recognise Mylex RAID
Date: Wed, 26 Jan 2000 18:18:00 -0000
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Heinz Mauelshagen' <mauelsha@ez-darmstadt.telekom.de>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> Yes, it's an obvious disadvantage to do this 8-{(((
> 
> The simple reason for it is performance enhancement.
> 

there had to be a reason. :)

but i can live with the performance drop - it's only going to be for things
like the startup lvm commands, and maintenance commands like pvcreate, isn't
it?

> A disadvantage still persists: you can't count on 16 minors 
> per disk for eg.
> like you can see with DAC960 with only 8 minors per volume.
> Scanning all device nodes still causes pain (s.b.).
> 

devfs would be the answer.. but that's in a bit of a political no-mans land.
:(

> Yep.
> That's why a change to use /proc/partitions is
> in the current developement code.
> 

eeekk... /proc.. no, no no. I've had too much crap with changes in format of
/proc files breaking userland tools, i hate the same to happen to LVM. I
think it would be much mroe hassle-free to just take the performance hit and
scan /dev. 

> I think we can count on the existence of /proc and can fallback
> to scanning /dev, if /proc doesn't exist by accident.
> 

ok.. sounds reasonable.

> Thanks 8-{)
> 
> Heinz
>

regards,

Paul Jakma.
