Date: Tue, 14 Nov 2000 07:59:10 +0100
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] Error -154 can't get data from VG
Message-ID: <20001114075910.A370@jadzia.josv.com>
References: <F2830mJWEsBk31TZ14e0000251d@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F2830mJWEsBk31TZ14e0000251d@hotmail.com>; from brunokc@hotmail.com on Mon, Nov 13, 2000 at 02:27:57PM -0800
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Kraychete da Costa <brunokc@hotmail.com>
Cc: linux-lvm@msede.com

I guess that even when your / is in an LV, it still has to be (or most
probably will be) contiguous on the disk? This would mean that you 
could handforge a partition table entry that maps exactly the root file 
system. The size does not even matter (make it the rest of the disk), 
as long as the start sector is allright. Such a partition table entry 
would allow you to mount the /, even though it is in an LV.

If you want a good set of recovery tools, download an ISO image of the
LinuxCare bootable business card (http://www.linuxcare.com/bootable_cd)
and burn it on a CD. You then have at least a serious amount of tools to
help you in the repair.

++Jos

And thus it came to pass that Bruno Kraychete da Costa wrote:
(on Mon, Nov 13, 2000 at 02:27:57PM -0800 to be exact)

> 
> Hi,
> 
> I'm writing from this hotmail account because my main machine is down. It 
> has LVM, but after some problems, I cannot seem to get it up again. It's a 
> SuSE 7.0 with kernel 2.4.0-test9. I was using LVM tools from suse 
> distribution (lvm-0.8-131) and I'm not sure what patches they incorporated 
> yet. I've got /dev/hda1 as my /boot (20MB) and all other partitions (/, 
> home, var, tmp, swap) in the "rootvg" volume group.
> 
> Well, the history. I added a second HD to my machine and was planning to add 
> it to my "rootvg". I actually made that far. I had this "data" LV and I was 
> planning to make the new HD as my new "data". So I deactivated the current 
> "data" LV, renamed it to "olddata" and created the new one in the new space 
> coming from the new HD. Now, all I had to do was to copy the contents from 
> "olddata" to "data". Whe I tried to mount /dev/rootvg/olddata, Linux froze. 
> Tried SysReq, no go. Thinking a little, I remembered that I had forgotten to 
> make that LV ("olddata") active again. Pushed reset button with my fingers 
> crossed. The initrd failed to find my old /dev/rootvg/root LV. Crap! :(
> 
> Using SuSE7 boot disk, I managed to get a shell with LVM tools available. 
> Vgscan and vgchanged succeeded and I could find the reason why my initrd 
> failed. /dev/rootvg/root was not the "3a:00" device anymore. It was now 
> "3a:01". Changed my initrd, umounted /dev/rootvg/root and rebooted. Got the 
> same error again. I must have changed the wrong thing. No problems ... let's 
> do it again. Booted from SuSE7 floppy to the shell with LVM tools and ... 
> vgscan is now failing!! I'm getting "error -154 can't get data from physical 
> volumes" or something like that. I cannot restore my /etc/lvmtab because my 
> /etc dir is inside /dev/rootvg/root :( When I first booted from the boot 
> disk and got LVM to work, it created /etc/lvmtab*, but it did so in the 
> ramdisk. Given that, I have the following questions:
> 
> 1) Why my Linux box froze when I (accidently) tried to mount an inactive LV? 
> Shouldn't it throw some error message or something?
> 
> 2) Why LVM didn't get corrupted when my box froze, but then got corrupted 
> when I simply rebooted my box? :(
> 
> 3) Since we have now some people that put their / in a volume group, isn't 
> it a good idea to have LVM save VGDA backups outside a LVM volume group? 
> (next time I can get my box to boot, I'll make a link from /etc/lvm* to 
> /boot/lvm/lvm*, so VGDA data will be stored in /dev/hda1).
> 
> So, from your experience, do you think it is possible to get my data back 
> from LVM's current state in my machine? All I have available is this shell 
> with LVM tools from SuSE7 boot disk. :(
> 
> Thank you for your help,
> 
> Bruno.
> 
> _________________________________________________________________________
> Get Your Private, Free E-mail from MSN Hotmail at http://www.hotmail.com.
> 
> Share information about yourself, create your own public profile at 
> http://profiles.msn.com.

-- 
Success and happiness can not be pursued; it must ensue as the 
unintended side-effect of one's personal dedication to a course greater 
than oneself.
