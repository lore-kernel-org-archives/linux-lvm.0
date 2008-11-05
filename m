Received: from mx.meyering.net (sebastian-int.corp.redhat.com [172.16.52.221])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mA5Fj2tO031018
	for <linux-lvm@redhat.com>; Wed, 5 Nov 2008 10:45:03 -0500
From: Jim Meyering <jim@meyering.net>
Date: Wed, 05 Nov 2008 16:45:02 +0100
Message-ID: <87ljvyyy69.fsf@rho.meyering.net>
MIME-Version: 1.0
Subject: [linux-lvm] lvm2.git has been regenerated
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
To: LVM general discussion and development <linux-lvm@redhat.com>

FYI, I've just regenerated the lvm2.git repository on sources.redhat.com
(aka sourceware.org) from the CVS repository.

    http://sources.redhat.com/git/gitweb.cgi?p=lvm2.git;a=summary

That means you will probably want to clone from scratch:

    git://sources.redhat.com/git/lvm2.git
    ssh://sources.redhat.com/git/lvm2.git
    http://sources.redhat.com/git/lvm2.git

and that references to SHA hashes in the old tree are no longer valid.

There is also an lvm2.git repository on et.redhat.com
that will shortly be mirroring this one.
