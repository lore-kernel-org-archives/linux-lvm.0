Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n47KEcvu023795
	for <linux-lvm@redhat.com>; Thu, 7 May 2009 16:14:38 -0400
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
	[141.2.22.233])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n47KEJnw013292
	for <linux-lvm@redhat.com>; Thu, 7 May 2009 16:14:20 -0400
Received: from smtpauth.cluster.uni-frankfurt.de ([10.2.22.4]
	helo=smtpauth2.rz.uni-frankfurt.de)
	by mailout.rz.uni-frankfurt.de with esmtp (Exim 4.69)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1M29z1-0003ZJ-By
	for linux-lvm@redhat.com; Thu, 07 May 2009 22:14:19 +0200
Received: from ada-03.ghl40.whgl.uni-frankfurt.de ([141.2.119.133])
	by smtpauth2.rz.uni-frankfurt.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <sven@whgl.uni-frankfurt.de>)
	id 1M29yp-0000TW-Oo
	for linux-lvm@redhat.com; Thu, 07 May 2009 22:14:07 +0200
Message-ID: <4A03410E.9060801@whgl.uni-frankfurt.de>
Date: Thu, 07 May 2009 22:14:06 +0200
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and Truecrypt
References: <1f04f6fa0905061653k57d9bc8ekc0e55f809e98126a@mail.gmail.com>	<4A02268F.8010105@whgl.uni-frankfurt.de>	<1f04f6fa0905061919l102db155t6965ead9257f9ddd@mail.gmail.com>	<011d01c9cee6$f9873f00$ec95bd00$@no>
	<1f04f6fa0905070938u2a24f78q4e33f97da122aba4@mail.gmail.com>
In-Reply-To: <1f04f6fa0905070938u2a24f78q4e33f97da122aba4@mail.gmail.com>
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

The kernel crypo API carries a vast selection of ciphers, hash functions 
and mode of operation (or rather block chaining algorithms). Most of 
them are used for ipsec too (ciphers and hashes), thus I am somewhat 
confident they are rather well revised. if you use a precompiled kernel, 
just do a cat /proc/crypto, it will list, what's available, if the 
ciphers etc. are modular, you might need to modprobe the modules you 
plan to use first.

I personally use luks headers, for easier handling, because I can assign 
keys via UUIDs, by plugging in a usb stick during boot (you could aswell 
probably write an init-script that waits for the keys to be transmitted 
via network ...)

The problem with volumes >>1TB seems to be 'omnipresent' cbc-essiv etc. 
show the same weakness, from what I gathered (I am no expert here), this 
  is a general consideration, if you have enough data for a statistical 
attack chances get bigger to break the encryption, if an adversary is 
able to write data to the device, and thus knows the unencrypted data 
aswell as the encrypted data. There seems to be a new mode of operation 
(or algorithm for block chaining) which reduces those chances further.

There was a discussion on the dm-crypt list, to automatically slice huge 
volumes in chunks, and use key splitting (or some sort of derivation) to 
get multiple keys for the chunks.

I chose another option, let's assume you haave n disks, let's call them 
/dev/sda through /dev/sdn for now. create an encrypted blockdevice via 
dm-crypt for each of those, for the sake of easiness we give them 
symbolic names, let's say crypt-a through crypt-n, with n different 
keyys. (On the assumption that every physical device is smaller than 
1TB). The crypted blockdevices behave exactly like physical disks, thus, 
you can partition them, or you can create PVs for LVM usage, or you can 
use md(raid) to form a raid volume out of them.
You can stack md/devmapper/dm-crypt devices on top of each other as you 
please, but always consider, more layaers could potentially produce 
errors, if any of the layers might have a bug/failure, this should be 
taken into account, tough it's a locigal thing.
Advantages of such a setup are:
1.) each disk has an own key, thus you need to break n keys, if you want 
to acces ALL data in clear
2.) no matter if the crypto algorithm is parallelized, each disk gets 
it's own dmcrypt kernel thread, which in turn can be scheduled onto 
different cores and cpus, thus yielding in a better performance, if you 
have multiple cores/cpus and the algorthim itself is not prallelized.
But it needs a little more work in the setup, since you need to provide 
multiple keys.

Example for clarification:


/dev/sda becomes /dev/crypta, /dev/crypta can be used like /dev/sda, 
after providing the key, cipher algorithm etc. to cryptsetup.
Now instead of putting your PV Header/Metadata onto /dev/sda, you use 
/dev/crypta, thus the metadata gets encrypted aswell as all the data in 
the PV. The PV's Metadata holds information about your VolumeGroup and 
Logical volumes, in your case as I understood it, you will have one 
VolumeGroup consisting of those n dm-crypt devices, and one 
LogicalVolume, with one giant filesystem.

If you wanna access files from windows easily, you'd then setup samba, 
and export the filesystem or directories in the filesystem via samba.
Make sure, you use a filesystem with ExtendedAttributes/Posix ACLs, have 
support for it in the kernel and in samba. If you set it up properly, 
you can access the volume or the directories exported, from windows, you 
can even manage user permission on the filesystem from your windows 
client, in the same manner you can on local disks. This will need some 
fiddling and testing around, but I can assure you it works :-).

 From what I know, luks/dm-crypt support is tied pretty well into 
ubuntu,  eventually check the ubuntu wiki, there's some articles for 
setting up dmcrypt etc. right from the beginning, if you'd want to hold 
the actual system on those crypto devices and boot of them aswell, for 
the latter, you need to choose some alternate setup media if I remember 
correctly.

Personal sidenote: Nopes, nevr made it to CCC unfortunately, but it's on 
my agenda, of things a man should do in his life :-)


Hope my mail helps a little in understanding possible setups ;-).

Regards

-Sven


Gordon Fogus schrieb:
> 
> Sven Eschenberg: "Concerning encryption, I was asking, because if you 
> use linux as OS on your NAS and linux solely, you could use dmcrypt 
> (which is used by truecrypt on linux too, if available) which gives you 
> more options on encryption etc. (Choose any cipher from the kernel 
> crypto api, luks key managment ...). This is usually integrated far 
> better into distributions, than truecrypt."
> 
> Wow, Linux has built in crypto.  Windows has... :(  I will check this 
> out.  I guess this means I need to get used to typing into the command 
> box to do everything.  I am using a 6TB RAID5 currently (5TB usable).  I 
> find it unbearably slow compared to my 4TB RAID0+1 (2TB usable).
> 
> Sven Eschenberg: "In case you want to avoid the luks header (since it 
> indicates some info on the crypted volume, offers multiple key slots 
> etc.) you can still revert to non-luks mode with dm-crypt and still 
> enjoy all the ciphers from the kernel (and modes of operation)."
> 
> Yes, I would definitely prefer not to have a header that says: "Secrets 
> lurk beyond".
> 
> Sven Eschenberg: "Concerning truecrypt: Truecrypt always uses XTS afaik, 
> you certainly would not want to encrypt a 10 TB volume with that.
> (http://en.wikipedia.org/wiki/XTS#XTS)"
> 
> Ohhhh bother!  You sound like you know crypto better than I.  What mode 
> of operation do you recommend?  Is there a distro you would recommend 
> for crypto above others?  I was thinking of using Ubuntu because it has 
> such a large support base.
> 
> Sorry, I didn't look at your address.  I was in Frankfurt a few years 
> ago.  Have you been to CCC ever?
> 
> Gordon
> 
> 
> 
