Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3ND9iO22728
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2005 09:09:44 -0400
Received: from mail.samera.com.py (mail.samera.com.py [200.85.40.10])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3ND9Ug8005255
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2005 09:09:36 -0400
Received: from [192.168.1.1] (sojourner.samera.com [192.168.1.1])
	by mail.samera.com.py (8.12.8/8.12.8) with ESMTP id j3ND9KKA032336
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2005 09:09:21 -0400
Message-ID: <426A4903.8060403@samera.com.py>
Date: Sat, 23 Apr 2005 09:09:23 -0400
From: "Oliver Schulze L." <oliver@samera.com.py>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Resizing root lvm
References: <4269D703.9030801@samera.com.py>
	<20050423075218.GA20444@percy.comedia.it>
In-Reply-To: <20050423075218.GA20444@percy.comedia.it>
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

Thanks Luca,
I just resised it using:
# ext2resize /dev/LocalGroup0/LocGroup00

Regards,
Oliver


Luca Berra wrote:

> On Sat, Apr 23, 2005 at 01:02:59AM -0400, Oliver Schulze L. wrote:
>
>> Hi,
>> I just installed the trial of RHEL4, I noted that the autopartition 
>> selected
>> a LVM configuration for the root partition.
>> I wanted to know if it is posible to add a new partition and then 
>> resize the
>> root partition.
>>
>> I have tryied but could not make the ext3 filesistem to grow. The lv 
>> have
>> become bigger, but not the filesystem.
>>
>> How can I resize the filesystem too?
>>
> RH4 supports online resizing of filesystems, read the
> release-notes
> (http://www.redhat.com/docs/manuals/enterprise/RHEL-4-Manual/release-notes/as-x86/) 
>
>
> L.
>

-- 
Oliver Schulze L.
<oliver@samera.com.py>
