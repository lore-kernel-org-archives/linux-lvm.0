From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] Problems with snapshots
Message-ID: <20030311225454.GB14568@gw.silicide.dk>
References: <8075D5C3061B9441944E137377645118012E9A@cinshrexc03.shermfin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8075D5C3061B9441944E137377645118012E9A@cinshrexc03.shermfin.com>
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
Date: Tue Mar 11 16:56:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Mar 11, 2003 at 04:20:49PM -0500, Rechenberg, Andrew wrote:
> 
> I've just implemented LVM 1.0.3 in the stock Red Hat 2.4.18-19 kernel
> and I believe I'm having issues with snapshots.  The past two nights my

Of course you have. There has been several bugs in the kode handling
snapshots. This is quite recently. The bugfixes should be in 1.0.7,
which you can get from the CVS. (make sure it is 1.0.7)



JonB
