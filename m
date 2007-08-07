Date: Tue, 7 Aug 2007 22:53:07 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20070807215307.GG2064@agk.fab.redhat.com>
References: <46B0EAEF.6090305@cfl.rr.com>
	<20070802065012.GA28687@percy.comedia.it>
	<46B254E4.60700@cfl.rr.com> <20070803081133.GB939@percy.comedia.it>
	<46B36F7A.2090601@cfl.rr.com>
	<20070803195749.GA27271@percy.comedia.it>
	<46B39E58.2040305@cfl.rr.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46B39E58.2040305@cfl.rr.com>
Subject: [linux-lvm] Re: [dm-devel] Re: LVM on dmraid breakage
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: device-mapper development <dm-devel@redhat.com>, ataraid-list@redhat.com, linux-lvm@redhat.com

On Fri, Aug 03, 2007 at 05:30:00PM -0400, Phillip Susi wrote:
> Editing a conf file to 
> specify a filter list of devices by name is all well and good for a 
> static system, but it does not play well in the modern udev managed plug 
> and play world.
 
BTW The filters could of course be generated dynamically (from a database) and
supplied on the command line (with --config) - or lvm2 could be extended to
read them from a database.

Alasdair
-- 
agk@redhat.com
