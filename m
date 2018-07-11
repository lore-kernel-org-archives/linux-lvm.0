MIME-Version: 1.0
References: <CABZYMH7=O418BQ+Xh0bo_6mmp1nNmK4r5w_=vJkS4YdYyWjEwQ@mail.gmail.com>
	<20180709171859.GB13875@redhat.com>
	<CABZYMH5_CTiubbMgAm-5GN+HrKcK+rVV4z6_n5xcad-oPm4qCg@mail.gmail.com>
	<20180710141152.GB14873@redhat.com>
In-Reply-To: <20180710141152.GB14873@redhat.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Wed, 11 Jul 2018 11:07:56 +0800
Message-ID: <CABZYMH68E3Nv+hW9t=JOhh8zXMxq8biNEzZkE=Dx1J6k+D6Afg@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] "VG xxx lock faied: error -221" while lv
 operation sucess
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

Hi Dave,

Thanks a lot for your analysis, and with help of
http://people.redhat.com/teigland/sanlock-messages.txt , It's clear to
get what happened.
So there must be some storage problem on Jul 5 15:27, hope lvmlockd
can handle this situation better in the future :-D

Thanks again,
Damon

On Tue, Jul 10, 2018 at 10:11 PM David Teigland <teigland@redhat.com> wrote:
>
> On Tue, Jul 10, 2018 at 03:52:26PM +0800, Damon Wang wrote:
> > Hi dave,
> >
> > Thank you for your reply, unfortunately I have rebooted that host last stat :(
> >
> > But good news is I have saved some logs, but I don't know weather it
> > helps since I only saved "lvmlockctl -i", "sanlock client status",
> > sanlock.log and messages.
> >
> > I pasted "sanlock client status" on https://pastebin.com/M9TRKeBk
> > "lvmlockctl -i ": https://pastebin.com/v9E1Atig
> >
> > Related messages and sanlock.log:
> >
> > "messages": https://pastebin.com/1tqtQvDS
> > "sanlock.log": https://pastebin.com/ESA4Wz3B
>
> That's all that's needed.  sanlock was getting io timeouts (-202) from the
> storage (probably related to the qla errors you also see.)  sanlock uses a
> 10 second io timeout by default (although using a non default value has
> not been as thoroughly tested.)
>
> Here's the first timeout, while trying to acquire a lock:
>
> Jul  5 15:27:49 iscsi sanlock[19403]: 2018-07-05 15:27:49 20369 [19408]: r2136 ballot 2 dblock read2 error -202
> Jul  5 15:27:49 iscsi sanlock[19403]: 2018-07-05 15:27:49 20369 [19408]: r2136 ballot 2 retract error -210
> Jul  5 15:27:49 iscsi sanlock[19403]: 2018-07-05 15:27:49 20369 [19408]: r2136 paxos_acquire 2 ballot error -210
> Jul  5 15:27:49 iscsi sanlock[19403]: 2018-07-05 15:27:49 20369 [19408]: r2136 acquire_token disk error -210 RETRACT_PAXOS
> Jul  5 15:27:49 iscsi sanlock[19403]: 2018-07-05 15:27:49 20369 [19408]: r2136 paxos_release already free last lver 1 owner 31 1 0 writer 31 1 20359 disk lver 1 owner 31 1 0 writer 31 1 20359
> Jul  5 15:27:49 iscsi sanlock[19403]: 2018-07-05 15:27:49 20369 [19408]: r2136 cmd_acquire 3,10,19384 acquire_token -210 lease io error
> Jul  5 15:27:49 iscsi lvmlockd[19384]: 1530775669 S lvm_f68643c145454594871f6f51b69bf8ba R 4bPTER-Q21t-VedL-UM8w-dPgn-6S13-lPoaB4 lock_san acquire error -210
>
> Here's the second, while trying to release a lock:
>
> Jul  5 15:27:59 iscsi sanlock[19403]: 2018-07-05 15:27:59 20379 [19407]: r2135 write_host_block host_id 31 flags 0 gen 0 rv -202
> Jul  5 15:27:59 iscsi sanlock[19403]: 2018-07-05 15:27:59 20379 [19407]: r2135 release_token shared write_host_block -202
> Jul  5 15:27:59 iscsi sanlock[19403]: 2018-07-05 15:27:59 20379 [19407]: r2135 release_token timeout r_flags 1
> Jul  5 15:27:59 iscsi lvmlockd[19384]: 1530775679 S lvm_f68643c145454594871f6f51b69bf8ba R VGLK unlock_san release error -202
> Jul  5 15:27:59 iscsi lvmlockd[19384]: 1530775679 S lvm_f68643c145454594871f6f51b69bf8ba R VGLK res_unlock lm error -221
> Jul  5 15:28:02 iscsi kernel: qla2xxx [0000:05:00.1]-801c:7: Abort command issued nexus=7:4:3 --  1 2002.
> Jul  5 15:28:04 iscsi kernel: qla2xxx [0000:05:00.1]-801c:7: Abort command issued nexus=7:4:0 --  1 2002.
>
> The io timeout error during acquire is usually not a problem, because the
> command will retry and succeed, or fail cleanly.  The io timeout error
> during release is a bigger problem, because it leaves a stray lock that
> later interferes with trying to acquire the lock again (the -17 errors you
> get after this.)  It looks like lvmlockd needs to better handle io timeout
> errors during unlock.  Thanks for the info,
> Dave
>
>
