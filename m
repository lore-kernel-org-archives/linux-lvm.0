Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9NI7iV09386
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 14:07:44 -0400
Received: from qproxy.gmail.com (qproxy.gmail.com [72.14.204.193])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9NI7crO012519
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 14:07:38 -0400
Received: by qproxy.gmail.com with SMTP id o38so225859qbe
	for <linux-lvm@redhat.com>; Sun, 23 Oct 2005 11:07:37 -0700 (PDT)
Message-ID: <e92a1b70510231101x5a0c08d2p@mail.gmail.com>
Date: Sun, 23 Oct 2005 20:01:35 +0200
From: Tobias <t.bjorndal@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] How does LVM2 handle disc error?
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
To: linux-lvm@redhat.com

Hi I'm about to set up a file server. How does lvm2 handle disc
crashes in a logic volume? The thing is we don't care if the data on
just the disc which crashes is gone, we have all data offline on tape
and dvds. But we don't want the whole group to crash because of one
disc. We would like to not use raid5 and such because one disc is
lost.

Its for internal use so there will be no heavy load. About 10-20 ppl
will use the server for online central storage. Storage size at least
1Tb but we hope for 2Tb or more without any expensive hardware. Only
cheap sata expansion cards and discs.

/Tobias
