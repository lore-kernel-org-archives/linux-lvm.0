Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i83K1W302757
	for <linux-lvm@redhat.com>; Fri, 3 Sep 2004 16:01:32 -0400
Received: from swlx167.swmed.edu (swlx167.swmed.edu [199.165.152.167])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i83K1QS0002691
	for <linux-lvm@redhat.com>; Fri, 3 Sep 2004 16:01:27 -0400
Received: from [129.112.118.137] (helo=utsouthwestern.edu)
	by swlx167.swmed.edu with esmtp (Exim 4.34) id 1C3KFN-0002nt-3u
	for linux-lvm@redhat.com; Fri, 03 Sep 2004 15:01:21 -0500
Message-ID: <4138CD8E.8060701@utsouthwestern.edu>
Date: Fri, 03 Sep 2004 15:01:18 -0500
From: Peter Smith <peter.smith@utsouthwestern.edu>
MIME-Version: 1.0
References: <005601c412af$748d71a0$1fa0a8c0@blec>	<200403261813.50041.krustev@krustev.net>	<20040326161644.GF12948@null.msp.redhat.com>	<20040512163244.C23665@homer.msp.redhat.com>
	<41377F77.7050201@uiuc.edu>
In-Reply-To: <41377F77.7050201@uiuc.edu>
Subject: Re: [linux-lvm] 2 TB limit
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigB8A7EF92842B90325A8C97F3"
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
--------------enigB8A7EF92842B90325A8C97F3
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

P. Larry Nelson wrote:

> On 5/12/2004 4:32 PM, Alasdair G Kergon wrote:
>
>> On Fri, Mar 26, 2004 at 10:16:44AM -0600, AJ Lewis wrote:
>>
>>> The PE size limitation isn't present in lvm2 (The version of lvm 
>>> that works
>>> in 2.6) if you use the native lvm2 format.  So you should be able to 
>>> create
>>> larger than 2TB LVs with LVM2.  Just FYI.
>>
>>
>>
>> As those of you monitoring the lvm-cvs mailing list may have noticed, 
>> I've added code to the LVM2 CVS tree to help people simulate large 
>> devices
>> for testing purposes on 2.6 kernels with the latest -udm patches.
>>
>>   lvcreate --type zero -L16T vg  # Create 16TB 'zero' device
>>   lvcreate -s vg/lvol0 -L1G      # Create snapshot of it
>>
>> Then use the snapshot as a 'sparse' device, in the example, supporting
>> upto 1GB of actual data.
>>
>> [At some point I'll merge it into a one-line command with --type sparse]
>>
>> NB There's been a lot of change in CVS recently (and more to come)
>> so I expect some new bugs to show up along with the new features:-(
>>  
>> Alasdair
>
>
> Being confined to running RedHat and using their updates and RPMs,
> I'm running stock RHEL-ES3 file servers with latest RH kernel of
> 2.4.21-15.0.4.ELsmp and lvm-1.0.3-15.  I'm led to understand that
> the ES3 kernel has portions of the 2.6 kernel in it, but I don't
> think it has the portion that can handle >2TB file systems.
>
> I have had a need to go to >2TB file systems for some time and am
> sort of limping along by stringing together many 2TB file systems.
>
> Can anyone (perhaps our list contributor from RedHat?) tell me when
> I can expect a kernel and lvm from RedHat that will allow me to go
> beyond the 2TB limit?
>
> Thanks!
> - Larry


I happened to look into this over the past few months.  Redhat 
Enterprise Linux v3 does NOT have any support for >2TB _anything_.  
Redhat has told me that >2TB support, which would mean kernel v2.6 (and 
probably LVM2) will only be available when Enterprise v4 comes out.  
Also, v4 is scheduled to be out in probably about 10 more months now, 
maybe less (at the time it was 13-15 months).

HTH

Peter


--------------enigB8A7EF92842B90325A8C97F3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQFBOM2R/TMBbARZqsERAmi2AJ9FVa97Ikh77I4zSIsDwLsqOq5XpwCeILCF
Tgo+plm7MIOPBVNffrL5Ugc=
=4RlD
-----END PGP SIGNATURE-----

--------------enigB8A7EF92842B90325A8C97F3--
