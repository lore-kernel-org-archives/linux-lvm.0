Message-ID: <3DCD6269.6010508@mvista.com>
From: Steven Dake <sdake@mvista.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] cant mount LV via partition/filesystem labels
References: <3DCA84BB.9050404@jumpline.com> <1036691083.13804.59.camel@hawk.birddog.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Sat Nov  9 13:30:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I wouldn't mind seeing the patches.

Thanks
-steve

Kirby C. Bohling wrote:

>On Thu, 2002-11-07 at 09:20, Ben Snyder wrote:
>  
>
>>Here's what I've got:
>>
>>RH7.2, kernel  2.4.9-34enterprise
>>
>>1 physical volume each on /dev/sda9 and /dev/sdb1
>>one logical volume over these two PV's
>>
>>I've labeled the filesystem via 'tune2fs' and want to use the label for 
>>mounting purposes, as is the default with the other (non-LVM) filesystems
>>
>>'vgscan' and 'vgchange -a y' have been performed
>>'vgdisplay' and 'lvdisplay' tell me all is well - everthing is 
>>read/write and available
>>'fsck' on the physical path reports clean...
>>
>>If I attempt to mount via the physical path to the LV, providing the 
>>mount point, everything works fine
>>
>>However, mount refuses to mount via filesystem/partition label, 
>>regardless if I use '-L' and provide the label or use the mountpoint and 
>>let mount figure it out on its own from /etc/fstab.  I get 'mount: no 
>>such partition found' (it is in /etc/fstab correctly, already checked that).
>>
>>Am I missing something about labels?  Maybe some other remedial 
>>filesystem characteristics/operations that I've missed because of 
>>cranius-up-rectus (head up a$$).
>>
>>    
>>
>
>I'm the guy sent in the patch to add LVM label support to mount and
>e2fsprogs.  I'm not sure RedHat 7.2 includes the proper version of those
>tools at all.  I've had problems were built by RedHat.
>
>The label stuff in mount and e2fsprogs reads /etc/partitions and
>searches all entries in that file for labels.  It doesn't search
>anything else.  LVM didn't (probably still doesn't) show up in etc
>partitions so label support fails.  It should search in the /proc files
>that have the LVM stuff to find them, and search for those.  That's what
>I added to the code, but I haven't seen it work since I sent in the
>patch.
>
>It's not hard to modify the code, I didn't bother figuring out why the
>redhat tools fails.  It wasn't terribly important to me.  If you want to
>look at it I will.  If nothing else I can send you a patch that you can
>use to rebuild your source RPM with.
>
>	Thanks,
>		Kirby
>
>
>
>
>  
>
>>Thanks in advance for feedback/suggestions.
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@sistina.com
>>http://lists.sistina.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>    
>>
