Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i26Nk0811133
	for <linux-lvm@redhat.com>; Sat, 6 Mar 2004 18:46:00 -0500
Received: from mwinf0401.wanadoo.fr (smtp4.wanadoo.fr [193.252.22.27])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i26NjxST027267
	for <linux-lvm@redhat.com>; Sat, 6 Mar 2004 18:45:59 -0500
Received: from wwinf0402 (wwinf0402 [172.22.135.29])
	by mwinf0401.wanadoo.fr (SMTP Server) with ESMTP id BA20F580010E
	for <linux-lvm@redhat.com>; Sun,  7 Mar 2004 00:45:53 +0100 (CET)
Message-ID: <2291972.1078616753747.JavaMail.www@wwinf0402>
From: dld.pascal.garcia@wanadoo.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Help : vg not accessible
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
Date: Sat Mar  6 18:44:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello, 
I introduce myself because that is the first time I use this mailing list.  
43, french, engenieer. I am using Linux since 3 years now. 
 
My problem is the following : 
If use lvm on my laptop for ages. 
 
By lack of space I decided to add a pv to the vg, and extend the lv /. 
 
It worked, but obviously the tool I used (diskdrake) did not write the partition table, and 
may be did other things stranges, so that after rebbot nothing works any longer (fatal). 
 
I made some tests and changes but probably made the situation even worse, by losing 
the MSB, so I cant even start booting. 
 
You probably understand that my / partition is on the vg, so that I do not have acces to 
the previous /etc/lvmcon/* and others files. 
 
could somebody give me the informatoipn where I can find the data structure I could 
eventually modify, so that, mounting this disk in an other system where linuw is installed 
the vg could be scaned? 
 
If not could somebody help me on this analisys and modification ? I know it will be hard, 
but my data is important. 
 
thank you  
 
Pascal Garcia 
 
