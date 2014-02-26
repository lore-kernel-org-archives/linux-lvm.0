Message-ID: <530E3464.3050606@ubuntu.com>
Date: Wed, 26 Feb 2014 13:37:24 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
References: <530E1EA8.9020301@ubuntu.com> <530E30B4.6020505@redhat.com>
In-Reply-To: <530E30B4.6020505@redhat.com>
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

On 2/26/2014 1:21 PM, Zdenek Kabelac wrote:
> This is no longer true for 'modern' systems with udev.
> 
> libdevmapper no longer creates any /dev nodes - it's all job for
> udev.
> 
> And udev has had in dark ages the idea to use 'space' as a
> separator for device names in device list. Thus it 'invented'
> escaping/mangling names. (There are more prohibited characters
> which used to be used for normal device names (see man dmsetup
> mangling))
> 
> If you have system without udev - you could disable name mangling
> on i.e. dmsetup cmdline.

So it is doing this to try and work around a bug in udev.  Has this
been fixed in modern udev and should be safe to disable?  It doesn't
seem to work for me when I do with udev 204: I end up with
/dev/mapper/foo.

> There is also envvar DM_DEFAULT_NAME_MANGLING_MODE_ENV_VAR_NAME 
> which could be used to set prefered behavior.
> 
> So there is no bug in libdm side - but I'll not comment on the
> rest...

The bug in libdm is that it is lieing to the calling application about
the name of the device, claiming it is not escaped, when in fact, it
is.  Or is dm_task_get_name() supposed to return a human readable
string rather than the actual file name?  If that is the case, how to
get the actual file name instead?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJTDjRkAAoJEI5FoCIzSKrwpAcIAJz9UAGH5KRTZphdC5TBnfiH
+5Hvpeep1gjO/W5mnsjNw7/Y1fP9W+vGKnJj2GUY4nlB0iVYoDxR6M8dTUkBKgZr
M+4hkxUdco8I/oik9uFZrF8YhcHIEsFJrhpAD/RDgsq7YiLD+U6bxAnR9O+OdCyG
hJh3GuKhEXf/A6D2sc89F06mg+7e2m44Yn/rjaYdQaYXISQ34++1lkrjZ8co8gDz
UWkPnoTwSJPuMhhhNXhBvSKxwl7J0SYC9E53D3uBChnHc3zfWoR21h8MxZ9EdUgD
sVA0HLZdxZrkbAiaw7p0YW8KZhEcT0Khsn+X/oagB/EqJBT5MXioHZIuAJk2nFw=
=hzdN
-----END PGP SIGNATURE-----
