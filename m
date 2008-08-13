Message-ID: <48A32173.1020605@redhat.com>
Date: Wed, 13 Aug 2008 19:01:23 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM with large arrays, one large or mutiple smallPV's?
References: <54AA5D29CDD96948959171E0DF2990295352@EMC1.uvic.ca><325343817.20080813114338@marki-online.net>
	<48A2B2F4.2080903@redhat.com>
	<4905EFD192EEDF4A9A19EEE98C32B7F70B8FCB6A@DBQV3005.na.corp.mckesson.com>
In-Reply-To: <4905EFD192EEDF4A9A19EEE98C32B7F70B8FCB6A@DBQV3005.na.corp.mckesson.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: "Allen, Jack" <Jack.Allen@mckesson.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Allen, Jack wrote:
>> On Behalf Of Bryn M. Reeves
>> Recent releases of LVM2 improve performance for large VGs as they
>> perform caching of metadata read from disk under some circumstances.
>> There were also a series of fixes to ensure that the tools behave
>> correctly when they find PVs with no metadata.
>> 
>> See earlier threads in the archives on this subject for more information
>> & examples of creating VGs with reduced numbers of metadata areas.
>> 
>> Regards,
>> Bryn.
> ============================================================
> You are saying it affects the performance of some of the LVM tools, but
> what about File Systems or databases that use the Logical Volume
> directly?

Correct. It has no effect on I/O performance - at least not in typical
real-world cases; you could probably construct a worst case scenario
where the VG is severely fragmented across 100s and 100s of PVs so tthat
I/O performance suffers but I have never in practice encountered this
situation (and it could just as easily occur in a VG containing a
smaller number of PVs with the right sequence of LV manipulations and
allocation policy).

On the other hand, poor tool performance with VGs containing 10s or 100s
of PVs has been reported in real world situations on numerous occasions
(particularly on s390/zVM systems using IBM DASD storage since these are
limited to 2GiB per volume so tend to be used in large numbers).

These problems tend not to be noticeable with modest numbers of PVs (~10
or so) although the impact can be measured. With hundreds of metadata
containing PVs the problem can be very noticeable - especially with LVM2
versions that do not include Milan's metadata caching enhancements.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIoyFz6YSQoMYUY94RAu6DAJ0WvnIlFjAizDj2Zzyx0bqX1TNRSACbBZU5
778C4VXaUo2xHe3Wmr7ODFM=
=K0Su
-----END PGP SIGNATURE-----
