Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0OEtx131645
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 09:55:59 -0500
Received: from mail.terrascale.net (modemcable010.32-70-69.static.videotron.ca
	[69.70.32.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0OEtkWc030978
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 09:55:51 -0500
In-Reply-To: <200601232302.SAA22735@out-of-band.media.mit.edu>
References: <200601232302.SAA22735@out-of-band.media.mit.edu>
Mime-Version: 1.0 (Apple Message framework v746.2)
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Apple-Mail-2-893552236"
Message-Id: <3CBC4C64-B672-4468-A493-7192234BA001@terrascale.net>
Content-Transfer-Encoding: 7bit
From: AJ Lewis <aj@terrascale.net>
Subject: Re: [linux-lvm] pvcreate can't use entire disk?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Tue, 24 Jan 2006 14:55:59 -0000
List-Id: <linux-lvm.redhat.com>
To: f-lvm@media.mit.edu
Cc: linux-lvm@redhat.com

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--Apple-Mail-2-893552236
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed


On Jan 23, 2006, at 5:02 PM, f-lvm@media.mit.edu wrote:

>     Date: Mon, 23 Jan 2006 22:35:16 +0000
>     From: Alasdair G Kergon <agk@redhat.com>
>
>     On Mon, Jan 23, 2006 at 05:26:00PM -0500, f-lvm@media.mit.edu  
> wrote:
>> "Device /dev/hdd not found."  The disk is surely online:  I can
>
>> I would have -expected- pvcreate to complain about a partition table
>> existing
>
>     The currrent internal structure of LVM2 makes that difficult.
>     Add -vvvv to commands for more information like that.
>
>     Invalid devices are filtered out at a low level in the libraries
>     so tools such as 'pvcreate' never see them.
>
>     If your disk has a partition table, then LVM2 insists you use  
> those
>     partitions to reduce the risk of accidents.
>
> Ah.  That's directly contrary to the LVM2 howto at
> http://www.tldp.org/HOWTO/LVM-HOWTO/initdisks.html,
> which says, "If you get an error that LVM can't initialize
> a disk with a partition table on it, ..." etc.

Well, LVM1 would complain about the partition table.  I guess lvm2  
does not, but that doesn't change the fact that neither would let you  
write to a whole disk with a partition table on it.  I can update the  
howto to say that is the error to expect for lvm2 when trying to use  
a whole disk with a partition table on it.

Regards,
AJ

--Apple-Mail-2-893552236
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFD1j/xn95okVnkz6cRAoFsAJ9q2dBmxDN914/Z5xCP8+iMddQeLQCdGrby
gE7CylwFTBYupPCMnvtlv0w=
=HMUu
-----END PGP SIGNATURE-----

--Apple-Mail-2-893552236--
