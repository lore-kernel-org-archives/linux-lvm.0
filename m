Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB2MaMsh009125
	for <linux-lvm@redhat.com>; Wed, 2 Dec 2009 17:36:22 -0500
Received: from mail-bw0-f214.google.com (mail-bw0-f214.google.com
	[209.85.218.214])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB2MaBit008299
	for <linux-lvm@redhat.com>; Wed, 2 Dec 2009 17:36:11 -0500
Received: by bwz6 with SMTP id 6so670141bwz.11
	for <linux-lvm@redhat.com>; Wed, 02 Dec 2009 14:36:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.0912011330030.29511@bmsred.bmsi.com>
References: <4cd59bf50911301645l51c44579k978225d3fe9e71b0@mail.gmail.com>
	<20091201182835.GC14760@IUPUI.Edu>
	<Pine.LNX.4.64.0912011330030.29511@bmsred.bmsi.com>
Date: Thu, 3 Dec 2009 00:36:10 +0200
Message-ID: <4cd59bf50912021436g6f45b0fcj544c2f2aae56932e@mail.gmail.com>
Subject: Re: [linux-lvm] show free space _inside_ logical volume
From: Gabriel <jarod125@gmail.com>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

df tells me the actual usable space on the partition which is less
than the filesystem size. However, dumpe2fs shows some useful
information:

user@homepc:~$ sudo dumpe2fs -h /dev/mapper/myvg-root | grep -i block
dumpe2fs 1.41.9 (22-Aug-2009)
Block count:              171008000
Reserved block count:     8546960
Free blocks:              13915854
First block:              0
Block size:               4096
Reserved GDT blocks:      983
Blocks per group:         32768
Inode blocks per group:   512
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
Journal backup:           inode blocks

Multiplying block count by block size and dividing the result by
1024^3, I obtain the exact value reported by lvdisplay:

user@homepc:~$ sudo lvdisplay -v /dev/myvg/root
    Using logical volume(s) on command line
  --- Logical volume ---
  LV Name                /dev/myvg/root
  VG Name                myvg
  LV UUID                6poYWo-YHsp-dhLC-lDBA-3xfw-9EIn-DSDYL2
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                652.34 GB
  Current LE             167000
  Segments               4
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:1

At the same time, df -h / shows this:

user@homepc:~$ df -h /
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/myvg-root
                      643G  590G   21G  97% /

which is significantly less (the difference being used for filesystem
metadata information).

After doing a lvextend, output of dumpe2fs does not change. The block
count number is increased only after running resize2fs. So, the
difference between this value and the one reported by lvdisplay is the
free space "inside" the LV.

In case I'd want to shrink the LV, I would need to first shrink the
filesystem and then the LV. If I were to shrink the LV to a value
higher than the one reported by df but lower than the one obtained by
converting the block count to GBs, I would probably end up with a
corrupted filesystem.

While we're at it, I'm curious about what the "Reserved block count"
and "Free blocks" values mean. The former translates to 32.6 GB which
is way more than the difference between the total space reported by df
(643 GB) and the entire filesystem size (652.34 GB). The latter
translates to 53 GB which is available space reported by df (21 GB) +
aforementioned 32.6 GB value.

On Tue, Dec 1, 2009 at 8:33 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:
> On Tue, 1 Dec 2009, Mark H. Wood wrote:
>
>> Depending on what's most important to you, to have either set of tools
>> work with the other's data would either be a layering violation, cause
>> unnecessary and fragile coupling of unrelated tools, or make them
>> needlessly complex. �Both toolsets need to remain small, light,
>> rugged, and simple, because they're used for standing up and repairing
>> systems that may not be ready for daily use.
>
> The other option is the ZFS approach of integrating LVM and filesystem.
> The drawback is that you can only ever use the one supported filesystem.
> (Though there is probably a way to mount unsupported filesystems - but
> then you are back to having to use both tools and subtract.)
>
> Linux LVM doesn't know or care what filesystem you use, which is super
> for experimenting with filesystems - expecially in conjunction with
> a virtual machine.
>
> --
> � � � � � � �Stuart D. Gathman <stuart@bmsi.com>
> � �Business Management Systems Inc. �Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
