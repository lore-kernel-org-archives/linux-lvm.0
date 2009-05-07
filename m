Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n475MvfI029127
	for <linux-lvm@redhat.com>; Thu, 7 May 2009 01:22:57 -0400
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
	[141.2.22.233])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n475LeYa001799
	for <linux-lvm@redhat.com>; Thu, 7 May 2009 01:21:40 -0400
Received: from smtpauth.cluster.uni-frankfurt.de ([10.2.22.4]
	helo=smtpauth2.rz.uni-frankfurt.de)
	by mailout.rz.uni-frankfurt.de with esmtp (Exim 4.69)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1M1w3A-0004Y0-3x
	for linux-lvm@redhat.com; Thu, 07 May 2009 07:21:40 +0200
Received: from ada-03.ghl40.whgl.uni-frankfurt.de ([141.2.119.133])
	by smtpauth2.rz.uni-frankfurt.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <sven@whgl.uni-frankfurt.de>)
	id 1M1w32-0001Em-K8
	for linux-lvm@redhat.com; Thu, 07 May 2009 07:21:32 +0200
Message-ID: <4A026FDD.90404@whgl.uni-frankfurt.de>
Date: Thu, 07 May 2009 07:21:33 +0200
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and Truecrypt
References: <1f04f6fa0905061653k57d9bc8ekc0e55f809e98126a@mail.gmail.com>	<4A02268F.8010105@whgl.uni-frankfurt.de>
	<1f04f6fa0905061919l102db155t6965ead9257f9ddd@mail.gmail.com>
In-Reply-To: <1f04f6fa0905061919l102db155t6965ead9257f9ddd@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Gordon,

As someone explained already, LVM writes metadata on each Physical 
Volume (read: disk or disk partition or any other block device), if you 
fancy it, you can even save two copies (just in case one copy gets 
corrupted due to some failure, bad sector or whatever).
The Metadata gives you the opportunity to change diskorder, move disks 
to different controllers (as in move some of the disks from one 
controller, to another controller in the machine), or any other machine, 
as long as you got the whole set at hands.
(Now that I am thinking about it, you could even place all n disks into 
n different machines and create an LVM from them, though this might be a 
little more tricky, than the other scenarios)

As an alternative, you could use md devices (offering different software 
based raid levels), md does indeed provide the same features (in 
example, you have a raid 5 volume with n drives, you can choose any n-1 
drives of those, stick em into another machine, and use the raid, add 
another disk, integrate it into the array and rebuild it).
So, for both cases, md based raid and lvm, there's metadata, no worries 
there.
Most HW Raidcontrollers (Tekram, Adaptec, 3ware ...) usually save 
metadata information on disks too, the major problem is getting a new 
(expensive) card from the same vendor.

Concerning encryption, I was asking, because if you use linux as OS on 
your NAS and linux solely, you could use dmcrypt (which is used by 
truecrypt on linux too, if available) which gives you more options on 
encryption etc. (Choose any cipher from the kernel crypto api, luks key 
managment ...). This is usually integrated far better into 
distributions, than truecrypt.
In case you want to avoid the luks header (since it indicates some info 
on the crypted volume, offers multiple key slots etc.) you can still 
revert to non-luks mode with dm-crypt and still enjoy all the ciphers 
from the kernel (and modes of operation).
Concerning truecrypt: Truecrypt always uses XTS afaik, you certainly 
would not want to encrypt a 10 TB volume with that.
(http://en.wikipedia.org/wiki/XTS#XTS)

And for your last question, no I live in Germany actaully (hence the .de 
domain)

Regards

-Sven



Gordon Fogus schrieb:
> Hello Sven (and all),
> 
> I have been concerned that a failure on one of the disk controllers 
> would result in data loss in the following way:
> 1. A mainboard fails that has a JOBD RAID connected
> 2. The mainboard is replaced and the drives from the original set are 
> connected.
> 3. Because of hardware changes and/or operating system changes and/or 
> "disk order" changes, no data can be read from the RAID.
> I'd be curious to know this: if I had a JOBD under LVM and I tried to 
> plug the disks into another PC entirely, would I be able to read the 
> files I had on those drives?  How does LVM know which drive was where in 
> the order of drives in the JOBD?
> 
> I am not actually worried about data loss from a drive failure.  I 
> backup regularly (but I have never had a hard drive fail.  I attribute 
> this partly to the temperature at which I keep my drives).  I have had 
> several RAID controller failures (which is why I no longer consider any 
> RAID level to be a backup).
> 
> By asking, "Is there any partuclar reason for using truecrypt?" do you 
> mean, "Why truecrypt as opposed to any other encryption solution?"?  If 
> so, I use truecrypt because it is opensource and has received a lot of 
> attention from experienced cryptographers.  I wouldn't trust closed 
> source or obscure encryption software.  On the other hand, if you were 
> asking, "Why use encryption?", then you might be interested in Sans news 
> bites: http://www.sans.org/newsletters/newsbites/ .  Sans covers many 
> data leaks.
> 
> (Do you live in Scandinavia?)
> 
> Gordon
> 
> On Wed, May 6, 2009 at 5:08 PM, Sven Eschenberg 
> <sven@whgl.uni-frankfurt.de <mailto:sven@whgl.uni-frankfurt.de>> wrote:
> 
>     Hi Gordon,
> 
>     Is there any particular Reason, why a mainboard failure should
>     result in massive data loss?
>     But you can be assured, that a disk failure in such a volume will
>     most certainly result in massive dataloss, since the filesystem
>     spans across all disks.
>     Is there any partuclar reason for using truecrypt?
> 
>     Regards
> 
>     -Sven
> 
