Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2TMEB11016812
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 18:14:11 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2TME7Zr032743
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 18:14:07 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id p2TME5gr021914
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 18:14:05 -0400
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id p2TME5ps023896
	for <linux-lvm@redhat.com>; Tue, 29 Mar 2011 18:14:05 -0400
Date: Tue, 29 Mar 2011 18:14:05 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <CE3415B4EB40445F8F294A52BC905070@caramon>
Message-ID: <alpine.LRH.2.00.1103291804330.23827@bmsred.bmsi.com>
References: <DE6049702F6A4634890B18D047C27E03@caramon>
	<20110329124434.3cf62c3e@bettercgi.com>
	<CE3415B4EB40445F8F294A52BC905070@caramon>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 29 Mar 2011, Fredrik Skog wrote:

> 1> I made a partition /dev/sde1 with Linux LVM
> 2> Run a "pvcreate /dev/sde1"
> 3> Run "vgextend vgftp /dev/sd1"
> 4> Run "lvextend -L+400G /dev/vgftp/lvftp"
> 5> Run "umount /dev/vgftp/lvftp"
> 6> Run "e2fsck -f /dev/vgftp/lvftp"
> 7> Run "resize2fs /dev/vgftp/lvftp"
>   resize2fs 1.41.10 (10-Feb-2009)
>   Resizing the filesystem on /dev/vgftp/lvftp to 1115800576 (4k) blocks
> 8> Here it all hangs. I cant do anything with the filesystem or LVM. every 
> command i do hangs.

The resize will take a very long time.  Did you try these commands on another
terminal?  Did you check the disk activity light?

>    I edited fstab so my LVM is not remounted on reboot, and rebooted.
>    Here I am right now.

That was probably a bad idea if the disk was still busy extending your
filesystem.

> I can run LVM commands fine now after the reboot and the output from 
> pvdisplay and lvdisplay is like i posted earlier.
> How can i revert this in a safe way? I was thinking of just removing the PV 
> and do a vgcfgrestore to "before" the lvextend.
> But since lvdisplay says the volume is 4.16TiB and pvdisplay says 5.59TiB 
> something is wrong? Or am I missing something?

lvdisplay will almost never show the same as pvdisplay.  One displays
*logical* volumes and the other *physical* volumes.

> I tried a " vgreduce vgftp /dev/sde1" to remove my new drive again, but this 
> only gives me an error "Physical volume "/dev/sde1" still in use"

Of course, because your extended LV is using it.

> I think this is strange because the pvdisplay seems to think i have not yet 
> added the PV but pvdisplay does.

Presumably you meant "lvdisplay" for one of the above.  What does
lvdisplay show for the size of your LV?  Also, try out "lvs" and "pvs"
for shorter output.  Include output in your response.

> If i do a lvreduce i fear something will break.

Even more than it is now, yes.

> Is it better to do a e2fsck now?

That is probably the only way to salvage what is left of your filesystem,
but don't do it until we find out whether the LV is the old or the new size.
I suspect the LV will be the new size, but the filesystem may still show
the old size.  Since the resize2fs should be just adding free space, 
there may not be any data loss.  e2fsck would fix the (now corrupt)
free space, and you can extend again.

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
