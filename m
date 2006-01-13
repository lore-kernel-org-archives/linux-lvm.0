Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0DI9R102775
	for <linux-lvm@redhat.com>; Fri, 13 Jan 2006 13:09:27 -0500
Received: from hotmail.com (bay103-f2.bay103.hotmail.com [65.54.174.12])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0DI9QKk031663
	for <linux-lvm@redhat.com>; Fri, 13 Jan 2006 13:09:26 -0500
Message-ID: <BAY103-F2E07AF1679A7B42131195D2260@phx.gbl>
In-Reply-To: <43C7BF09.3000003@fastenal.com>
From: "Crazyguy78 Anderton" <crazyguy78@msn.com>
Subject: Re: [linux-lvm] And another hdd to my LVM
Date: Fri, 13 Jan 2006 11:09:20 -0700
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Thanks that worked. I was using  jfs.


>From: Kelly Sauke <ksauke@fastenal.com>
>Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
>To: LVM general discussion and development <linux-lvm@redhat.com>
>Subject: Re: [linux-lvm] And  another hdd to my LVM
>Date: Fri, 13 Jan 2006 08:54:01 -0600
>
>Use lvextend to extend the logical volume.  Then use ext2online (assuming 
>you are using the ext2 or ext3 filesystem) to extend the filesystem.
>
>Crazyguy78 Anderton wrote:
>>When I Frist install fedora 4 I made a Lvm on  one of my harddrive 
>>/dev/sdb5 and mount it to /video  and now I want to  add another hdd. well 
>>now I got to where I set up the drive in Logical volume Management and 
>>show both drive under Volgroup00. But I cannot figure out how to get the 
>>other drive Show up to /video mount so I can Have more space.
>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
