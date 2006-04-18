Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3ICioJu017424
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 08:44:50 -0400
Received: from smtp-out2.email.it (smtp-out2.email.it [80.247.70.37])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3ICiUjf030919
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 08:44:37 -0400
Received: from [10.253.12.196] (host96-52.pool8711.interbusiness.it
	[87.11.52.96])by smtp-out2.email.it (Email.it) with ESMTP id
	D5A5B1BCE6Bfor <linux-lvm@redhat.com>;
	Tue, 18 Apr 2006 14:40:33 +0200 (CEST)
From: Simone Gotti <simone.gotti@email.it>
Date: Tue, 18 Apr 2006 14:40:34 +0200
Message-Id: <1145364034.3003.55.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] dmeventd_mirror problem and some questions.
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi All,

I was curious to try the experimental dmeventd + the mirror checking
dso.
Everytime I created a mirror volume, dmeventd was crashing when the
mirror finished the syncing process. 
I tracked it down to _get_mirror_event that is expeting a return string
from the status ioctl to dm like "2 253:4 253:5 400/400 1 AA 3 cluster
253:3 A" but it gets only "2 253:4 253:5 400/400" so it SIGSEGV when is
going to read over the number of returned arguments in the "args" array
from split_words.

The same string is returned by "dmsetup status".

Do these informations aren't already implemented in the ioctl, or are
there some patches around that I can try? (my kernel is the latest
available in fedora rawhide: 2.6.16-1.2131_FC6)

Another question, If I understand it correctly, the mirror library for
dmeventd will look to possible problems (eg the lost of a PV containing
a mirror), and it will call the right lvm command to fix it?
For example, if a PV containing a side of a 2 way mirrored volume is
lost, what are the various actions that it will do (I noticed an
lvreduce --removemissing, but my fear is that this command will also
remove unmirrored volumes)?

Thanks!

Bye!

Simone Gotti.


 
 
 --
 Email.it, the professional e-mail, gratis per te: http://www.email.it/f
 
 Sponsor:
 Problemi di Liquidit�? Con Logos Finanziaria 30.000 � in 24 ore a dipendenti e lavoratori autonomi con rimborsi fino a 120 mesi, clicca qui
* 
 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=2911&d=18-4
