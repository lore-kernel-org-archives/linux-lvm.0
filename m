Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2R4UXpn017897
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 00:30:33 -0400
Received: from mail.bmsi.com (mail.bmsi.com [68.106.146.44])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2R4UUG3021633
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 00:30:31 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id r2R4UToG000656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 00:30:29 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by bmsred.bmsi.com (8.14.4/8.14.4) with ESMTP id r2R4TM7L027449
	for <linux-lvm@redhat.com>; Wed, 27 Mar 2013 00:29:23 -0400
Date: Wed, 27 Mar 2013 00:29:22 -0400 (EDT)
From: Stuart D Gathman <stuart@bmsi.com>
In-Reply-To: <5151A59B.5010909@bmsi.com>
Message-ID: <alpine.LRH.2.03.1303270026120.27414@bmsi.com>
References: <FAAB9C9B-FCA0-43CB-8B2C-F4F389941AAE@me.com>
	<533CFD97-2715-4B1C-A8C5-02161911747D@googlemail.com>
	<51509ECB.4050901@bmsi.com>
	<244E0086-C561-4034-BF26-31DFC419B72F@googlemail.com>
	<5150B555.4010207@bmsi.com>
	<0FEAF33E-7395-4820-9732-AFE70D3B5877@googlemail.com>
	<5150C1F8.8090107@bmsi.com>
	<CA+iDeo3WTK1gEiVzdmqA=kJ4nksZH-P76O1pBCL3MCTeme4zqg@mail.gmail.com>
	<5151A59B.5010909@bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mar 26, Stuart D Gathman transmitted in part:

> Why has the offset shifted?  Possibilities:
>
> 1) different md driver version on knoppix (although using an older
> version would move the md superblock from end of drive to beginning of
> drive - shifting the opposite way).  Or different options.  BUT mdadm
> seemed to recognize your RAID, so let's
> discount this theory.
>
> 2) alignment options to pvcreate - but it still should have been seen by
> lvs!
>
> 3) the offset hasn't shifted, but you've written over the first few
> sectors with the empty VG.  Is the 2nd human readable part, by any
> chance, missing the first part?  You could post both parts for us to
> look at.

4) the shape of the md array changed.  Say, you somehow didn't 
actually remove the failed drive before adding the replacement.  What
does md raid10 do if you add a 4th disk to a 3 drive array?  Add
it as a spare?  Reshape, shuffling all your data?
