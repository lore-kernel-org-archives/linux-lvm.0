Message-ID: <20040106181311.B26794@cs.mcgill.ca>
From: Navindra Umanee <navindra@cs.mcgill.ca>
Subject: Re: [linux-lvm] vgscan goes into an infinite loop (migration issues)
References: <20040106165719.A26553@cs.mcgill.ca> <20040106225901.J21022@uk.sistina.com>
Mime-Version: 1.0
In-Reply-To: <20040106225901.J21022@uk.sistina.com>; from Alasdair G Kergon on Tue, Jan 06, 2004 at 10:59:01PM +0000
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Jan  6 17:15:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Alasdair G Kergon <agk@uk.sistina.com> wrote:
> And there's a clue in that error message: the PV's UUID is meant 
> to appear between 'PV' and 'on' - but it's empty.

Hmmm.  Does this help:

[navindra@vinata navindra]# lvm1-pvdisplay /dev/hda6
--- Physical volume ---
PV Name               /dev/ide/host0/bus0/target0/lun0/part6
VG Name               bytepool
PV Size               10 GB [20964762 secs] / NOT usable 32.19 MB [LVM: 129 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                5
PE Size (KByte)       32768
Total PE              318
Free PE               0
Allocated PE          318
PV UUID               none

As you see, it claims there is no UUID.

> Please send me a copy of your metadata so I can try to reproduce
> the problem.

Thanks a lot for your followup!  I've sent the information you requested.

Cheers,
Navin.
