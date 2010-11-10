Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAAHuh3p009268
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 12:56:43 -0500
Received: from mail-gx0-f174.google.com (mail-gx0-f174.google.com
	[209.85.161.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAAHuSnY030430
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 12:56:28 -0500
Received: by gxk23 with SMTP id 23so591254gxk.33
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 09:56:28 -0800 (PST)
Message-ID: <4CDADCC8.9030400@gmail.com>
Date: Wed, 10 Nov 2010 12:56:24 -0500
From: Mauricio Tavares <raubvogel@gmail.com>
MIME-Version: 1.0
References: <4CDAAE84.5060806@gmail.com> <4CDAB63A.9090504@cfl.rr.com>
In-Reply-To: <4CDAB63A.9090504@cfl.rr.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Bad disk?
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
To: Phillip Susi <psusi@cfl.rr.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 11/10/2010 10:11 AM, Phillip Susi wrote:
> On 11/10/2010 9:39 AM, Mauricio Tavares wrote:
>> Yesterday I added a hard drive (to put extra stuff on it) to my ubuntu
>> 10.10 box and created a LVM in it. Then copied some files to it and
>> restarted the machine to see if it would mount into the right
>> mountpoint. It didn't. So I decided to see if it was there (vg in
>> question is export):
>
> None of the errors you posted mention a physical disk at all, so there
> isn't anything wrong with them.  To find out what dm-0 is you need to
> poke around with dmsetup.

	Now that might be interesting since I honestly do not know how to use 
it (and my google-fu seems weak today). But this is a bit more info I found:

raub@strangepork:~$ sudo pvs -a
   /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
   /dev/dm-0: read failed after 0 of 4096 at 429496664064: Input/output 
error
   /dev/dm-0: read failed after 0 of 4096 at 429496721408: Input/output 
error
   /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
   /dev/dm-0: read failed after 0 of 4096 at 4096: Input/output error
   /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
   PV         VG     Fmt  Attr PSize   PFree
   /dev/dm-0              --        0       0
   /dev/dm-1  root   lvm2 a-   277.05g 192.55g
   /dev/dm-2              --        0       0
   /dev/dm-3              --        0       0
   /dev/dm-4              --        0       0
   /dev/dm-5              --        0       0
   /dev/ram0              --        0       0
   /dev/ram1              --        0       0
   /dev/ram10             --        0       0
   /dev/ram11             --        0       0
   /dev/ram12             --        0       0
   /dev/ram13             --        0       0
   /dev/ram14             --        0       0
   /dev/ram15             --        0       0
   /dev/ram2              --        0       0
   /dev/ram3              --        0       0
   /dev/ram4              --        0       0
   /dev/ram5              --        0       0
   /dev/ram6              --        0       0
   /dev/ram7              --        0       0
   /dev/ram8              --        0       0
   /dev/ram9              --        0       0
   /dev/root              --        0       0
   /dev/sda1              --        0       0
   /dev/sda3              --        0       0
   /dev/sdc1  export lvm2 a-   465.76g  65.76g
raub@strangepork:~$

FYI, the root vg in inside /dev/sda3, which is an encrypted partition. 
How can I find which drive /dev/dm-0 is?
