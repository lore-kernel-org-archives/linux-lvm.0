Received: from thunderbird6.fab.redhat.com (vpn-6-46.fab.redhat.com
	[10.33.6.46])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n3K86fIQ012708
	for <linux-lvm@redhat.com>; Mon, 20 Apr 2009 04:06:41 -0400
Message-ID: <49EC2C28.9030304@redhat.com>
Date: Mon, 20 Apr 2009 09:02:48 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Will LVM2 ever be able to do striped mirrors "raid
	10"?
References: <49DCA275.8070203@Calva.COM>
	<49DF02A7.50606@Calva.COM>	<20090410101959.GA21846@us.ibm.com>
	<49DF2403.10009@Calva.COM>	<49E32F57.8020105@redhat.com>
	<37d33d830904130730j6cb7bc16y50a2a6ac682dc5d@mail.gmail.com>
In-Reply-To: <37d33d830904130730j6cb7bc16y50a2a6ac682dc5d@mail.gmail.com>
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

Sandeep K Sinha wrote:
> On Mon, Apr 13, 2009 at 5:55 PM, Bryn M. Reeves <bmr@redhat.com> wrote:
> John Hughes wrote:
>>>> malahal@us.ibm.com wrote:
>>>>> John Hughes [john@Calva.COM] wrote:
>>>>>
>>>>>> John Hughes wrote:
>>>>>>
>>>>>>>                if (lp->stripes > 1) {
>>>>>>>                        log_error("mirrors and stripes are currently "
>>>>>>>                                  "incompatible");
>>>>>>>                        return 0;
>>>>>>>                }
>>>>>>>
>>>>>>> Should I just stick with mdadm for my mirroring and striping needs?
>>>>>>>
>>>>> You can do it today with some hassle or wait until someone implements a
>>>>> feature called 'generic layering'. The feature really means, treat some
>>>>> LVs as PVs!
>>>>>
>>>>> How can you do raid10 today? Create two raid0 LVs. Lets us call these
>>>>> lvgroup0/lv0 and lvgroup0/lv1. Now create raid1 lv in lvgroup1 where
>>>>> lvgroup1's PVs are lvgroup0/lv0 and lvgroup0/lv1.
>>>>>
>>>>> Isn't that a rai10 volume?
> No, it's a RAID 0+1 (RAID01/mirror of stripes).
> 
>>>> To increase the chances of surviving a double-disk failure it would be
>>>> better to raid-0 a bunch of raid-1's.
> This is RAID1+0 (RAID10/stripe of mirrors) - it's usually preferable to
> 0+1 not only because of the improved redundancy but also the individual
> 
>> I disagree.
> 
>> Look at this:
>> http://www.pcguide.com/ref/hdd/perf/raid/levels/multXY-c.html

What do you disagree with?

The article you linked to points out the same robustness and recovery
concerns with a 0+1 layout as I mentioned earlier. It then goes on to
say that this could be mitigated for 0+1 by a smart RAID implementation
that continues to stripe to partially-failed RAID 0 sets but that most
actual RAID controllers don't chose to implement this.

The article seems to make the same claims as I did.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iEYEARECAAYFAknsLCgACgkQ6YSQoMYUY94KswCeOahyHLXilItIA8B1AR2Z/Ujb
aloAn0jftWyKXqr9QK51tYkwmOWU68LF
=mMPX
-----END PGP SIGNATURE-----
