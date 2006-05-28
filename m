Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4S26kL9014528
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 22:06:46 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.188])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4S26d5L023722
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 22:06:40 -0400
Received: by nf-out-0910.google.com with SMTP id l36so102019nfa
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 19:06:39 -0700 (PDT)
Message-ID: <5485940d0605271900r60918863yfe7d8992ea710125@mail.gmail.com>
Date: Sun, 28 May 2006 03:00:39 +0100
From: "C'est Pierre" <cestpierre@gmail.com>
In-Reply-To: <5485940d0605271711g6d372400s3ab56c79e0488338@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5485940d0605271711g6d372400s3ab56c79e0488338@mail.gmail.com>
Subject: [linux-lvm] Re: alternate link / multi-pathing
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

Again, this time I am looking for some clues. I was trying to make a
test, so I created a logical volume called 'lv01', mounted it under a
directory and created a file on it, but somehow, when I am trying to
unmount it, the umount command stops responding and all I get is these
messages when I run dmesg:

multipath: sdb: redirecting sector 4480 to another IO path
multipath: only one IO path left and IO error.
multipath: sdb1: rescheduling sector 4489
multipath: sdb: redirecting sector 4480 to another IO path
multipath: only one IO path left and IO error.
multipath: sdb1: rescheduling sector 4489
multipath: sdb: redirecting sector 4480 to another IO path
multipath: only one IO path left and IO error.
multipath: sdb1: rescheduling sector 4489
multipath: sdb: redirecting sector 4480 to another IO path
multipath: only one IO path left and IO error.


Any hints? the load average is going pretty crazy too: load average:
7.22, 5.00, 2.24

Thanks,
Pierre


On 5/28/06, C'est Pierre <cestpierre@gmail.com> wrote:
> Hello,
>
> How can I setup multi-pathing so that I can create a vg with a
> physical device over two different fibre-channel links, so if one link
> fails, LVM uses the other?
>
> I am using the term alternate link but its origins are in hp-ux.
>
> If you could point me to some documentation on it, I would appreciate it!
>
> Thanks,
> Pierre
>
