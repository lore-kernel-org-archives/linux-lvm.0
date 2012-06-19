Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q5JNI3Th015164
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2012 19:18:03 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q5JNI2MS004760
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2012 19:18:02 -0400
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id BC0A421C46
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2012 18:18:00 -0500 (CDT)
Date: Tue, 19 Jun 2012 18:17:54 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120619181754.5b8a7f31@bettercgi.com>
In-Reply-To: <4FE0C16F.4020804@gmail.com>
References: <4FE0C16F.4020804@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM internals, guides, design, tutorials plz
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
To: linux-lvm@redhat.com

Make no changes to the drives you have. Try to fix only
images of them. "fix" means change what's on disk, which means lose
what's there. The most common cause of completely destroyed data is
attempts to recover it. 

Study /etc/lvm/backup/* and /etc/lvm/archive/* copied from a live
system. That pretty well shows you the internal structure of the data
better than prose is likely to explain it.  That textual representation
of the metadata is exactly what's on disk.  It's just written
circularly in disk, so it starts with the middle of an old version.

As far as recovery, it's probably going to either be fairly simple, or
not possible at the LVM level. If you have an old backup of the system,
it should contain /etc/lvm/backup/.  If you didn't change the LVM since
that old backup was done, you're gold. Just vgcfgrestore
from /etc/lvm/backup/ in the old backup.

Make no changes to the drives you have.  Try to fix only images of
them.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Tue, 19 Jun 2012 18:14:07 +0000
Daniel Hilst <danielhilst@gmail.com> wrote:

> I'm searching for LVM2 implementation designs, anatomy, internals and 
> such stuff..
> 
> Tutorials, Howtos (I've already read the LVM Howto from tldp),
> Guides, are all welcome.. I've lost a LVM and need to recover it...
> or die trying :-)
> 
> 
> So.. Testdisc, and Photorec don't help me.. I've already try.. can't
> ran gpart too...
> 
> I want to be able to search for lvm metadata from the end of the disk 
> with some binary editor, like lde.
> 
> 
> Thanks in advance
> Hilst
