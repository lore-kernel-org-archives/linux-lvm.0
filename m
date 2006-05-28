Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4S1vOkA013309
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 21:57:24 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.184])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4S1vIrU022266
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 21:57:18 -0400
Received: by nf-out-0910.google.com with SMTP id o25so32152nfa
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 18:57:17 -0700 (PDT)
Message-ID: <5485940d0605271850n30ac0eeg6be49037f12d26cf@mail.gmail.com>
Date: Sun, 28 May 2006 02:50:24 +0100
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

Nevermind about my previous question! I just made my way into this
page: http://www.redhat.com/docs/manuals/enterprise/RHEL-4-Manual/s390-multi-install-guide/s1-s390info-raid.html
and have setup the multipathing nicely.

However, I went into the second node (this is 2 nodes failover cluster
environment) and I noticed that the vg and the md0 appeared there
there automatically! is this normal? is there anything I should do?

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
