Message-ID: <31A612FE6020D2119F6400A0C9B67EBB116E59@fthw901e.as.fth.sbs.de>
From: Franken Klaus <Klaus.Franken@fth2.siemens.de>
Subject: RE: [linux-lvm] vgscan in /sbin/init.d/boot ?
Date: Wed, 10 Nov 1999 15:44:59 +0100
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Stephan Hendl' <Stephan.Hendl@lds.brandenburg.de>, linux-lvm@msede.com

> -----Original Message-----
> From: Stephan Hendl [mailto:Stephan.Hendl@lds.brandenburg.de]
> Sent: Wednesday, November 10, 1999 10:05 AM
> To: linux-lvm@msede.com
> Subject: [linux-lvm] vgscan in /sbin/init.d/boot ?
> 
> 
> Hi all,
> 
> does anybody know where I have to put the lines
> 
> vgscan
> vgchange -ya
> 
> in the boot script? The docs don't tell something about the 
> place. I use SuSE-Linux.

The best place should be '/etc/rc.d/boot.local' (if / and /usr isn't in LVM)
But not tested with SuSE-Linux.

Klaus.Franken@fth2.siemens.de    +49 911 978 3707
Siemens Business Services IP 23F
