Date: Thu, 4 Oct 2001 15:51:39 +0100 (IST)
From: Paul Jakma <paulj@alphyra.ie>
Subject: Re: [linux-lvm] lvcreate segfault in vg_setup_pointers_for_snapshots
In-Reply-To: <20011004120503.A3373@btconnect.com>
Message-ID: <Pine.LNX.4.33.0110041547550.14465-100000@dunlop.dub.ie.alphyra.com>
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

On Thu, 4 Oct 2001, Joe Thornber wrote:

> >    for ( l = 0; l < vg->lv_max; l++) {
> >       lv_t *lv_chain_ptr = vg->lv[l];
> >       if ( lv_chain_ptr == NULL) continue;

> No, this snippet looks right to me.  How can we test before the assignment ?

well, it's not a biggy, but you could test vg->lv[l] for NULL and 
conditionally assign and save a copy if NULL.

in light of your next sentence though, doesn't matter.

> If lv_chain_ptr is NULL the code then jumps back to the top of the
> 'for' loop.

ah... Doh! of course.

> - Joe

anyway, any idea how to get a deeper back trace? or does info stack/bt 
print out the complete stack trace?

--paulj
