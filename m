Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j22J8RK21990
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 14:08:27 -0500
Received: from kweetal.tue.nl (kweetal.tue.nl [131.155.3.6])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j22J8LZA015543
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 14:08:21 -0500
Received: from iris.tue.nl (iris.tue.nl [131.155.2.34])
	by kweetal.tue.nl (Postfix) with ESMTP id 3F9E513B722
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 20:08:11 +0100 (CET)
Received: from [131.155.224.41] (t-26-41.athome.tue.nl [131.155.224.41])
	by iris.tue.nl (Postfix) with ESMTP id 2944710C0B9
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 20:08:11 +0100 (CET)
Message-ID: <42260F1B.2030803@are-b.org>
Date: Wed, 02 Mar 2005 20:08:11 +0100
From: oliver <oliver@are-b.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Partition table gone? Any way to restore?
References: <4225FBC8.9020904@are-b.org>
	<20050302174819.GN17589@lug-owl.de>	<4225FEBC.2060505@are-b.org>
	<20050302180537.GO17589@lug-owl.de>
In-Reply-To: <20050302180537.GO17589@lug-owl.de>
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

I do have an empty 120GB hdd available to dump the entire contence on. I 
guess dd will do the trick?

Jan-Benedict Glaw wrote:

>On Wed, 2005-03-02 18:58:20 +0100, oliver <oliver@are-b.org>
>wrote in message <4225FEBC.2060505@are-b.org>:
>  
>
>>When i do a less -f /dev/hde I can see a lot of data.
>>
>>E.g. I see a string looking a lot like ReiserFS and scrolling down 
>>further I see /dev/vg00/<nameofparts created> so I'm sure a LOT is still 
>>there. I'll give it a shot. Any other ideas are still welcome!
>>    
>>
>
>So let gpart guess and re-install a partition record. Though, you'd
>better prepare a backup of that given HDD...
>
>MfG, JBG
>
>  
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
