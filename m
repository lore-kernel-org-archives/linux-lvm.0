Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6BCUrGK016972
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 08:30:53 -0400
Received: from lnx130.hrz.tu-darmstadt.de (root@lnx130.hrz.tu-darmstadt.de
	[130.83.174.24])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6BCUp74031711
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 08:30:51 -0400
Received: from lnx108.hrz.tu-darmstadt.de (lnx108.hrz.tu-darmstadt.de
	[130.83.47.29])
	by lnx130.hrz.tu-darmstadt.de (8.13.4/8.12.10) with ESMTP id
	k6BCUj7E018566
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 14:30:45 +0200
Received: from iss1.vlsi.informatik.tu-darmstadt.de
	(iss1.vlsi.informatik.tu-darmstadt.de [130.83.164.1])
	by lnx108.hrz.tu-darmstadt.de (Postfix) with ESMTP id 4DD26D3961
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 14:30:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by iss1.vlsi.informatik.tu-darmstadt.de (Postfix) with ESMTP id
	3AEBA8007
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 14:30:45 +0200 (CEST)
Received: from iss1.vlsi.informatik.tu-darmstadt.de ([127.0.0.1])
	by localhost (iss1 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 01384-03 for <linux-lvm@redhat.com>;
	Tue, 11 Jul 2006 14:30:45 +0200 (CEST)
Received: from iss17.vlsi.informatik.tu-darmstadt.de
	(iss17.vlsi.informatik.tu-darmstadt.de [130.83.164.17])
	by iss1.vlsi.informatik.tu-darmstadt.de (Postfix) with ESMTP id
	22A3F8006
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 14:30:45 +0200 (CEST)
Date: Tue, 11 Jul 2006 14:30:39 +0200
From: Tom Assmuth <ml-lvm@iss.tu-darmstadt.de>
Message-ID: <20060711123039.GA945@iss.tu-darmstadt.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvextend origin
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
Content-Transfer-Encoding: 7bit
To: lvm-mailing-list <linux-lvm@redhat.com>

hi there, 

im trying to get lvm-snapshots working with lvm2 and debian. 
But i think this is a general question, too.

so here my question: 

Is it possible to lvextend an origin lv (of snapshots) with lvm2 ?

i got the message: "Snapshot origin volumes can be resized only while
inactive: try lvchange -an"

that is strange to me, because with lvm1 that's not even a point to
mention.

Is it necessary to deactivate the origins, because the snapshots are
rw by default? (Well that's the only difference to me) - if "yes", how
can i create a read-only snapshot?

Thanks 4 any hints! 

tom 


-- 
___________  __  ____          ___    
 / _   __   /_/ ( (   /|/| / / /  /_/ 
/ (_) ///  / / __)_) /   |/_/ /  / /  
