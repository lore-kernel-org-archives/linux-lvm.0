From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems adding and moving disk.
Message-ID: <20021024092512.A29870@sistina.com>
References: <E184Vqg-0006Yf-00@hermes.sistina.com>
Mime-Version: 1.0
In-Reply-To: <E184Vqg-0006Yf-00@hermes.sistina.com>; from kalle@idlar.nu on Thu, Oct 24, 2002 at 02:19:16AM +0200
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
Date: Thu Oct 24 02:28:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Oct 24, 2002 at 02:19:16AM +0200, kalle@idlar.nu wrote:
> Hello!
> 
> After installing a new disk and moving one other disk from master to slave I cant get my VG back online. Im running 2.4.19 with the 1.0.5 tools
> 
> When vgchange -ay runs at boot up I get this error:
> 
> Trying to vfree() bad address (40176008)
> Unable to handle kernel NULL pointer dereference at virtual address 0000000c
>  printing eip:
> c0125b04
> *pde = 00000000
> Oops: 0000
> CPU:    0
> EIP:    0010:[<c0125b04>]    Not tainted
> EFLAGS: 00010006
> eax: 00c61054   ebx: 0805f1e8   ecx: 00000000   edx: c100001c
> esi: 00000000   edi: 00000206   ebp: cef85000   esp: cf053b84
> ds: 0018   es: 0018   ss: 0018
> Process vgchange (pid: 127, stackpage=cf053000)
> Stack: cef850c0 0805f1e8 00042f40 cef85000 d084a186 0805f1e8 00000000 cef85000
>        cf052000 00000000 cef854c4 00000000 000042f5 d0849345 00000000 00000000
>        00000000 fffffffa 00000000 cef858f8 4004fe0a 00000000 d0848c2d 00000000
> Call Trace:    [<d084a186>] [<d0849345>] [<d0848c2d>] [<d084ece0>] [<c010f594>]
>   [<c01df2e1>] [<c011eea2>] [<c011f3ee>] [<c0108660>] [<c018adf1>] [<c0197403>]
>   [<c0196d60>] [<c018c0d4>] [<c018c132>] [<c018c487>] [<c018c8bd>] [<c0196d60>]
>   [<c01097ed>] [<d08475a8>] [<c01274f4>] [<c0127306>] [<c011e896>] [<c011e8e3>]
>   [<c011ea7e>] [<c010f6f4>] [<c0121cd4>] [<c0121d01>] [<c011e902>] [<c0134b94>]
>   [<c012d1e2>] [<c0164cda>] [<c012c315>] [<c012c22a>] [<c0138847>] [<c010856f>]
> 
> Code: 2b 59 0c 89 d8 31 d2 f7 76 18 89 c3 8b 41 14 89 44 99 18 89
> 
> 
> I tried running a vgscan -d and I got this:
> 
> 
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: 0
> <1> lvm_get_iop_version -- LEAVING with ret: 10
> <1> lvm_lock -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> 
> ..and it hangs there
> 
> I managed to get everything back online if I removed the new disk and moved the otherone back from slave to master.
> 
> Does anyone know what might be causing this?

Kalle,

that sounds like a hardware fight at first glance.

Are cabling and master/slave settings all right?
Does your BIOS autodetect the disks fine?

Run the oops through ksymoops to make any sense out of it.

> 
> 
> /Kalle
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
