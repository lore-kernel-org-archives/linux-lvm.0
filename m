Return-Path: <jan@moria.gondor.com>
Date: Mon, 8 Jan 2001 01:40:15 +0100
From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] vgcfgrestore bug followup
Message-ID: <20010108014014.A6944@gondor.com>
References: <0ada40824210711NYCSMTP2@nyc.rr.com> <20010107223300.A6050@gondor.com> <20010108012632.A11834@fb0442.mathematik.tu-darmstadt.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010108012632.A11834@fb0442.mathematik.tu-darmstadt.de>; from grothe@mathematik.tu-darmstadt.de on Mon, Jan 08, 2001 at 01:26:32AM +0100
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

On Mon, Jan 08, 2001 at 01:26:32AM +0100, Holger Grothe wrote:
> > Index: pv_read_all_pv_of_vg.c
> > ===================================================================
> > RCS file: /data/cvs/LVM/tools/lib/pv_read_all_pv_of_vg.c,v
> > retrieving revision 1.3
> > diff -u -1 -b -p -r1.3 pv_read_all_pv_of_vg.c
> > --- pv_read_all_pv_of_vg.c	2000/11/20 02:47:20	1.3
> > +++ pv_read_all_pv_of_vg.c	2000/12/22 23:27:00
> > @@ -103,2 +103,3 @@ int pv_read_all_pv_of_vg ( char *vg_name
> >              pv_this_sav = pv_this;
> > +	    if(np<pv_tmp[p]->pv_number) np=pv_tmp[p]->pv_number;
> >              if ( ( pv_this = realloc ( pv_this,
> > @@ -111,5 +112,4 @@ int pv_read_all_pv_of_vg ( char *vg_name
> >              }
> > -            pv_this[np] = pv_tmp[p];
> > -            pv_this[np+1] = NULL;
> > -            np++;
> > +            pv_this[pv_tmp[p]->pv_number-1] = pv_tmp[p];
> > +            //pv_this[np+1] = NULL; // XXX???
>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> IMHO the pv_this list has to be terminated by NULL (see next lines of 
> source). Otherwise you may get "seg faults" while running vgscan
> (see. Rik's mail). Replacing the marked line with 'pv_this[np] = NULL;' 
> worked for me.

Yes, that's why I marked this line with XXX ;-). 
I did fix the bug that hit me, but I didn't check if I may have introduced
new bugs.
You are probably right that pv_this[np]=NULL is needed. By the way, 
the realloc can be changed to (np+1)*sizeof(...) instead of (np+2)*sizeof(...).

Jan
