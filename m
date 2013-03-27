Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2RCln13010586
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 08:47:49 -0400
Received: from mail-bk0-f44.google.com (mail-bk0-f44.google.com
	[209.85.214.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2RCllhk030719
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 08:47:47 -0400
Received: by mail-bk0-f44.google.com with SMTP id jk13so1060696bkc.17
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 05:47:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: "=?iso-8859-1?Q?Bj=F6rn_Nadrowski?=" <bjrnfrdnnd@gmail.com>
In-Reply-To: <alpine.LRH.2.03.1303270026120.27414@bmsi.com>
Date: Wed, 27 Mar 2013 13:47:43 +0100
Message-Id: <FFEB7E95-4D32-48DD-ACE4-83797C284C42@googlemail.com>
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
	<5150B555.4010207@bmsi.com>
	<0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
	<5150C1F8.8090107@bmsi.com>
	<CA+iDeo3WTK1gEiVzdmqA=kJ4nksZH-P76O1pBCL3MCTeme4zqg@mail.gmail.com>
	<5151A59B.5010909@bmsi.com>
	<alpine.LRH.2.03.1303270026120.27414@bmsi.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] vg disappeared after replacing disc in raid10
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

As I say, 
I do not think (maybe that is just a hope) that the offset did shift. 
I believe that because

* there are two complete vg descriptions in the same part at the beginning of the device, before and after my vgcreate action
* the older vg description has been replaced by the newer, actual one after the vgcreate action

I made absolutely sure that the failing device had been flagged as failed and removed via mdadm --remove. 
When I added the new drive, the raid10 only ran on three disks.

What do you think I should do?
restore the beginning of the device using the file md0.txt?
Then recreate the physical volume again using the -uuid switch?
But what then?


On Mar 27, 2013, at 5:29 , Stuart D Gathman <stuart@bmsi.com> wrote:

> On Mar 26, Stuart D Gathman transmitted in part:
> 
>> Why has the offset shifted?  Possibilities:
>> 
>> 1) different md driver version on knoppix (although using an older
>> version would move the md superblock from end of drive to beginning of
>> drive - shifting the opposite way).  Or different options.  BUT mdadm
>> seemed to recognize your RAID, so let's
>> discount this theory.
>> 
>> 2) alignment options to pvcreate - but it still should have been seen by
>> lvs!
>> 
>> 3) the offset hasn't shifted, but you've written over the first few
>> sectors with the empty VG.  Is the 2nd human readable part, by any
>> chance, missing the first part?  You could post both parts for us to
>> look at.
> 
> 4) the shape of the md array changed.  Say, you somehow didn't actually remove the failed drive before adding the replacement.  What
> does md raid10 do if you add a 4th disk to a 3 drive array?  Add
> it as a spare?  Reshape, shuffling all your data?
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
