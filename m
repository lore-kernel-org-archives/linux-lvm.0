Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5LLkn023655
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 17:46:49 -0400
Received: from web50010.mail.yahoo.com (web50010.mail.yahoo.com
	[206.190.38.25])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i5LLkme1015828
	for <linux-lvm@redhat.com>; Mon, 21 Jun 2004 17:46:48 -0400
Message-ID: <20040621214642.26818.qmail@web50010.mail.yahoo.com>
Date: Mon, 21 Jun 2004 14:46:42 -0700 (PDT)
From: bert schindler <bert_schindler@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1477731456-1087854402=:26638"
Subject: [linux-lvm] LVM + DM patches
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--0-1477731456-1087854402=:26638
Content-Type: text/plain; charset=us-ascii

i've a LVM over S/W RAID5(redhat 9 kernel 2.4.20-6) 
I want to use LVM2,Snapshot features etc so i've to compile DM for
that.now the drill is the VFS-lock-patch and the other patches.Can anyone
please guide me about the order in which i should apply the patches given below.i've been trying for a couple of days and its not working :( it results in
un-compilable tree .
a)ftp://sources.redhat.com/pub/dm/patches/2.4-stable/2.4.20/2.4.20-dm9.tar
b)linux-2.4.20-VFS-lock.patch from device-mapper.1.00.18/patches dir
c)deviocotl..patch from the above patches dir.

I'm i missing any patches?
 
bert
 
 

		
---------------------------------
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
--0-1477731456-1087854402=:26638
Content-Type: text/html; charset=us-ascii

<DIV>i've a LVM over S/W RAID5(redhat 9 kernel 2.4.20-6) <BR>I want to use LVM2,Snapshot features etc so i've to compile DM for<BR>that.now the drill is the VFS-lock-patch and the other patches.Can anyone<BR>please&nbsp;guide me about the order in which i should apply the patches given below.i've been trying for a couple of days and its not working :( it results in<BR>un-compilable tree .</DIV>
<DIV>a)ftp://sources.redhat.com/pub/dm/patches/2.4-stable/2.4.20/2.4.20-dm9.tar<BR>b)linux-2.4.20-VFS-lock.patch from device-mapper.1.00.18/patches dir<BR>c)deviocotl..patch from the above patches dir.<BR></DIV>
<DIV>I'm i missing any patches?</DIV>
<DIV>&nbsp;</DIV>
<DIV>bert</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV><p>
		<hr size=1>Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/mail_us/taglines/100/*http://promotions.yahoo.com/new_mail/static/efficiency.html">New and Improved Yahoo! Mail</a> - 100MB free storage!
--0-1477731456-1087854402=:26638--
