Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8K6vCWI028331
	for <linux-lvm@redhat.com>; Thu, 20 Sep 2007 02:57:12 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l8K6v9kc009789
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 20 Sep 2007 02:57:11 -0400
Date: Thu, 20 Sep 2007 08:57:07 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm HA problem with  file descriptor left open
Message-ID: <20070920065707.GB12857@percy.comedia.it>
References: <46E4F110.6040003@ezpear.com>
	<20070917213319.GV18444@agk.fab.redhat.com>
	<46F13FE5.6010905@ezpear.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46F13FE5.6010905@ezpear.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Sep 19, 2007 at 11:27:33PM +0800, Hans wrote:
>Alasdair G Kergon wrote:
>>On Mon, Sep 10, 2007 at 03:24:00PM +0800, hans wrote:
>>   
>>>File descriptor 5 left open File descriptor 6 left open File descriptor
>>>7 left open File descriptor 8 left open File descriptor 9 left open File
>>>descriptor 10 left open File descriptor 11 left open File descriptor 12
>>>left open 0 logical volume(s) in volume group "vg0_sites" now active
>>>Is it possible to force LVM
>>>to close descriptors?
>>>     
>>  
>>Those are only harmless warnings - LVM2 does close the file descriptors.
>>It is only fatal under some selinux configurations.
>>
>>Alasdair
>>   
>
>Thanks for answer.
>But I don't think it is harmless. When my server shutdown , and my 
>backup is up high availability doesn't work.
>DRBD  doesn't start because of this error.
>After I manual set up drbd active, I can not see files created on main 
>machine .
>After I again start main machine and start DRBD I can see all files.
>I think it is problem with descriptors which cause errors in my HA.
>I heard that I can use CLVM, but I don't know how it is compatible with LVM.

I feel difficult to believe it is file descriptors that cause you
problems. That debug message is only annoying and i don't see why it is
there at all.

what i see from the scarce info you posted is:
>> LVM[8796]:      2007/09/10_14:55:26 INFO: Deactivating volume group
>> vg0_sites
>> LVM[8796]:      2007/09/10_14:55:26 INFO: File descriptor 3 left open
>> File descriptor 5 left open File descriptor 6 left open File descriptor
>> 7 left open File descriptor 8 left open File descriptor 9 left open File
>> descriptor 10 left open File descriptor 11 left open File descriptor 12
>> left open 0 logical volume(s) in volume group "vg0_sites" now active
so lvm is asked to deactivate vg vg0_sites and it does it, this appears
to be normal.
maybe _reading_ the log file of which you graciously let us know only
two lines will give you more hints about what is going on.
also if you are asking for help, detailing your configuration will
usually result in people being able to understand what you are talking
about.


finally if you suspect an issue with lvm you could configure debug
options under the "log" section of /etc/lvm/lvm.conf and analyze the
resulting logs.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
