Date: Mon, 6 Nov 2000 23:43:06 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] / on LVM - what to do on shutdown?
Message-ID: <20001106234306.A16931@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <3A0694E7.52D2AF89@fl.priv.at>
Mime-Version: 1.0
In-Reply-To: <3A0694E7.52D2AF89@fl.priv.at>; from fl@fl.priv.at on Mon, Nov 06, 2000 at 12:24:23PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Friedrich Lobenstock <fl@fl.priv.at>
Cc: linux-lvm@msede.com

On Mon, Nov 06, 2000 at 12:24:23PM +0100, Friedrich Lobenstock wrote:
> Hi!
> 
> I have a problem because I don't know what to do when / is on lvm.
> 
> Currently /sbin/init.d/halt does the following (/ is not on lvm):
> 
>   [..]
>   echo "Unmounting file systems"
>   umount -avt noproc,nonfs 
>   [..]
>   umount -anvt proc
>   
>   if test -d /etc/lvmtab.d -a -x /sbin/vgchange ; then
>       /sbin/vgchange -a n
>   fi
>   
>   [..]
>   mount -no remount,ro / 2> /dev/null
>   sync                
>   [..]
>   halt -d -f
> 
> 
> Now what if / is on lvm? Should I really call "/sbin/vgchange -a n" ?

You can safely do it because it tries to deactivate all active VGs
the LVM driver is aware which fails for VGs with open LVs anyway.

Nothing is written to any device by the LVM during "vgchange -a n".
IOW: no harm happens if you avoid it completely during shutdown.

> What are with the commands afterwards will they fail or might
> the lvm device get mixed up because of not correctly closing it?
> Or should I load a ramdisk to do the work, if at all possible?
> 
> I think the md-Device does a clean shutdown by itself, because
> I use md to create a raid1 with lvm on top?
> 
> PS: You might gess that I'm using SuSE Linux, 7.0 to precise.
> The kernel ist 2.4.0-test10.
> 
> 
> MfG / Regards
> Friedrich Lobenstock

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
