Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2IKvtH2012800
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2010 16:57:55 -0400
Received: from n23.bullet.mail.ukl.yahoo.com (n23.bullet.mail.ukl.yahoo.com
	[87.248.110.140])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o2IKvjVC009178
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2010 16:57:45 -0400
Message-ID: <370327.39654.qm@web87113.mail.ird.yahoo.com>
References: <4A2CF3C24E05B348A46BAF5A7C4593D406F874F1@BTCMVEXC1-PRD.hq.netapp.com>
	<20100318145652.GB32200@redhat.com>
Date: Thu, 18 Mar 2010 20:57:44 +0000 (GMT)
From: chris procter <chris-procter@talk21.com>
In-Reply-To: <20100318145652.GB32200@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] how to change the volume group name of the attached
	backup
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

>> Hi,

>> 
>> I have a 2 Linux(RHL) machines (L1 and L2).  One is clone of other. I have 
>> taken the backup of a L1. Now I have attached that backup to L2.
>> 
>> Before attaching L2 has /dev/sda and after attatchement it has /dev/sdb
>> 
>> But I cant mount /dev/sdb as it is on LVM. As both are having same VG
>> NAME I can't even mount logical volume.
>> 
>> So I thought to change the volume group name of the 
>> second but not able to do that.
>>
>> My intention is to mount the backup of L1 in L2 to check all data are
>> 
>> correct.
>> 
>> Need your help to solve it.

>Please see: man vgimportclone
>
>Though vgimportclone is only provided in newer versions of lvm2 
> (>= 2.02.46).
>
>Mike

Just to expand on Mikes comments, you'll have two volume groups with the same name, but lvm thinks its just seeing the same vg twice because they both have the same uuid, and it will think sda and sdb are two paths to the same device because they have the same uuid as well.  

The good news is this is exactly the situation vgimportclone was written to solve so running something like (read the man page first, its good, Mike wrote it!)
#  vgimportclone -n MYNEWVG /dev/sdb 
should fix things for you.

The other bit of good news is that while vgimportclone only comes with versions of lvm >= 2.02.46 I think it  works on any RHEL 5.x  (it was written on rhel 5.0 iirc but I can't remember the lvm version)  so if you can get a copy from cvs or somewhere you should be ok.

If your using rhel 4 or earlier then you have a problem, but if you can present the clone to another machine (L3 :)  and run vgimportclone then present it back to L2 that should work.  Theres a bug somewhere in the rhel 4 version of lvm that means it doesn't respect changes to LVM_SYSTEM_DIR. 

chris


      
