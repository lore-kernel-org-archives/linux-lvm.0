Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBIJGUns028213
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 14:16:31 -0500
Received: from clarity.mcc.ac.uk (clarity.mcc.ac.uk [130.88.200.144])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBIJFr8v031384
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 14:15:53 -0500
Received: from kelvin.its.manchester.ac.uk ([130.88.25.195])
	by clarity.mcc.ac.uk with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.63 (FreeBSD))
	(envelope-from <cs@networkingnewsletter.org.uk>) id 1J4huy-000CQl-Pd
	for linux-lvm@redhat.com; Tue, 18 Dec 2007 19:15:52 +0000
Received: from dyn-62-56-75-159.dslaccess.co.uk ([62.56.75.159]:50853
	helo=[192.168.1.64])
	by kelvin.its.manchester.ac.uk with esmtpa (Exim 4.43)
	id 1J4huy-0001ew-Lz
	for linux-lvm@redhat.com; Tue, 18 Dec 2007 19:15:52 +0000
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C93823E21AC9CD@an-ex.ActiveNetwerx.int>
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk>
	<1C8CF1EA1A5B5940B81B0710B2A4C93823E21AC9CD@an-ex.ActiveNetwerx.int>
Message-Id: <67500E55-99D2-4F59-9942-F014BEC4C8F2@networkingnewsletter.org.uk>
Content-Transfer-Encoding: 7bit
From: michael <cs@networkingnewsletter.org.uk>
Subject: Re: [linux-lvm] won't dual boot: 2 disks and LVM
Date: Tue, 18 Dec 2007 19:15:23 +0000
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


On 18 Dec 2007, at 18:19, Joseph L. Casale wrote:

>> Whilst I cannot find any definite reference stating "MS WinXP cannot
>> handle LVM" it does seem to be the culprit.
>>
>> Anybody got any such definitive references or other help?
>>
>> Thanks, Michael
>
> If you do this, you will destroy the mbr on the first disc making  
> Fedora unbootable. You will then have to re-install grub and make  
> sure your menu has an entry for winxp. As far as winxp hanging on  
> install, I am not surprised as it doesn't understand/know of lvm or  
> Linux at all. It's likely trying to analyze the disc and gets  
> stuck. You may have less work in the long run if you do unplug it!
> jlc

i've not had problems with Linux dual booting it's the LVM itself  
that seems a problem for WinXP installation.
I'm really hoping it is possible to dual boot Linux/LVM and WinXP!!!
