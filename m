Date: Mon, 2 Aug 1999 09:57:24 +0100 (BST)
From: James Pattinson <jamesp@aethos.co.uk>
Subject: Re: [linux-lvm] RAID and LVM?
In-Reply-To: <Pine.LNX.4.10.9907261949360.14960-100000@hibernia.spin.ie>
Message-ID: <Pine.LNX.4.10.9908020953470.2161-100000@fuse.aethos.co.uk>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Is anyone using alan's ac12 patch for RAID and LVM? My machine at home has
2.2.10 with raid0145 applied, and my root partition is striped across two
hd/s controllers. I want to be able to use LVM though.

I downloaded alan's patch, but then couldn't get LVM tools to compile at
all. Do I need to upgrade to a new glibc or something? I'm running more or
less a basic RH6 system.

Any tips?

Cheers!

James

>   new way!
>   you better check alans patch it is on kernel.org mirrors
> 
> great... alan must have exercised his magic coding fingers and
> massaged the two patches into their proper places :)  
> 
>   we have to set the partition as a raid autodetect partition
>   then create an initrd with the command
>   insmod lvm.o
>   vgscan
>   vgchange -a y
>   
> uhmm.. but i think eventually for LVM on RAID autodetect to work
> nicely, LVM is going to have to use some block device contents magic.
> 
> or ideally for raid to be fully integrated into LVM, and create
> RAID-5 VG's. 
> 
>   the problem is that when raid is loaded as a module autodetect
>   does not happen than when initrd is finished :(
>   
>   L.
>   
>   
> i'm downloading your patch now anyway. 
> 
> regards,
> -- 
> Paul Jakma
> paul@clubi.ie	http://hibernia.clubi.ie
> PGP5 key: http://www.clubi.ie/jakma/publickey.txt
> -------------------------------------------
> Fortune:
> A meeting is an event at which the minutes are kept and the hours are lost.
> 
> 
> 
