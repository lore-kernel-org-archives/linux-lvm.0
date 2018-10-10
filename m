Date: Wed, 10 Oct 2018 14:08:58 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20181010190857.GB10633@redhat.com>
References: <CABZYMH5DD8LFKNeFoWuk+8ZOAwyqWG5pVYAGYFtv4hjZ-Dyu5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABZYMH5DD8LFKNeFoWuk+8ZOAwyqWG5pVYAGYFtv4hjZ-Dyu5A@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] lvm command hung with sanlock log
 "ballot 3 abort1 larger lver in bk..."
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
To: Damon Wang <damon.devops@gmail.com>
Cc: linux-lvm@redhat.com

On Wed, Oct 10, 2018 at 03:51:14PM +0800, Damon Wang wrote:
> I can not create lv in an environment and after some check I found a
> server has hold the VGLK and not released for long time.

Hi, I'm curious how many hosts are using this VG?  (It's not immediately
relevant to this problem.)

I'm confused about how this host is using different host_id's in each VG
lockspace.  I would normally expect that /etc/lvm/lvmlocal.conf contains
local/host_id = N, and then find host_id N for all the lvm lockspaces:

s lvm_b075258f5b9547d7b4464fff246bbce1:49:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:0
s lvm_671bfaeb4e344014b041fc78115307bb:30:/dev/mapper/671bfaeb4e344014b041fc78115307bb-lvmlock:0
s lvm_4c149e7262a64c728997954257bece01:94:/dev/mapper/4c149e7262a64c728997954257bece01-lvmlock:0
s lvm_091c17d096894a179313aad65cb4127a:87:/dev/mapper/091c17d096894a179313aad65cb4127a-lvmlock:0

The VGLK being held for a long time is just a secondary effect of the real
problem, which is that acquiring an LV lock is stuck in a retry loop in
the low level sanlock code.  sanlock keeps retrying because there's bad
data in host_id 19's lease structure on disk.  host_id 19 failed sometime
before 18-10-10 14:12, and if you could find and send any messages from
that machine prior to it failing, that might help.

(Also, if you'd like to upload a copy of the hidden "lvmlock" LV from this
VG, I might try to pull more clues from that.)


> r lvm_b075258f5b9547d7b4464fff246bbce1:u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:111149056:SH
> p 27919 ADD        <------

sanlock is stuck repeatedly trying to acquire the lock for that LV (u3G3 /
r3098). The debug info for acquiring that lock begins here:

> 018-10-10 14:12:36 11494 [27916]: s4:r3098 resource
> lvm_b075258f5b9547d7b4464fff246bbce1:u3G3P3-5Ert-CPSB-TxjI-dREz-GB77-AefhQD:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:111149056:SH

> 018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire begin e 0 0
> 018-10-10 14:12:36 11494 [27916]: r3098 leader 2 owner 19 1 4854717
  dblocks 8:29802:510:140245418403952:140245440585933:140245418403840:4:1,48:202556049:0:0:0:0:3:0,65:218746066:0:0:0:0:3:0,79:202874080:0:0:0:0:3:0,

That shows the LV is already locked by host_id 19 (generation 1).

> 018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire leader 2
> owner 19 1 4854717 max mbal[65] 218746066 our_dblock 202556049 0 0 0 0 3

> 018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire owner 19 1 4854717
  host_status 19 2 10914 wait_start 11494

> 018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire owner 19 1 4854717
  delta 19 2 10995 mismatch

Those two messages show that host_id 19 is currently alive with generation
2.  Since the lock is owned by host_id 19 generation 1, it means that
host_id 19 previously failed while holding a lock on this LV, and has
since restarted and rejoined the lockspace (increasing the generation
number to 2 upon rejoining).  Since the owner of the lock is now stale,
this host should be able to acquire it immediately, but it doesn't...

> 018-10-10 14:12:36 11494 [27916]: r3098 paxos_acquire leader 2
> owner 19 1 4854717

> 018-10-10 14:12:36 11494 [27916]: r3098 ballot 3 phase1 write mbal 218748049

> 018-10-10 14:12:36 11494 [27916]: r3098 ballot 3 abort1 larger
> lver in bk[18] 29802:510:140245418403952:140245440585933:140245418403840:4
> our dblock 218748049:0:0:0:0:3

While going through the steps to acquire this lock, it finds invalid
dblock data on disk from host_id 19.  There's no checksum error for the
invalid data, so I wonder if it could be bad data in the buffer which 19
wrote before failing.  This host is looking at the invalid lease version
from the dblock, which is causing it to retry (the correct thing when it
legitimately sees a larger lease version.)  The checksum should normally
prevent it from using the invalid data.

> Besides, I found there are some hosts has different sanlock io timeout
> than others, is this the root cause?

Some hosts could still be using the previous 10 sec timeout if they have
not restarted the lockspace (or a particular delta lease has not been
reacquired using the newer timeout).  I don't think it would effect this
problem.
