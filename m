Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1DLeni10565
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 16:40:49 -0500
Received: from behemoth.csg.stercomm.com (e3hst100.csg.stercomm.com [204.214.3.100])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1DLemb20228
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 16:40:49 -0500
Received: from stercomm.com (unknown [10.20.20.10])
	by behemoth.csg.stercomm.com (Postfix) with ESMTP id C46D4BBF
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2004 15:40:42 -0600 (CST)
Message-ID: <402D419A.8060000@stercomm.com>
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Problems :)
References: <402CD9E4.8070402@demonlord.de> <20040213143846.GB10943@redhat.com> <402D0433.5000909@demonlord.de> <20040213173203.GA13188@redhat.com>
In-Reply-To: <20040213173203.GA13188@redhat.com>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 16:40:22 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Heinz Mauelshagen wrote:
...
> BTW: you should either run e2fsadm to grow/shrink the unmounted
>      filesystem _and_ the logical volume in one go
>      -or-
>      use the filesystem resizer and lvextend/lvreduce in the correct order
>      (lvextend + grow fs -or- shrink fs + lvreduce).
> 
>      Problem with the later is getting the size arguments right ;-)

Be overly conservative and just grow the filesystem to fill the
leftover space afterwards.  So overguess on shrinking the filesystem,
choose something safe for the lv shrink, then grow the filesystem
to fill.
