Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7L6qskN010302
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 02:52:55 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7L6qrF2032240
	for <linux-lvm@redhat.com>; Tue, 21 Aug 2007 02:52:53 -0400
Date: Tue, 21 Aug 2007 08:52:52 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Flexible storga: LVM setup on top of mdadm sets. Good
	idea or not?
Message-ID: <20070821065251.GB16272@percy.comedia.it>
References: <20070723072320.GB30790@percy.comedia.it>
	<Pine.LNX.4.44.0708202030010.8227-100000@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0708202030010.8227-100000@bmsred.bmsi.com>
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

On Mon, Aug 20, 2007 at 08:33:26PM -0400, Stuart D. Gathman wrote:
>On Mon, 23 Jul 2007, Luca Berra wrote:
>
>> On Sun, Jul 22, 2007 at 02:57:33PM -0400, Stuart D. Gathman wrote:
>> >The main drawback to md raid1 is that it always resynchronizes
>> >the *entire* partition when a disk goes offline temporarily.  I also
>
>> False. md uses bitmaps to avoid this.
>
>Ok, I just tested this with Centos-5.0, kernel-2.6.18-8.1.8.el5.
>I shutdown with md1 50% resynced, and when it boots, it starts over
>at the beginning.  Maybe we are talking about different things, but
>it is a major annoyance that it restarts the sync from the beginning
>if it misses just one update (e.g. unexpected power failure or reboot).
>
did you add the bitmap to your md array?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
