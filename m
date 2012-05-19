Date: Sat, 19 May 2012 20:10:04 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120519191004.GN29330@agk-dp.fab.redhat.com>
References: <1816793.YNuiVBaGhv@laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1816793.YNuiVBaGhv@laptop>
Subject: Re: [linux-lvm] Is the new RAID implementation going to
	deprecate	traditional stripes and mirrors?
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
To: ben <benscott@nwlink.com>
Cc: linux-lvm@redhat.com

On Sat, May 19, 2012 at 11:58:54AM -0700, ben wrote:
> Does all the new RAID MD support mean the standard LVM type of mirrors and 
> stripes will go away or at least not be further developed?
 
Current thinking:

Stripes remain as-is (they're very simple, it's not worth changing).

Preferred mirror switches to md, but existing mirror implementation
remains available and continues to be used for temporary mirrors like 
pvmove.

Alasdair
