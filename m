Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2HKqcmm023306
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 16:52:38 -0400
Received: from mail-qy0-f103.google.com (mail-qy0-f103.google.com
	[209.85.221.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2HKqJEQ025399
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 16:52:19 -0400
Received: by qyk1 with SMTP id 1so420552qyk.23
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 13:52:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1237286304.10568.67.camel@breeves.fab.redhat.com>
References: <49BA9BF9.3070507@esiway.net> <49BE9F73.8050109@gmail.com>
	<87f94c370903161236y197edd7ehef3dc8eefc6d617b@mail.gmail.com>
	<200903161255.21126.benscott@nwlink.com>
	<87f94c370903161358u16398431uac9f8e8ab3e0c17@mail.gmail.com>
	<1237286304.10568.67.camel@breeves.fab.redhat.com>
Date: Tue, 17 Mar 2009 16:52:19 -0400
Message-ID: <87f94c370903171352y18bf404fi5ebe57591d876d5d@mail.gmail.com>
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

On Tue, Mar 17, 2009 at 6:38 AM, Bryn M. Reeves <bmr@redhat.com> wrote:
> On Mon, 2009-03-16 at 16:58 -0400, Greg Freemyer wrote:
>> On Mon, Mar 16, 2009 at 3:55 PM, ben scott <benscott@nwlink.com> wrote:
>> > Is the liblvm project at a state where vgs, lvs or pvs functionality i=
s mostly
>> > working? I am writing a program for working with logical volumes and i=
t would
>> > be very helpful if I could start integrating liblvm now even if it is =
still
>> > buggy at the moment. Also, where can I =EF=BF=BDfind the files or cvs?
>> >
>> > Thank you
>>
>> I think you mean libdevmapper don't you?
>
> No, he means liblvm:
>
> http://fedoraproject.org/wiki/Features/liblvm
> http://fedoraproject.org/wiki/LVM/liblvm
>
> Patches are just starting to be merged but it's still a
> work-in-progress:
>
> http://www.redhat.com/archives/lvm-devel/2009-March/msg00008.html
>

Very cool.  I just recommended libdevmapper to a project team doing
some work.  liblvm looks like a much better fit for them.

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
