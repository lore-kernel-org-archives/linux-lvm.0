Date: Thu, 4 Oct 2001 11:31:15 +0100 (IST)
From: Paul Jakma <paulj@alphyra.ie>
Subject: Re: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
In-Reply-To: <20011004000451.T8954@turbolinux.com>
Message-ID: <Pine.LNX.4.33.0110041120590.14465-100000@dunlop.dub.ie.alphyra.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

ok... looking at tools/lib/vg_setup_pointers_for_snapshots():

 if ( vg == NULL) goto vg_setup_pointers_for_snapshots_end;
   for ( l = 0; l < vg->lv_max; l++) {
      lv_t *lv_chain_ptr = vg->lv[l];
      if ( lv_chain_ptr == NULL) continue;
      if ( lv_chain_ptr->lv_access & LV_SNAPSHOT_ORG) {

isn't this a wee bit suspect? we test for NULL /after/ the assignment, 
and continue anyway? next line deferences that pointer, irregardless 
of the test for previously..

anyway... this isn't my problem, vg->lv_max[1] / lv_chain_ptr is not 
null, it's invalid.

anyone know how to get a longer backtrace from gdb?

--paulj
