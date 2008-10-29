Received: from [10.34.32.183] (mazybook.englab.brq.redhat.com [10.34.32.183])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m9TBdOIP018100
	for <linux-lvm@redhat.com>; Wed, 29 Oct 2008 07:39:25 -0400
Message-ID: <49084B6D.90604@redhat.com>
Date: Wed, 29 Oct 2008 12:39:25 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] clvmd locking disabled
References: <490678BE.1070700@hidden.domain.name>	<08781647-26E4-46F3-B148-A64933B84363@redhat.com>	<4907AF21.4030808@hidden.domain.name>	<49083B9E.4090308@gk-software.com>
	<49083EBC.5080301@gk-software.com>
In-Reply-To: <49083EBC.5080301@gk-software.com>
Content-Transfer-Encoding: 7bit
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

Stepan Kadlec wrote:
> one more report:
> 
> # vgscan
> File descriptor 3 (/dev/tty) leaked on vgscan invocation. Parent PID 
> 3389: bash
> File descriptor 5 (/dev/pts/1) leaked on vgscan invocation. Parent PID 
> 3389: bash
> File descriptor 7 (pipe:[9066]) leaked on vgscan invocation. Parent PID 
> 3389: bash

So the calling application (bash) forgot to close some descriptors
(running lvm in mc shell usually produces this:-)

That's just warning, lvm close all descriptors, you can ignore these messages.
(and if the parent process is clvmd, it is bug in clvmd and we should fix it :)

>    Unknown locking type requested.
>    Locking type 3 initialisation failed.

Locking type 2 and 3 are cluster locking
Type 2 is for external locking library, 3 is internal (compiled-in)

For type 3 you should use  --with-cluster=internal in configure.
(you can still switch type 2 with this setting, but if you do not
use own locking library, it is probably not needed).

Milan
--
mbroz@redhat.com
