Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3DEUr6U007868
	for <linux-lvm@redhat.com>; Mon, 13 Apr 2009 10:30:53 -0400
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3DEUR6s031711
	for <linux-lvm@redhat.com>; Mon, 13 Apr 2009 10:30:27 -0400
Received: by wa-out-1112.google.com with SMTP id v33so1250329wah.19
	for <linux-lvm@redhat.com>; Mon, 13 Apr 2009 07:30:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49E32F57.8020105@redhat.com>
References: <49DCA275.8070203@Calva.COM> <49DF02A7.50606@Calva.COM>
	<20090410101959.GA21846@us.ibm.com> <49DF2403.10009@Calva.COM>
	<49E32F57.8020105@redhat.com>
Date: Mon, 13 Apr 2009 20:00:27 +0530
Message-ID: <37d33d830904130730j6cb7bc16y50a2a6ac682dc5d@mail.gmail.com>
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid 
	10"?
From: Sandeep K Sinha <sandeepksinha@gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Apr 13, 2009 at 5:55 PM, Bryn M. Reeves <bmr@redhat.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> John Hughes wrote:
>> malahal@us.ibm.com wrote:
>>> John Hughes [john@Calva.COM] wrote:
>>>
>>>> John Hughes wrote:
>>>>
>>>>> � � � � � � � �if (lp->stripes > 1) {
>>>>> � � � � � � � � � � � �log_error("mirrors and stripes are currently "
>>>>> � � � � � � � � � � � � � � � � �"incompatible");
>>>>> � � � � � � � � � � � �return 0;
>>>>> � � � � � � � �}
>>>>>
>>>>> Should I just stick with mdadm for my mirroring and striping needs?
>>>>>
>>>
>>> You can do it today with some hassle or wait until someone implements a
>>> feature called 'generic layering'. The feature really means, treat some
>>> LVs as PVs!
>>>
>>> How can you do raid10 today? Create two raid0 LVs. Lets us call these
>>> lvgroup0/lv0 and lvgroup0/lv1. Now create raid1 lv in lvgroup1 where
>>> lvgroup1's PVs are lvgroup0/lv0 and lvgroup0/lv1.
>>>
>>> Isn't that a rai10 volume?
>
> No, it's a RAID 0+1 (RAID01/mirror of stripes).
>
>> To increase the chances of surviving a double-disk failure it would be
>> better to raid-0 a bunch of raid-1's.
>
> This is RAID1+0 (RAID10/stripe of mirrors) - it's usually preferable to
> 0+1 not only because of the improved redundancy but also the individual

I disagree.

Look at this:
http://www.pcguide.com/ref/hdd/perf/raid/levels/multXY-c.html

> mirror sets can have failures and recover independently. When a strip
> set in a RAID0+1 fails the entire mirror must be re-synchronised giving
> longer recovery times and more performance degradation during the rebuild.
>



>> Are we sure there are no deadlock problems with LVM2 layered on top of
>> LVM2?
>
> Stacked volumes work fine, there's just limited support in the tools for
> creating them without going to a lot of manual effort at the moment.
>
> Regards,
> Bryn.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.9 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iEYEARECAAYFAknjL1cACgkQ6YSQoMYUY96uPACeNwylwf1aeZuAzYxHWGJhH7Je
> LHMAnjLy4NB77gUiABVUkiKeCAMpbGU4
> =lv0v
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Regards,
Sandeep.





 	
�To learn is to change. Education is a process that changes the learner.�
