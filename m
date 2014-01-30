Received: from [10.34.131.133] (dhcp131-133.brq.redhat.com [10.34.131.133])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0UB1tbj010074
	for <linux-lvm@redhat.com>; Thu, 30 Jan 2014 06:01:56 -0500
Message-ID: <52EA3122.2090605@redhat.com>
Date: Thu, 30 Jan 2014 12:01:54 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <16647-1390949651-817374@sneakemail.com>	<24444-1390997738-899111@sneakemail.com>
	<26083-1390999499-900991@sneakemail.com>
In-Reply-To: <26083-1390999499-900991@sneakemail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Full DRDB device on LVM is now unusable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 29.1.2014 13:45, Seb A napsal(a):
> Write Protect appears to be off here (Thanks Angel):
>
> [root@Openfiler2 ~]# grep -i "Write Protect" /var/log/messages
> kern.info<6>: Jan 28 17:28:11 Openfiler2 kernel: Write protecting the kernel
> read-only data: 7056k
> kern.notice<5>: Jan 28 17:28:11 Openfiler2 kernel: sd 0:0:0:0: [sda] Write
> Protect is off
> kern.notice<5>: Jan 28 17:28:11 Openfiler2 kernel: sd 0:0:1:0: [sdb] Write
> Protect is off
> kern.notice<5>: Jan 28 17:28:11 Openfiler2 kernel: sd 0:0:2:0: [sdc] Write
> Protect is off
>
> Kind regards,
>
> Seb A
>
>
>
>

As a follow-up of irc discussion.


incorrect  filter rules were set.


For drbd its mandatory to let lvm2 command see only those devices which are 
supposed to be used.

Reference to drbd lvm nesting guide:
http://www.drbd.org/users-guide-8.3/s-nested-lvm.html

Rule #1 - set an appropriate 'filter' is very important.

For activation of nested LV  lvm must not see drbd origin nodes!


Zdenek
