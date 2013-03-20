Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r2KImwNO017431
	for <linux-lvm@redhat.com>; Wed, 20 Mar 2013 14:48:58 -0400
Received: from exprod5og104.obsmtp.com (exprod5og104.obsmtp.com [64.18.0.178])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id r2KImu96018264
	for <linux-lvm@redhat.com>; Wed, 20 Mar 2013 14:48:57 -0400
Received: by mail-gh0-f199.google.com with SMTP id r16so2663570ghr.2
	for <linux-lvm@redhat.com>; Wed, 20 Mar 2013 11:48:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130320145519.GB4759@redhat.com>
References: <CAHkw+LfrqkbZ8GUnEfz8umL22NJHep0xTmYkQ3wb-gr3rSFNhA@mail.gmail.com>
	<20130320103836.58451646@jajo.eggsoft>
	<20130320145519.GB4759@redhat.com>
Date: Wed, 20 Mar 2013 14:48:55 -0400
Message-ID: <CAHkw+LdOACp1v9ndmjrUG__-E01XwMVM-jhaxGQLgSpzYRsBVg@mail.gmail.com>
From: Marc Smith <marc.smith@mcc.edu>
Subject: Re: [linux-lvm] Error Attempting to Create LV on Clustered VG
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

Jacek: Thank you, that solved the problem.

David: Thanks for the tip, I will use it.


--Marc

On Wed, Mar 20, 2013 at 10:55 AM, David Teigland <teigland@redhat.com> wrote:
>> > I've Google'd around a bit but haven't found any other posts quite
>> > like this one. Here are the software versions I'm using on these
>> > hosts:
>> > Linux kernel: 3.7.8
>> > LVM2: 2.02.97
>> > DLM User Tools (dlm_controld): 4.0.1
>> > Corosync: 2.3.0
>> > Pacemaker: 1.1.8
>>
>> Are you using a 64-bit environment. If so, then this might be the bug in the
>> 3.7 kernel DLM driver.
>>
>> http://www.redhat.com/archives/cluster-devel/2013-February/msg00060.html
>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=d4b0bcf32b946590afd29e202d6a399b84fe6c67
>
> The fix is in the 3.8 kernel.
>
>> > When I attempt to create a LV on this VG from one of the hosts, I get
>> > the following error message:
>> > [root@ben ~]# lvcreate -L 150G -n testvmfs1 r0
>> >   Error locking on node 40e6640a: Invalid argument
>> >   Error locking on node 31e6640a: Invalid argument
>> >   Failed to activate new LV.
>
> I'd also advise setting up proper node definitions in corosync.conf;
> it avoids the invalid nodeid issue and makes everything cleaner.
> Here's what I use:
>
> totem {
>         version: 2
>         secauth: off
>         cluster_name: foo
> }
>
> nodelist {
>         node {
>                 ring0_addr: 1.1.1.1
>                 nodeid: 1
>         }
>         node {
>                 ring0_addr: 2.2.2.2
>                 nodeid: 2
>         }
> }
>
> quorum {
>         provider: corosync_votequorum
>         two_node: 1
> }
>
> logging {
>         to_syslog: yes
> }
>
