Mime-Version: 1.0 (Apple Message framework v606)
In-Reply-To: <20031209192646.GB4188@localhost>
References: <CEADF0D83077F7458B763904E47AA709BD64@exchange.neokimia.com> <20031209192646.GB4188@localhost>
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha1; boundary="Apple-Mail-2-349814980"
Message-Id: <80D33623-2A7F-11D8-97B2-000393DC1896@sistina.com>
Content-Transfer-Encoding: 7bit
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Is there a maximum for LV?
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
Date: Wed Dec 10 07:57:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Apple-Mail-2-349814980
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Dec 9, 2003, at 1:26 PM, Jose Luis Domingo Lopez wrote:
> On Tuesday, 09 December 2003, at 09:29:05 -0500,
> Yanick Quirion wrote:
>
>> On the past I was using lvm 1.1rc2. For an unknown reason, the 
>> version is not anymore available.
>> But with this version, when I do a "vgdisplay" I was able to saw the 
>> LV Max Size:
>>
>> How I'm testing LVM2. The field "MAX LV Size" is not there anymore. 
>> Is this means that LV doesn't have a maximum?
>>
> From vgcreate(8):
> -s, --physicalextentsize PhysicalExtentSize[kKmMgGtT]
>        Sets the physical extent size on physical volumes of this volume
>        group.  A size suffix (k for kilobytes up to t for terabytes) is
>        optional, megabytes is the default  if  no  suffix  is  present.
>        Values  can be from 8 KB to 16 GB in powers of 2. The default of
>        4 MB causes maximum LV sizes of ~256GB because as many  as  ~64k
>        extents  are  supported  per LV. In case larger maximum LV sizes
>        are needed (later), you need to set the  PE  size  to  a  larger
>        value  as  well.  Later changes of the PE size in an existing VG
>        are not supported.
>
> So it seems you have a 255 GiB limit on LV sizes with your LVM2 setup. 
> This
> same limitation is what applies to LVM2 Logical Volumes, and the math 
> is
> simple to do.

Actually, LVM2 no longer has a limitation on LV size based on PE size 
when using format2 metadata (which is used by default when creating new 
VGs).  So Yanick is correct in surmising the LV no longer has a maximum 
in LVM2 if the VG and LVs in question were created with the lvm2 tools. 
  If the VG was made with LVM1, or was created with the -M1 flag to 
vgcreate in LVM2, it does indeed still have the limit imposed by the 
format1 metadata.

Regards,
--
AJ Lewis
Sistina Software Inc.             http://www.sistina.com
720 Washington Ave, Suite 200     Voice:  612-638-0500
Minneapolis, MN 55414             E-Mail: 
lewis_NOSPAM_(AT)sistina(DOT)com

Current GPG fingerprint = D638 9C01 D08F 29A4 5D50  D064 F6A6 0ED6 E386 
E6EB
Grab the key at: http://people.sistina.com/~lewis/gpg.html or one of the
many keyservers out there...

I have yet to meet a C compiler that is more friendly and easier to use
than eating soup with a knife.

--
AJ Lewis
Sistina Software Inc.             http://www.sistina.com
720 Washington Ave, Suite 200     Voice:  612-638-0500
Minneapolis, MN 55414             E-Mail: 
lewis_NOSPAM_(AT)sistina(DOT)com

Current GPG fingerprint = D638 9C01 D08F 29A4 5D50  D064 F6A6 0ED6 E386 
E6EB
Grab the key at: http://people.sistina.com/~lewis/gpg.html or one of the
many keyservers out there...

Chaos, panic, pandemonium - my work here is done

--Apple-Mail-2-349814980
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (Darwin)

iD8DBQE/1iUchn5UyEmEOBMRAnPxAJ4v9Jy7ndgRq3YDjr/aJIv5ZD0uawCeNmR+
RTByEy6D0Go/cIe7hwApa2o=
=pOwy
-----END PGP SIGNATURE-----

--Apple-Mail-2-349814980--
