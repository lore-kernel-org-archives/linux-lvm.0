Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2TNgUV6012081
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 19:42:30 -0400
Received: from smtp.bredband2.com (smtp.bredband2.com [83.219.192.166])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2TNgPE1016245
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 19:42:25 -0400
Received: from caramon (c-83-219-217-17.cust.bredband2.com [83.219.217.17])
	(Authenticated sender: ba9826)
	by smtp.bredband2.com (Postfix) with ESMTPA id 11B2CE9645
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2011 01:42:24 +0200 (CEST)
Message-ID: <42AEB48A89934796B809CD50728FD78F@caramon>
From: "Fredrik Skog" <fredrik.skog@rodang.se>
References: <DE6049702F6A4634890B18D047C27E03@caramon><20110329124434.3cf62c3e@bettercgi.com><CE3415B4EB40445F8F294A52BC905070@caramon>
	<alpine.LRH.2.00.1103291804330.23827@bmsred.bmsi.com>
Date: Wed, 30 Mar 2011 01:42:59 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to fix missmatch between VG-size and LV-size?
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,
----- Original Message ----- 
From: "Stuart D. Gathman" <stuart@bmsi.com>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Wednesday, March 30, 2011 12:14 AM
Subject: Re: [linux-lvm] How to fix missmatch between VG-size and LV-size?


> On Tue, 29 Mar 2011, Fredrik Skog wrote:
>
>> 1> I made a partition /dev/sde1 with Linux LVM
>> 2> Run a "pvcreate /dev/sde1"
>> 3> Run "vgextend vgftp /dev/sd1"
>> 4> Run "lvextend -L+400G /dev/vgftp/lvftp"
>> 5> Run "umount /dev/vgftp/lvftp"
>> 6> Run "e2fsck -f /dev/vgftp/lvftp"
>> 7> Run "resize2fs /dev/vgftp/lvftp"
>>   resize2fs 1.41.10 (10-Feb-2009)
>>   Resizing the filesystem on /dev/vgftp/lvftp to 1115800576 (4k) blocks
>> 8> Here it all hangs. I cant do anything with the filesystem or LVM. 
>> every command i do hangs.
>
> The resize will take a very long time.  Did you try these commands on 
> another
> terminal?  Did you check the disk activity light?
>

I waited for a few days before i tried to interupt anything. I rebooted 
after a few weeks of not touching the computer. I checked for disk activity 
and found nothing.

>>    I edited fstab so my LVM is not remounted on reboot, and rebooted.
>>    Here I am right now.
>
> That was probably a bad idea if the disk was still busy extending your
> filesystem.
>
>> I can run LVM commands fine now after the reboot and the output from 
>> pvdisplay and lvdisplay is like i posted earlier.
>> How can i revert this in a safe way? I was thinking of just removing the 
>> PV and do a vgcfgrestore to "before" the lvextend.
>> But since lvdisplay says the volume is 4.16TiB and pvdisplay says 5.59TiB 
>> something is wrong? Or am I missing something?
>
> lvdisplay will almost never show the same as pvdisplay.  One displays
> *logical* volumes and the other *physical* volumes.
>
>> I tried a " vgreduce vgftp /dev/sde1" to remove my new drive again, but 
>> this only gives me an error "Physical volume "/dev/sde1" still in use"
>
> Of course, because your extended LV is using it.
>
>> I think this is strange because the pvdisplay seems to think i have not 
>> yet added the PV but pvdisplay does.
>
> Presumably you meant "lvdisplay" for one of the above.  What does
> lvdisplay show for the size of your LV?  Also, try out "lvs" and "pvs"
> for shorter output.  Include output in your response.
>

Yes, the later should be  lvdisplay

# vgs
  VG    #PV #LV #SN Attr   VSize VFree
  vgftp  12   1   0 wz--n- 5.59t 1.43t

# lvs
  LV    VG    Attr   LSize Origin Snap%  Move Log Copy%  Convert
  lvftp vgftp -wi--- 4.16t


>> If i do a lvreduce i fear something will break.
>
> Even more than it is now, yes.
>
>> Is it better to do a e2fsck now?
>
> That is probably the only way to salvage what is left of your filesystem,
> but don't do it until we find out whether the LV is the old or the new 
> size.
> I suspect the LV will be the new size, but the filesystem may still show
> the old size.  Since the resize2fs should be just adding free space, there 
> may not be any data loss.  e2fsck would fix the (now corrupt)
> free space, and you can extend again.
>
> --
>        Stuart D. Gathman <stuart@bmsi.com>
>     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 
> 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Thanks
/Fredrik Skog 
