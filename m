Message-ID: <530E30B4.6020505@redhat.com>
Date: Wed, 26 Feb 2014 19:21:40 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <530E1EA8.9020301@ubuntu.com>
In-Reply-To: <530E1EA8.9020301@ubuntu.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, psusi@ubuntu.com

Dne 26.2.2014 18:04, Phillip Susi napsal(a):
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> So if I tell dmsetup to create a device named 'foo bar' it ends up
> actually naming it 'foo\x20bar'.  If I run parted on 'foo\x20bar', it
> appears that libdevmapper helpfully tries to unescape the name,
> returning 'foo bar' from dm_task_get_name().  Unfortunately, such a
> dev node does not actually exist so this creates a problem trying to
> open it.
>
> This seems like a bug in libdevmapper.  I'd say the name of the actual
> dev node should not be escaped in the first place.

This is no longer true for 'modern' systems with udev.

libdevmapper no longer creates any /dev nodes - it's all job for udev.

And udev has had in dark ages the idea to use 'space' as a separator
for device names in device list. Thus it 'invented' escaping/mangling names.
(There are more prohibited characters which used to be used for normal device 
names (see man dmsetup mangling))

If you have system without udev - you could disable name mangling on i.e. 
dmsetup cmdline.

There is also envvar DM_DEFAULT_NAME_MANGLING_MODE_ENV_VAR_NAME
which could be used to set prefered behavior.

So there is no bug in libdm side - but I'll not comment on the rest...

I'll just note - it really means all tools now would need to be fixed to 
handle udev mangled names properly...

Regards

Zdenek
