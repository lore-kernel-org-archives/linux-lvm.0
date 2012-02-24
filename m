Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1OLwuSa032091
	for <linux-lvm@redhat.com>; Fri, 24 Feb 2012 16:58:56 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1OLwtTg004131
	for <linux-lvm@redhat.com>; Fri, 24 Feb 2012 16:58:55 -0500
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q1OLw6bC025058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 24 Feb 2012 16:58:06 -0500
Message-ID: <4F48081D.8070901@bmsi.com>
Date: Fri, 24 Feb 2012 16:58:53 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <CALLsPVhgBoZiPU6GR_UAjE31ZFOjyTkUeF03ddt5_+B6YD=16g@mail.gmail.com>
In-Reply-To: <CALLsPVhgBoZiPU6GR_UAjE31ZFOjyTkUeF03ddt5_+B6YD=16g@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Question for LVM feasibility and usage on the
 embedded linux
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Long ago, Nostradamus foresaw that on 02/23/2012 08:00 PM, 박준모 would 
write:
> Actually, i know that LVM solution is very attractive for engineer 
> and/or system which have multiple disks.

> But, in my case, i have a only one disk(2TB) and i need to 
> expand/shrink the partition dynamically according to the user request 
> while file systems are online(without reboot or backup).

LVM expands/shrinks logical volumes (which you use instead of 
partitions) while filesystems are online - that is a standard function. 
It doesn't matter how many disks you have. Most desktops have just one.

As to whether the *filesystem* can expand or shrink online - that 
depends on the filesystem. ext3 and ext4 can expand online, but not 
shrink online. In general, it is a lot easier for a filesystem to 
support expanding online that shrinking online. However, you can unmount 
and shrink a filesystem and its underlying LV without disturbing other 
filesystems. (As you would with partitions.)

>
> Requested Feature
> 1) expand/shrink the partition dynamically according to the user request.
> 2) space limitation per each partition or directory.
Not sure what you mean by "space limitation". Each LV has a size, yes.
>
> This is my user scenario.
> 1) Let's say that 500G is for shared folder and another 500G is for 
> multimedia folder. And 1TB is a free disk space.
> 2) shared folder can use additional free disk at any time up to 1TB 
> freely if free space is available.. But, multimedia folder can't use 
> additional space without user permission and it can use only 500G space.
> 3) Let's say shared folder have 1.5TB now. But,if multimedia folder 
> want to expand their space with 500G(Total 1TB), system MUST allocate 
> additional space to multimedia folder. In this case, shared folder 
> should be shrunk to 1TB and multimedia folder should be expanded up to 
> 1TB.
> 4) Now, user can't write the data to the each folder over 1TB.
>
>
> 1) Does LVM suitable solution for me?( only 2TB one disk)
Again, the number of disks is not relevant.

Adding space to either filesystem while live is fully supported with 
many filesystems, including ext3 and ext4. However, this depends on an 
administrator issuing commands to add the space. You can also set up a 
script to check free space, and add more when it gets low. Shrinking 
requires unmounting with all the filesystems I am familiar with.
> 2) Do you know any case study on embedded system or similar with my 
> situation?
It is pretty standard on any system. Even a home desktop will have 
several filesystems which are expanded as needed.
> 3) Could you give me any comments or guidance?
It sounds like you need to install a linux distro with LVM on a desktop 
or laptop and start using it. Try Fedora - but don't use the default 
layout (which uses LVM but allocates all free space to the root 
filesystem). Allocate only 10G for the root filesystem. After installing 
and updating, allocate, initialize, and mount a /home filesystem of 10G. 
While logged in, and using the GUI, expand /home to 20G. That will give 
you the basics. Now create /shared and /multimedia filesystems.
