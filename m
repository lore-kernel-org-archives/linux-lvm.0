Message-ID: <3B8FF12F.7050808@st-peter.stw.uni-erlangen.de>
Date: Fri, 31 Aug 2001 22:18:55 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PBs with LVM over software RAID
References: <3B8E3F0E.8050609@st-peter.stw.uni-erlangen.de> <20010830083546.A20989@sistina.com> <3B8EC633.40202@st-peter.stw.uni-erlangen.de> <3B8F8C5E.7030603@st-peter.stw.uni-erlangen.de> <20010831110512.V541@turbolinux.com> <3B8FD95C.60702@st-peter.stw.uni-erlangen.de> <20010831130718.C541@turbolinux.com>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

do you think i schould also try a kernel upgrade and/or LVm
the XFS cvs tree should be till 2.4.10pre2 and sistina released lvm-1.0.1rc2
and i'm with XFS cvs kernel-2.4.9 and lvm-1.0.1rc1 
Andreas Dilger wrote:

>On Aug 31, 2001  20:37 +0200, svetljo wrote:
>
>>>>EIP; e29c0266 <[linear]linear_make_request+36/f0>   <=====
>>>>
>>Trace; c023fa12 <__make_request+412/6d0>
>>Trace; c0278dcd <md_make_request+4d/80>
>>Trace; c027fa0f <lvm_make_request_fn+f/20>
>>Trace; c023fd89 <generic_make_request+b9/120>
>>
>
>OK, so the oops is inside the RAID layer, but it may be that it is
>being fed bogus data from a higher layer.  Even so, it should not
>oops in this case.  Since XFS changes a lot of the kernel code, I
>would either suggest asking the XFS folks to look at this oops,
>or maybe on the MD RAID mailing list, as they will know more about it.
>
>Cheers, Andreas
>
