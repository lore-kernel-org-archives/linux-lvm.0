Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k38MCAEk022734
	for <linux-lvm@redhat.com>; Sat, 8 Apr 2006 18:12:10 -0400
Received: from web60411.mail.yahoo.com (web60411.mail.yahoo.com
	[209.73.178.154])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k38MC4CO008933
	for <linux-lvm@redhat.com>; Sat, 8 Apr 2006 18:12:04 -0400
Message-ID: <20060408211158.56899.qmail@web60411.mail.yahoo.com>
Date: Sat, 8 Apr 2006 14:11:58 -0700 (PDT)
From: <linux_user98765@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Concise LVM Summary
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
To: linux-lvm@redhat.com

I'm trying to write a perl script to give concise output of 
pvs, vgs, lvs, pvdisplay, vgdisplay, lvdisplay and df -- something
like:


VG home [PE (4MB): 0 (0 b) / 52205 (203.93 GB)]
LV /dev/home/lvol0 /home [LE: 52205 (203.93 GB); DF: 64G/201G (129G)
34%]
PV /dev/sdb [PE (4096KB): 0 (0 b) / 38156 (149.05 GB); DF: ??/149G (??)
??%]
PV /dev/hdb4 [PE (4096KB): 0 (0 b) / 14049 (54.88 GB); DF: ??/55G (??)
??%]


however, there are a few things I have yet to figure out:

- determine the actual disk usage of a particular PV in a given LV
- the lvs column option which produces the heading "Log"
- the nature of the pvs,vgs,lvs separator inconsistencies:

lvs - Headers and LV lines are separator terminated
vgs - Headers not separator terminated, VG lines are
pvs - Headers not separator terminated, PV lines are

- The unabreviated names of the column headings
  (a website detailing each would be nice)
- whether pvdisplay,vgdisplay,lvdisplay offer anything more than
  pvs, vgs, lvs with all columns displayed
- Why the majority of pvs,vgs,lvs columns lack data

I'm still working on the code, but the above are the major stumbling
blocks I've come across so far...

TIA!

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
