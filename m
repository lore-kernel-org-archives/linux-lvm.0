References: <574B1DC9.2090700@ubuntu.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <db139f28-5020-31b2-abc6-80c94daf7bdb@redhat.com>
Date: Mon, 30 May 2016 10:15:21 +0200
MIME-Version: 1.0
In-Reply-To: <574B1DC9.2090700@ubuntu.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM says physical volumes are missing,
	but they are not
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com, Phillip Susi <psusi@ubuntu.com>

On 29.5.2016 18:50, Phillip Susi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
>
> I upgraded last night to Ubuntu 16.04, and LVM has ( even when booting
> back into 15.10 ) decided that two of my three physical volumes are
> missing, but they are not:
>
> psusi@faldara:~$ sudo pvs
>   PV         VG      Fmt  Attr PSize   PFree
>   /dev/md0   faldara lvm2 a-m  101.91g  58.91g
>   /dev/md1   faldara lvm2 a-m    1.69t 264.86g
>   /dev/sdb1  faldara lvm2 a--    1.82t   1.81t
> psusi@faldara:~$ sudo vgchange -ay
>   Refusing activation of partial LV faldara/Music.  Use
> '--activationmode partial' to override.
>   Refusing activation of partial LV faldara/Videos.  Use
> '--activationmode partial' to override.
>   Refusing activation of partial LV faldara/swap.  Use
> '--activationmode partial' to override.
>   Refusing activation of partial LV faldara/trusty-old.  Use
> '--activationmode partial' to override.
>   Refusing activation of partial LV faldara/vivid.  Use
> '--activationmode partial' to override.
>   Refusing activation of partial LV faldara/pool0.  Use
> '--activationmode partial' to override.
>   Refusing activation of partial LV faldara/xenial.  Use
> '--activationmode partial' to override.
>   6 logical volume(s) in volume group "faldara" now active
>
> If I use --activationmode partial, then all volumes are correctly
> mapped, with no missing extents:

Hi

Please provide full 'vgchage -ay -vvvv' trace of such activation command.

Also specify which version of lvm2 is in use by your distro.

Regards

Zdenek
