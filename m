Date: Mon, 26 Jul 1999 22:25:50 +0200 (CEST)
From: Ingo Molnar <mingo@chiara.csoma.elte.hu>
Reply-To: Ingo Molnar <mingo@chiara.csoma.elte.hu>
Subject: Re: [linux-lvm] RAID and LVM?
In-Reply-To: <Pine.LNX.4.10.9907261949360.14960-100000@hibernia.spin.ie>
Message-ID: <Pine.LNX.3.96.990726222206.21028A-100000@chiara.csoma.elte.hu>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Jakma <paul@clubi.ie>
Cc: Luca Berra <bluca@comedia.it>, linux-lvm@msede.de, bluca@colombina.comedia.it, linux-lvm@msede.com


On Mon, 26 Jul 1999, Paul Jakma wrote:

>   new way!
>  you better check alans patch it is on kernel.org mirrors
>
> great... alan must have exercised his magic coding fingers and
> massaged the two patches into their proper places :)

(rather flame me for it ;) The new RAID driver will likely not go into
2.2.11, but into 2.2.12. Anyway, the new RAID 0723 release is much more
merging-friendly wrt. LVM.

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

or, considering the relative complexity of the two drivers (and the
conceptual background), to integrate LVM into the concepts of RAID :) Or
let them live side by side as now.

-- mingo
