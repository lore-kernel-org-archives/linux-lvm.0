Date: Wed, 11 Oct 2000 13:26:41 -0500 (EST)
From: Brian Poole <raj@cerias.purdue.edu>
Subject: Re: [linux-lvm] lvdisplay disagrees with df for resized LV
In-Reply-To: <m23di3l4ux.fsf@puma.redeye>
Message-ID: <Pine.SOL.4.10.10010111323250.2606-100000@basm.cerias.purdue.edu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Cowling <andy@redeye.com>
Cc: linux-lvm@msede.com

> I have resized the file system to 90G successfully but, there always a
> but isn't there :-), df now reports a total of 88Gb.
>
> Out of interest is this due to rounding or reisfer/LVM housekeeping ?

Neither, this is actually a misperception of what a Gb really is. A Gb is
_not_ 1000Mb, despite what harddrive manufacturers will gladly tell you,
it is 1024Mb, and a Mb is really 1024Kb, and so on.

Taking a look at your particular case, 90,000 Mb divided by 1024 (not
1000, so it isn't 90) to get Gbs is 87.89G, which is indeed exactly what
you have, no?


-b
