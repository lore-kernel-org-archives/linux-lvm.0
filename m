Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8AEMPnh012917
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2010 10:22:26 -0400
Received: from eastrmmtao107.cox.net (eastrmmtao107.cox.net [68.230.240.59])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8AEMGl5005358
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2010 10:22:17 -0400
Received: from eastrmimpo02.cox.net ([68.1.16.120]) by eastrmmtao107.cox.net
	(InterMail vM.8.00.01.00 201-2244-105-20090324) with ESMTP id
	<20100910142216.HCHO21335.eastrmmtao107.cox.net@eastrmimpo02.cox.net>
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2010 10:22:16 -0400
Message-ID: <4C8A3F22.3070908@cox.net>
Date: Fri, 10 Sep 2010 10:22:26 -0400
From: "Clyde E. Kunkel" <rascal.jumper-747@cox.net>
MIME-Version: 1.0
References: <AANLkTikbz3mxVyaXtE_gavc3ri-4Y7TJTWmCXxcDkbT=@mail.gmail.com>
	<4C868067.8050909@Media-Brokers.com>
In-Reply-To: <4C868067.8050909@Media-Brokers.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Either the superblock or the partition table is
 likely to be corrupted
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

  On 09/07/2010 02:11 PM, Charles Marcus wrote:
> On 2010-09-07 12:45 PM, James Corteciano<james@linux-source.org>  wrote:
>> 2) I run system-config-lvm and reduce lv-wf1 from 160G to 70G and
>> increased lv-wf2 from 10G to 30G.
>>
>> Now, when I run the rhcs-nfs1 service using the command "clusvcadm
>> -e rhcs-nfs1 -m rhcs-node1", I got failed result. I have checked the
>> /var/log/messages and this is the output.
> Dumb/obvious question... you did reduce the size of the filesystem
> *before* reducing the size of the LV, right?
>

And, if it was done out of sequence, is there a way to still fix it?

TIA
