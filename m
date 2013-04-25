Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3PCEeSH019545
	for <linux-lvm@redhat.com>; Thu, 25 Apr 2013 08:14:40 -0400
Received: from homiemail-a83.g.dreamhost.com (caibbdcaaaaf.dreamhost.com
	[208.113.200.5])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3PCEdCR015604
	for <linux-lvm@redhat.com>; Thu, 25 Apr 2013 08:14:39 -0400
Received: from homiemail-a83.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a83.g.dreamhost.com (Postfix) with ESMTP id 5B93B5E078
	for <linux-lvm@redhat.com>; Thu, 25 Apr 2013 05:14:39 -0700 (PDT)
Received: from [127.0.0.1] (unknown [159.63.145.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tanstaafl@libertytrek.org)
	by homiemail-a83.g.dreamhost.com (Postfix) with ESMTPSA id 2F2925E063
	for <linux-lvm@redhat.com>; Thu, 25 Apr 2013 05:14:39 -0700 (PDT)
Message-ID: <51791E1A.8020903@libertytrek.org>
Date: Thu, 25 Apr 2013 08:14:18 -0400
From: Tanstaafl <tanstaafl@libertytrek.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM snapshots and filesystem quiescence
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

I'm totally new to LVM snapshots. I've have read the FAQ and docs and 
searched the list archives and can't find an answer to my question...

I know that you have to quiesce SQL databases using their own native 
tools if you want to have a consistent snapshot of the raw db files, but 
what about other programs like postfix or dovecot that are constantly 
(on a busy server) writing to disk? Do you need to stop these, take the 
snapshot, then restart them? Or will the filesystem itself handle this 
(similar to how VSS works on windows)?

I'm fairly certain the answer is no, I don't have to worry about these 
kinds of programs, only SQL databases.

I engage a script that simply performs a native dump of my databases 
immediately preceding the snapshot (my db's are very small and the dumps 
only take a few seconds, and this just seems much simpler to me) and 
places these files into a sql_dumps directory on the filesystem that 
will be snapshotted so these will be included in my backups, so am not 
worried about them being in a consistent state.

Thanks in advance...

Charles
