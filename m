From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems binding raw devices to PV's
Message-Id: <20011220210509.A17214@sistina.com>
References: <200112200054.fBK0sDs03623@lvadp.fc.hp.com>
MIME-Version: 1.0
In-Reply-To: <200112200054.fBK0sDs03623@lvadp.fc.hp.com>; from
    andrew@lvadp.fc.hp.com on Wed, Dec 19, 2001 at 05:54:12PM -0700
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
Date: Thu Dec 20 14:05:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Andrew,

I admit that the oops shouldn't happen but what's the use of binding
raw devices to PVs anyway?

Regards,
Heinz

On Wed, Dec 19, 2001 at 05:54:12PM -0700, Andrew Patterson wrote:
> 
> We are having problems when running vgchange to activate volume groups
> that have raw devices bound to it's PV's. We are currently using
> LVM 1.0.1-rc4 running on Linux kernel 2.4.14. 
> 
> Andrew
> 
> Reproducing problem:
> --------------------
> 1. Establish raw device <--> scsi disk device bindings using raw
>    utility
> 2. Create 1 vg with 2 pv's (problem not seen with only 1 pv)
> 3. Deactivate vg with vgchange
> 4. When you re-activate the vg with vgchange, something is corrupted
>    such that the raw mappings appear to have been changed.
> 5. The next attempt to change back the raw binding causes segfault in
>    the raw utility, accompanied by a kernel stack trace on the
>    console/syslog
> 6. The next attempt to change back the raw binding causes the system
>    to completely lock up/wedge.
> 
> Capture showing problem:
> ------------------------
> jerry# 
> jerry# 
> jerry# raw /dev/raw2 8 16
> /dev/raw/raw2:	bound to major 8, minor 16
> jerry# raw /dev/raw3 8 32
> /dev/raw/raw3:	bound to major 8, minor 32
> jerry# raw /dev/raw3 8 48
> /dev/raw/raw4:	bound to major 8, minor 48
> jerry# raw /dev/raw4 8 64
> /dev/raw/raw5:	bound to major 8, minor 64
> jerry# raw /dev/raw5 8 80
> /dev/raw/raw6:	bound to major 8, minor 80
> jerry# raw /dev/raw6 8 96
> /dev/raw/raw7:	bound to major 8, minor 96
> jerry# raw /dev/raw8 8 112
> /dev/raw/raw8:	bound to major 8, minor 112
> jerry# raw /dev/raw9 8 128
> /dev/raw/raw9:	bound to major 8, minor 128
> jerry# 
> jerry# 
> jerry# raw -qa
> /dev/raw/raw2:	bound to major 8, minor 16
> /dev/raw/raw3:	bound to major 8, minor 32
> /dev/raw/raw4:	bound to major 8, minor 48
> /dev/raw/raw5:	bound to major 8, minor 64
> /dev/raw/raw6:	bound to major 8, minor 80
> /dev/raw/raw7:	bound to major 8, minor 96
> /dev/raw/raw8:	bound to major 8, minor 112
> /dev/raw/raw9:	bound to major 8, minor 128
> jerry# pvcreate /dev/sdf
> pvcreate -- physical volume "/dev/sdf" successfully created
> 
> jerry# pvcreate /dev/sdg
> pvcreate -- physical volume "/dev/sdg" successfully created
> 
> jerry# vgcreate testVG1 /dev/sdf /dev/sdg
> vgcreate -- INFO: using default physical extent size 4.00 MB
> vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgcreate -- doing automatic backup of volume group "testVG1"
> vgcreate -- volume group "testVG1" successfully created and activated
> 
> jerry# raw -qa
> /dev/raw/raw2:	bound to major 8, minor 16
> /dev/raw/raw3:	bound to major 8, minor 32
> /dev/raw/raw4:	bound to major 8, minor 48
> /dev/raw/raw5:	bound to major 8, minor 64
> /dev/raw/raw6:	bound to major 8, minor 80
> /dev/raw/raw7:	bound to major 8, minor 96
> /dev/raw/raw8:	bound to major 8, minor 112
> /dev/raw/raw9:	bound to major 8, minor 128
> jerry#
> jerry#
> jerry# vgchange -an testVG1
> vgchange -- volume group "testVG1" successfully deactivated
> 
> jerry# raw -qa
> /dev/raw/raw2:	bound to major 8, minor 16
> /dev/raw/raw3:	bound to major 8, minor 32
> /dev/raw/raw4:	bound to major 8, minor 48
> /dev/raw/raw5:	bound to major 8, minor 64
> /dev/raw/raw6:	bound to major 8, minor 80
> /dev/raw/raw7:	bound to major 8, minor 96
> /dev/raw/raw8:	bound to major 8, minor 112
> /dev/raw/raw9:	bound to major 8, minor 128
> jerry#
> jerry#
> jerry# vgchange -ay testVG1
> vgchange -- volume group "testVG1" successfully activated
> 
> jerry# raw -qa
> /dev/raw/raw2:	bound to major 8, minor 16
> /dev/raw/raw3:	bound to major 8, minor 32
> /dev/raw/raw4:	bound to major 8, minor 48
> /dev/raw/raw5:	bound to major 8, minor 64
> /dev/raw/raw6:	bound to major 8, minor 96      <------ CHANGED/WRONG
> /dev/raw/raw7:	bound to major 8, minor 80      <------ CHANGED/WRONG
> /dev/raw/raw8:	bound to major 8, minor 112
> /dev/raw/raw9:	bound to major 8, minor 128
> jerry#
> jerry#
> jerry# raw /dev/raw6 0 0
> Segmentation fault
> 
> >>>>>>>>>> THIS APPEARED ON CONSOLE/SYSLOG >>>>>>>>>>>>>>>>>>
> Dec 19 15:53:32 jerry kernel: invalid operand: 0000
> Dec 19 15:53:32 jerry kernel: CPU:    0
> Dec 19 15:53:32 jerry kernel: EIP:    0010:[<c01396a2>]    Not tainted
> Dec 19 15:53:32 jerry kernel: EFLAGS: 00010202
> Dec 19 15:53:32 jerry kernel: eax: 00000001   ebx: 000000d8   ecx: c1e72de8   
> edx: 00000001
> Dec 19 15:53:32 jerry kernel: esi: c1e72de0   edi: c03f5880   ebp: f2e41f88   
> esp: f2e41f60
> Dec 19 15:53:32 jerry kernel: ds: 0018   es: 0018   ss: 0018
> Dec 19 15:53:32 jerry kernel: Process raw (pid: 506, stackpage=f2e41000)
> Dec 19 15:53:32 jerry kernel: Stack: 000000d8 c03f5968 c03f5880 c0207f16 
> c1e72de0 f3858d20 bffffcd0 0000ac00
> Dec 19 15:53:32 jerry kernel:        ffffffe7 00000000 00000006 00000000 
> 00000000 00000000 00000000 c01415a7
> Dec 19 15:53:32 jerry kernel:        f638d920 f3858d20 0000ac00 bffffcd0 
> f2e40000 bffffde4 bffffd1c 00000004
> Dec 19 15:53:32 jerry kernel: Call Trace: [<c0207f16>] [<c01415a7>]
> [<c0106d6f>]
> Dec 19 15:53:32 jerry kernel:
> Dec 19 15:53:32 jerry kernel: Code: 0f 0b 8b 56 04 8b 06 89 50 04 89 02 8b 5e 
> 30 8d 46 30 39 c3
> <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
> 
> jerry#
> jerry#
> jerry# raw /dev/raw7 8 96
> >>>>>>>>>>>> SYSTEM LOCKED-UP COMPLETELY >>>>>>>>>>>>>>>>>>>
> 
> 
> 
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
