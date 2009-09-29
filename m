Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8TLW0tf030561
	for <linux-lvm@redhat.com>; Tue, 29 Sep 2009 17:32:00 -0400
Received: from mail-yx0-f183.google.com (mail-yx0-f183.google.com
	[209.85.210.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8TLVmwa006951
	for <linux-lvm@redhat.com>; Tue, 29 Sep 2009 17:31:48 -0400
Received: by yxe13 with SMTP id 13so6677302yxe.23
	for <linux-lvm@redhat.com>; Tue, 29 Sep 2009 14:31:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <d60517f30909232055g452df1cjcd298ddb0e428ba4@mail.gmail.com>
References: <d60517f30909222050j77b16ce7x769f442043151bbd@mail.gmail.com> 
	<d60517f30909232055g452df1cjcd298ddb0e428ba4@mail.gmail.com>
From: Thiago Nunes <thiagonunesrs@gmail.com>
Date: Tue, 29 Sep 2009 21:31:28 +0000
Message-ID: <d60517f30909291431m1e8de73asd033a0e82526896e@mail.gmail.com>
Subject: [linux-lvm] Re: "Incorrect metadata area header checksum" after a
	pvmove and pvresize
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Please, some one have a hint to me? Have I made something wrong?

I have an 80 GB hard drive (sda) who had a swap of 500 MB (sda1), an
/boot with 30 MB (sda2), a physical volume with 55 GB (sda3) and some
less important partitions after.

I use gentoo and some days ago I needed some more free space on my
/var/tmp/paludis (/dev/vg/tmp-paludis) and, workaroundly, ran a
pvcreate on /dev/sda5, who had 5 GB, added it to my volume group and
resized the logical volume /dev/vg/tmp-paludis.

Now I want to use my hard drive with a new scheme partition using the
sda3  until the end of the drive, with no more partitions after this.
To do that I took an auxiliary hard drive and booted my machine with
this drive (sdb) and using the System Rescue CD (v1.1.3) distribution.

Then I created an sdb1 with 6GB, ran pvcreate on it and added it to my
volume group. So I ran pvmove on sda5 to move data to sdb1, since sda3
had no more free space. After that I removed sda5 from my volume group
and deactivated the volume group to repartition my hard drive,
recreated the sda3 to occupies the drive until the end and ran
pvresize on sda3. Everything ran ok with no errors or warnings.

Then I wanted to use my system again and I rebooted the PC to boot my
system. I would continue to pvmove the sdb1 after I got my system
running but at the boot got the message "Incorrect metadata area
header checksum" from vgchange -a y on initrd and never more could
access my volume group.

Now I am on system rescue cd again and can't access my data. I don't
know what went wrong and don't know how to securely recover my volume
group.

Someone have any hint to me?

Here are the output of plenty useful commands:
http://200.19.254.116/~thiago/arquivos-lvm/

--
thiago
