From: "Bruno Kraychete da Costa" <brunokc@hotmail.com>
Subject: Re: [linux-lvm] Error -154 can't get data from VG
Date: Tue, 14 Nov 2000 09:09:17 PST
Mime-Version: 1.0
Message-ID: <F125PGNkY5TetpIuPHD000030b1@hotmail.com>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: josv@osp.nl
Cc: linux-lvm@msede.com



>I guess that even when your / is in an LV, it still has to be (or most
>probably will be) contiguous on the disk? This would mean that you
>could handforge a partition table entry that maps exactly the root file
>system. The size does not even matter (make it the rest of the disk),
>as long as the start sector is allright. Such a partition table entry
>would allow you to mount the /, even though it is in an LV.

I remember that, doing a cat /proc/lvm would show me that the only 
contiguous LV was swap (I explicitly set it do be contiguous). But this 
could be a good idea. Could any one confirm if this is possible?

>If you want a good set of recovery tools, download an ISO image of the
>LinuxCare bootable business card (http://www.linuxcare.com/bootable_cd)
>and burn it on a CD. You then have at least a serious amount of tools to
>help you in the repair.

Humm. Thanks for the tip. I'll try this one.

Bruno.

_________________________________________________________________________
Get Your Private, Free E-mail from MSN Hotmail at http://www.hotmail.com.

Share information about yourself, create your own public profile at 
http://profiles.msn.com.
