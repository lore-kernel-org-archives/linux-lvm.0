Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p17ApKx2000357
	for <linux-lvm@redhat.com>; Mon, 7 Feb 2011 05:51:20 -0500
Received: from seldrel01.sonyericsson.com (seldrel01.sonyericsson.com
	[212.209.106.2])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p17Ap7eI002016
	for <linux-lvm@redhat.com>; Mon, 7 Feb 2011 05:51:08 -0500
From: "Assarsson, Emil" <Emil.Assarsson@sonyericsson.com>
Date: Mon, 7 Feb 2011 11:51:02 +0100
Message-ID: <2BF070A7A2375D46BA1B6087F8D5DCB678B8E77247@seldmbx01.corpusers.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] pvdisplay shows misleading information about used
	devices
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
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

Hi,

pvdisplay doesn't show the actual used devices based on the device mapper. It seems to base the information on the cache file and that is misleading. If there is something wrong with the setup it doesn't show.
I consider this to be a bug. I had to learn about "dmsetup ls --tree" to find out what was wrong.

(I have configured LVM filter to only accept mpath or local disk now and it is working like it should.)

Best regards

Emil Assarsson
Sony Ericsson Mobile Communications AB

"The information in this email, and attachment(s) thereto, is strictly confidential and may be legally privileged. It is intended solely for the named recipient(s), and access to this e-mail, or any attachment(s) thereto, by anyone else is unauthorized. Violations hereof may result in legal actions. Any attachment(s) to this e-mail has been checked for viruses, but please rely on your own virus-checker and procedures. If you contact us by e-mail, we will store your name and address to facilitate communications in the matter concerned. If you do not consent to us storing your name and address for above stated purpose, please notify the sender promptly. Also, if you are not the intended recipient please inform the sender by replying to this transmission, and delete the e-mail, its attachment(s), and any copies of it without, disclosing it."
