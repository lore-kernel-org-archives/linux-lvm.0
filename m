Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m27IYm64015322
	for <linux-lvm@redhat.com>; Fri, 7 Mar 2008 13:34:48 -0500
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.238])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m27IYHmi006701
	for <linux-lvm@redhat.com>; Fri, 7 Mar 2008 13:34:17 -0500
Received: by wr-out-0506.google.com with SMTP id 67so407217wri.3
	for <linux-lvm@redhat.com>; Fri, 07 Mar 2008 10:34:17 -0800 (PST)
Message-ID: <dd20e5b50803071034j29ca410dm304acf3e7b174f80@mail.gmail.com>
Date: Fri, 7 Mar 2008 13:34:16 -0500
From: "Lionel Kernux" <lionel.kernux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Can I create a PV that only uses a portion of a
	partition?
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

Hi again,

I have a 1.4TB disk that contains 1 parttition /dev/sda1.

Currently I have 1 PV that was created from /dev/sda1.

I have 1 VG created using the PV /dev/sda1.

I'd like to create some more VG's using the one disk.

Can I:

resize the PV /dev/sda1 and then create a new PV using the freed space?

I have a feeling that the relationship between partitions:PV's is 1:1.
Is this the case?

I was short-sighted when I created the PV and VG on this machine and
basically made one giant PV and one giant VG allocating it. Now I'd
like to be more granular.

I'm thinking the only way is to pvresize to shrink the PV, then shrink
the partition, then create some new partitions in the recovered space,
then create some new PV's from the new partitions, then create some
new VG's from the new PV's.


Any help?

Thanks

LK
