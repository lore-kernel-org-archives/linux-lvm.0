Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1F6vLi04917
	for <linux-lvm@redhat.com>; Sun, 15 Feb 2004 01:57:21 -0500
Received: from brown.fusion-hosting.net ([63.106.141.109])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1F6vKb16044
	for <linux-lvm@redhat.com>; Sun, 15 Feb 2004 01:57:21 -0500
Received: from fusion-hosting.net (localhost.localdomain [127.0.0.1])
	by brown.fusion-hosting.net (8.12.8/8.11.0) with SMTP id i1F6ulI9016477
	for <linux-lvm@redhat.com>; Sun, 15 Feb 2004 01:56:48 -0500
From: Chris Wells <chris@fusion-hosting.net>
Message-ID: <47927.129.33.49.251.1076828208.squirrel@www.fusion-hosting.net>
Subject: Re: [linux-lvm] Problems importing volume group
In-Reply-To: <20040214101743.GD22753@redhat.com>
References: <2022.63.106.141.106.1076694581.squirrel@www.fusion-hosting.net>
        <20040214101743.GD22753@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sun Feb 15 01:56:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Heinz,

Thanks for the advice.. unfortunately I did not have a backup of
/etc/lvmconf/.. the data was unfortunately lost.  As it stands, I'm still
quite new to the Linux aspect of LVM.  How do I go about backing up VG
configuration or /etc/lvmconf.. Also can you recommend any decent online
guides/How-Tos for Linux LVM?  The documentation I've read thus far (books
and online) has been limited.

>
> Chris,
>
> looks like the installation toasted your PVs (writing partition tables
> to the drives?).
>
> Run vgcfgrestore (you've got a backup of /etc/lvmconf/*, right?).
>
> Regards,
> Heinz    -- The LVM Guy --
>
>
> On Fri, Feb 13, 2004 at 12:49:41PM -0500, Chris Wells wrote:
>> Hello all,
>>
>> I'm still a newbie to LVM but I've followed a FAQ in exporting my VG
>> (I had to replace a failing system drive - not in the VG).  When I
>> replaced the drive and tried to import the volume group, I get the
>> following errors:
>>
>> vgimport kbvg /dev/hde /dev/hdf
>> vgimport -- ERROR "pv_check_consistency(): PE size" checking physical
>> volume consistency of "/dev/hde"
>> vgimport -- ERROR "pv_check_consistency(): PE size" checking physical
>> volume consistency of "/dev/hdf"
>> vgimport -- ERROR: no valid physical volumes found to import volume
>> group "kbvg"
>>
>> When I do a pvscan, I get:
>>
>> pvscan
>> pvscan -- reading all physical volumes (this may take a while...)
>> pvscan -- inactive PV "/dev/hde"  is in EXPORTED VG "kbvg" [0 / 0
>> free] pvscan -- inactive PV "/dev/hdf"  is in EXPORTED VG "kbvg" [0 /
>> 0 free] pvscan -- total: 2 [37.46 MB] / in use: 2 [37.46 MB] / in no
>> VG: 0 [0]
>>
>>
>> I get these errors even when replacing the old drive and trying to
>> import back.  Any ideas on what I can do next or what the problem
>> could be?  Or.. at least, does anyone know of any tools which I can
>> use to retrieve data from these drives?
>>
>> Any help is greatly appreciated!
>>
>> --
>> Thanks,
>>    Chris Wells
>>    Fusion Hosting & Design
>>    Lexington, KY
>>    chris@fusion-hosting.net
>>    http://www.fusion-hosting.net
>>    Phone: (859) 492-6439
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
> Heinz Mauelshagen                                 Red Hat, Inc.
> Consulting Development Engineer                   Am Sonnenhang 11
>                                                   56242 Marienrachdorf
> Germany
> Mauelshagen@RedHat.com                            +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


-- 
Thanks,
   Chris Wells
   Fusion Hosting & Design
   Lexington, KY
   chris@fusion-hosting.net
   http://www.fusion-hosting.net
   Phone: (859) 492-6439
