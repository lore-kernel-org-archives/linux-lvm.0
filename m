Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k27LLu101506
	for <linux-lvm@redhat.com>; Tue, 7 Mar 2006 16:21:56 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.193])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k27LLott012560
	for <linux-lvm@redhat.com>; Tue, 7 Mar 2006 16:21:50 -0500
Received: by wproxy.gmail.com with SMTP id i24so24361wra
	for <linux-lvm@redhat.com>; Tue, 07 Mar 2006 13:21:50 -0800 (PST)
Message-ID: <6dcf0dbc0603071321x5fdaac9dr711212e600c8b8dc@mail.gmail.com>
Date: Tue, 7 Mar 2006 22:21:49 +0100
From: "John Smith" <lbalbalba@gmail.com>
Subject: Re: [linux-lvm] Boot Mgr support for '/boot' on LVM2 volumes ?
In-Reply-To: <20060307190636.GA12504@percy.comedia.it>
MIME-Version: 1.0
Content-Disposition: inline
References: <6dcf0dbc0603050846k2b8bb546r1a3b6f30f541e473@mail.gmail.com>
	<20060307190636.GA12504@percy.comedia.it>
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

On 3/7/06, Luca Berra <bluca@comedia.it> wrote:
>
> Christophe Saout made some patches to lilo to be able to boot from a
> lvm2 /boot (http://www.saout.de/misc/), this patch has been adopted into
> major distributions.
>
Cool, I didnt know that.

>
> this is correct, the lv for /boot is to be linear and contiguus, it is
> user responsability to ensure this.
>
UUhhmm...Ok, now im confused. If 'the user' still has to make sure
that /boot is linear and contiguous, then :
1.) Exactly, what, does the patch *do* then ?
2.) How does 'the user' (me, in this case) ensure this ?


Sincerely,

John Smith.
