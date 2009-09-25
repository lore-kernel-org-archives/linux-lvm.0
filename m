Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8PFCudX018280
	for <linux-lvm@redhat.com>; Fri, 25 Sep 2009 11:12:56 -0400
Received: from outbound.icp-qv1-irony-out3.iinet.net.au
	(outbound.icp-qv1-irony-out3.iinet.net.au [203.59.1.148])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8PFCjtZ019411
	for <linux-lvm@redhat.com>; Fri, 25 Sep 2009 11:12:46 -0400
Message-ID: <4ABCDDEC.8000707@iinet.net.au>
Date: Sat, 26 Sep 2009 01:12:44 +1000
From: David Timms <dtimms@iinet.net.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] grow lv bug - pvs -v display bug
References: <200909220808.16458.whobedobe@dodo.com.au>
	<20090921223257.GB22590@us.ibm.com>
In-Reply-To: <20090921223257.GB22590@us.ibm.com>
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

On 09/22/2009 08:32 AM, malahal@us.ibm.com wrote:
> Hugh [whobedobe@dodo.com.au] wrote:
>>      Scanning for physical volume names
>>    PV         VG         Fmt  Attr PSize  PFree  DevSize PV UUID
>>    /dev/sdb2  VolGroup00 lvm2 a-   67.91G 20.00G  47.93G eCuGyH-jV7L-Tgdg-JyYW-
>> sWK1-ehZY-OLw0WS
>
> DevSize is smaller than PSize!
Exactly what I was saying, yes PFree is indicating +'ve 20GB free, not 
-'ve 20GB Free. Looks at the very least like a bug in pvsc -v

I am guessing that my gui tool system-config-lvm uses the lvs PFree 
value to suggest that it can expand an lv into pv free space. But if 
this value was correct (ie showing as negative), then maybe it wouldn't 
suggest that there is pv free space, and then fail inexplicably when the 
user attempts to use some of that "anti-free" space ?

As well as displaying "-" space free, it might make sense for the tool 
to suggest there is something wrong with the setup, since the printed 
values don't actually make any sense (eg like assert (pvsize - pvusage) 
<> pvfree) to push the admin to see the problem.

DaveT.
