Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6LETLK8013034
	for <linux-lvm@redhat.com>; Thu, 21 Jul 2011 10:29:21 -0400
Received: from seldrel01.sonyericsson.com (seldrel01.sonyericsson.com
	[212.209.106.2])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6LETJvO001642
	for <linux-lvm@redhat.com>; Thu, 21 Jul 2011 10:29:20 -0400
From: "Assarsson, Emil" <Emil.Assarsson@sonyericsson.com>
Date: Thu, 21 Jul 2011 16:29:18 +0200
Message-ID: <2BF070A7A2375D46BA1B6087F8D5DCB67E864BF902@seldmbx01.corpusers.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] How to resize a logical volume with snapshots?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

Does anyone have an idea how to resize a logical volume with snapshots attached without destroying the snapshots?
From my understanding the snapshot need to be able to contain all changed blocks so additional blocks in a resize need to be copied into the snapshot volume. Or am I wrong?




Best regards

Emil Assarsson
Sony Ericsson Mobile Communications AB

"The information in this email, and attachment(s) thereto, is strictly confidential and may be legally privileged. It is intended solely for the named recipient(s), and access to this e-mail, or any attachment(s) thereto, by anyone else is unauthorized. Violations hereof may result in legal actions. Any attachment(s) to this e-mail has been checked for viruses, but please rely on your own virus-checker and procedures. If you contact us by e-mail, we will store your name and address to facilitate communications in the matter concerned. If you do not consent to us storing your name and address for above stated purpose, please notify the sender promptly. Also, if you are not the intended recipient please inform the sender by replying to this transmission, and delete the e-mail, its attachment(s), and any copies of it without, disclosing it."
