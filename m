Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3L46TUA006667
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 00:06:29 -0400
Received: from rattler.cajuninc.com
	(adsl-068-153-235-242.sip.shv.bellsouth.net [68.153.235.242])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3L46EcJ022559
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 00:06:15 -0400
Received: from localhost (localhost [127.0.0.1])
	by rattler.cajuninc.com (Postfix) with ESMTP id 97919781D8
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2010 23:06:14 -0500 (CDT)
Received: from rattler.cajuninc.com ([127.0.0.1])
	by localhost (rattler.cajuninc.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id dmwnY9HhgB70 for <linux-lvm@redhat.com>;
	Tue, 20 Apr 2010 23:06:14 -0500 (CDT)
Received: from rattler.cajuninc.com (unknown [10.10.11.1])
	by rattler.cajuninc.com (Postfix) with ESMTP id 17A5E781D6
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2010 23:06:14 -0500 (CDT)
Message-ID: <4BCE79B5.9070600@cajuninc.com>
Date: Tue, 20 Apr 2010 23:06:13 -0500
From: "M.Lewis" <cajun@cajuninc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Migrating LVM
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
To: linux-lvm@redhat.com


I'm building a new machine with RAID1+LVM2. I plan to migrate the data 
from the old machine HD to the new machine.

Is it better to make the new VG the same name as the existing VG on the 
old box? Or should I make it different.

Is there an easy way to do this that I've not yet found? I was thinking 
to make the new VG the same name as the old, add the old drives to the 
machine then pvmove the data.

Thanks for any pointers!
Mike
