Message-ID: <8F120FA493CAD743B30EEB8F356985B501A78136@AUSXMBT102VS1.amer.dell.com>
From: Robert_Macaulay@Dell.com
Subject: RE: [linux-lvm] lvcreate segfaults
Date: Fri, 7 Sep 2001 10:59:44 -0500 
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm having the same problem as well. gdb on the core file shows

 lv_create (vg=0xb, lv=0xbffffab4,
    lv_name=0xbffffae4
"uuy?\003uy?(uy?Guy?iuy?suy?6?y?U?y?o?y?\204?y?\233?y?|?y?E?y?O?y???y?i?y?u?
y?\nyy?\eyy?)yy?4yy??yy?Eyy?Uyy?") at lv_create_remove.c:42
42      inline int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {

I haven't changed the inlines yet since it's a production system, and it
didn't seem to help for John

> -----Original Message-----
> From: John Marquart [mailto:jomarqua@indiana.edu]
> Sent: Wednesday, September 05, 2001 5:42 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] lvcreate segfaults
> 
> 
> Alas alas,
>         This patch seemed to have changed the problem mroe 
> then anything
> else.
>  
> I am still getting segfaults - however this time in a different place.
>  
> (from gdb ./lvcreate w/ set args = rootvg -L4M -nfoo):
> -----
> Starting program: /usr/src/LVM/1.0.1-rc2/./tools/lvcreate rootvg -L4M
> -nfoo
>  
> Program received signal SIGSEGV, Segmentation fault. 
> lv_create (vg=0x4,
> lv=0xbffffae4,
>     lv_name=0xbffffaf8 "\023.Rt~A`z\217\003\021\034'") at
> lv_create_remove.c:42
> 42      int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {     
> 
> -----
> 
> As far as I can tell - the only significant difference 
> between this putput
> and the pre-patched output - is that it is now int lv_create 
> instead of
> inline int lv_create.
> 
> If there is any other info I can provide - as always - please ask.
> 
> -j
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
