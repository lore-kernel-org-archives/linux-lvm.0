Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0IK7AO21815
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 15:07:10 -0500
Received: from svsmail.gsfc.nasa.gov (svsmail.gsfc.nasa.gov [128.183.34.28])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0IK751s001618
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 15:07:05 -0500
Received: from [128.183.34.47] (nu.gsfc.nasa.gov [128.183.34.47])
	by svsmail.gsfc.nasa.gov (Postfix) with ESMTP id C6186801F7
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 15:07:04 -0500 (EST)
Message-ID: <41ED6C68.10109@svs.gsfc.nasa.gov>
Date: Tue, 18 Jan 2005 15:07:04 -0500
From: "Randall A. Jones" <rajones@svs.gsfc.nasa.gov>
MIME-Version: 1.0
Subject: Re: [linux-lvm] snapshots and nfs
References: <dff37527050118093648e504e@mail.gmail.com>	<20050118194449.GQ26670@agk.surrey.redhat.com>
	<dff3752705011811541b040c4e@mail.gmail.com>
In-Reply-To: <dff3752705011811541b040c4e@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Kristina Clair wrote:

>On Tue, 18 Jan 2005 19:44:49 +0000, Alasdair G Kergon <agk@redhat.com> wrote:
>  
>
>>On Tue, Jan 18, 2005 at 12:36:06PM -0500, Kristina Clair wrote:
>>    
>>
>>>so, is there a way to have lvcreate not suspend the volume?  I'm using
>>>xfs, so I should be able to freeze the filesystem.
>>>      
>>>
>> 
>>Quick question: you're not running xfs_freeze are you?
>>If so, try without, as device-mapper does the equivalent of that
>>internally and xfs can't handle things if it gets run twice.
>>    
>>
>
>No, if I run xfs_freeze first, lvcreate hangs when it tries to suspend
>the volume, so I stopped doing that.
>Now, if I run lvcreate shortly after the machine is booted, it runs
>successfully.  However, if I try to run the same command the next day,
>after it's been online and the webservers have had the filesystem
>mounted, it hangs when trying to suspend the volume.
>
>  
>
Is it possible that mounting the NFS mounts on the webservers read-only 
as a temporary measure while creating the snapshot will help?

>So I'm wondering if the problem is that the webservers have the
>filesystem mounted and in use (apache is serving pages from it),  I'm
>trying to find a way to keep the filesystem mounted over nfs but still
>be able to create snapshots, and I was wondering if I could use
>xfs_freeze and have lvcreate not try to suspend the volume.
>
>Thanks,
>Kristina
>
>  
>
-- 
..:.::::
Randall Jones     GST      NASA Goddard Space Flight Center
HPC Visualization Support       http://hpcvis.gsfc.nasa.gov
Scientific Visualization Studio    http://svs.gsfc.nasa.gov
rajones@svs.gsfc.nasa.gov      Code 610.3      301-286-2239
