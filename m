Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1S2OK111326
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 21:24:20 -0500
Received: from brmea-mail-2.sun.com (brmea-mail-2.Sun.COM [192.18.98.43])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1S2OI4h015656
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 21:24:19 -0500
Received: from fe-amer-06.sun.com ([192.18.108.180])
	by brmea-mail-2.sun.com (8.12.10/8.12.9) with ESMTP id k1S2OI8u023080
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 19:24:18 -0700 (MST)
Received: from conversion-daemon.mail-amer.sun.com by mail-amer.sun.com
	(Sun Java System Messaging Server 6.2-4.02 (built Sep  9 2005))
	id <0IVD00801LAJJD00@mail-amer.sun.com>
	(original mail from renato.shimizu@uol.com.br) for linux-lvm@redhat.com;
	Mon, 27 Feb 2006 19:24:18 -0700 (MST)
Date: Mon, 27 Feb 2006 23:24:08 -0300
From: Renato Shimizu <renato.shimizu@uol.com.br>
In-reply-to: <IVDHT3$4D014995332A7BD8339106C2CBEA1897@uol.com.br>
Sender: Renato.Shimizu@Sun.COM
Message-id: <4403B448.2040705@uol.com.br>
MIME-version: 1.0
Content-Transfer-Encoding: 8bit
References: <IVDHT3$4D014995332A7BD8339106C2CBEA1897@uol.com.br>
Subject: [linux-lvm] Re: LVM - vgimport
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
Content-Type: text/plain; format="flowed"; charset="utf-8"
To: "renato.shimizu" <renato.shimizu@uol.com.br>
Cc: linux-lvm <linux-lvm@redhat.com>


More error details:

vgimport -- physical volumes "/dev/sdc1" and "/dev/sdd1" are in
different volume groups
- Red Hat Linux ES 3 kernel 2.6.14

Regards

Renato.


renato.shimizu wrote:
> Hi experts
>
> I need some help about this problem. 
> I need to backup my volume group oravg. So, I�m using shadow image (BCV) on my disks on same server, it�s same I make dd if=/dev/sdc1 of=/dev/sdd1 bs=1024k, but after it sync on disks, there are on pvscan /dev/sdc1 and /dev/sdd1 with same name. 
> I can�t to import with "vgimport -f copy_oravg /dev/sdd1", because the disks is using same name allocate "oravg".
> Can I change volume group in physical volumes inactive?
> Can I change UUID on physical volumes inactive?
> I see that HP-UX there are vgchgid command?
> http://docs.hp.com/en/B2355-90692/vgchgid.1M.html
>
> Thanks in advanced.
>
> Best regards.
>
> Renato.
>
>  
>
>
>   
