Subject: Re: [linux-lvm] summary of what I need to do to mount snapshot on XFS
From: Jeremy Hansen <jeremy@troubletext.com>
In-Reply-To: <20020109130259.GC744@tykepenguin.com>
References: <1010503449.28039.5.camel@cali.nesnahhouse.com>
    <E16OHUh-0004tv-00@hermes.sistina.com>
    <20020109130259.GC744@tykepenguin.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1010608661.15375.31.camel@jeremy-linux.intranet.qualys.com>
MIME-Version: 1.0
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
Date: Wed Jan  9 14:51:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Actually, now I am getting Oops

Mounting filesystem "lvm(58,1)" in no-recovery mode.  Filesystem will be
inconsi
stent.
lvm -- giving up to snapshot /dev/collector/collector_lv on
/dev/collector/colle
ctor_snapshot: out of space
Unable to handle kernel paging request at virtual address 00006e60
 printing eip:
f884898d
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<f884898d>]    Not tainted
EFLAGS: 00010246
eax: 00000dcc   ebx: 00006e60   ecx: c7612c00   edx: 00000000
esi: 00000000   edi: 022ae678   ebp: 00000800   esp: e5149a9c
ds: 0018   es: 0018   ss: 0018
Process mhonarc (pid: 21751, stackpage=e5149000)
Stack: 00000080 e5148000 00000027 00000000 c7612d70 c7612c00 022ae69f
00000003 
       f8845821 e5149af6 e5149aec 022ae178 c7612c00 00002202 c69e5360
00000f67 
       f7e90600 f785b000 022ae178 00011560 022ae69f 022ae69f 08000001
c69e5360 
Call Trace: [<f8845821>] [<c01b1ddf>] [<f884590f>] [<c0238f4f>]
[<c01b1ddf>] 
   [<c01b2007>] [<c01b24a0>] [<c01b211e>] [<c01b1e50>] [<c01f92e4>]
[<c01f9a27>]
 
   [<c020551e>] [<c01f9157>] [<c01fafe8>] [<c01fb327>] [<c01f8b59>]
[<c0204fd3>]
 
   [<c0217ffe>] [<c021a437>] [<c01cfa77>] [<c01f4044>] [<c020b2f3>]
[<c0219cd1>]
 
   [<c0149b9c>] [<c0147496>] [<c0142025>] [<c014204b>] [<c013f01e>]
[<c010712b>]
 

Code: 8b 0b eb 12 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90 90 8b 


On Wed, 2002-01-09 at 05:02, Patrick Caulfield wrote:
> On Wed, Jan 09, 2002 at 10:06:04PM +1000, Adrian Head wrote:
> > The basic concept is you create a snapshot LV
> > lvcreate -L1G -s -n snap /dev/vg/lv1
> > 
> > This will create a 1G snapshot logical volume called snap for the original 
> > logical volume /dev/vg/lv1
> > 
> > If this has completed successfully then you can mount it.
> > 
> > mount -t xfs -o nouuid /dev/vg/snap /mnt/snapshot
> 
> You may also need -o norecovery too.
> 
> patrick
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
