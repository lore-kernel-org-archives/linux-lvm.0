Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r01M7Ywk007412
	for <linux-lvm@redhat.com>; Tue, 1 Jan 2013 17:07:34 -0500
Received: from lnx503.hrz.tu-darmstadt.de (lnx503.hrz.tu-darmstadt.de
	[130.83.156.232])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r01M7TIR008183
	for <linux-lvm@redhat.com>; Tue, 1 Jan 2013 17:07:30 -0500
Received: from iss1.vlsi.informatik.tu-darmstadt.de
	(iss1.vlsi.informatik.tu-darmstadt.de [130.83.164.1])
	by lnx503.hrz.tu-darmstadt.de (8.14.4/8.14.4/HRZ/PMX) with ESMTP id
	r01M7Smh026358
	for <linux-lvm@redhat.com>; Tue, 1 Jan 2013 23:07:28 +0100
	(envelope-from ml-lvm@iss.tu-darmstadt.de)
Received: from localhost (localhost [127.0.0.1])
	by iss1.vlsi.informatik.tu-darmstadt.de (Postfix) with ESMTP id
	6453AF89D
	for <linux-lvm@redhat.com>; Tue,  1 Jan 2013 23:07:28 +0100 (CET)
Received: from iss1.vlsi.informatik.tu-darmstadt.de ([127.0.0.1])
	by localhost (iss1.vlsi.informatik.tu-darmstadt.de [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id k3Qyow5qeGvZ for <linux-lvm@redhat.com>;
	Tue,  1 Jan 2013 23:07:28 +0100 (CET)
Received: from iss17.vlsi.informatik.tu-darmstadt.de
	(iss17.vlsi.informatik.tu-darmstadt.de [130.83.164.17])
	by iss1.vlsi.informatik.tu-darmstadt.de (Postfix) with ESMTP id
	4FA0CB4A4
	for <linux-lvm@redhat.com>; Tue,  1 Jan 2013 23:07:28 +0100 (CET)
Date: Tue, 1 Jan 2013 23:07:27 +0100
From: Tom Assmuth <ml-lvm@iss.tu-darmstadt.de>
Message-ID: <20130101220727.GA32103@iss.tu-darmstadt.de>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] howto avoid initializing a particular volume-group at
	boot time?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
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

hi and best wishes for the new year!
 
Let me describe my scenario: I have a big volume group (let's say:
/dev/vgbig/lv[1-9]) with a lot of snapshots in it and not used very
often. Another volume group (/dev/vgsmall/lv[1-9]) contains data for
normal use.

Because of initializing /dev/vgbig/ at boot time the machine becomes
usable after about 12h (twelve!)

It would be ok if the machine would boot with /dev/vgsmall
initialized, would do it's normal duty and in an late initscript would
initialize /dev/vgbig/ (vgchange -ay /dev/vgbig/ ) It would be ok to
wait now, because i could do my normal work.

I thougt about a rule in /etc/lvm/lvm.conf, but i am not sure how to
write it.

Does anyone? Thanks in advance, tom 

-- 
___________  __  ____          ___    
 / _   __   /_/ ( (   /|/| / / /  /_/ 
/ (_) ///  / / __)_) /   |/_/ /  / /  
