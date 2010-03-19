Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2JIbWWI001359
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2010 14:37:32 -0400
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2JIbH4w021544
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2010 14:37:18 -0400
Received: by wwe15 with SMTP id 15so1962725wwe.33
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2010 11:37:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4BA3BEBE.2010204@cfl.rr.com>
References: <4BA3BEBE.2010204@cfl.rr.com>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Fri, 19 Mar 2010 13:36:56 -0500
Message-ID: <f4f537b51003191136r5f0d96f1m3c0ed8315382009c@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Data alignment
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

On Fri, Mar 19, 2010 at 1:13 PM, Phillip Susi <psusi@cfl.rr.com> wrote:
> I have been trying to get my logical volume to be aligned to a 512 KB
> boundary on my SSD so it lines up with the flash erase block. �I thought
> I could do this with pvcreate --dataalign 1024, but this caused the data
> to be aligned to a 1024 sector boundary within the partition, which
> itself starts on sector 63. �I then thought the --dataalignoffsest
> switch would help, but specifying 63 there caused the data to be moved
> to sector 1087. �I tried giving it -63, but was told that a negative
> number is not allowed. �Why not? �How can I get the data to start on
> sector 1024-63 of the partition so it ends up on pysical sector 1024 of
> the disk?

Align the partition?
