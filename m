Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8PKeCr23589
	for <linux-lvm@redhat.com>; Sat, 25 Sep 2004 16:40:12 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8PKe6SA029944
	for <linux-lvm@redhat.com>; Sat, 25 Sep 2004 16:40:06 -0400
Date: Sat, 25 Sep 2004 22:40:05 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Problem at boot time with Mandrake 10.1 community
Message-ID: <20040925204004.GC7387@percy.comedia.it>
References: <1096118366.3170.64.camel@localhost>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1096118366.3170.64.camel@localhost>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: lvm-linux <linux-lvm@redhat.com>

On Sat, Sep 25, 2004 at 03:19:26PM +0200, Pascal Garcia dld wrote:
>Hello,
>here is my problem :
>I installed on a test disk the new version of Mandrake, kernel
>2.6.8.1mdk.
>I have one partition, unique element of a VG named rootvg.
>On the vg I created 2 reiserfs partitions one for / and one for /home,
>and a swap partition.
>
>No problem with the installation as long as I create the vg or use an
>existing vg. (In an other mail, I will detail the problem entcountered
>when freeing a vg during installation process).
>
>When booting, I can select the kernel I want with lilo and then, in the
>list of messages 2 concerning the vg, saying approximately :
>- The lv is not available
>- The lv is not complete and mounted read only.
>
>Then a kernel panic occurs.
>
go to http://qa.mandrakesoft.com/ and file a bug against mkinitrd
but please, do remember that "approximately" won't help, i would need to
know exactly what you read on your screen and more details about your
configuration to fix this in a timely manner.

regards,
L.

btw it does not write that "The lv is not complete and mounted read
only.", it writes "Partial mode. Incomplete volume groups will be
activated read-only." and that is normal.



-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
