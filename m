Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA8K9hr11500
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 15:09:43 -0500
Received: from mta.hosting-seguridad.com (mta.hosting-seguridad.com
	[207.150.162.14])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA8K9cjU020036
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 15:09:43 -0500
Received: from localhost (localhost [127.0.0.1])
	by mta.hosting-seguridad.com (Postfix) with ESMTP id BD77360057
	for <linux-lvm@redhat.com>; Mon,  8 Nov 2004 21:09:37 +0100 (CET)
Received: from skorpio (unknown [80.103.237.103])
	by mta.hosting-seguridad.com (Postfix) with ESMTP id 33CA160053
	for <linux-lvm@redhat.com>; Mon,  8 Nov 2004 21:09:34 +0100 (CET)
From: Roman Medina-Heigl Hernandez <roman@rs-labs.com>
Subject: Re: [linux-lvm] Creating PV over a /dev/mapper device /
Date: Mon, 08 Nov 2004 21:11:23 +0100
Message-ID: <6jkvo0tc8d79f8rldpjbh4bmsklc4dsbdg@4ax.com>
References: <tk9so0di0jsl44dagc1dl8at6e9ld4r1be@4ax.com>
	<mhcso057hatf6psfl54vqqe0qtqpgrj7p8@4ax.com>
	<20041107191323.GE2717@agk.surrey.redhat.com>
In-Reply-To: <20041107191323.GE2717@agk.surrey.redhat.com>
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

On Sun, 7 Nov 2004 19:13:23 +0000, you wrote:

>On Sun, Nov 07, 2004 at 03:36:54PM +0100, Roman Medina-Heigl Hernandez wrote:
>>   Internal error: unknown device-mapper task 16
>
>Suggests that your 'lvm' binary is newer than your device-mapper
>library.  If that's pure Debian, it suggests there's a package
>version dependency missing.  I'll see about changing that out-dated 
>error message.

I was using this source:
deb http://www.fs.tum.de/~bunk/debian woody/bunk-2 main

Now I'm using:
deb http://www.backports.org/debian stable libgcrypt11 devmapper
lvm-common lvm2

It contains older packages but they seems to match dependencies
better. The problem is solved. Thanks again, A.

 Saludos,
 --Roman

--
PGP Fingerprint:
09BB EFCD 21ED 4E79 25FB  29E1 E47F 8A7D EAD5 6742
[Key ID: 0xEAD56742. Available at KeyServ]
