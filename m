Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6MH1Da28582
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 13:01:13 -0400
Received: from webmail.slshs.org (c78.134.nauticom.net [209.195.134.78])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6MH1Ce1004264
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 13:01:12 -0400
Received: from localhost (localhost [127.0.0.1])
	by webmail.slshs.org (Postfix) with ESMTP id 6EC4F17287E
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 12:00:04 -0400 (EDT)
Received: from webmail.slshs.org ([127.0.0.1])
	by localhost (Tegucigalpa [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 27375-01 for <linux-lvm@redhat.com>;
	Thu, 22 Jul 2004 12:00:03 -0400 (EDT)
Received: from [192.168.0.200] (c-24-3-125-0.client.comcast.net [24.3.125.0])
	by webmail.slshs.org (Postfix) with SMTP id 9C4931652B6
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 12:00:03 -0400 (EDT)
Message-ID: <40FFF2C9.2040200@slshs.org>
Date: Thu, 22 Jul 2004 13:00:57 -0400
From: Angelo DiNardi <adinardi@slshs.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2/DM Mapping Tables Documentation
References: <20040719062936.26249.qmail@web11805.mail.yahoo.com>
In-Reply-To: <20040719062936.26249.qmail@web11805.mail.yahoo.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig2D1C79675BDF9D1DF369799E"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig2D1C79675BDF9D1DF369799E
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

I believe the command "sync" at a shell prompt will flush the cache to 
disk. Someone correct me if I'm wrong.

--Angelo

Dave B wrote:
> This is still causing me headaches... Does anybody
> have any insight on this?
> 
> --- bowmailtmp-lvm@yahoo.com wrote:
> 
>>ok, i think i've got an idea what's going on here,
>>it
>>seems that the lvm cache may be the problem here. 
>>it
>>seems like in some cases if i wait a couple
>>*minutes*
>>then the data magically shows up in the proper
>>physical sectors of the disk.  in some cases it is
>>faster, some quite slow.  can someone confirm this
>>for
>>me and give me an idea of the mechanics involved
>>with
>>the cache?  also, is there a command to force the
>>cache to be flushed out?  i'll keep looking through
>>the man pages for this.
>>
>>thanks,
>>dave
>>
>>--- bowmailtmp-lvm@yahoo.com wrote:
>>
>>>I have been having a very difficult time
>>
>>correlating
>>
>>>physical addresses to LVM2/DM addresses.
>>>
>>>for instance, if i do:
>>>dmsetup table /dev/mapper/avtest-vdisk2g
>>>
>>>the result is:
>>>0 4194304 linear 22:65 384
>>>
>>>from what i currently understand, this means
>>
>>logical
>>
>>>extent 0 (which is composed of 8192 512 byte
>>
>>sectors
>>
>>>in the default config) of this LV should start at
>>>physical sector 384 of device 22:65 (/dev/hdd1 on
>>
>>my
>>
>>>machine)
>>>
>>>after i've written to the logical device a couple
>>>times, it appears this correlation doesn't hold
>>
>>when
>>
>>>i
>>>access the physical sectors on hdd1 using dd. 
>>>however, if i use dd to access the sectors through
>>>the
>>>LV, all the data appears as it should.  i was
>>
>>under
>>
>>>the impression that the logical to physical
>>
>>mappings
>>
>>>was quite straightforward and intuitive, but i
>>
>>feel
>>
>>>that i am missing some key information.  Can
>>
>>someone
>>
>>>help me out of is there decent developer
>>>documentation
>>>somewhere that explains the mappings?
>>>
>>>As a more complete example of my problem, if i do
>>>the
>>>following:
>>>
>>>dd if=/dev/zero of=/dev/avtest/vdisk2g count=1
>>>then do:
>>>dd if=/dev/avtest/vdisk2g of=tmpfile.out count=1
>>>then tmpfile.out contains 512 bytes of zeros.
>>>
>>>however, if I do:
>>>dd if=/dev/hdd1 of=tmpfile.out skip=384 count=1
>>>then tmpfile.out contains other data, not the
>>
>>zero's
>>
>>>i
>>>would expect from the output of the dmsetup table
>>>command above.  I feel i'm missing something
>>
>>fairly
>>
>>>basic here, but I haven't had any luck tracking
>>
>>this
>>
>>>relationship down.  I suppose there is always the
>>>sourc code :)
>>>
>>>
>>>Thanks a lot.
>>>
>>>
>>>
>>>_______________________________________________
>>>linux-lvm mailing list
>>>linux-lvm@redhat.com
>>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>>read the LVM HOW-TO at
>>>http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at
>>http://tldp.org/HOWTO/LVM-HOWTO/
>>
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--------------enig2D1C79675BDF9D1DF369799E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFA//LO36+5mTcIDKcRAqMRAJsH6P/BMCEv9He5KQ3Ry49b1Cf8AgCdFQ1w
7v6BCSBVaTkeaX0lcL1n/Tg=
=8K9S
-----END PGP SIGNATURE-----

--------------enig2D1C79675BDF9D1DF369799E--
