Message-ID: <34BE27FD7F4BD111B9C600805F15B7DC016E7DA4@info-akh.linz.at>
From: Michelic Adalbert <adalbert.michelic@akh.linz.at>
Subject: Re: [linux-lvm] Cannot access VG due to "hd error"
Date: Thu, 3 Aug 2000 09:38:45 +0200 
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Justin Hamilton' <JHamilton@Earthling.Net>, "'linux-lvm@msede.com'" <linux-lvm@msede.com>

Hello Justin,

Justin Hamilton wrote:
> I believe this is a Kernel issue.  Take a look at the following,
> I think it fits you needs:
> 
> ATA/IDE/MFM/RLL support
> ->IDE, ATA and ATAPI Block devices
> --->Use multi-mode by default
> 
> CONFIG_IDEDISK_MULTI_MODE:
> 
> If you get this error, try to say Y here:
> hda: set_multmode: status=0x51 { DriveReady SeekComplete Error }
> hda: set_multmode: error=0x04 { DriveStatusError }
> If in doubt, say N.

I have tried the CONFIG_IDEDISK_MULTI_MODE kernel option - but
unfortunately it doesn't help.

I tried to make a ReiserFS on the "defect" disk and copying a lot
of files from and to the disk (on the same machine) - everything
works without a single problem. But if I restore the LVM-PV from
my backup disk the problems start again.

Could it be, that the LVM on-disk structures are corrupted and
vgscan therefore accesses the disk in a wrong way which then
causes this kernel messages?


BTW: I have some logical volumes on the first disk of the volume
group - is it possible to use only these volumes?
Currently my /usr-volume is in the defect VG (on the first disk) -
and therefore I can't do anything with my machine ...


Rgds, Adalbert
