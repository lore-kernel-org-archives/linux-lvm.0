Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jARELOV26461
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 09:21:24 -0500
Received: from eastrmmtao02.cox.net (eastrmmtao02.cox.net [68.230.240.37])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jARELHc5031749
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 09:21:17 -0500
Received: from [192.168.0.9] (really [70.179.95.46]) by eastrmmtao02.cox.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20051127142002.FCUW8508.eastrmmtao02.cox.net@[192.168.0.9]>
	for <linux-lvm@redhat.com>; Sun, 27 Nov 2005 09:20:02 -0500
Message-ID: <4389C0F9.8040103@cox.net>
Date: Sun, 27 Nov 2005 09:21:45 -0500
From: Old Fart <rascal.jumper-747@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] One of 8 PVs dead - Trying to rescue data
	from	remaining 7
References: <4365F0AC.3090909@oxtel.com>	<80d985600511252130j37b17586i9dd1649a958622ba@mail.gmail.com>	<438881B0.4040000@cox.net>
	<80d985600511270409q6fadc509p151530b7e1083482@mail.gmail.com>
In-Reply-To: <80d985600511270409q6fadc509p151530b7e1083482@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: rascal.jumper-747@cox.net.spamorama.redhat.com,
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

Craig Hagerman wrote:
> On 11/27/05, Old Fart <rascal.jumper-747@cox.net> wrote:
>   
>> Craig Hagerman wrote:
>>     
>>> On 10/31/05, Tom Robinson <tom.robinson@oxtel.com> wrote:
>>>       
>> I use raid 5 just for this problem.  Have dropped 2 of the 3 raid
>> devices and system keeps on truckin'.  You can hot add devices back in
>> and keep going while they sync.  Good luck.
>>
>>     
>
> Yeah, this would work with 3 discs, but doesn't answer the general
> question about recovering data from a single LVM drive. In my 2 drive
> system it wouldn't work. Any other ideas? I would assume that if one
> drive failed it should be trivial to be able to access the information
> on the remaining drive. If not, then I would be a lot safer going back
> to a non-LVM system using the two drives as distinct partitions.
>
> Craig
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>   
Take a look at a 2 disk raid 1 array as a pv.  I have seen that array 
degrade to 1 drive and the LV was ok.

-- 
Regards,

Old Fart
