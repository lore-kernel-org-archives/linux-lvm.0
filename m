Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] Request for misalignment tests
Date: Wed, 27 Jun 2001 06:56:52 -0400
References: <20010626161947.A11918@sistina.com>
In-Reply-To: <20010626161947.A11918@sistina.com>
MIME-Version: 1.0
Message-Id: <01062706565200.00314@oscar>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, Heinz Mauelshagen <mauelshagen@sistina.com>

On June 26, 2001 05:19 pm, Heinz Mauelshagen wrote:

oscar# pvdisplay -v /dev/hda3 | grep "^ *00000"
   00000 /dev/lv/swap              00086   4572
oscar# pvdisplay -v /dev/hde1 | grep "^ *00000"
   00000 /dev/lv/swap              00000   1136
oscar# pvdisplay -v /dev/hdg1 | grep "^ *00000"
   00000 /dev/lv/swap              00172   1137

oscar# pvdisplay /dev/hdg1
--- Physical volume ---
PV Name               /dev/hdg1
VG Name               lv
PV Size               37.28 GB / NOT usable 568 KB [LVM: 158 KB]
PV#                   3
PV Status             available
Allocatable           yes (but full)
Cur LV                2
PE Size (KByte)       4096
Total PE              9543
Free PE               0
Allocated PE          9543
PV UUID               v4eKca-DZfn-fYKP-q0pF-zWev-2HMM-TeKzbA

> All,
>
> we need your help in regard to the misalignment problems we are trying
> to fix right now in order to get facts concerning how many people are
> actually suffering from it.
>
>
> In case you created VGs or extended them with LVM 0.9.1 Beta 6 or 7,
> we'd appreciate if you could send us the output (if any) of
>
>    pvdisplay -v /dev/YourPVname | grep "^ *00000"
>
> if the sector offset in the last column is odd.
>
> If so, please add a "pvdisplay /dev/YourPVname" as well.
>
> We appreciate your help!
>
> Regards,
> Heinz      -- The LVM guy --
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
>-=-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Bartningstr. 12
>                                                   64289 Darmstadt
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 6151 7103 86
>                                                        FAX 7103 96
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
>-=- _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
