Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB93dbV07852
	for <linux-lvm@redhat.com>; Thu, 8 Dec 2005 22:39:37 -0500
Received: from web32605.mail.mud.yahoo.com (web32605.mail.mud.yahoo.com
	[68.142.207.232])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id jB93dPEP024016
	for <linux-lvm@redhat.com>; Thu, 8 Dec 2005 22:39:25 -0500
Message-ID: <20051209033914.33441.qmail@web32605.mail.mud.yahoo.com>
Date: Fri, 9 Dec 2005 11:39:14 +0800 (CST)
From: Way Loss <lossway@yahoo.com.hk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Newbie of LVM
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

Hi all,

   I am very new to LVM. Here is the detail of my
current fs.
Filesystem            Size  Used Avail Use% Mounted on
/dev/md1              9.4G  2.5G  6.5G  28% /
/dev/md2              9.4G  7.6G  1.4G  85% /home
/dev/md3              9.4G  6.6G  2.4G  74% /var
/dev/md4              958M   18M  892M   2% /tmp
/dev/md5              153G  119G   27G  82% /www

    My md5 is almost full and I wanna use LVM to merge
my md5 with a new partition from a new hdd. I wanna
ask if this possible for LVM to merge 2 partition
together while one of them have data on it? I can't
suffer any data loss and want to make sure that LVM
works perfectly to what I want.
   Thanks all.

Best Regards,
Sing

_______________________________________
 �x��ӍϢ - Yahoo! Messenger
 ������]���ϾW����������Կ�������ӍϢ�o�㣬�����ϾW�r���������������κ��fԒ������ʧ��
  http://messenger.yahoo.com.hk 
