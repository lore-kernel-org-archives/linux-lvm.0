Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3GLbEV8008833
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2008 17:37:14 -0400
Received: from mta-fe.casema.nl (cas-mta3-fe.casema.nl [83.80.1.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3GLaumX019911
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2008 17:36:56 -0400
Received: from localhost (cas-filter5.mgmt.casema.nl [10.42.32.118])
	by mta-fe.casema.nl (Postfix) with ESMTP id 3E50C3DB7
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2008 23:36:50 +0200 (CEST)
Received: from mta-fe.casema.nl ([10.42.32.28])
	by localhost (cas-filter5.mgmt.casema.nl [10.42.32.211]) (amavisd-new,
	port 20024) with ESMTP id 9AVs1D3zXB3U for <linux-lvm@redhat.com>;
	Wed, 16 Apr 2008 23:36:50 +0200 (CEST)
Received: from denie (535484E6.cable.casema.nl [83.84.132.230])
	by mta-fe.casema.nl (Postfix) with SMTP id 074E43DEB
	for <linux-lvm@redhat.com>; Wed, 16 Apr 2008 23:36:49 +0200 (CEST)
Message-ID: <003e01c8a009$fa453ad0$0132a8c0@denie>
From: "Denie Andriessen" <denie@bokxing.nl>
References: <48061439.6040001@gmail.com>
	<20080416210439.GA31820@pretender.frop.net>
Subject: Re: [linux-lvm] LVM snapshot - "dd" file size
Date: Wed, 16 Apr 2008 23:36:49 +0200
MIME-Version: 1.0
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: LVM general discussion and development <linux-lvm@redhat.com>

A compressed dd can still be quite large, as there still might contain non 
zero values..

if you compress the image, a possible way to make the resulting files 
smaller is to:

- do a: 'dd if=/dev/zero of=/dummyfile' on the filesystem first (you might 
want to use 'bs' and 'count' parameters)
- if you topped off the disk, delete the all zero dummyfile.

The zipped result might be smaller. (both with dd and with tar..)

Regards,
Denie

----- Original Message ----- 
From: <dave@frop.net>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Wednesday, April 16, 2008 11:04 PM
Subject: Re: [linux-lvm] LVM snapshot - "dd" file size


> this has nothing to do with LVM.
>
> dd knows nothing about files, it just copies the entire device (or file or 
> whatever).
>
> tar will work, if you use the right command line switches. Search around 
> on the web for pointers on how to use it.
>
> Another intermediate way would be to compress the image you get with dd.
>
> On Wed, Apr 16, 2008 at 04:59:05PM +0200, Thomas Bellembois wrote:
>> Hi!
>>
>> I am using LVM partitions on a Debian Xen system.
>> I use LVM snapshots to clone and backup my virtual machines.
>>
>> I have noticed that the ISO file created with the "dd" command it much
>> bigger that the partition used space (actually 4.7GB for the ISO - 500MB
>> used space). No problem if I mount the LVM snapshot and "tar" all of the
>> data.
>>
>> I have googled the question and read that "dd" also copy "not used 
>> space".
>> Why is the ISO file so big ? Is the "tar" method less safe ?
>> Is there a better solution ?
>>
>> Thanks for your answers.
>>
>> Regards,
>>
>> Thomas
>>
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
