Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m498pMGt008785
	for <linux-lvm@redhat.com>; Fri, 9 May 2008 04:51:22 -0400
Received: from caine.easynet.fr (smarthost159.mail.easynet.fr [212.180.1.159])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m498p724023212
	for <linux-lvm@redhat.com>; Fri, 9 May 2008 04:51:08 -0400
Received: from saros016845-4.clients.easynet.fr ([84.37.61.220]
	helo=titan.saros.fr) by caine.easynet.fr with esmtp (Exim 4.63)
	(envelope-from <gilles.guiot@saros.fr>) id 1JuOJm-0006JR-Lb
	for linux-lvm@redhat.com; Fri, 09 May 2008 10:51:06 +0200
Received: from [192.168.100.11] (helo=[127.0.0.1])
	by titan.saros.fr with esmtp (Exim 4.63)
	(envelope-from <gilles.guiot@saros.fr>) id 1JuOJh-0004xh-Cz
	for linux-lvm@redhat.com; Fri, 09 May 2008 10:51:01 +0200
Message-ID: <48241070.6020207@saros.fr>
Date: Fri, 09 May 2008 10:50:56 +0200
From: Gilles Guiot <gilles.guiot@saros.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] device /dev/sdb1 not found or ignored by filtering
References: <4821C3F1.6000108@saros.fr> <4822C057.60409@laposte.net>
In-Reply-To: <4822C057.60409@laposte.net>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello and thanks for the answer.
For "political" (indeed) reasons, we can't use the raid 5......

and there is a partition using the whole second "disk" (ie raid array), 
it is sdb 1. When I type the command pvcreate /dev/sdb or /dev/sdb1
i get the following message....device /dev/sdb1 not found or ignored by 
filtering

xdub a �crit :
> Hi,
>
> No sure what you want to do with your 2 raid1 arrays... and
> why you want to incorporate the first one into LV (?).
>
> Did you partition your second array ? if not, you can create a PV
> like this: pvcreate /dev/sdb. "pvcreate" can initialize a disk or 
> partition.
>
>    - pvcreate /dev/sdb
>    - vgcreate vg00 /dev/sdb
>
> Again, no sure what you want to do, but with 4 HD you should consider
> to build raid5 (hardware raid) and then create PV, VG, LV.
>
> Regards
>
>
> Gilles Guiot wrote:
>> Hello Everybody
>>
>> I have two raid 1 arrays on a Dell PowerEdge 2950,
>> 1) 2*500 Go
>> 2) 2*750 Go
>>
>> I need to use LVM, to create a LV on the second raid array, in which 
>> i will afterwards incorporate the first raid array. I have the latest 
>> debian distro installed, with kernel updates, and LVM2 is installed.
>>
>> I encounter my first problem when typing pvcreate /dev/sdb1. ( the 
>> partition of the second raid array) I get the message :
>> device /dev/sdb1 not found or ignored by filtering
>> I checked /etc/lvm/lvm.conf, and I commented out the line about the 
>> filter.
>> After a reboot, no more luck. I tried to circumvent the problem by 
>> booting with an ubuntu CD, but i get the same error message.
>> Could anybody tip me about what's wrong and more importantly suggest 
>> solutions to me ? :-)
>>
>> Thanks a lot in advance.
>>
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


-- 
Gilles Guiot
Responsable exploitation informatique
T�l. : 01 53 23 02 20
gilles.guiot@saros.fr
