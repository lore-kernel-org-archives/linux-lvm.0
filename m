Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71CF16A6AD
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 15:03:58 +0000 (UTC)
Received: from postamt.cs.uni-dortmund.de (postamt.cs.uni-dortmund.de
	[129.217.4.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10FDCC058CA6
	for <linux-lvm@redhat.com>; Mon, 19 Nov 2018 15:03:55 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 19 Nov 2018 16:03:53 +0100
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
In-Reply-To: <1044845531.2858991.1542636286779@mail.yahoo.com>
References: <1044845531.2858991.1542636286779.ref@mail.yahoo.com>
	<1044845531.2858991.1542636286779@mail.yahoo.com>
Message-ID: <19d30fdf4dfd3ef69c6018108407e4ea@cs.uni-dortmund.de>
Subject: Re: [linux-lvm] lvcreate from a setuid-root binary
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hello,

On 2018-11-19 15:04, matthew patton wrote:
>> program calls getpwuid() with the real user id of the calling user
> 
> maybe I missed a critical post explaining why it has to be, but that's
> a job for a trivial sudo specification line.
> 
> I can't think of any reason why sudo is not the answer to your
> problem, or frankly isn't always the answer.

I have already tried sudo before writing my own setuid-root-program, by 
calling it directly from pam_exec and by letting pam_exec call another 
program first that calls sudo. Either case failed, even with simple 
tests like letting sudo run /bin/ls (and of course I checked before that 
the same user could use sudo from the command line).

Regards
   Christoph
