Date: Thu, 4 Oct 2001 12:05:03 +0100
Subject: Re: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
Message-ID: <20011004120503.A3373@btconnect.com>
References: <20011004000451.T8954@turbolinux.com> <Pine.LNX.4.33.0110041120590.14465-100000@dunlop.dub.ie.alphyra.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0110041120590.14465-100000@dunlop.dub.ie.alphyra.com>; from paulj@alphyra.ie on Thu, Oct 04, 2001 at 11:31:15AM +0100
From: Joe Thornber <thornber@btconnect.com>
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

On Thu, Oct 04, 2001 at 11:31:15AM +0100, Paul Jakma wrote:
> ok... looking at tools/lib/vg_setup_pointers_for_snapshots():
> 
>  if ( vg == NULL) goto vg_setup_pointers_for_snapshots_end;
>    for ( l = 0; l < vg->lv_max; l++) {
>       lv_t *lv_chain_ptr = vg->lv[l];
>       if ( lv_chain_ptr == NULL) continue;
>       if ( lv_chain_ptr->lv_access & LV_SNAPSHOT_ORG) {
> 
> isn't this a wee bit suspect? we test for NULL /after/ the assignment, 
> and continue anyway? next line deferences that pointer, irregardless 
> of the test for previously..

No, this snippet looks right to me.  How can we test before the assignment ?
If lv_chain_ptr is NULL the code then jumps back to the top of the 'for' loop.

- Joe
