Return-Path: <tack@linux.com>
Subject: Re: [linux-lvm] LVM vs. md: Benefits in RAID0?
From: Jason Tackaberry <tack@linux.com>
In-Reply-To: <20010724224656.A2226@dardhal.mired.net>
References: <20010724224656.A2226@dardhal.mired.net>
Content-Transfer-Encoding: quoted-printable
Date: 24 Jul 2001 19:32:35 -0400
Message-Id: <996017561.930.29.camel@andromeda>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi Jos=E9, thanks for your reply.  I have a few questions:

On 24 Jul 2001 22:46:56 +0000, Jos=E9 Luis Domingo L=F3pez wrote:
> The quick and dirty hack to get resizable RAIDed storage devices is:
>=20
> a) Layer LVM on top of (hard/soft) RAID

The problem I see with this is that if you extend the volume group by
adding a new partition, the new partition must be linearly concatenated
and so it won't be part of the stripe set.  So while you can technically
extend this configuration, you're not truly resizing the RAID device.
Suppose you start off with an md stripe set with sda1 and sdb1, and then
later on you want to add sdc1, you get something like this:

<lame ASCII art>
+----------------------------+
|         logical_vol01      |
+----------------------------+
|         volume_group01     |
+-------------------+--------+
|     md0 RAID0     |        |
+-------------------+  sdc1  |
|   sda1   |  sdb1  |        |
+----------+--------+--------+
</lame ASCII art>

So yes, you can extend your logical volume, but you're not extending
your stripe set.  I guess this has the advantage over linear
concatenation in that at least for sda1 and sdb1 you'll get the
performance benefit.

> b) Layer sotfware RAID on top of software LVM

I'm just not sure how this would work?  You can't extend md devices, as
far as I know.  So you can extend the underlying logical volume, but
then from the RAID layer on top, it just sees one device, so it's not
really RAID at all.  Can you clarify on this one?

Cheers,
Jason.
