Message-ID: <50365BFF.503@redhat.com>
Date: Thu, 23 Aug 2012 17:36:15 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
In-Reply-To: <CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvextend NEVER works but screws up
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: tariq wali <ganaiwali@gmail.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08/23/2012 12:14 PM, tariq wali wrote:
> # lvextend -L +42.7G -n /dev/vg0/logs Rounding up size to full
> physical extent 42.70 GB Extending logical volume logs to 142.70
> GB Logical volume logs successfully resized

Afaik the -n is not necessary here - it's only meaningful with resize
operations if the --resizefs option is also given (so it only calls
fsadm resize and not fsadm check).

> #resize2fs /dev/vg0/logs    ( and it gets screwed up here ) 
> resize2fs 1.39 (29-May-2006) *resize2fs: Filesystem has unsupported
> feature(s) while trying to open /dev/vg0/logs* *Couldn't find valid
> filesystem superblock.*

This is the problem. You appear to be using a version of e2fsprogs
that is older than the version used to create the file system in the
first place. In this case they will give up and refuse to do anything
rather than potentially damage a file system that has unknown features
enabled.

> lvm version LVM version:     2.02.88(2)-RHEL5 (2012-01-20) Library
> version: 1.02.67-RHEL5 (2011-10-14) Driver version:  4.11.6

Can you post the version of e2fsprogs you have installed and also the
output of "dumpe2fs -h /dev/vg0/logs"?

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAlA2W/8ACgkQ6YSQoMYUY95y8ACgwTykP1Z/izonns5vvM5dm8nf
/LMAn3zw8RYpabEJ38k5s9Lg5Xt7zlkr
=ipyA
-----END PGP SIGNATURE-----
