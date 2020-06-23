From: Vojtech Juranek <vjuranek@redhat.com>
Date: Tue, 23 Jun 2020 16:26:02 +0200
Message-ID: <1643811.X513TT2pbd@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2048144.C4sosBPzcN";
	micalg="pgp-sha256"; protocol="application/pgp-signature"
Subject: [linux-lvm] Removing VG mappings using dmsetup tool
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
To: linux-lvm@redhat.com
Cc: nsoffer@redhat.com

--nextPart2048144.C4sosBPzcN
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,
I'm working on storage part of oVirt project [1]. Besides other options, we 
provide iSCSI storage for VMs. We create PV(s) on attached LUN(s), create 
volume group from this PV(s) and then create LVs on this VG as needed (each 
disk on its LV, similar there's dedicated LV for our metadata etc.). VG is 
what we call (block) storage domain. 

When we remove storage domain we deactivate all LVs and remove LVs and VG from 
all hosts. However, when this fails (e.g. storage is for some reason 
unavailable), hosts are left with stale LVs and VG which can cause various 
issues for us. What we are going to do is to remove these stale VG mappings 
using dmsetup remove command (first we try to remove LVs using lvm, but if 
there are still some mappings, we will try to remove it using dmsetup). 

I'd like to head your opinion on this approach. Is it wise to use dmsetup in 
such case? Or is there any better way how to handle such situations or remove 
stale mappings?

Thanks
Vojta

[1] https://www.ovirt.org/
--nextPart2048144.C4sosBPzcN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEp6bZMIUgcejwGV0/ep5DIt+WOWsFAl7yEPoACgkQep5DIt+W
OWtr3AgAv7P+mVyvCcg6sEBTHvXa1WEG/2T6dLOHgPPqbaUPGK3ceGeIwD46H24o
GjQbNJ84Zsg0fl4+2QjmPy4kqCj2yfA/zL4wh7EvQkeLIJ3TUel3WQVB9//SVNq1
vRSqPxAiXdf315wYX56dX0r6zcEdXFhjLxwAMqKkC/dEQ2ChMnwhEX2pmBZdJ9DQ
RWJUcLuRMea/Ge9aTinA+rEaj8wjfVEBfD7kmVjnjJRdTPXGMDDH1iRurY24zudW
yaGA1Vha6e4KdKmc7oLqTr6S/bEyhMIdu5fbmfwzEJwT6aNnWEzjbrjZ7LwNtHUN
K6qjEXbwHk8WMm5wQF0dzkKhj8EdBA==
=TZ9m
-----END PGP SIGNATURE-----

--nextPart2048144.C4sosBPzcN--
