MIME-Version: 1.0
References: <CABZYMH5DD8LFKNeFoWuk+8ZOAwyqWG5pVYAGYFtv4hjZ-Dyu5A@mail.gmail.com>
	<20181010190857.GB10633@redhat.com>
In-Reply-To: <20181010190857.GB10633@redhat.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Thu, 11 Oct 2018 21:03:01 +0800
Message-ID: <CABZYMH7MCecO37Fav-6GH=vWzcR56XG3T0Gx4heRWR8k1QtcOQ@mail.gmail.com>
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
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

1. About host ID

This is because I regenerate a host id when the host join a new
lockspace -- I find host id need to be unique only in each lockspace
rather than all lockspace.
it's very natural a host should keep a single host id, since the
exists of global lock, the host id on global lock lockspace must
unique to all and can be set to all lockspaces.
but consider this situation:

three hosts a, b, c and 3 storage 1, 2, 3
each host only attach 2 storage,
a possible combination: a(1,2), b(2,3), c(1,3)
so none of these storage is a proper storage to hold global lock!

so I give up the global lock setting and the host id on global, I'll
only correct global lock when I need(add vg, pv, etc)


2. About host 19

I found host 19 truly hold the lease since 2018-10-09 20:49:15:

daemon 091c17d0-648eb28c-HLD-1-3-S07
p -1 helper
p -1 listener
p 2235 lvmlockd
p 2235 lvmlockd
p 2235 lvmlockd
p 2235 lvmlockd
p -1 status
s lvm_b075258f5b9547d7b4464fff246bbce1:19:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:0

 2018-10-09 20:49:15 4854716 [29802]: s4:r2320 resource
lvm_b075258f5b9547d7b4464fff246bbce1:u3G3P3-5Ert-CPSB-TxjI-
dREz-GB77-AefhQD:/dev/mapper/b075258f5b9547d7b4464fff246bbce1-lvmlock:111149056:SH
for 5,14,29715
 2018-10-09 20:49:15 4854716 [29802]: r2320 paxos_acquire begin e 0 0
 2018-10-09 20:49:15 4854716 [29802]: r2320 leader 1 owner 54 2 0
dblocks 53:54:54:54:2:4755629:1:1,
 2018-10-09 20:49:15 4854716 [29802]: r2320 paxos_acquire leader 1
owner 54 2 0 max mbal[53] 54 our_dblock 0 0 0 0 0 0
 2018-10-09 20:49:15 4854716 [29802]: r2320 paxos_acquire leader 1 free
 2018-10-09 20:49:15 4854716 [29802]: r2320 ballot 2 phase1 write mbal 2019
 2018-10-09 20:49:15 4854717 [29802]: r2320 ballot 2 mode[53] shared 1 gen 2
 2018-10-09 20:49:15 4854717 [29802]: r2320 ballot 2 phase1 read
18:2019:0:0:0:0:2:0,
 2018-10-09 20:49:15 4854717 [29802]: r2320 ballot 2 phase2 write bal
2019 inp 19 1 4854717 q_max -1
 2018-10-09 20:49:15 4854717 [29802]: r2320 ballot 2 abort2 larger
mbal in bk[79] 4080:0:0:0:0:2 our dblock 2019:2019: 19:1:4854717:2
 2018-10-09 20:49:15 4854717 [29802]: r2320 ballot 2 phase2 read
18:2019:2019:19:1:4854717:2:0,79:4080:0:0:0:0:2:0,
 2018-10-09 20:49:15 4854717 [29802]: r2320 paxos_acquire 2 retry
delay 724895 us
 2018-10-09 20:49:16 4854717 [29802]: r2320 paxos_acquire leader 2
owner 19 1 4854717
 2018-10-09 20:49:16 4854717 [29802]: r2320 paxos_acquire 2 owner is
our inp 19 1 4854717 commited by 80
 2018-10-09 20:49:16 4854717 [29802]: r2320 acquire_disk rv 1 lver 2 at 4854717
 2018-10-09 20:49:16 4854717 [29802]: r2320 write_host_block host_id
19 flags 1 gen 1 dblock 29802:510:
140245418403952:140245440585933:140245418403840:4:RELEASED.
 2018-10-09 20:49:16 4854717 [29802]: r2320 paxos_release leader 2
owner 19 1 4854717
 2018-10-09 20:49:16 4854717 [29802]: r2320 paxos_release skip write
last lver 2 owner 19 1 4854717 writer 80 1        4854737 disk lver 2
owner 19 1 4854717 writer 80 1 4854737

does the "paxos_release skip write last lver" is abnormal?


3. Others

The lvmlockd I set it size as 1GB, it maybe to large to upload and
analyse, but I can upload to s3 if we have no other clues.
Because of the problem of multipath queue_if_no_path, it's difficult
to kill process using lv, I may clear lockspace directly without the
process killed, is this related to this problem?
I'm wondering why host generation change in host 19, does clear
lockspace and rejoin or reboot host cause this?

Thanks,
Damon
