Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2F9jAS28368
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 04:45:10 -0500
Received: from web80601.mail.yahoo.com (web80601.mail.yahoo.com [66.218.79.90])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2F9jA07005870
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 04:45:10 -0500
Message-ID: <20040315094504.30807.qmail@web80601.mail.yahoo.com>
Date: Mon, 15 Mar 2004 01:45:04 -0800 (PST)
From: David Minor <sus4@sbcglobal.net>
MIME-Version: 1.0
Subject: [linux-lvm] VGs gone!
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
To: linux-lvm@redhat.com

My volumes have disappeared.  can anyone help recover?

setup: 
I have two drives partitioned identically so that they
can be mirrored.  each drive has a boot, swap, and a
very large lvm partition.  We had a problem with the
root partition on the first drive, so we decided to
restore from the mirror using dd.  After doing this,
the VGs are not in existence anymore.  running
'vgscan' shows it creates /etc/lvmtab and
/etc/lvmtab.d correctly, but they are empty.  

Is there a way to recreate this information?
