Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7979fbk029683
	for <linux-lvm@redhat.com>; Wed, 9 Aug 2006 03:09:41 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7979YfY016674
	for <linux-lvm@redhat.com>; Wed, 9 Aug 2006 03:09:35 -0400
Date: Wed, 9 Aug 2006 09:09:33 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Moving a lv between hosts
Message-ID: <20060809070933.GC22136@percy.comedia.it>
References: <5bdb1aa70608082054o5baaabe6i6ffef4d4c6d23e40@mail.gmail.com>
	<20060809051644.GB22136@percy.comedia.it>
	<5bdb1aa70608082254m5b51062di2141d7f95a294c81@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5bdb1aa70608082254m5b51062di2141d7f95a294c81@mail.gmail.com>
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
To: Simon <greminn@gmail.com>
Cc: linux-lvm@redhat.com

On Wed, Aug 09, 2006 at 05:54:23PM +1200, Simon wrote:
>Hi Luca,

Please, keep the thread on the mailing list
(to everybody else, sorry for the full quote)

>Thanks for the responce... a quick question (see below):
>
>On 8/9/06, Luca Berra <bluca@comedia.it> wrote:
>>On Wed, Aug 09, 2006 at 03:54:01PM +1200, Simon wrote:
>> >Hi There,
>> >
>> >Is there an easy way/process to move a logical volume between hosts?
>> >(Apart from coping the data within the mounted volume).
>> >
>> >In reading thru.. vgexport and vgimport are for the volume group
>> >itself. But i would like a away to just move a lv within vg.
>>
>>if the lv is the only thing sitting onto a set of pv
>>you can just:
>>lvchange -a n on the old host
>>move the disks
>>avtivate the vg with the --partial option on the new host
>>
>>then run vgreduce --removemissing on both machines.
>
>On server1 and server2 we have a hdc1 which is a Linux LVM, i have
>created a vg called "testvg", and then a number of lvs "testlv1" to
>"testlv5" on server1  and now want to move "testlv3" (for example)
>over to server2.

then you have two different disks one in each server.

in this case you have to create a suitable vg and lv on server2
either copy the data from a mounted filesystem
or you dd the whole lv.

>(Sorry, a bit new to this and might not have the terms down yet)...
>
>If i to a "vchange -a n /dev/testvg/testlv3", which makes it now
>unavailable within the vg... when you say "move the disk" do you mean
>pysically move the disk?

ignore my previous mail, it does not apply to your case.

>Again, sorry - i didnt explain myself enough in the first place.
>
>Apprciate any help here!
>
>Simon

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
