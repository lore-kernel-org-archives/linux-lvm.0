From: Rich Scheller <richs@dev.tivoli.com>
Subject: Re: [linux-lvm] lvm-1.0.1 patch causes kernel compile errors on
 SPARC64
In-Reply-To: <20011203083555.A1022@tykepenguin.com>
Message-ID: <Pine.GSO.4.21.0112030934420.17154-100000@devmail.dev.tivoli.com>
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
Date: Mon Dec  3 09:34:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

This patch fixed the kernel build break.  Thanks!

On Mon, 3 Dec 2001, Patrick Caulfield wrote:

> On Fri, Nov 30, 2001 at 10:49:29AM -0600, Rich Scheller wrote:
> > I just tried to build a generic 2.4.16 kernel with lvm-1.0.1 patches on a
> > Sun Enterprise 250, following the directions in lvm_1.0.1.tar.gz.  I got
> > an error in the SPARC 64/32-bit ioctl conversion code.  Does anyone have
> > any ideas on how to proceed?  Is LVM even supported on SPARC64 platforms?
> 
> Here's a proper patch. 
> 
> patrick
> 
> --- arch/sparc64/kernel/ioctl32.c.orig	Mon Dec  3 08:34:04 2001
> +++ arch/sparc64/kernel/ioctl32.c	Mon Dec  3 08:33:33 2001
> @@ -2667,7 +2667,7 @@
>  				}
>  
>  				
> -				v->pv[i]->pe = NULL; v->pv[i]->inode = NULL;
> +				v->pv[i]->pe = NULL; v->pv[i]->bd = NULL;
>  			}
>  		}
>  		if (!err) {
> @@ -2709,14 +2709,14 @@
>  		u.lv_bydev.lv = get_lv_t(ptr, &err);
>  		if (err) return err;
>  		u.lv_bydev.lv = &p;
> -		p.pe = NULL; p.inode = NULL;		
> +		p.pe = NULL; p.bd = NULL;		
>  		break;		
>  	case VG_EXTEND:
>  		err = copy_from_user(&p, (void *)arg, sizeof(pv32_t) - 8 - UUID_LEN+1);
>  		if (err) return -EFAULT;
>  		err = copy_from_user(p.pv_uuid, ((pv32_t *)arg)->pv_uuid, UUID_LEN+1);
>  		if (err) return -EFAULT;
> -		p.pe = NULL; p.inode = NULL;
> +		p.pe = NULL; p.bd = NULL;
>  		karg = &p;
>  		break;
>  	case PV_CHANGE:
> @@ -2729,7 +2729,7 @@
>  		if (cmd == PV_CHANGE) {
>  			err = copy_from_user(&p, (void *)A(ptr), sizeof(pv32_t) - 8 - UUID_LEN+1);
>  			if (err) return -EFAULT;
> -			p.pe = NULL; p.inode = NULL;
> +			p.pe = NULL; p.bd = NULL;
>  		}
>  		break;
>  	}
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 

-- 
Rich Scheller    Build Strategy and Infrastructure Group
IBM SWG          rschelle@us.ibm.com
(Tivoli)         Voice: 512-436-8563  Tie-Line: 749-8563

    The love of Lotus Notes is the root of all evil.
