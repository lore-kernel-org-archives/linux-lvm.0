Date: Tue, 6 Apr 2004 08:09:03 +0100
From: thornber@redhat.com
Message-ID: <20040406070903.GB25046@nimzo>
References: <20040405213230.GA12461@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040405213230.GA12461@osdl.org>
Subject: [linux-lvm] Re: experimeinting with mirroring, other targets
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Olien <dmo@osdl.org>
Cc: thornber@redhat.com, linux-lvm@redhat.com

On Mon, Apr 05, 2004 at 02:32:30PM -0700, Dave Olien wrote:
> Is the only way to set up mirroring targets to use the dmsetup
> tool?

Yes, but AJ and Alasdair are working on putting the mirroring support
into the LVM2 tools.

> Also, does LVM allow me to layer these targets, for example if I
> wanted a logical volume that is multipathed, mirrored, and striped?

Absolutely, we rely on that sort of thing a lot (eg. for pvmove).

- Joe
