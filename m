Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4S9Aea1022877
	for <linux-lvm@redhat.com>; Sun, 28 May 2006 05:10:40 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4S9AVla011110
	for <linux-lvm@redhat.com>; Sun, 28 May 2006 05:10:32 -0400
Date: Sun, 28 May 2006 11:10:25 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: alternate link / multi-pathing
Message-ID: <20060528091024.GY8203@percy.comedia.it>
References: <5485940d0605271711g6d372400s3ab56c79e0488338@mail.gmail.com>
	<5485940d0605271850n30ac0eeg6be49037f12d26cf@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5485940d0605271850n30ac0eeg6be49037f12d26cf@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sun, May 28, 2006 at 02:50:24AM +0100, C'est Pierre wrote:
>Nevermind about my previous question! I just made my way into this
>page: 
>http://www.redhat.com/docs/manuals/enterprise/RHEL-4-Manual/s390-multi-install-guide/s1-s390info-raid.html
>and have setup the multipathing nicely.

actually the device-mapper-multipath would a better approach than
md-multipath

>However, I went into the second node (this is 2 nodes failover cluster
>environment) and I noticed that the vg and the md0 appeared there
>there automatically! is this normal? is there anything I should do?

it is not normal
it should not happen

if you insist in using md multipath, ensure raid autodetect won't pick
it up.
i.e. disable damned autodetect on kernel command line or
change the partition type to something different than 'Linux Raid'

then you'll have to ensure that your distribution  init scripts do not
automatically start it.
best way is omitting this set entries from /etc/mdadm.conf
and putting it somewhere else, then invoking
"mdadm -Asc /some/where/else/mdadm.conf" in your cluster script

if you use device-mapper-multipath (which might also solve the issue in
your next post :)
there is no problem if multipath finds the devices on the failover node,
but you must prevent lvm from activating the vg

to do this either add cluster locking or use tags, as explained in the 
doc/tagging.txt files in the lvm distribution

Regards,
L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
