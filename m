Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8UJWaf4018903
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2008 15:32:36 -0400
Received: from n8.bullet.re3.yahoo.com (n8.bullet.re3.yahoo.com
	[68.142.237.93])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m8UJWOoc029308
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2008 15:32:24 -0400
From: Steve Brueggeman <xioborg@yahoo.com>
Subject: Re: [linux-lvm] lvm over loop device
Date: Tue, 30 Sep 2008 14:32:23 -0500
Message-ID: <sbv4e49co2f8nhe2e9rpreo3co90ss7vbs@4ax.com>
References: <db00b3d70809260504j1754c205v9044f069c37e2c24@mail.gmail.com>
	<48E09B18.6030908@redhat.com>
	<1222681480.6519.33.camel@geert-laptop>
In-Reply-To: <1222681480.6519.33.camel@geert-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

I didn't see any replies to this, so I thought I'd post what I've found.

You have to specify a smaller extent size when creating the volume group.  The
default extent size is 4MB, which is larger than your physical device on
/dev/loop1 (use the -s option)

For example, try this instead, which would give 4 extents on the 1MB physical
device on /dev/loop1 (I think.  I am not certain about how much metadata exists
on the physical device for LVM2)

>vgcreate SmallDiskGroup -s256k /dev/loop0 # create a new volumegroup using the
>loop0 device as phisical volume.

Steve.


On Mon, 29 Sep 2008 11:44:40 +0200, you wrote:

>Hello Bryn,
>I haven't had the time yet to try Stuart's suggestion... I've re did my
>attempt to create the lv though, and this time with the -vvv option in
>the step where I create the lv.
>my steps:
>dd if=/dev/sdb1 of=./disk0 # copy a existing LVM-partition to a file
>losetup -f ./disk0 	   # link the file to a loop device
>pvcreate /dev/loop0	   # create a pv using the file
>vgcreate SmallDiskGroup /dev/loop0 # create a new volumegroup using the
>loop0 device as phisical volume.
>vgchange -a y SmallDiskGroup #Activate the volumegroup
>
>nb. vgdisplay SmallDiskGroup gives 'Act PV 1' but 'MAX LV 0'
>
>the output of lvcreate -vvv -L1 -nSmallDiskVolume SmallDiskGroup is
>downloadable here: http://pastebin.com/pastebin.php?dl=m2b9dcd7f
>
>I hope you can find anything.
>
>Greetings,
>Geert
>  
>On Mon, 2008-09-29 at 10:08 +0100, Bryn M. Reeves wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>> 
>> geert Geurts wrote:
>> > So what I did first create a LVM partition of 1MB on a memorystick and then 
>> > change the if of dd to point to the LVM partition, I'm now able to pvcreate 
>> > /dev/loop0, vgcreate SmallDisk /dev/loop0.
>> > But I'm unable to create a logical volume in the SmallDisk group...
>> > what am I doing wrong here? is it even possible if not why?
>> 
>> Hi Geert,
>> 
>> What was the error you were getting at this point? If possible, can you
>> use a service like pastebin.com to post the complete output of "lvcreate
>> - -vvv" with the options you're using for the SmallDisk VG. That should
>> give enough detail to have some idea where it's failing.
>> 
>> I think the idea is reasonable enough although you'll probably need to
>> do some fiddling around to get the size/number of the gmailfs volumes
>> right to give good performance.
>> 
>> Snapshots could definitely work here but I think it might be a bit
>> tricky without some of the patches that are currently outstanding for
>> device-mapper, esp. Mikulas' snapshot merging patches which you'd need
>> to "restore" one of the COW areas. See the thread here:
>> 
>> http://kerneltrap.org/Linux/LVM_Snapshot_Merging
>> 
>> Regards,
>> Bryn.
>> 
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.9 (GNU/Linux)
>> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>> 
>> iEYEARECAAYFAkjgmxgACgkQ6YSQoMYUY96LegCcCHPZNLfhTUjIrsLiJcgROTDV
>> +SwAoLFQDiGpkZl5tpEFW5hjFH+6OuAj
>> =i+W8
>> -----END PGP SIGNATURE-----
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
