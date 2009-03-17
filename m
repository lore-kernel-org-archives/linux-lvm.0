Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2HAb6SX001511
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 06:37:06 -0400
Subject: Re: [linux-lvm] liblvm status question
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <87f94c370903161358u16398431uac9f8e8ab3e0c17@mail.gmail.com>
References: <49BA9BF9.3070507@esiway.net> <49BE9F73.8050109@gmail.com>
	<87f94c370903161236y197edd7ehef3dc8eefc6d617b@mail.gmail.com>
	<200903161255.21126.benscott@nwlink.com>
	<87f94c370903161358u16398431uac9f8e8ab3e0c17@mail.gmail.com>
Date: Tue, 17 Mar 2009 10:38:24 +0000
Message-Id: <1237286304.10568.67.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
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

On Mon, 2009-03-16 at 16:58 -0400, Greg Freemyer wrote:
> On Mon, Mar 16, 2009 at 3:55 PM, ben scott <benscott@nwlink.com> wrote:
> > Is the liblvm project at a state where vgs, lvs or pvs functionality is mostly
> > working? I am writing a program for working with logical volumes and it would
> > be very helpful if I could start integrating liblvm now even if it is still
> > buggy at the moment. Also, where can I  find the files or cvs?
> >
> > Thank you
> 
> I think you mean libdevmapper don't you?

No, he means liblvm:

http://fedoraproject.org/wiki/Features/liblvm
http://fedoraproject.org/wiki/LVM/liblvm

Patches are just starting to be merged but it's still a
work-in-progress:

http://www.redhat.com/archives/lvm-devel/2009-March/msg00008.html

Follow the lvm-devel mailing list to keep track of what's going on.

Regards,
Bryn.
