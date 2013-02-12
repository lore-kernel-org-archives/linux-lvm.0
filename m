Message-ID: <511A1128.9060405@redhat.com>
Date: Tue, 12 Feb 2013 10:53:44 +0100
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <CAGvHCLnuhJXDKSRV5Sp5UkwoR9pGnb_9+Jhb1=eQN-=JP_N0eQ@mail.gmail.com>
In-Reply-To: <CAGvHCLnuhJXDKSRV5Sp5UkwoR9pGnb_9+Jhb1=eQN-=JP_N0eQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Removing a (potentially unused?) PV from a VG
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Harold Pimentel <haroldpimentel@gmail.com>

On 02/08/2013 09:18 PM, Harold Pimentel wrote:
> Hi all,
>
> So, I have the following setup:
>
> - Ubuntu 12,04
> - 1 6TB physical volume (the one with data) [ext4]
> - 1 13TB PV (no data... I think?) [ext4]
>
> Here is the story...
>
> - I created an ext4 on the 13TB PV, added the 13TB to the VG to make a
> 13TB volume group.

Moment. Why creating ext4 on the PV first?
You added PV to VG first, I guess.

> - Everything went fine and then I ran:
>
> Code:
>
> resize2fs /dev/volgroup/volume
>
>
> And to my surprise.. I couldn't resize past 16TB ! (crap! should have
> checked this first!).

OK, so did it resize to 16TB, right? So now you have 16TB FS over two 
PVs: 6TB + 10TB. You need to downsize the FS first.

Also, when resizing LVs, it is safer to use fsadm, to avoid common 
problem where people shrink LV before FS.

>
> So, nothing happened.. Now what I want to do is remove the 13TB PV
> from the VG and do something else with it... but I get the following
> error:
>
>
> Code:
>
> sudo vgreduce -t home_volume_group /dev/sdc1
>    Test mode: Metadata will NOT be updated.
>    Physical volume "/dev/sdc1" still in use
>
> I don't remember the message, but I was going to try to use pvmove to
> move stuff off of /dev/sdc1 and it failed stating something like "No
> available extents"... which I don't even expect to have anything
> written to that disk since nothing was written after the install.

If above still fails, try `pvmove --alloc anywhere /dev/sdc1`. It may help.

-- Marian

>
> How can I safely remove this PV from the VG?
>
>
> Thanks a bunch!
>
> Harold
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
