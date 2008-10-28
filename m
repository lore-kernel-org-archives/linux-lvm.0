Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9S2TnOc005213
	for <linux-lvm@redhat.com>; Mon, 27 Oct 2008 22:29:49 -0400
Received: from mail.unpatched.net (mail.unpatched.net [80.179.151.65])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9S2SCf3001676
	for <linux-lvm@redhat.com>; Mon, 27 Oct 2008 22:28:13 -0400
Received: from [192.168.10.98] (localhost [127.0.0.1])
	by mail.unpatched.net (Postfix) with ESMTP id 754F5D40DA
	for <linux-lvm@redhat.com>; Tue, 28 Oct 2008 04:31:26 +0200 (IST)
Message-ID: <490678BE.1070700@hidden.domain.name>
Date: Tue, 28 Oct 2008 04:28:14 +0200
From: Yoav <ml-lvm@hidden.domain.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] mirror and snapshot incompatible
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

According to lvcreate, a snapshot of a mirrored volume cannot be created 
("Snapshots and mirrors may not yet be mixed").  However, devmapper does 
not seem to have the same limitation when used directly (not through lvm).

Is there a current reason for lvcreate to enforce this rather harsh 
limitation?

What are the risks I'm taking by manually creating a dm-snapshot from a 
dm-mirror device?  (of course I'm also replacing the dm-mirror device 
with a snapshot-origin of the actual dm-mirror device).

If there is an actual reason for preventing this, what is the suggested 
way to consistently backup a mirror volume?  Is there a way to 
temporarily take one of the mirror "legs" (mimage devices)  offline in 
order to back it up, and resync it later?

    Yoav
