Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9K9F0V03709
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 05:15:00 -0400
Received: from e2kintsmtp01b.tim.it (sdtri-s.tim.it [194.243.137.92] (may be
	forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9K9Ewd1018518
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 05:14:59 -0400
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 20 Oct 2005 11:14:52 +0200
Message-ID: <DE77E2FB6E674A40B1B661B4D91F1FE501AAA523@E2KMBX20VS.intranet.tim.it>
From: "Caligiuri, Marco Ernesto" <mcaligiuri.c@mail.tim.it>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM2 problems!!
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi to all....,
I'm Marco an italian user of RedHat Enterprise 4 , i have this kind of problems:
I must install GFS on a disk partition, non root-partition, it is /dev/sdc1 . Before to make a GFS filesystem...i need to create a volume with LVM2.
Id of partition is 8e (linux LVM)  but when i excute the command :
pvcreate /dev/sdc or pvcreate /dev/sdc1 and any other command of lvm (vgcreate...lvcreate....) i receive always the same error:
 
connect() failed on local socket: Connection refused
 Locking type 2 initialisation failed.

why?? Anyone can help me?
 
Thank you in Advance
Marco

This message is for the designated recipient only and may contain privileged or confidential information. If you have received it in error, please notify the sender immediately and delete the original. Any other use of the email by you is prohibited.


����������������������������������������������������������������������������
su www.tim.it - Clienti Privati -, Puoi votare la tua MMS SuperSTAR preferita e vincere un telefonino Nokia 3220.
����������������������������������������������������������������������������
