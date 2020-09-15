Received: from [10.43.17.75] (unknown [10.43.17.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1D4660C0F
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2020 11:55:23 +0000 (UTC)
References: <5CE72DC6-9948-4CB6-83E9-C1F2AE55D5DB@gmail.com>
From: =?UTF-8?Q?Vojt=c4=9bch_Trefn=c3=bd?= <vtrefny@redhat.com>
Message-ID: <1eb0c4c0-08e2-cd74-7134-7f894a23d00d@redhat.com>
Date: Tue, 15 Sep 2020 13:55:23 +0200
MIME-Version: 1.0
In-Reply-To: <5CE72DC6-9948-4CB6-83E9-C1F2AE55D5DB@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] vgcfgrestore + pvcreate using liblockdev api in C
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
To: linux-lvm@redhat.com

Hi, libblockdev is not part of the LVM project so it's usually better to
ask on our GitHub: https://github.com/storaged-project/libblockdev

Example for extra arguments is available in the documentation:
http://storaged.org/libblockdev/libblockdev-Utils.html#bd-extra-arg-new
(the example is for the filesystem plugin, but it works the same for LVM
plugin).

We don't have full coverage of all LVM commands so there is no
vgcfgrestore function in the LVM plugin. We are currently working on new
major release so this would be a good time for adding new functions
and/or adjusting API so please open an issue on GitHub for things you'd
like to be added to libblockdev.

On 9/14/20 7:56 AM, Tomas Dalebjörk wrote:
> hi
> 
> Is there an api available today or an example how to perform the below OS commands in C using a function or api instead of system calls?
> 
> 1. create an unique uid on the server, and store it on the PV disk
> 
> # pvcreatue -u <generated uid> <your device>
> 
> 2. create the LVM metadata backup content (as /etc/lvm/backup/...)
> - add PV uid generated above as there is no parameter to save the data to a device
> - add unique VG
> - add exactly 1 contiguous LV
> 
> 3. save LVM metadata to the PV disk as the OS command does
> 
> # vgcfgrestore VG
> 
> Can this be done by instead of using system() calls, instead using native C commands either via an API or other methods?
> 
> the examples for bd_lvm_pvcreate() in libblockdevapi for example does not say how to add -u flag
> and I couldn’t find any vgcfgrestore there too?
> 
> besides this, I found it strange why pvcreate -u is needed at all? would be better to have a <dev> parameter directly to the vgcfgrestore command instead
> 
> looking forward to hearing from you soon again 
> 
> regards Tomas
> 
> Sent from my iPhone
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
