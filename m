Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p23KB34D028205
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2011 15:11:03 -0500
Received: from mail-ew0-f46.google.com (mail-ew0-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p23KAWMR025945
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2011 15:10:54 -0500
Received: by mail-ew0-f46.google.com with SMTP id 6so538457ewy.33
	for <linux-lvm@redhat.com>; Thu, 03 Mar 2011 12:10:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
Date: Thu, 3 Mar 2011 15:09:48 -0500
Message-ID: <AANLkTimPQM1dABu=SwTLY6Z6p9mXz2O=T6ujskCMkpqj@mail.gmail.com>
From: John Drescher <drescherjm@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Resizing underlying LVM partition after cloning to
 bigger disk
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
Cc: Scott Arthur <scott@scottatron.com>

On Thu, Mar 3, 2011 at 12:25 AM, Scott Arthur <scott@scottatron.com> wrote:
> So I've just cloned a 1TB disk to a new 2TB disk using GNU ddresuce
> My partition table looks like this:
> Model: ATA WDC WD20EARS-00M (scsi)
> Disk /dev/sda: 2000GB
> Sector size (logical/physical): 512B/512B
> Partition Table: msdos
> Number �Start � End � � Size � �Type � � �File system �Flags
> �1 � � �32.3kB �296MB � 296MB � primary � ext4 � � � � boot
> �2 � � �296MB � 1000GB �1000GB �extended
> �5 � � �296MB � 1000GB �1000GB �logical � � � � � � � �lvm
> I'm obviously wanting to expand the LVM partition to fill the remaining 1TB
> of space.
> Am I able to simply use parted to resize the partition before doing a
> pvresize etc?
> Or is it risky to resize the underlying LVM partition?
>
No. I do not believe this is risky.

John
