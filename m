Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1DJa2i32753
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 14:36:02 -0500
Received: from demonserver.de (p15093797.pureserver.info [217.160.109.186])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1DJa1b11385
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 14:36:02 -0500
Received: from demonlord.de (160.12.204.212.sr1.DTM1.ip.versanet.de [212.204.12.160])
	(authenticated bits=0)
	by demonserver.de (8.12.8/8.12.8) with ESMTP id i1DJa0K8016433
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 20:36:01 +0100
Message-ID: <402D2752.7020305@demonlord.de>
From: Christian Reiss <email@demonlord.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig31714F9ED58CFEAFBEDA1CFA"
Subject: [linux-lvm] One more problem..
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 14:35:01 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig31714F9ED58CFEAFBEDA1CFA
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Greetings,

one more problem:
When i run vgreduce (after setting +a +x), i get this:


# vgreduce share -a -v

vgreduce -- locking logical volume manager
vgreduce -- checking volume group name "share"
vgreduce -- checking volume group "share" existence
vgreduce -- checking volume group "share" activity
vgreduce -- reading data of volume group "share" from disk(s)
vgreduce -- reducing volume group "share" by physical volume "/dev/hdd"
vgreduce -- reducing VGDA structures of volume group "share"
vgreduce -- volume group "share" will be reduced by 1 physical volume

vgreduce -- reducing physical volumes in VGDA in kernel
vgreduce -- ERROR "parameter error" reducing volume group "share" by 
physical volume "/dev/hdd" in kernel


Is it me, or... ? ;)

-Christian.
-- 
Christian Reiss <email@demonlord.de>
demonserver.de

Key fingerprint = 2999 B7CD A218 06DF D658  5BE3 18B6 B232 02FF 71B2
Public Key can be obtained here: http://www.demonlord.de/pgp.txt

--------------enig31714F9ED58CFEAFBEDA1CFA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFALSdSGLayMgL/cbIRApHTAKDou4Cw2yFEhaqCzv/JMy6UtFpCZwCg1YMu
GKBT+icuCmHcM/hXFMAGOzg=
=eZfa
-----END PGP SIGNATURE-----

--------------enig31714F9ED58CFEAFBEDA1CFA--
