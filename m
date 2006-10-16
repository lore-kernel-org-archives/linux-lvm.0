Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9GGo2vK003109
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 12:50:02 -0400
Received: from pbr322.ceingebi.unam.mx (pbr322.ibt.unam.mx [132.248.32.1])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9GGnxsP018054
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 12:50:00 -0400
Received: from [132.248.32.28] (negra [132.248.32.28])
	by pbr322.ceingebi.unam.mx (8.12.3/8.12.3/Debian-7.1) with ESMTP id
	k9GFp55r015820
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 10:51:05 -0500
Message-ID: <4533ABCD.8030502@ibt.unam.mx>
Date: Mon, 16 Oct 2006 10:57:01 -0500
From: Jerome <jerome@ibt.unam.mx>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to restore a PV ??
References: <452EEB6C.9040701@ibt.unam.mx>
In-Reply-To: <452EEB6C.9040701@ibt.unam.mx>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

jbrassow wrote:
 >does 'vgcfgrestore principal' work?
 >
 > brassow
 >
Hi Jonathan,
i try to use this command, and i've received this error mesage:

/etc/lvm/backup/principal: stat failed: No such file or directory
Couldn't read volume group metadata.
Restore failed.

I mean that i've lost the /etc/lv/ directory lost. I've read some 
information about how to construct the Metadata file with hexdump 
command (cf : 
https://www.redhat.com/archives/linux-lvm/2006-June/msg00049.html).
But i not sure how to do this yet.

Thank's a lot.




-- 
-- J�r�me
Il n'y a point de g�nie sans un grain de folie.
	(Aristote)
