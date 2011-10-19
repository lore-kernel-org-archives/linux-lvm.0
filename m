Date: Wed, 19 Oct 2011 14:16:09 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20111019131609.GS24527@agk-dp.fab.redhat.com>
References: <1319028502.1827.24.camel@deela.quest-ce.net>
	<20111019125654.GQ24527@agk-dp.fab.redhat.com>
	<20111019130723.GR24527@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20111019130723.GR24527@agk-dp.fab.redhat.com>
Subject: Re: [linux-lvm] lvmtrim
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yann Droneaud <yann@droneaud.fr>
Cc: linux-lvm@redhat.com

On Wed, Oct 19, 2011 at 02:07:23PM +0100, Alasdair G Kergon wrote:
> 2) Add vgtrim (+man page) which takes VG-style arguments, uses
> process_each_pv_in_vg which uses process_each_segment_in_pv which checks if
> segment is free and if so calls the code from (1) to issue a discard on it.
 
Adding a new cmd involves:
  create tools/vgtrim.c   (e.g. use stripped down vgdisplay.c as template?)
  Add to SOURCES in Makefile
  Add section to commands.h (alphabetically)

Alasdair
