From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] PV-Move fails, not able to clear the last PE from
    a disk..
Message-Id: <20020306112118.G21935@sistina.com>
References: <033801c1c3e5$df231530$f707a182@gimmie.tudelft.nl>
    <033e01c1c3e8$1acc7340$f707a182@gimmie.tudelft.nl>
MIME-Version: 1.0
In-Reply-To: <033e01c1c3e8$1acc7340$f707a182@gimmie.tudelft.nl>;
    from D.Andriessen@pink.nl on Tue, Mar 05, 2002 at 02:50:19AM +0100
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
Date: Wed Mar  6 04:23:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Mar 05, 2002 at 02:50:19AM +0100, Denie Andriessen wrote:
> Hi,
> 
> Could it be the:  "known misalignment issue we had in the 0.9.1 Beta series"
> (after reading through lots of messages)
> https://mail.sistina.com/pipermail/linux-lvm/2002-February/010724.html

Yes, that's my guess.

> 
> Is an upgrade 'dangerous' ? (risk of loosing data)

Well, the way to go is:

- pvmove /dev/hdf2 # move your data back to /dev/hdf1
- vgreduce test12 /dev/hdf2
- update to LVM 1.0.3 (or wait for 1.0.4 which will be released soon)
- pvcreate /dev/hdf2
- vgextend test12 /dev/hdf2
- pvmove /dev/hdf1

> 
> Cheers,
> Denie
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
