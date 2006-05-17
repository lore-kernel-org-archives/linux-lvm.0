Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HHU18L000838
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 13:30:01 -0400
Received: from smtp.andrew.cmu.edu (smtp.andrew.cmu.edu [128.2.10.83])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HHTx8U017036
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 13:29:59 -0400
Message-ID: <446B5DAA.8020004@cmu.edu>
Date: Wed, 17 May 2006 13:30:18 -0400
From: George Nychis <gnychis@cmu.edu>
MIME-Version: 1.0
References: <446A36B8.1060707@cmu.edu> <20060516203917.GQ11191@w.ods.org>
	<446A418E.3070307@cmu.edu> <20060517034814.GA25818@w.ods.org>
	<446B2523.1040800@cmu.edu>
	<20060517133456.GD23933@csclub.uwaterloo.ca>
	<446B27E4.7040509@cmu.edu>
	<20060517155335.GF23933@csclub.uwaterloo.ca>
In-Reply-To: <20060517155335.GF23933@csclub.uwaterloo.ca>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: need help booting from SATA in 2.4.32 / LVM
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
To: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
Cc: linux-lvm@redhat.com, linux-kernel@vger.kernel.org, Willy Tarreau <willy@w.ods.org>



Lennart Sorensen wrote:
> On Wed, May 17, 2006 at 09:40:52AM -0400, George Nychis wrote:
>> Because it does......
>>
>> on bootup the *same* exact drive in 2.4.32 shows up as /dev/hda
>>
>> It has the exact same volume information as my drive that shows up in
>> 2.6.9 as /dev/sda
> 
> Yes I do remember a few sata controllers had some support in 2.4, which
> was dropped from 2.6 early on when libata came in.
> 
> It is very unlikely you will ever see that again in the future.
> 
> Len Sorensen
> 

I see... well I am finally getting it to boot, i did not have initrd
support built into the 2.4.32 kernel, but now i'm getting LVM errors:

Scanning logical volumes
   /bin/vgscan.lvm1: execvp failed: No such file or directory
ERROR: /bin/vgscan exited abnormally!
Activating logical volumes
   /bin/vgchange.lvm1: execvp failed: No such file or directory
ERROR: /bin/vgchange exited abnormally!

I know nothing about LVM so... i'm pretty clueless for now
