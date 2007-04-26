Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3QEFJUB020596
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2007 10:15:20 -0400
Received: from nz-out-0506.google.com (nz-out-0506.google.com [64.233.162.236])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3QEFInA026531
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2007 10:15:18 -0400
Received: by nz-out-0506.google.com with SMTP id s18so877534nze
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2007 07:15:12 -0700 (PDT)
Message-ID: <fd8dc0d20704260700l76ae6476k13c1e5dfac8b24f3@mail.gmail.com>
Date: Thu, 26 Apr 2007 10:00:08 -0400
From: "Boris Ostrovsky" <baostr@gmail.com>
Subject: Re: [linux-lvm] multiple levels of snapshots
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@redhat.com

At Alasdair suggestion, I am posting to the list steps that I executed
to make this work,
in case someone else is interested in doing something like this as well.

Here is the hierarchy  that I was trying to create:

             base
                |
             child1
              /     \
       child2.1  child2.2
                       |
                     child3

I used 1GB volume for base and gave 1GB to each COW volume (you can give less
than that if you don't expect too many dirty writes):

# lvcreate -L 1G -n base vg
# lvcreate -L 1G -n cow1 vg
# lvcreate -L 1G -n cow2.1 vg
# lvcreate -L 1G -n cow2.2 vg
# lvcreate -L 1G -n cow3 vg
# echo 0 $(blockdev --getsize /dev/mapper/vg-base) snapshot \
/dev/mapper/vg-base /dev/mapper/vg-cow1 p 8 | dmsetup create vg-child1
# echo 0 $(blockdev --getsize /dev/mapper/vg-child1) snapshot \
/dev/mapper/vg-child1 /dev/mapper/vg-cow2.1 p 8 | dmsetup create vg-child2.1
# echo 0 $(blockdev --getsize /dev/mapper/vg-child1) snapshot \
/dev/mapper/vg-child1 /dev/mapper/vg-cow2.2 p 8 | dmsetup create vg-child2.2
# echo 0 $(blockdev --getsize /dev/mapper/vg-child1) snapshot \
/dev/mapper/vg-child2.2 /dev/mapper/vg-cow3 p 8 | dmsetup create vg-child3

If you now mount /dev/mapper/vg-child2.1, you will see contents of
base and child1.
Mounting /dev/mapper/vg-child3 will additionally provide you with contents of
child2.2.

-boris

Alasdair G Kergon wrote:
>
> On Mon, Apr 23, 2007 at 02:54:37PM -0400, Boris Ostrovsky wrote:
> > From what I can see, LVM tools don't allow creating multiple levels of
> > snapshots (i.e. creating a
> > snapshot of a snapshot). Is this a fundamental property of LVM/device
> > mapper architecture
> > or is it that this feature simply hasn't made it to LVM (yet)?
>
> You could indeed set it up outside LVM using dmsetup.
