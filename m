Subject: Re: [linux-lvm] lvm and 'poor mans raid' on heterogenous hard drives!
References: <m3zo23u0o7.fsf@shakti.rupa.com>
    <000e01c1bab8$e046f520$216410ac@tao.co.uk>
From: Rupa Schomaker <rupa-list@rupa.com>
Message-Id: <m3pu2ylsl3.fsf@shakti.rupa.com>
MIME-Version: 1.0
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
Date: Thu Feb 21 10:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----

"William Blunn" <bill@tao-group.com> writes:

> Swap devices only contain volatile data anyway.

> I wouldn't mind losing the contents of my swap device. The machine will
> probably crash. It's the same as if the machine went down through a
> power outage. Not a big problem. Assuming only the swap device failed, I
> could just re-boot and run with a bit less swap space.

<nod>  But we try to minimize the posibility of failure.  Thats why
many of us have a UPS hooked up.  If there is a power failure we can
shutdown the system cleanly on our own terms and not the power
companies. 

> If the drive fails, I lose the contents of any filesystems on the same
> drive. Much more significant. The fact that the machine went down
> because the swap device failed pales into insignificance, because now
> all the data has disappeared. No-one can do any work until we have
> replaces disk(s), sorted out the filesystems, restored from backups etc.

Unless it is mirrored somehow...

- -- 
- -rupa

-----BEGIN PGP SIGNATURE-----
Version: 2.6.3ia
Charset: noconv
Comment: Processed by Mailcrypt 3.5.6, an Emacs/PGP interface

iQEVAwUBPHUdBnHDM4ucEopdAQGzPAf+InTVnZvUXgsMKMFxZqf8WUiFlqBwInY3
96MKgZtjtB2EvnChkVe9uUMksUGeMjarrAO9e1TMpnGzU2wjEcZySID8i+vErEYB
ypG7vHT0VHLzZi+NsRlT1X7HKwLizU74TkDGE8/5H5HQN04HId9OgKeRDbi6XyLV
Ms5TCfMET3q3lbT3LaYnOGjXZkOfrFsRt3z36CWaDfhOxyauZTYi3ThaCk2vs6jm
PPU6PELmboJTIp7vmhv9VKSqwMMBYpgCDp20mmVZEaoRpz6ymWc0SCyyWTCrujQh
RaXtolG9u8Aqj0aQvPgtKjpJKbCMspZM8Wtr55KGKmnqF+AVHkl3Tg==
=6+ot
-----END PGP SIGNATURE-----
