Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJGdGr04327
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 11:39:16 -0500
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAJGdFOk004080
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 11:39:15 -0500
Received: from [127.0.0.1] (leviathan [131.128.51.64])
	by leviathan.ele.uri.edu (8.12.9/8.12.9) with ESMTP id iAJGd7qr013298
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 11:39:07 -0500 (EST)
From: Ming Zhang <mingz@ele.uri.edu>
Message-Id: <1100882347.2984.32.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Fri, 19 Nov 2004 11:39:07 -0500
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] relocate on write for snapshot
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi, I wonder if there are any thought about a relocate on write policy
for snapshot instead of copy on write policy used now?

instead of copy old one to snapshot, overwrite old one with new one, 2
writes and 1 reads. it is possible that write new data to a usused
location directly.

i know later remove a snaphot will be a little trouble, but there must
be some way to get around it.

just a rough thought, any comment?

ming
