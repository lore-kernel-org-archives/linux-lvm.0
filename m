Date: Thu, 29 Apr 2010 19:13:56 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100429181356.GB14077@agk-dp.fab.redhat.com>
References: <loom.20100429T185325-182@post.gmane.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <loom.20100429T185325-182@post.gmane.org>
Subject: Re: [linux-lvm] will pvmove'ing (an LV at a time) defragment?
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
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: linux-lvm@redhat.com

There is no automatic defragmentation available, but you can do it
manually by specifying devices and extent ranges (see pvmove man page).

Alasdair
