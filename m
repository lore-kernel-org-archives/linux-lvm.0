Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o956X7Gs002382
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 02:33:07 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o956WvTF008025
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 02:32:57 -0400
Received: by iwn5 with SMTP id 5so10271196iwn.33
	for <linux-lvm@redhat.com>; Mon, 04 Oct 2010 23:32:56 -0700 (PDT)
MIME-Version: 1.0
Sender: a.skwar@gmail.com
In-Reply-To: <AANLkTimSuJmsruAbN5K+s8=DcrcVqB6BAbcyFhdTauF+@mail.gmail.com>
References: <AANLkTikmp+gSajt=Nnp7JuopFBQgzM1DsGmziyMOjeXW@mail.gmail.com>
	<AANLkTinq+3DzM0x1sOGJB6Kw93d3i+dezNy86B1SQRBP@mail.gmail.com>
	<1286249478.12105.27@raydesk1.bettercgi.com>
	<AANLkTimSuJmsruAbN5K+s8=DcrcVqB6BAbcyFhdTauF+@mail.gmail.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Tue, 5 Oct 2010 08:32:31 +0200
Message-ID: <AANLkTina=tBEY2aCtSo3AsjOiMAqxWxobDFserPCV-HM@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] mounting a filesystem on LVM2
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

hi.

You seem to be confused about the steps that are required for
"getting a directory to store stuff" on Linux. Let me give you a
basic workflow:

In old fashioned partition setup:

a) Get a storage device (hard disk, SSD, FC, iSCSI, ...)
 -> Result: Device "file" like /dev/sda
b) Split the storage device into chunks of wanted size ("partitions")
 using tools like fdisk, cfdisk, parted === REQUIRED TO BE DONE!
 -> Result: Device "files" like /dev/sda1, /dev/sda3, /dev/sda15
f) On those partitions, create a filesystem (eg. mkfs.ext3) or swap (mkswap)
g) Mount

In LVM, you'd do:

a) Get a storage device (hard disk, SSD, FC, iSCSI, ...)
 -> Result: Device "file" like /dev/sda
b) Split the storage device into chunks of wanted size ("partitions")
 using tools like fdisk, cfdisk, parted === COMPLETELY OPTIONAL!
 -> Result: Device "files" like /dev/sda1, /dev/sda3, /dev/sda15
c) "Declare" the "storage spot" (/dev/sda, /dev/sda3, ...) as physical
 volumes (pv) using pvcreate
d) Create a volume group (vg), using this/these pv(s)
e) On a vg, create logical volumes (lv) using lvcreate
f) On these/this lv, create a filesystem (eg. mkfs.ext3) or swap (mkswap)
g) mount

Steps a), f) and g) are identical in old fashioned way and LVM. Step
b) is required in partitioning way and optional in LVM setup.

It's also identical, that you only create ONE (1) filesystem on any
ONE (1) partition or lv. You do *NOT* create two or more filesystems
on one partition/lv (it's doable, but *EXTREMELY* unusual).

But that's also outlined in the LVM howto... Chapter 11.
http://tldp.org/HOWTO/LVM-HOWTO/commontask.html

You really should read it...

Alexander

2010/10/5 Tapas Mishra <mightydreams@gmail.com>:
> On Tue, Oct 5, 2010 at 9:01 AM, Ray Morris <support@bettercgi.com> wrote:
>>
>> partitions, just like any other block device.
>> Preferably use parted as opposed to fdisk, as
>> fdisk can support only up to 2 TB.
>
> You mean to say within the LVM if I use parted that way I will be able
> to create two different filesystems existing together.
> Until now what ever I came across internet is mkfs.ext3 and mkswapfs but
> they work on two different LVM and will convert those LVM into ext3
> and swap respectively.
> I want to break one LVM into 2 one of which I want to populate with a
> root filesystem
> and another with swap.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Alexander
--
↯    Lifestream (Twitter, Blog, …) ↣ http://alexs77.soup.io/     ↯
↯ Chat (Jabber/Google Talk) ↣ a.skwar@gmail.com , AIM: alexws77  ↯
