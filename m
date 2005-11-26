Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAQFd0V07744
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2005 10:39:00 -0500
Received: from eastrmmtao06.cox.net (eastrmmtao06.cox.net [68.230.240.33])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAQFd09U030729
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2005 10:39:00 -0500
Received: from [192.168.0.9] (really [70.179.95.46]) by eastrmmtao06.cox.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20051126153724.VHSQ9108.eastrmmtao06.cox.net@[192.168.0.9]>
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2005 10:37:24 -0500
Message-ID: <438881B0.4040000@cox.net>
Date: Sat, 26 Nov 2005 10:39:28 -0500
From: Old Fart <rascal.jumper-747@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] One of 8 PVs dead - Trying to rescue data
	from	remaining 7
References: <4365F0AC.3090909@oxtel.com>
	<80d985600511252130j37b17586i9dd1649a958622ba@mail.gmail.com>
In-Reply-To: <80d985600511252130j37b17586i9dd1649a958622ba@mail.gmail.com>
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

Craig Hagerman wrote:
> On 10/31/05, Tom Robinson <tom.robinson@oxtel.com> wrote:
>   
>> Summary: One of my 8 PVs is dead and I despirately need to rescue
>>
>> I am curious about what to do in general if I have one disc fail on a
>> multi-LVM system. Personally I have a two disc LVM system. You problem
>> made me realize I have no idea what to do to recover data if one of
>> the discs has a problem. Anyone have the answer?
>>
>> Craig
>>
>>     
I use raid 5 just for this problem.  Have dropped 2 of the 3 raid 
devices and system keeps on truckin'.  You can hot add devices back in 
and keep going while they sync.  Good luck.

-------------------
Regards,

Old Fart
