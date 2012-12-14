Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qBEIXCcZ000567
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2012 13:33:12 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBEIXBwo002764
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2012 13:33:11 -0500
Received: from sdg.bmsi.com (sdg.bmsi.com [192.168.9.34] (may be forged))
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id qBEIX9xC004362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2012 13:33:10 -0500
Message-ID: <50CB70E5.6010002@bmsi.com>
Date: Fri, 14 Dec 2012 13:33:09 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <CAG2kNCw6r7KKOZonGagjCbw9QiftDQOAv5Qn-m8aNnLQUf4sNQ@mail.gmail.com>
	<CAG2kNCy_qwLar7Cw3rr=7j7LP=XRvFMRv7Jit3SHWy+O_SmuRA@mail.gmail.com>
	<50C9F6AF.50908@redhat.com>
	<CAG2kNCwH-VKPVGyafcid8eSbg8uNZtNhqVs=GtGqKs21f6BHYA@mail.gmail.com>
	<50CA0492.1050906@redhat.com>
In-Reply-To: <50CA0492.1050906@redhat.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Convert striped lv to single pv on another disk?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

On 12/13/2012 11:38 AM, Bryn M. Reeves expounded in part:
> On 13/12/12 16:11, Gianluca Cecchi wrote:
>> I found in another thread that the resulting LV with pvmove remains a
>> striped one on only one disk as far as its structure is concerned...
>> with degraded performance...
>> Have you an example of pvmove command options to test to execute based
>> on my test?
>> So that I can verify with my loop devices?
> Yes, you're right. You will end up with both stripes still present but
> on a single disk.
>
> The best I could do using pvmove was to move individual extents around
> (!) to make the LV contiguous on-disk. Of course, this doesn't remove
> the striping and inflates the number of segments since each pair of
> striped extents effectively becomes a segment.
>
> The lvconvert command also still accepts a -i <n> parameter but doesn't
> do anything useful with it and doesn't report an error.
>
Could you create an asymmetrical mirror - where one leg is striped and=20
the other is linear?  Then you can just sync the mirror and delete the=20
striped leg.   I could even see operating with such a mirror - call it=20
RAID =EF=BF=BD.  Reads would prefer the striped side, and the mirror is the=
re in=20
case one of the stripes fails, while requiring only 1 additional drive=20
and degrading only write performance.

RAID10 over the 3 drives is probably better, though.
