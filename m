Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9M6CBBr006548
	for <linux-lvm@redhat.com>; Mon, 22 Oct 2007 02:12:11 -0400
Received: from ispbrasil.com.br (server.ispbrasil.com.br [209.67.213.238])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9M6CARb013087
	for <linux-lvm@redhat.com>; Mon, 22 Oct 2007 02:12:10 -0400
Message-ID: <025401c81472$c80e8080$fe01a8c0@ispbrasil>
From: "Itamar Reis Peixoto" <itamar@ispbrasil.com.br>
References: <471C29F2.5090408@redhat.com>
Subject: Re: [linux-lvm] lvreduce
Date: Mon, 22 Oct 2007 03:14:15 -0300
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: LVM general discussion and development <linux-lvm@redhat.com>

try to grow the partition again

make a backup first (dd is your friend)


--------------------

Itamar Reis Peixoto

e-mail/msn: itamar@ispbrasil.com.br
skype: itamarjp 
icq: 81053601
+55 11 4063 5033
----- Original Message ----- 
From: "Humble Chirammal" <hchiramm@redhat.com>
To: <linux-lvm@redhat.com>
Sent: Monday, October 22, 2007 1:41 AM
Subject: [linux-lvm] lvreduce


> Hi All,
>  One of the customer ran  "lvreduce" command without reducing the 
> filesystem (resize2fs ).  After the system was rebooted got this error.
> 
> <<snip>>
> 
> The filesystem size (according to the superblock) is 19922944 blocks
> The physical size of the device is 13369344 blocks
> Either the superblock or the partition table is likely to be corrupt!
> <<snip>>
> 
> Is there any way for data recovery???
> 
> Welcomes your valid responses
> 
> Regards
> Humble
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
