Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA8K7Kr10833
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 15:07:20 -0500
Received: from mta.hosting-seguridad.com (mta.hosting-seguridad.com
	[207.150.162.14])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA8K7IGO019438
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 15:07:18 -0500
Received: from localhost (localhost [127.0.0.1])
	by mta.hosting-seguridad.com (Postfix) with ESMTP id 7241560057
	for <linux-lvm@redhat.com>; Mon,  8 Nov 2004 21:07:17 +0100 (CET)
Received: from skorpio (unknown [80.103.237.103])
	by mta.hosting-seguridad.com (Postfix) with ESMTP id A463660053
	for <linux-lvm@redhat.com>; Mon,  8 Nov 2004 21:07:14 +0100 (CET)
From: Roman Medina-Heigl Hernandez <roman@rs-labs.com>
Subject: Re: [linux-lvm] Creating PV over a /dev/mapper device
Date: Mon, 08 Nov 2004 21:09:02 +0100
Message-ID: <e5kvo0tad7ubm03ffp22b022u301lddis2@4ax.com>
References: <tk9so0di0jsl44dagc1dl8at6e9ld4r1be@4ax.com>
	<20041107192450.GF2717@agk.surrey.redhat.com>
	<3e4to0lgsvjoe6mqijohlh8558vbbb9uhj@4ax.com>
	<20041108142811.GH2717@agk.surrey.redhat.com>
In-Reply-To: <20041108142811.GH2717@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 8 Nov 2004 14:28:11 +0000, you wrote:

>On Sun, Nov 07, 2004 at 10:35:57PM +0100, Roman Medina-Heigl Hernandez wrote:
>> First, thanks for your fast answer. I added the "device-mapper" type
>> but it is still not working. Example:
> 
>    # List of pairs of additional acceptable block device types found 
>    # in /proc/devices with maximum (non-zero) number of partitions.
>    # types = [ "fd", "device-mapper", 16 ]
>
>Firstly the line is commented out;

Oh my God... :-) Sorry for the tremendous lapsus.

>secondly make it:
>  types = [ "device-mapper", 16 ]

Now it is working. Thanks.

>You can run 'lvm dumpconfig' to check what settings have actually 
>been read in from the config files.

jupiter:/etc/lvm# lvm dumpconfig
  No such command.  Try 'help'.

But don't worry. It appears I'm using an old version of lvm (I
downgraded to solve the "Internal error: unknown device-mapper task
16" problem).

jupiter:/etc/lvm# lvm version
  LVM version:     2.00.06 (2003-08-20)
  Library version: 1.00.05-ioctl-cvs (2003-09-01)
  Driver version:  4.1.0
jupiter:/etc/lvm# 

>> I've set-up lvm1 mode ('cause I read that it is more stable than lvm2)
>
>Don't know where you read that but I'd strongly dispute it.

I don't remember either... well, I'll trust you and I'll use lvm2 ;-)

Thanks for your help.

 Saludos,
 --Roman

--
PGP Fingerprint:
09BB EFCD 21ED 4E79 25FB  29E1 E47F 8A7D EAD5 6742
[Key ID: 0xEAD56742. Available at KeyServ]
