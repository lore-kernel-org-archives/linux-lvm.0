Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAL22bV13028
	for <linux-lvm@redhat.com>; Sun, 20 Nov 2005 21:02:37 -0500
Received: from mail.stuwo.at ([193.170.138.234])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAL22bpZ021170
	for <linux-lvm@redhat.com>; Sun, 20 Nov 2005 21:02:37 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.stuwo.at (Postfix) with ESMTP id AC0A6415E
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2005 02:25:57 +0100 (CET)
Received: from mail.stuwo.at ([127.0.0.1])
	by localhost (stuwosrv [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 03157-03 for <linux-lvm@redhat.com>;
	Mon, 21 Nov 2005 02:25:51 +0100 (CET)
Received: from www.stuwo.at (localhost [127.0.0.1])
	by mail.stuwo.at (Postfix) with ESMTP id 2F177415D
	for <linux-lvm@redhat.com>; Mon, 21 Nov 2005 02:25:51 +0100 (CET)
From: "Philipp Goedl" <goedlphilipp@www.stuwo.at>
Date: Mon, 21 Nov 2005 03:25:51 +0200
Message-Id: <20051121011532.M21170@www.stuwo.at>
MIME-Version: 1.0
Subject: [linux-lvm] uuid_fixer: pv_read(): pv_flush
Reply-To: philipp.goedl@stuwo.at,
	LVM general discussion and development <linux-lvm@redhat.com>
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

I wanted to free a PV for normal use, but after pvmove'ing the content to 
other pv's i managed to pvremove -ff the free partition instead of vgreduce 
it. :/

Now neither of the logical volumes actually works, so i dl'ed the uuid_fixer 
(lvm complained about not finding a volume with uuid=xy, i suppose it was 
hda2, the one i pvremove'd)

When running it i just get

pv_read(): pv_flush

and thats it.

What can i try to rescue the volume group?

Thanks in advance,
Phil
