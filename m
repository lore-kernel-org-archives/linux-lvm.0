Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2T2U5YL021406
	for <linux-lvm@redhat.com>; Tue, 28 Mar 2006 21:30:05 -0500
Received: from sapo.pt (relay6.ptmail.sapo.pt [212.55.154.26])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k2T2TvWD027004
	for <linux-lvm@redhat.com>; Tue, 28 Mar 2006 21:29:57 -0500
Received: from unknown (HELO [192.168.10.12])
	(op227512@mail.telepac.pt@[81.193.81.25])
	(envelope-sender <mbd@netopia.pt>)
	by mta2 (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 29 Mar 2006 02:29:51 -0000
Message-ID: <4429F11D.8010404@netopia.pt>
Date: Wed, 29 Mar 2006 03:29:49 +0100
From: "Miguel Bettencourt Dias (Netopia)" <mbd@netopia.pt>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------060405060403020902060009"
Subject: [linux-lvm] LVM data recovery ?
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------060405060403020902060009
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Hi All,

I've been reading the arquives and didn't find an answer to my problem 
and I was wondering how data recovery could be done... because I have a 
server that crashed quite badly. It did not have lvm backups from 
/etc/lvm/archive/ and I wanted to recover the LVM.

I only have two partitions, sda1 and sda2.
sda1 is the /boot. sda2 is LVM, with swap and / (the machine runs fedora 
core 4)with root inside the LVM... now I know that's a bad ideia.

The problem is that I don't have any backups of any LVM information and
all I know is the size of the partitions inside LVM...

Adding 2031608k swap on /dev/VolGroup00/LogVol01.  Priority:-1 extents:1 
across:2031608k

Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
                       32963596  24207464   8756132  74% /
/dev/sda1               101086     56597     39270  60% /boot
/dev/shm               1037328         0   1037328   0% /dev/shm


can I conceivably recover the data ? how ?


regards,
miguel dias



--------------060405060403020902060009
Content-Type: text/x-vcard; charset=utf-8;
 name="mbd.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="mbd.vcf"

begin:vcard
fn:Miguel Bettencourt de Freitas Dias
n:Bettencourt de Freitas Dias;Miguel
org;quoted-printable:Netopia, Sistemas de Informa=C3=A7=C3=A3o Global, Lda.
adr:;;Apartado 42111;Lisboa;;1601-801 Lisboa;Portugal
email;internet:miguel.dias@netopia.pt
tel;work:+351917245758
tel;fax:+35166917245758
tel;cell:+351917245758
url:http://www.netopia.pt
version:2.1
end:vcard


--------------060405060403020902060009--
