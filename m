Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1M6tdi32346
	for <linux-lvm@redhat.com>; Sun, 22 Feb 2004 01:55:39 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.126.183])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1M6tcb29454
	for <linux-lvm@redhat.com>; Sun, 22 Feb 2004 01:55:38 -0500
Received: from [212.227.126.209] (helo=mrelayng.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1AunWc-0005gT-00
	for linux-lvm@redhat.com; Sun, 22 Feb 2004 07:55:38 +0100
Received: from [213.39.131.178] (helo=tric)
	by mrelayng.kundenserver.de with asmtp (TLSv1:RC4-SHA:128)
	(Exim 3.35 #1)
	id 1AunWb-0003TY-00
	for linux-lvm@redhat.com; Sun, 22 Feb 2004 07:55:37 +0100
Received: from root by tric with local (Exim 4.30)
	id 1AunWa-0002oQ-K9
	for linux-lvm@redhat.com; Sun, 22 Feb 2004 07:55:36 +0100
From: Volker Gropp <tric@renatager.de>
Message-ID: <20040222065536.GA10657@tric>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] badblocks on lvm1 lv using device mapper and lvm2 userland tools
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sun Feb 22 01:54:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

is there any way to handle badblocks on a lvm1 lv in an dm lvm2
environment. EVMS seem to be able to reallovate those, but i dont wanna
switch.

my kernel is 2.4.25, no patches on a debian system using IDE drives.

Volker Gropp
