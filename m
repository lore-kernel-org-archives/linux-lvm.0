Received: from [10.32.64.203] (dhcp-0-203.surrey.redhat.com [10.32.64.203])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l2MLTkEj000361
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 21:29:46 GMT
Message-ID: <4602F5C6.7000403@redhat.com>
Date: Thu, 22 Mar 2007 21:31:50 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] failing hard drive
References: <4602A28E.8010502@arabidopsis.info> <4602A6CA.6050809@redhat.com>
	<4602EDFF.20301@arabidopsis.info>
In-Reply-To: <4602EDFF.20301@arabidopsis.info>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tim Milstead wrote:
> I have made the copy using a rescue CD and an external USB drive.
> Fitting the replacement internally is going to be difficult hence the
> question about doing it this way. Are you sure? I was just worried that
> perhaps LVM looked beyond a simple '/dev/hde' referred to drives in some
> deeper way e.g. serial number, model, make etc.

LVM doesn't use the '/dev/hdX' names at all. Instead it scans all block
devices looking for a label that was written to the disk when pvcreate
is run (stored in the 2nd sector).

As long as this label gets copied over the two devices will be
indistinguishable to LVM. If you dd the whole device over, then you're
definitely going to include the label.

You do need to arrange to make the replacement drive inaccessible to LVM
though if it will still be physically attached to the machine.

Either wipe the label out or mask the device using a filter in
/etc/lvm/lvm.conf - see the man page for details of this.

That said, if I was doing this on my own system, I would be using the
pvcreate/vgextend/pvmove steps I outlined further down.

>> To temporarily bring the VG up to 10 disks to allow you to remove the
>> failing member. You should then find the "pvmove /dev/hde" works as
>> expected (assuming the new disk is at least as big as the one you are
>> replacing).
>>   
> Yes, but given the space constraints I'd rather avoid this.

I don't see how the space constraints make a difference here - you're
going to have both devices attached at the same time however you decide
to do this.

Once the pvmove completes (analogous to the dd in the other method), you
can run "vgreduce /dev/hde" to permanently remove the failing drive from
the volume group, bringing you back down to 9 disks.

Kind regards,

Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGAvXG6YSQoMYUY94RAjZ2AJ9XJhR/gif4JDKblFGoxxKVtUT8egCgjOdr
XQIwn9vsSnl/NMK59Cj3ybo=
=rz4H
-----END PGP SIGNATURE-----
