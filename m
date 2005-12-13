Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBDHfR113194
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 12:41:27 -0500
Received: from eastrmmtao06.cox.net (eastrmmtao06.cox.net [68.230.240.33])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBDHfJ9A004695
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 12:41:19 -0500
Received: from [192.168.0.5] (really [70.179.95.46]) by eastrmmtao06.cox.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20051213173918.QLUO9108.eastrmmtao06.cox.net@[192.168.0.5]>
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 12:39:18 -0500
Message-ID: <439F07E3.80804@cox.net>
Date: Tue, 13 Dec 2005 12:41:55 -0500
From: Old Fart <rascal.jumper-747@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: If one disk fails i loose everything?
References: <200512131624.jBDGO5ui009897@cichlid.com>
In-Reply-To: <200512131624.jBDGO5ui009897@cichlid.com>
Content-Transfer-Encoding: 7bit
Reply-To: rascal.jumper-747@cox.netmunged.redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Andrew Burgess wrote:
>> Good discussion....the need to protect data under various contingencies 
>> is why I use raid5 sets as the PVs.  You can lose up to two and keep 
>> your data, hot add, have spares, etc.
>>     
>
> You mean raid6
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>   
Actually I meant raid 5 based on actual 2 disk dropouts experienced on 
test systems and the LVM data was still available.  Probably lucky.  
Thanks for the note.
