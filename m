Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k28Kh6110446
	for <linux-lvm@redhat.com>; Wed, 8 Mar 2006 15:43:06 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k28Kh4L9016448
	for <linux-lvm@redhat.com>; Wed, 8 Mar 2006 15:43:04 -0500
Date: Wed, 8 Mar 2006 21:43:03 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Boot Mgr support for '/boot' on LVM2 volumes ?
Message-ID: <20060308204302.GA25789@percy.comedia.it>
References: <6dcf0dbc0603050846k2b8bb546r1a3b6f30f541e473@mail.gmail.com>
	<20060307190636.GA12504@percy.comedia.it>
	<6dcf0dbc0603071321x5fdaac9dr711212e600c8b8dc@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6dcf0dbc0603071321x5fdaac9dr711212e600c8b8dc@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Mar 07, 2006 at 10:21:49PM +0100, John Smith wrote:
>On 3/7/06, Luca Berra <bluca@comedia.it> wrote:
>>
>> Christophe Saout made some patches to lilo to be able to boot from a
>> lvm2 /boot (http://www.saout.de/misc/), this patch has been adopted into
>> major distributions.
>>
>Cool, I didnt know that.
>
>>
>> this is correct, the lv for /boot is to be linear and contiguus, it is
>> user responsability to ensure this.
>>
>UUhhmm...Ok, now im confused. If 'the user' still has to make sure
>that /boot is linear and contiguous, then :
>1.) Exactly, what, does the patch *do* then ?
it allows lilo to query device mapper and map a dm device to physical
sectors on the disk.
>2.) How does 'the user' (me, in this case) ensure this ?
>
make /boot a separate logical volume than /
do not extend it.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
