Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7FDb1ko015522
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 09:37:01 -0400
Received: from smtp-01.arnet.com.ar (smtp-01.arnet.com.ar [200.45.191.24])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k7FDaqjX028115
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 09:36:52 -0400
Message-ID: <44E1B9DB.3030403@arnet.net.ar>
Date: Tue, 15 Aug 2006 09:11:07 -0300
From: German Staltari <gstaltari@arnet.net.ar>
MIME-Version: 1.0
Subject: Re: [linux-lvm] expanded volume
References: <44E1AB70.8080702@arnet.net.ar>
	<20060815114516.GA16285@cobalt0.panici.net>
In-Reply-To: <20060815114516.GA16285@cobalt0.panici.net>
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

paddy wrote:
> On Tue, Aug 15, 2006 at 08:09:36AM -0300, German Staltari wrote:
>   
>> Hi, I've expanded a LV but the disks that I've added to the LV/VG are 
>> not being used (the I/Os to this disks are almost null and the old ones 
>> still with high I/Os). Is there a way to force I/O to the new disks?
>>     
>
> did you resize the filesystem? what filesystem(s) are you using?
>
> Regards,
> Paddy
>   
Yes, the FS was resized. I'm using ext3.
Thanks,
German
