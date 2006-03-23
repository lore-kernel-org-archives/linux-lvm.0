Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2NGd8BE014791
	for <linux-lvm@redhat.com>; Thu, 23 Mar 2006 11:39:08 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.204])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2NGd8NW030698
	for <linux-lvm@redhat.com>; Thu, 23 Mar 2006 11:39:08 -0500
Received: by wproxy.gmail.com with SMTP id i28so536022wra
	for <linux-lvm@redhat.com>; Thu, 23 Mar 2006 08:39:08 -0800 (PST)
Message-ID: <170fa0d20603230838y173d14f5ib2692c87ab6b20ea@mail.gmail.com>
Date: Thu, 23 Mar 2006 11:38:45 -0500
From: "Mike Snitzer" <snitzer@gmail.com>
Subject: Re: [linux-lvm] Hardware snapshots and LVM2?
In-Reply-To: <H000007200c27f69.1142968273.fsu50.nll.se@MHS>
MIME-Version: 1.0
Content-Disposition: inline
References: <H000007200c27f69.1142968273.fsu50.nll.se@MHS>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 3/21/06, fredrik.backman@nll.se <fredrik.backman@nll.se> wrote:
> Hi
>
> Im doing a snapshot (hardware-based in EVA5000) of a LV
> (lvm2) and i
> wonder what is the correct way to use this snapshot?
> Problem is that
> this snapshot has the same ID as the original one. In HP-UX
> a would do a
> vgchgid on this snapshot-LV. Any help would be aprreciated.

You're creating snapshots of the entire block device.  As such the
snapshot device has identical LVM2 metadata as the origin device.  You
need to generate new PV, VG, LV UUIDs, modify the metadata and then
restore that modified metadata to the snapshot device (via
vgcfgbackup, vgcfgrestore).  EVMS has a decent random lvm2 UUID
generator function that can be pulled out and made to run standalone.

Mike
