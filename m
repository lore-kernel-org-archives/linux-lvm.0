Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Date: Sun, 20 May 2001 01:39:04 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJEELGIOAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM on multi-boot Linux system?
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

 
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,
I just built a non-root LVM system,
created a Lvolume for root, migrated root to it.
I can now dual boot between these; root on LV or root on
partition.

I've also built a "Linux From Scratch" system
on a new Lvolume.

So now I have a 'pristine' Linux system,
with supporting programs, libraries and kernel which
actually *boots* and when it does boot,
/dev/commsVG/lfsLV is mounted on /

So its an LVM-root system...

(Now triple-boot; 
	non-LVM root RH7.1, LVM-root RH7.1 and LVM-root LFS)


Problem; 
- - pvscan finds the physical volumes
- - vgscan fails with an error
- - there is *no* /dev/commsVG
	hence no volumes can be accessed...

Any ideas? 
Am I just pushing my luck?
8)


-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 7.0.3 for non-commercial use <http://www.pgp.com>

iQA/AwUBOwZ3dwhKySqSS+rVEQLSWQCg5gnr20iPpR/QbukkML3uf41f2aIAoM2F
LwSCcvYvkPpvzr9/RlbQFHDS
=Av5x
-----END PGP SIGNATURE-----
