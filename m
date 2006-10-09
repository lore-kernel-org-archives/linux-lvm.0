Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k99Iwisj005391
	for <linux-lvm@redhat.com>; Mon, 9 Oct 2006 14:58:44 -0400
Received: from cobalt0.panici.net (cobalt0.panici.net [207.234.248.139])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k99Iwef0024675
	for <linux-lvm@redhat.com>; Mon, 9 Oct 2006 14:58:41 -0400
Received: (from padski@localhost)
	by cobalt0.panici.net (8.10.2/8.10.2) id k99IwXc29998
	for linux-lvm@redhat.com; Mon, 9 Oct 2006 19:58:34 +0100
Date: Mon, 9 Oct 2006 19:58:32 +0100
From: paddy <paddy@panici.net>
Message-ID: <20061009185806.GA29486@cobalt0.panici.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LV open but not mounted ?
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
To: linux-lvm@redhat.com


I just noticed that I have a system where an LV appears to be open
(as given by lvs), but I can't see it mounted anywhere, or opened
by any process.

Any insights, suggestions, explanations, etc gratefully received :-)

Regards,
Paddy
-- 
Perl 6 will give you the big knob. -- Larry Wall
