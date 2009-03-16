Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GKxVt4013367
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 16:59:31 -0400
Received: from qw-out-2122.google.com (qw-out-2122.google.com [74.125.92.27])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2GKwrdL017930
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 16:58:53 -0400
Received: by qw-out-2122.google.com with SMTP id 3so1692096qwe.39
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 13:58:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200903161255.21126.benscott@nwlink.com>
References: <49BA9BF9.3070507@esiway.net> <49BE9F73.8050109@gmail.com>
	<87f94c370903161236y197edd7ehef3dc8eefc6d617b@mail.gmail.com>
	<200903161255.21126.benscott@nwlink.com>
Date: Mon, 16 Mar 2009 16:58:52 -0400
Message-ID: <87f94c370903161358u16398431uac9f8e8ab3e0c17@mail.gmail.com>
Subject: Re: [linux-lvm] liblvm status question
From: Greg Freemyer <greg.freemyer@gmail.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Mar 16, 2009 at 3:55 PM, ben scott <benscott@nwlink.com> wrote:
> Is the liblvm project at a state where vgs, lvs or pvs functionality is m=
ostly
> working? I am writing a program for working with logical volumes and it w=
ould
> be very helpful if I could start integrating liblvm now even if it is sti=
ll
> buggy at the moment. Also, where can I =EF=BF=BDfind the files or cvs?
>
> Thank you

I think you mean libdevmapper don't you?

Pretty sure libdevmapper is used by the core LVM 2.0 tools.
Unfortunately, I'm not aware of any documentation about what the API
is.  I guess you have to read the source.

Greg
--=20
Greg Freemyer
Head of EDD Tape Extraction and Processing team
Litigation Triage Solutions Specialist
http://www.linkedin.com/in/gregfreemyer
First 99 Days Litigation White Paper -
http://www.norcrossgroup.com/forms/whitepapers/99%20Days%20whitepaper.pdf

The Norcross Group
The Intersection of Evidence & Technology
http://www.norcrossgroup.com
