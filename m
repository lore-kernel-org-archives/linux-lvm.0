Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m2AFJ1Wc016246
	for <linux-lvm@redhat.com>; Mon, 10 Mar 2008 11:19:01 -0400
Message-ID: <47D54FC2.9050600@redhat.com>
Date: Mon, 10 Mar 2008 15:12:02 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can I create a PV that only uses a portion of
	a	partition?
References: <dd20e5b50803071034j29ca410dm304acf3e7b174f80@mail.gmail.com>
	<20080310082120.GA3096@percy.comedia.it>
In-Reply-To: <20080310082120.GA3096@percy.comedia.it>
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

Luca Berra wrote:
> On Fri, Mar 07, 2008 at 01:34:16PM -0500, Lionel Kernux wrote:
>> I was short-sighted when I created the PV and VG on this machine and
>> basically made one giant PV and one giant VG allocating it. Now I'd
>> like to be more granular.
> creating multiple PV on the same disk makes no sense.
> if you were to do this you could well do without LVM and avoid the
> hassle.

Not necessarily; Lionel could have perfectly valid reasons for wanting
to have multiple volume groups on the same disk.

> I'm thinking the only way is to pvresize to shrink the PV, then shrink
> the partition, then create some new partitions in the recovered space,
> then create some new PV's from the new partitions, then create some
> new VG's from the new PV's.

Yes, this approach should work fine - the only catch is if there are
extents already allocated in the area of the partition that you want to
shrink. In this case you can use pvmove with /path/to/dev:start-end
arguments to relocate any troublesome extents.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFH1U/C6YSQoMYUY94RAiT1AJwJ3thr96MqSrXQIhIwf4h0wy2gIwCgteux
Rj7mBPM9Enev1ONmE1U+ZnU=
=y5SC
-----END PGP SIGNATURE-----
