Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GDBbF9003358
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 09:11:39 -0400
Received: from mx03.syneticon.net (mx03.syneticon.net [78.111.66.105])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3GCR41d031241
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 08:27:05 -0400
Received: from localhost (filter1.syneticon.net [192.168.113.83])
	by mx03.syneticon.net (Postfix) with ESMTP id 141DD3614B
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 14:27:01 +0200 (CEST)
Received: from mx03.syneticon.net ([192.168.113.84])
	by localhost (mx03.syneticon.net [192.168.113.83]) (amavisd-new,
	port 10025) with ESMTP id J5ZTGpTgrav2 for <linux-lvm@redhat.com>;
	Thu, 16 Apr 2009 14:26:59 +0200 (CEST)
Received: from [192.168.10.145] (koln-5d818dc1.pool.einsundeins.de
	[93.129.141.193]) by mx03.syneticon.net (Postfix) with ESMTPSA
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 14:26:59 +0200 (CEST)
Message-ID: <49E72412.1070407@wpkg.org>
Date: Thu, 16 Apr 2009 14:26:58 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
References: <29070.706.qm@web94806.mail.in2.yahoo.com>
	<49E71F9D.3010401@sivell.com>
In-Reply-To: <49E71F9D.3010401@sivell.com>
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

vu pham schrieb:

>> as per the redhat guide this should result in mirror leg failure and 
>> any subsequent write activity to the mirror should convert the mirror 
>> into linear volume. but the output of lvs command still shows copy % 
>> as 100%. also data in filesystem of lv1 is erased and it is converted 
>> into read only filesystem.
>>
>> can anyone please let us know the correct way to simulate lvm mirror 
>> failure and recovery.
>>
>> thanks and regards
> 
> I think to simulate error failure you have to write to the underlying 
> devices, not the mirrored device. When you write to the mirrored device, 
> lvl1 in this case, data is mirrored so there is no failure at all. So I 
> think you have to dd to either /dev/sda3 or /dev/sdb3.

How will LVM distinguish between a valid and invalid copy in that case?

Are you sure that on reads, LVM will return data from the "good" copy, 
not the one you just overwrote with "dd if=/dev/zero of=/dev/sdb 
seek=xxx bs=1M count=10"?


-- 
Tomasz Chmielewski
http://wpkg.org
