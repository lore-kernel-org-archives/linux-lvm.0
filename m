Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7LF9AuP007007
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 11:09:10 -0400
Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7LF97CE020956
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 11:09:08 -0400
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTP id l7LF8ZJX026680
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 17:08:35 +0200
Received: from linuxbox.linuxbox.cz (localhost.localdomain [127.0.0.1])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTP id l7LF8veN026432
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 17:08:57 +0200
Received: from localhost (extmaillist@localhost)
	by linuxbox.linuxbox.cz (8.13.8/8.13.4/Submit) with ESMTP id
	l7LF8pBH026429
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 17:08:51 +0200
Date: Tue, 21 Aug 2007 17:08:51 +0200 (CEST)
From: Nikola Ciprich <extmaillist@linuxbox.cz>
Message-ID: <alpine.LRH.0.999.0708211658250.24950@linuxbox.linuxbox.cz>
MIME-Version: 1.0
Subject: [linux-lvm] growing snapshots beyond original lv size
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
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,
I'd like to ask a question regarding snapshots.
My scenario:
I have LV with some data, ie 2GB size.
Then I create it's snapshot, also 2GB size.
Is it possible to enlarge snapshot to ie 4GB to get 4GB of usable 
capacity?
If I try to resize it using lvextend, lvdisplay then says that COW-table 
size is 4GB, but LV size is still 2GB (and the device is really only 2GB 
large).
So my question is:
is it possible to enlarge snapshots this way? if yes, what am I doing 
wrong??

thanks a lot for any advice

with best regards

Nikola Ciprich


-- 
