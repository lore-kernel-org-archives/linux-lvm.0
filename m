Message-ID: <530E541C.9040001@ubuntu.com>
Date: Wed, 26 Feb 2014 15:52:44 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
References: <530E1EA8.9020301@ubuntu.com> <530E30B4.6020505@redhat.com>
	<530E3464.3050606@ubuntu.com> <530E3CAA.1070308@redhat.com>
In-Reply-To: <530E3CAA.1070308@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] libdevmapper's handling of devices with spaces in
	the name
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
Content-Type: text/plain; charset="us-ascii"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 2/26/2014 2:12 PM, Zdenek Kabelac wrote:
> As said - there is no bug in libdm - libdm expects udev to create
> nodes. You can reconfigure libdm to do this job instead of udev -
> but then nothing else will work with it - so it's basically
> dead-road...

It doesn't matter who creates it, what matters is that when parted
asks what the correct name is, that it be told the name that actually
is created.

> The best you can do is to not use names which needs mangling -
> that's my best suggestions (and lvm team already spend countless
> hours on some usable workarounds and solutions...)

Unfortunately, it seems that a number of hardware vendors ship
preconfigured fakeraid setups with a space in the name of the volume.

> For mangling see 'dmsetup mangle' help - how to obtain device
> names...

Is there a libdevmapper call to do this?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJTDlQcAAoJEI5FoCIzSKrw3Z8H/3pS3uLG9vcQOrVba4KMxjN6
PY1uPGCWIUyqiGUYxzyleyAXp7TVyNpvomPEuevToSaEQBjL60jBUW1NNSiqPmsz
Dk9DDGzF7ecmQ3p4w6jPn0+RBKNvLU1jZygxCsMW3A9c2iqhuICkKD+MMDzjj2bw
Af/M6fT8aJBUWCeLeT+egKY2vVHP59j0AyNwj2ei4pBZ+Y2gOoecJTB+kZB7VgJ+
MoY8VdQaQGhMKQLtmmkD5kIDbe7x8f1mYj4y1BUhzvnemu4vpFn7s5wOE41+9cTk
F5J0GWE6OgNQ3oXLktpkt50hQH72rAOOrnlzEpx/SobH6l1oEtB0XpJdyVuiIAc=
=kiNS
-----END PGP SIGNATURE-----
