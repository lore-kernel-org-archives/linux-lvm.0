From: Todd Underwood <todd@osogrande.com>
Subject: Re: [linux-lvm] problems importing non-exported VG
In-Reply-To: <20011211020757.C2120@tiger.bigcats.invalid>
Message-ID: <Pine.LNX.4.10.10112101818460.30490-100000@staff>
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
Date: Mon Dec 10 19:17:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

wolfgang, all,

yep, vgscan finds no volume groups on the system. sigh.  i guess i really
need a backup of /etc/lvm*, which is on the lv.  sigh again.

todd underwood, vp & cto
oso grande technologies, inc.
todd@osogrande.com

"Those who give up essential liberties for temporary safety deserve
neither liberty nor safety." - Benjamin Franklin

On Tue, 11 Dec 2001, Wolfgang Weisselberg wrote:

> Date: Tue, 11 Dec 2001 02:07:57 +0100
> From: Wolfgang Weisselberg <weissel@netcologne.de>
> Reply-To: linux-lvm@sistina.com
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] problems importing non-exported VG
> 
> Hi, Todd!
> 
> Todd Underwood (todd@osogrande.com) wrote 94 lines:
> 
> > after an upgrade during which i moved from a root LVM system to a non-root
> > LVM system and my /etc/lvm* files/directories were lost, i find i'm unable
> > to re-import data from a previously existing volume group and i'm not even
> > sure what the right steps are.
> 
> Did you try running vgscan?  Grep doesn't show it in your
> mail, so I ask that 'stupid' question.  No guarantee that
> it'll work, though
> 
> -Wolfgang
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> 
