Message-ID: <394E85F6.E8263F85@msede.com>
Date: Mon, 19 Jun 2000 22:43:34 +0200
From: Michael Marxmeier <mike@msede.com>
Reply-To: t.reber@dkfz-heidelberg.de
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan fails to find vg
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message from Tobias Reber" <t.reber@dkfz-heidelberg.de> ...

-------- Original Message --------
From: "Tobias Reber" <t.reber@dkfz-heidelberg.de>
References: <20000612190824.A7258@bar.nowhere>
Subject: Re: [linux-lvm] vgscan fails to find vg
Date: Wed, 14 Jun 2000 09:18:24 +0200

for me it helped to start devfsd before vgscan
Cheers 
Tobias

----- Original Message ----- 
From: <zoo1@corecomm.net>
To: <linux-lvm@msede.com>
Sent: Tuesday, June 13, 2000 1:08 AM
Subject: [linux-lvm] vgscan fails to find vg


> i'm trying to convert my old mandrake 6.0 system to lvm, using a
> 2.4.0test kernel, lvm-0.8final and devfs, and i'm having a hard time
> getting my rc scripts to work. on bootup, vgscan fails to find the vg
> for no reason i can think of.
> 
> i'm working around this with the kludge of vgexport on shutdown and
> vgimport on bootup, which works, but just doesn't seem right. i've got a
> 32KB debug output file of vgscan failing; what would be the best way of
> submitting it to whom?
> 
>
