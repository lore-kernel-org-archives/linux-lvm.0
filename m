Subject: Re: [linux-lvm] LVM2 for kernels 2.4.20(another problem raid-0)
Message-ID: <1043665631.3e3512dfb8b34@secure.st-peter.stw.uni-erlangen.de>
From: Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>
References: <1043622448.3e346a3057b43@secure.st-peter.stw.uni-erlangen.de>
In-Reply-To: <1043622448.3e346a3057b43@secure.st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Mon Jan 27 05:08:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


> Hi just an intermidiate report,
> cause it's with 2.4.20-dm-2
> (i'm rebuilding now with dm-7)

it's just the same with dm-7 :(
####################################################
XFS mounting filesystem device-mapper(254,8)
raid0_make_request bug: can't convert block across chunks or bigger than 16k
25181119 4
raid0_make_request bug: can't convert block across chunks or bigger than 16k
25181151 4
raid0_make_request bug: can't convert block across chunks or bigger than 16k
25181183 4
raid0_make_request bug: can't convert block across chunks or bigger than 16k
25181215 4
raid0_make_request bug: can't convert block across chunks or bigger than 16k
25181247 4
raid0_make_request bug: can't convert block across chunks or bigger than 16k
25181279 4
raid0_make_request bug: can't convert block across chunks or bigger than 16k
25181311 4
raid0_make_request bug: can't convert block across chunks or bigger than 16k
25181343 4
I/O error in filesystem ("device-mapper(254,8)") meta-data dev 0xfe08 block
0x801a37       ("xlog_bread") error 5 buf count 131072
XFS: failed to find log head
XFS: log mount/recovery failed
XFS: log mount failed
#################################################################


any hints for testing, debuging?

is it the same with the ac kernels?
( or may be does smbd have a ac kernel with xfs , i want to test it 
but ac doesn't have xfs support :( )

Regards,

svetljo

> when i try to mount a xfs filesystem wich is on 
> lv over soft raid-0, i'm getting just like in
> 2.5.2x - 2.5.4x (i didn't try later kernels) :
> 
> ############################
> raid0_make_request bug: can't convert block across chunks or bigger than
> 16k
> 25181311 4
> raid0_make_request bug: can't convert block across chunks or bigger than
> 16k
> 25181343 4
> ############################
> 
> is this know problem, is it fixed ?
> i thought that the problem exist only in 2.5 kernel
> 
> Regards,
> 
> svetljo
