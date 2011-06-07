Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p572U2Gr030008
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2011 22:30:02 -0400
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p572TxTg023688
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2011 22:30:01 -0400
Received: by gwaa18 with SMTP id a18so2178441gwa.33
	for <linux-lvm@redhat.com>; Mon, 06 Jun 2011 19:29:59 -0700 (PDT)
MIME-Version: 1.0
From: Misc Things <formisc@gmail.com>
Date: Mon, 6 Jun 2011 22:29:19 -0400
Message-ID: <BANLkTi=O_ua2rMCA3Cs4tvvExzjo5cxBOg@mail.gmail.com>
Subject: [linux-lvm] Installation fails if VG is exported
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,
 i guess i'm doing smth very stupid, but... Here is the story:
 i decided to migrate to RH6 ( SL6). I run pretty old box ( 6 yo,
AST160 ASPIRE) with recently added WD1.5 TB ( i doubt it makes any
difference, but .. ).
System has a few VGs ( LVM2) created and enabled.
I'm a bit paranoid to lose my data during installation - i followed
the LVM's FAQ (http://tldp.org/HOWTO/LVM-HOWTO/recipemovevgtonewsys.html).
Here are the steps i took and the results:
1. umount ;
2.  vgchange -ay
3. vgexport
4. i commented out the VG in /etc/fstab ( just in case ).
reboot - FS is not mounted, VG is inactive - so far everything as expected.

reboot and load network installation, default values are picked up on
the GUI installer's screen.
During the HDs checking phase, anaconda terminates with the message "
unalbe to activate exported VG".
I googled around with not much success. The only similar issue was
closed in2007 (https://bugzilla.redhat.com/show_bug.cgi?id=191879)

Please advise.
Andrew
