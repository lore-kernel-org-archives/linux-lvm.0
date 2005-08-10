Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7A7iRV17752
	for <linux-lvm@redhat.com>; Wed, 10 Aug 2005 03:44:27 -0400
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.206])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7A7iLE9012908
	for <linux-lvm@redhat.com>; Wed, 10 Aug 2005 03:44:21 -0400
Received: by rproxy.gmail.com with SMTP id 1so49297rny
	for <linux-lvm@redhat.com>; Wed, 10 Aug 2005 00:44:21 -0700 (PDT)
Message-ID: <5055b5c005081000441e03379@mail.gmail.com>
Date: Wed, 10 Aug 2005 00:44:21 -0700
From: Abhishek Gupta <abhishekgupt@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Question Regarding Snapshots.
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

Hi,

I am new to LVM and was wondering if it is possible to safely snapshot
the snapshot of a logical volume.

The scenario I am considering is this:

There is a logical volume A. A snapshot of a logical volume results in
another logical volume A*. Now, is it possible to modify A* and then
snapshot it to create a new logical volume A**.

Has anyone tried this before? Any answers/comments will be appreciated.

Thanks

Abhishek
