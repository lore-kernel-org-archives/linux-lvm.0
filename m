From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm 1.0.3, kernel 2.4.17 and the libs...
Message-Id: <20020227101910.B19249@sistina.com>
References: <1014754031.10436.60.camel@dirac.cids.ca>
MIME-Version: 1.0
In-Reply-To: <1014754031.10436.60.camel@dirac.cids.ca>; from
    dsavard@cids.ca on Tue, Feb 26, 2002 at 03:07:11PM -0500
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
Date: Wed Feb 27 03:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 26, 2002 at 03:07:11PM -0500, Daniel Savard wrote:
> I did a major mistake while playing with my LVs resulting in corruption
> or my VG. So, I am trying to recover as much as I can from my system.
> All my filesystems where LV except /, /boot and /usr. However, /var,
> /tmp, /home and /opt were LVs which are no longer accessible.
> 
> I tried to run the vgcfgrestore command and I am running into the
> following error:
> 
> vgcfgrestore: error while loading shared libraries: /lib/liblvm-10.so.1:
> undefined symbol: opt_ignore

Clean build (configure;make;make install) should avoid this.
Looks like an old vgcfgrestore uses the newer library.
Please check, if you really start the newly installed tools or hit
older ones (PATH, alias).

> 
> I built all the stuff in the lvm-build directory and installed it
> accordingly to the instructions (make, make install).
> 
> Anybody can help me with this one?
> 
> -- 
> 
> =======================================
> Daniel Savard
> 
> Internet: dsavard@cids.ca
> =======================================
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
