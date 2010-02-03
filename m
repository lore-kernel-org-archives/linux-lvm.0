Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o13K4XjA025400
	for <linux-lvm@redhat.com>; Wed, 3 Feb 2010 15:04:33 -0500
Received: from mail-fx0-f217.google.com (mail-fx0-f217.google.com
	[209.85.220.217])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o13K4H2e032363
	for <linux-lvm@redhat.com>; Wed, 3 Feb 2010 15:04:18 -0500
Received: by fxm9 with SMTP id 9so1882618fxm.30
	for <linux-lvm@redhat.com>; Wed, 03 Feb 2010 12:04:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B61E479.8040806@dogpad.net>
References: <4B61E479.8040806@dogpad.net>
Date: Wed, 3 Feb 2010 22:04:17 +0200
Message-ID: <4cd59bf51002031204l4e56f0f3jdd45d5d82196fd2b@mail.gmail.com>
From: Gabriel <jarod125@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] how to determine minimum partition size based on PV
	size
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Jan 28, 2010 at 9:24 PM, Joe Harvell
<jharvell+lists.lvm@dogpad.net> wrote:
> I need to reduce the size of an existing PV so that I can shrink the
> partition it resides on an reclaim the storage. �I have already shrunk
> the file systems and done an lvreduce.

before working on the PV, you also need to reduce the size of the
volume group the LV resides on.

> I have three questions:
>
> 1. Is the value of the '--setphysicalvolumesize' argument to the
> 'pvresize' command the size the physical volume (contents and metadata)
> will occupy on disk after the operation? �Or is it the specifying the
> new capacity of the PV to hold data?

In my understanding, the parameter specifies the total size of the PV.
The sum of PVs sizes (seen with pvdisplay) should be equal or larger
than the size of the VG residing on them.

> 2. How do I determine the minimum size I can specify to pvreduce and
> still have all of the original contents of the PV in the newly sized PV?

Multiply the number of allocated PEs to the size of a PE.

> 3. How do I determine the size the newly modified PV occupies on disk so
> that I can reduce the partition it lives on to its minimum size?

pvdisplay?


Sorry for the late reply, HTH.
