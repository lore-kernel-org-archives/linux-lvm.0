Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BLsp63003799
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 17:54:51 -0400
Received: from qb-out-0506.google.com (qb-out-0506.google.com [72.14.204.231])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7BLsiTV031181
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 17:54:44 -0400
Received: by qb-out-0506.google.com with SMTP id b14so514391qbc
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 14:54:43 -0700 (PDT)
Message-ID: <87f94c370608111454k52b83397lab0de23e1bf29c55@mail.gmail.com>
Date: Fri, 11 Aug 2006 17:54:42 -0400
From: "Greg Freemyer" <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] Missing link in /dev/<domain>?
In-Reply-To: <20060811210227.GJ18633@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <87f94c370608111059h2259788bx9e6cd37293e8ec5d@mail.gmail.com>
	<20060811180654.GI18633@agk.surrey.redhat.com>
	<87f94c370608111238h1f92f13ekf47b608e5235edd9@mail.gmail.com>
	<20060811210227.GJ18633@agk.surrey.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, "Marlier, Ian" <ian.marlier@studentuniverse.com>

lvremove of the snapshot resolved my issue, thanks.

I'm using 2.6.16 (from SUSE) which I know is a little old.

Is the snapshot code likely to progress beyond experimental in the
vanilla kernel soon, or maybe already has?

Thanks
Greg

On 8/11/06, Alasdair G Kergon <agk@redhat.com> wrote:
> On Fri, Aug 11, 2006 at 03:38:56PM -0400, Greg Freemyer wrote:
> > Name             Maj Min Stat Open Targ Event  UUID
> > TruStore--Data-data-real 253   2 L--w    1    1      0
> > LVM-mMDI3Wi6Av0TlwI4D905RvPDfWM3rNlBxxpvaosSsuQnSubLnpkprJIBEdn1VHiV-real
> > TruStore--Data-home 253   0 L--w    1    1      0
> > LVM-mMDI3Wi6Av0TlwI4D905RvPDfWM3rNlBHU7HFSYOTsxTwH6Pg1c4k0UQOK7O4j6X
> > TruStore--Data-data 253   3 ---w    0    0      0
>                               ^
>
> > LVM-mMDI3Wi6Av0TlwI4D905RvPDfWM3rNlBxxpvaosSsuQnSubLnpkprJIBEdn1VHiV
> > TruStore--Data-config 253   1 L--w    1    1      0
> > LVM-mMDI3Wi6Av0TlwI4D905RvPDfWM3rNlBG5XBMCNoneiIFa16MFUHMmmhPgvEF3da
>
> > Snap%  Move Copy%  Log LV UUID
> >  config    TruStore-Data    1 -wi-ao  1.00G  -1  -1 253  1
> >                      G5XBMC-None-iIFa-16MF-UHMm-mhPg-vEF3da
> >  data      TruStore-Data    1 owi-d- 63.00G  -1  -1 253  3
> >                      xxpvao-sSsu-QnSu-bLnp-kprJ-IBEd-n1VHiV
> >  data_snap TruStore-Data    1 swi--- 45.00G  -1  -1 -1   -1   data
> >                      m4ZSZG-ba0q-Fgco-sYcy-e0DJ-V3SI-Bb0r6C
> >  home      TruStore-Data    1 -wi-ao 10.00G  -1  -1 253  0
> >                      HU7HFS-YOTs-xTwH-6Pg1-c4k0-UQOK-7O4j6X
>
> It still thinks you have a snapshot, but it's failing to activate it.
> If you don't need it, try lvremoving the snapshot.
>
> Alasdair
> --
> agk@redhat.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>


-- 
Greg Freemyer
The Norcross Group
Forensics for the 21st Century
