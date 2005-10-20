Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9KN4LV04129
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 19:04:21 -0400
Received: from qproxy.gmail.com (qproxy.gmail.com [72.14.204.207])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9KN4FhL000662
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 19:04:15 -0400
Received: by qproxy.gmail.com with SMTP id q10so11375qbq
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 16:04:14 -0700 (PDT)
Message-ID: <80d985600510201557ibdc20d1w8b6105c2142d5cb9@mail.gmail.com>
Date: Fri, 21 Oct 2005 07:57:31 +0900
From: Craig Hagerman <craighagerman@gmail.com>
Subject: Re: [linux-lvm] setting up LVM, lost everything with a typo
In-Reply-To: <170fa0d20510201256q2f6abdd5tf507720ae2e9aa16@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <80d985600510191907na711430v24a1fe95264ebd48@mail.gmail.com>
	<170fa0d20510201254t60dbd4d6r510c41149ff5487b@mail.gmail.com>
	<170fa0d20510201256q2f6abdd5tf507720ae2e9aa16@mail.gmail.com>
Content-Transfer-Encoding: 8bit
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

On 10/21/05, Mike Snitzer <snitzer@gmail.com> wrote:
> Last line should've been:
>  vgcfgrestore -f /etc/lvm/backup/media_vg media_vg
>
>
>
> ---------- Forwarded message ----------
> From: Mike Snitzer <snitzer@gmail.com>
> Date: Oct 20, 2005 3:54 PM
> Subject: Re: [linux-lvm] setting up LVM, lost everything with a typo
> To: LVM general discussion and development <linux-lvm@redhat.com>
>
>
>  On 10/19/05, Craig Hagerman <craighagerman@gmail.com > wrote:
> > Hi,
> >
> > I recently got a new HD and thought it was about time I started using
> > LVM. Unfortunatly, I think I have ended up loosing all of my data due
> > to a typo. I would like to know if my data is lost forever. If not,
> > what can I do now to recover. Here is the whole story...
>
>  You've changed the partition table of /dev/sdb but the data itself _should_
> still be intact (changing the type shouldn't adversely affect the offsets of
> your sdb1 partition).  You might try the type change on /dev/sda2 and then
> restore the backup of the media_vg's VGDA from /etc/lvm/backup/media_vg
> using pvcreate and vgcfgrestore, something like:
>
>  pvcreate --restorefile /etc/lvm/backup/media_vg --uuid
> rlnV4y-B4eJ-Pyc0-RLJm-2Zbv-t04C-dxzU1A /dev/sdb1
>  pvcreate --restorefile /etc/lvm/backup/media_vg --uuid
> ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6 /dev/sda2
>  vgcfgrestore -f /etc/lvm/backup/media_vg test_vg
>
>  That said, its unclear to me why /dev/sda2 is unknown...  so take my advise
> at your own risk ;)
>
>


Thank you Mike - that did it. I am SO happy! I can mount the vg and
everything is there. I think I will backup everything onto DVD (about
180GB) before I do another reboot.

Craig
