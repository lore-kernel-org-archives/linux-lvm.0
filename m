Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0AKikr19868
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 15:44:46 -0500
Received: from postfix3-1.free.fr (postfix3-1.free.fr [213.228.0.44])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0AKiju6007279
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 15:44:45 -0500
Received: from flo.18rcarmes.fr (unknown [81.56.213.72])
	by postfix3-1.free.fr (Postfix) with ESMTP id B48EA1734E9
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 21:44:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by flo.18rcarmes.fr (Postfix) with ESMTP id 0FE038BF7
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 21:44:40 +0100 (CET)
Received: from flo.18rcarmes.fr ([127.0.0.1])
	by localhost (flo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 01664-07 for <linux-lvm@redhat.com>;
	Mon, 10 Jan 2005 21:44:34 +0100 (CET)
Received: from marco (marco.18rcarmes.fr [192.168.0.1])
	by flo.18rcarmes.fr (Postfix) with ESMTP id 845448BF5
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 21:44:34 +0100 (CET)
From: Marc Cousin <cousinmarc@free.fr>
Date: Mon, 10 Jan 2005 21:44:34 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200501102144.34198.cousinmarc@free.fr>
Subject: [linux-lvm] scary message (incorrect header checksum)
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

Hi, 
I'm having the following message ...
flo:~# vgscan
  Reading all physical volumes.  This may take a while...
  Incorrect metadata area header checksum
  Found volume group "data" using metadata type lvm2

It doesn't seem to be a problem, as the lvms are working correctly, but I'd 
like to get rid of this warning...
How can I do this ?

Cheers

-- 
BOFH Excuse #236:

Fanout dropping voltage too much, try cutting some of those little traces
