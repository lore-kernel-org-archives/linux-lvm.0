Date: Wed, 31 May 2000 11:01:28 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] SuSE/LVM boot problem
Message-ID: <20000531110128.A22796@gruyere.muc.suse.de>
References: <390FD771.DB59EECB@msede.com> <20000503095326.A4439@archimedes.suse.com>
Mime-Version: 1.0
In-Reply-To: <20000503095326.A4439@archimedes.suse.com>; from dgould@suse.com on Wed, May 03, 2000 at 09:53:26AM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dgould@suse.com
Cc: adilger@turbolabs.com, linux-lvm@msede.com

On Wed, May 03, 2000 at 09:53:26AM -0700, dgould@suse.com wrote:
> If I have understood this, we need the following to make this
> work (some of this may already exist):
> 
>  - lvm needs to provide an way for other programs to translate logical
>    blocks to physical

A physical equivalent to FIBMAP. Not too hard to implement I think.  

> 
>  - lvm needs to have a way of tracking/enforcing/satisfying the constraint
>    that specified lvs need to be in the bios bootable physical area

That's pretty much impossible. How would e.g. LVM find out that the scsi
controller of disk X does not have a boot rom? You have to trust the user there.

> 
>  - lilo needs to understand about lvm and use the lvm provided ways to
>    get physical mappings.

That's complicated. Someone did a similar hack for RAID0, but LVM is more
complicated than MD RAID0. Better just supply the real block numbers to lilo
and rerun it as needed (LVM could warn about it) 

> 
>  - the kernel needs to be able to reconstruct enough of the lvm
>    descriptors to mount / at boot time.

That's handled in the initrd (lilo loads kernel + initrd, initrd contains
LVM tools) 


-Andi
