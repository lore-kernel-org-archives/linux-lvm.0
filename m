Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9E7gM7J027123
	for <linux-lvm@redhat.com>; Sat, 14 Oct 2006 03:42:22 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9E7gJZh020866
	for <linux-lvm@redhat.com>; Sat, 14 Oct 2006 03:42:20 -0400
Date: Sat, 14 Oct 2006 09:42:18 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Mounting hardware snapshots/clones on the same host ?
Message-ID: <20061014074218.GC17336@percy.comedia.it>
References: <88134f8b0610120207g4faaa0f2q27fc86f368a90fac@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88134f8b0610120207g4faaa0f2q27fc86f368a90fac@mail.gmail.com>
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

On Thu, Oct 12, 2006 at 11:07:10AM +0200, Olivier Verloove wrote:
>Hello,
>
>I've seen this question a few times in the archives but without any answer.
>
>Is there a way to activate/mount a copy of a volume group taken with a
>disk-array based point-in-time copy on the same host ?
>
>The
>issue is that the disk-array based software will copy all information on
>the disk including PVID/VGID's which is confusing for Linux's LVM.
>
>Special tools are available on other platforms (vgchgid on HP-UX, recreatevg
>on AIX) for this purpose.
>
>Thanks in advance.
>
Look for the thread called "Altering a Physical Volume's UUID" on the
list archives

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
