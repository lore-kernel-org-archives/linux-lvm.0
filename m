Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i67EVM011550
	for <linux-lvm@redhat.com>; Wed, 7 Jul 2004 10:31:22 -0400
Received: from web80809.mail.yahoo.com (web80809.mail.yahoo.com
	[66.163.170.104])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i67EVGXn026486
	for <linux-lvm@redhat.com>; Wed, 7 Jul 2004 10:31:17 -0400
Message-ID: <20040707143116.72498.qmail@web80809.mail.yahoo.com>
Date: Wed, 7 Jul 2004 07:31:16 -0700 (PDT)
From: <cmc4slack-jfs@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] mixing ext3 and reiserfs on slack upgrade
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM <linux-lvm@redhat.com>

I'm getting ready to upgrade my slackware
box from 9.1 to 10, have been using reiserfs
with lvm on my two VG's but now I'm thinking
of making the rootvg (one one partition) ext3
and the datavg (on another partition) reiserfs.
The datavg has my home directory.

Here's what I'm unsure about: 
let's say after the initial part of the install
I have

rootvg - with updated OS and ext3
datavg - with /home and tar backups as reiserfs

When I boot up will there be any problem with 
the upgraded system recognizing datavg with the
old volume group and filesystem? I'll want to
convert it at first, I'm mainly concerned about
getting to it after the upgrade.

Are there any problems with mixing ext3 and
reiserfs on the same system?

Thanks for any advice!


=====
Christopher Mark Conn
http://storm.cadcam.iupui.edu/~cmcgoat
Austin, Texas, USA
