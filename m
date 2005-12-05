Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB5ITZV32572
	for <linux-lvm@redhat.com>; Mon, 5 Dec 2005 13:29:35 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.195])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB5ITRH8000707
	for <linux-lvm@redhat.com>; Mon, 5 Dec 2005 13:29:28 -0500
Received: by zproxy.gmail.com with SMTP id v1so1062566nzb
	for <linux-lvm@redhat.com>; Mon, 05 Dec 2005 10:29:27 -0800 (PST)
Message-ID: <87f94c370512051029uc354fadw1921ec2ff72cbbe5@mail.gmail.com>
Date: Mon, 5 Dec 2005 13:29:23 -0500
From: Greg Freemyer <greg.freemyer@gmail.com>
In-Reply-To: <87f94c370512010752n6f4b311eqe8ff0b2c8bd92f4f@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <87f94c370512010752n6f4b311eqe8ff0b2c8bd92f4f@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Dumb LVM question
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

All,

With LVM 2, how do I kill any and all snapshots.

With LVM 1 it was "vgscan -r".

I need to be able to do this with a script, so I'm hoping lvm 2 has a
way to kill all snapshots without knowing their names, etc.  If not, I
guess I can script up something to do the job.

Greg
--
Greg Freemyer
The Norcross Group
Forensics for the 21st Century


--
Greg Freemyer
The Norcross Group
Forensics for the 21st Century
