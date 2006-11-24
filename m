Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAOCQGTK030983
	for <linux-lvm@redhat.com>; Fri, 24 Nov 2006 07:26:16 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.171])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAOCQC4Q009122
	for <linux-lvm@redhat.com>; Fri, 24 Nov 2006 07:26:12 -0500
Received: by ug-out-1314.google.com with SMTP id 30so666285ugs
	for <linux-lvm@redhat.com>; Fri, 24 Nov 2006 04:26:11 -0800 (PST)
Message-ID: <5485940d0611240426w313d42b3q2d249c124ed54fe6@mail.gmail.com>
Date: Fri, 24 Nov 2006 12:26:11 +0000
From: "C'est Pierre" <cestpierre@gmail.com>
Subject: Re: [linux-lvm] how to extend an lvm partition?
In-Reply-To: <4566BBE7.5080609@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5485940d0611231801o6391e2ccmcd827c7d2f44c5a5@mail.gmail.com>
	<4566BBE7.5080609@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

OK Bryn,

I completly forgot to check for a pvextend/resize... my bad! I do have
those tools.

Thanks!
Pierre

On 11/24/06, Bryn M. Reeves <breeves@redhat.com> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> C'est Pierre wrote:
> > Hello,
> >
> > I just got curious, if I migrate the data from a lun to another one
> > which is bigger, with poor man's ghost such as 'dd if=sda of=sdb', how
> > am I going to be able to extend the lvm partition afterwards? is this
> > possible? I know I could add a new partition in the remaining space,
> > pvcreate/vgextend it into the existing VG, but are there other
> > alternatives?
> >
> > Thanks
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> Hi,
>
> If your version of the LVM2 tools is recent enough you can use the
> pvresize command to achieve this. It normally takes one argument - the
> physical volume path to resize:
>
> [root ~]# pvresize /dev/loop0
>   Physical volume "/dev/loop0" changed
>   1 physical volume(s) resized / 0 physical volume(s) not resized
>
> This was added in CVS around a year ago - I think it should have made it
> into releases from 2.02.00.
>
> Without pvresize support, the easiest way to use the extra space is, as
> you said, to partition it as an additional PV.
>
> Regards,
> Bryn.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (GNU/Linux)
> Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org
>
> iD8DBQFFZrvn6YSQoMYUY94RAjjPAKDCUlGMBkCG3ShhIy48cUwPYuSDLQCfeOVI
> ck5kC0LzecYyAZDBHd1Kgaw=
> =K3/+
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
