Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBO9YbV7006895
	for <linux-lvm@redhat.com>; Wed, 24 Dec 2008 04:34:37 -0500
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.229])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBO9YONV024330
	for <linux-lvm@redhat.com>; Wed, 24 Dec 2008 04:34:25 -0500
Received: by rv-out-0506.google.com with SMTP id f6so3120931rvb.51
	for <linux-lvm@redhat.com>; Wed, 24 Dec 2008 01:34:24 -0800 (PST)
Message-ID: <1908f30812240134h2ec2f192xf1fe272336dd8ca9@mail.gmail.com>
Date: Wed, 24 Dec 2008 10:34:24 +0100
From: "Jordi Prats" <jordi.prats@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] is snapshoting risky if it gets full?
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

Hi all,
I'm using snapshots to get backups from a MySQL database.

There's any risk if "Allocated to snapshot" raises to 100% usage? It's
going to affect in any way the original logical volume?

regards,
-- 
Jordi
